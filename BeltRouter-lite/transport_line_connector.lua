---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by seancheey.
--- DateTime: 9/27/20 5:19 PM
--- Terminology:
---     targetBelt/sourceBelt: If belt A is point towards belt B, then belt B is the targetBelt of A. reversely, belt A is belt B's sourceBelt
---     |->| |->| |->| for this situation, in terms of the belt in the middle, the 1st belt is its sourceBelt, and 3rd is its targetBelt

local assertNotNull = require("assert_not_null")
--- @type Logger
local logging = require("logging")
--- @type ArrayList
local ArrayList = require("array_list")
--- @type MinHeap
local MinHeap = require("minheap")
--- @type Vector2D
local Vector2D = require("vector2d")
--- @type EntityRoutingAttribute
local EntityRoutingAttribute = require("path_find/entity_routing_attribute")
--- @type PathSegment
local PathSegment = require("path_find/path_segment")
--- @type TransportLineType
local TransportLineType = require("enum/line_type")
--- @type PathNode
local PathNode = require("path_find/path_node")
--- @type MinDistanceDict
local MinDistanceDict = require("path_find/min_distance_dict")
local release_mode = require("release")

local DirectionHelper = {}

--- @param entity LuaEntity
--- @return Vector2D
function DirectionHelper.targetPositionOf(entity)
    return DirectionHelper.targetPosition(entity.position, entity.direction)
end

--- @param position Vector2D
--- @param direction defines.direction
--- @return Vector2D
function DirectionHelper.targetPosition(position, direction)
    return Vector2D.fromPosition(position) + Vector2D.fromDirection(direction or belt_old_directions.north)
end

--- @param position Vector2D
--- @param getEntityFunc fun()
--- @return LuaEntity[] | ArrayList
function DirectionHelper.neighboringEntities(position, getEntityFunc)
    local entities = ArrayList.new()
    for _, direction in ipairs { belt_old_directions.north, belt_old_directions.east, belt_old_directions.south, belt_old_directions.west } do
        local entity = getEntityFunc(Vector2D.fromDirection(direction) + position)
        if entity ~= nil then
            entities:add(entity)
        end
    end
    return entities
end

--- An "Abstract" transport line connector
--- @class TransportLineConnector
--- @field asyncTaskManager AsyncTaskManager
--- @field canPlaceEntityFunc fun(position: Vector2D): boolean
--- @field placeEntityFunc fun(entity: LuaEntityPrototype)
--- @field getEntityFunc fun(position: Vector2D): LuaEntity
--- @field greedyLevel number
--- @type TransportLineConnector
local TransportLineConnector = {}

TransportLineConnector.__index = TransportLineConnector

--- @param canPlaceEntityFunc fun(position: Vector2D): boolean
--- @param placeEntityFunc fun(entity: LuaEntityPrototype)
--- @param getEntityFunc fun(position: Vector2D): LuaEntity
--- @return TransportLineConnector
function TransportLineConnector.new(canPlaceEntityFunc, placeEntityFunc, getEntityFunc, asyncTaskManager)
    assertNotNull(canPlaceEntityFunc, placeEntityFunc, getEntityFunc, asyncTaskManager)
    return setmetatable(
            { canPlaceEntityFunc = canPlaceEntityFunc,
              placeEntityFunc = placeEntityFunc,
              getEntityFunc = getEntityFunc,
              asyncTaskManager = asyncTaskManager,
              greedyLevel = 1.05 -- just a initial value, will be overridden by player's own setting
            }, TransportLineConnector)
end

--- @class LineConnectConfig
--- @field allowUnderground boolean default true
--- @field preferOnGround boolean default true
--- @field preferLongestUnderground boolean default true
--- @field preferGroundModeUndergroundPunishment number
--- @field turningPunishment number

--- @param startingEntity LuaEntity
--- @param endingEntity LuaEntity
--- @param asyncTaskManager AsyncTaskManager
--- @param additionalConfig LineConnectConfig optional
--- @param player LuaPlayer optional, player to inform when building finished
function TransportLineConnector:buildTransportLine(startingEntity, endingEntity, asyncTaskManager, additionalConfig, player)
    assertNotNull(self, startingEntity, endingEntity)
    local function reportToPlayer(text)
        if player then
            player.print(text)
        end
    end
    if not startingEntity.valid then
        reportToPlayer { "error-message.starting-entity-not-valid" }
        return
    end
    if not endingEntity.valid then
        reportToPlayer { "error-message.ending-entity-not-valid" }
        return
    end
    local entityName = startingEntity.name
    if entityName == "entity-ghost" then
        entityName = startingEntity.ghost_name
    end
    local onGroundVersion = EntityRoutingAttribute.from(entityName).groundEntityPrototype
    if onGroundVersion == nil then
        reportToPlayer { "error-message.find-line-group-failed", { startingEntity.name } }
        return
    end
    local startingUnit = PathSegment:fromLuaEntity(startingEntity)
    local endingUnit = PathSegment:fromLuaEntity(endingEntity, true)

    local minDistanceDict = MinDistanceDict:new()
    local priorityQueue = MinHeap:new()
    self.greedyLevel = settings.get_player_settings(player)["greedy-level"].value

    -- Here starts the main logic of function
    local startingEntityTargets = startingUnit:possibleNextPathSegments(false)
    local anyUnblocked = false
    for _, target in ipairs(startingEntityTargets) do
        if self.canPlaceEntityFunc(target.position) then
            anyUnblocked = true
            break
        end
    end
    if not anyUnblocked then
        reportToPlayer { "error-message.starting-entity-blocked" }
        return
    end
    local startingEntityTargetPos = EntityRoutingAttribute.from(startingUnit.name).lineType == TransportLineType.itemLine and DirectionHelper.targetPositionOf(startingUnit) or startingUnit.position
    -- A* algorithm starts from endingUnit so that we don't have to consider/change last belt's direction
    priorityQueue:push(0, PathNode:new(endingUnit, nil, additionalConfig))
    local maxTryNum = settings.get_player_settings(player)["max-path-finding-explore-num"].value
    local batchSize = settings.get_player_settings(player)["path-finding-test-per-tick"].value
    local totalTryNum = 0
    local taskPriority = game.tick
    local function tryFindPath()
        local foundPath = false
        local tryNum = 0
        while not priorityQueue:isEmpty() and tryNum < batchSize and not foundPath do
            --- @type PathNode
            local transportChain = priorityQueue:pop().val
            if tryNum == 0 then
                player.create_local_flying_text { text = { "info-message.path-find-tag" }, position = transportChain.pathUnit.position, time_to_live = 15 }
            end
            if startingUnit:canConnect(transportChain.pathUnit) then
                transportChain:placeAllEntities(self.placeEntityFunc)
                logging.log("Path find algorithm explored " .. tostring(totalTryNum + tryNum) .. " blocks to find solution")
                foundPath = true
            end
            for _, newChain in pairs(self:surroundingCandidates(transportChain, minDistanceDict, startingUnit, endingUnit, additionalConfig)) do
                priorityQueue:push(self:estimateDistance(newChain.pathUnit, startingEntityTargetPos, startingUnit.direction) + newChain.cumulativeDistance, newChain)
            end
            tryNum = tryNum + 1
        end
        totalTryNum = totalTryNum + tryNum
        if not foundPath then
            if priorityQueue:isEmpty() then
                self:debug_visited_position(minDistanceDict)
                reportToPlayer { "error-message.path-find-terminated-early" }
            elseif totalTryNum >= maxTryNum then
                self:debug_visited_position(minDistanceDict)
                reportToPlayer { "error-message.maximum-trial-reached", tostring(maxTryNum) }
            else
                asyncTaskManager:pushTask(tryFindPath, taskPriority)
            end
        end
    end
    asyncTaskManager:pushTask(tryFindPath, taskPriority)
end

--- @param transportChain PathNode
--- @param startingSegment PathSegment
--- @param endingSegment PathSegment
--- @param playerConfig LineConnectConfig
--- @return PathNode[]
function TransportLineConnector:surroundingCandidates(transportChain, minDistanceDict, startingSegment, endingSegment, playerConfig)
    assertNotNull(self, transportChain, minDistanceDict, startingSegment, playerConfig)

    local candidates = transportChain.pathUnit:possiblePrevPathSegments(playerConfig.allowUnderground, self.canPlaceEntityFunc):map(
            function(pathUnit)
                return PathNode:new(pathUnit, transportChain, playerConfig)
            end
    )
    local legalCandidates = ArrayList.new()
    for _, newChain in ipairs(candidates) do
        if self:testCanPlace(newChain, minDistanceDict, startingSegment, endingSegment) then
            legalCandidates:add(newChain)
        end
    end
    return legalCandidates
end

--- @param newChain PathNode
--- @param minDistanceDict MinDistanceDict
--- @param startingSegment PathSegment
--- @param endingSegment PathSegment
function TransportLineConnector:testCanPlace(newChain, minDistanceDict, startingSegment, endingSegment)
    assertNotNull(self, newChain, minDistanceDict, startingSegment)
    local pathUnit = newChain.pathUnit
    local entityList = pathUnit:toEntitySpecs()

    for _, entity in ipairs(entityList) do
        if not self.canPlaceEntityFunc(entity.position) then
            return false
        end
    end

    local attribute = EntityRoutingAttribute.from(pathUnit.name)
    if attribute.isUnderground then
        -- make sure there is no interfering underground belts whose direction is parallel to our underground belt pair
        for testDiff = 1, pathUnit.distance - 2, 1 do
            local testPos = pathUnit.position + Vector2D.fromDirection(pathUnit.direction):scale(testDiff)
            local entityInMiddle = self.getEntityFunc(testPos)
            if entityInMiddle and (entityInMiddle.name == pathUnit.name) and (((pathUnit.direction or belt_old_directions.north) - entityInMiddle.direction) % 4) == 0
            then
                logging.log("can't cross other entity facing" .. tostring(entityInMiddle.direction), "placing")
                return false
            end
        end
    end

    local closeToFinal = false
    for _, entity in ipairs(entityList) do
        if attribute.lineType == TransportLineType.itemLine then
            -- Check neighbor belts, make sure they don't face our path
            for _, neighbor in ipairs(DirectionHelper.neighboringEntities(entity.position, self.getEntityFunc)) do
                local neighborType = EntityRoutingAttribute.from(neighbor.name)
                if neighborType
                        -- same line type
                        and (neighborType.lineType == TransportLineType.itemLine)
                        -- 0.5 to capture splitter position difference
                        and ((DirectionHelper.targetPositionOf(neighbor) - entity.position):lInfNorm() <= 0.5)
                        -- input underground belt will not interfere
                        and ((not neighborType:isUndergroundBelt()) or (neighbor.belt_to_ground_type == "output"))
                then
                    if (neighbor.position - startingSegment.position):lInfNorm() > 0.5 then
                        logging.log("found interfere and avoid building at " .. serpent.line(entity.position), "placing")
                        return false
                    else
                        closeToFinal = true
                    end
                end
            end
        elseif attribute:isOnGroundPipe() then
            -- Check neighbor pipes, make sure pipe are not our neighbor and underground pipe doesn't face our path
            for _, neighbor in ipairs(DirectionHelper.neighboringEntities(entity.position, self.getEntityFunc)) do
                local neighborType = EntityRoutingAttribute.from(neighbor.name)
                if neighborType and neighborType.lineType == TransportLineType.fluidLine then
                    if neighborType:isOnGroundPipe() or DirectionHelper.targetPositionOf(neighbor) == entity.position then
                        if (neighbor.position - startingSegment.position):lInfNorm() > 0.5 and (neighbor.position - endingSegment.position):lInfNorm() > 0.5 then
                            logging.log("found interfere and avoid building at " .. serpent.line(entity.position), "placing")
                            return false
                        else
                            closeToFinal = true
                        end
                    end
                end
            end
        end
    end

    if newChain.enforceCollisionCheck then
        -- check the transport chain doesn't collide with itself
        -- TODO: although I've optimized this check only to be done when necessary, this is still costly and performance degrades even more for long+curvy path. Any possibility of optimizing even more?
        local testPositions = newChain.pathUnit:toEntitySpecs()
        local testingChain = newChain.prevChain
        while testingChain do
            for _, testSpec in ipairs(testPositions) do
                if testSpec.position == testingChain.pathUnit.position then
                    return false
                end
            end
            testingChain = testingChain.prevChain
        end
    end

    if closeToFinal then
        return true
    else
        -- we only consider those path whose distance could be smaller at the position, like dijkstra algorithm
        local distanceSmallerThanAny = false
        for _, sourceUnit in ipairs(pathUnit:possiblePrevPathSegments(false)) do
            local curMinDistance = minDistanceDict:get(sourceUnit.position, sourceUnit.direction)
            if curMinDistance == nil or curMinDistance > newChain.cumulativeDistance then
                minDistanceDict:put(sourceUnit.position, sourceUnit.direction, newChain.cumulativeDistance)
                distanceSmallerThanAny = true
            end
        end
        if not distanceSmallerThanAny then
            --logging.log("distance is no smaller than any at " .. serpent.line(pathUnit.position), "placing")
        end
        return distanceSmallerThanAny
    end
end

--- A* algorithm's heuristics cost
--- @param testPathSegment PathSegment
--- @param targetPos Vector2D
--- @param rewardDirection defines.direction
function TransportLineConnector:estimateDistance(testPathSegment, targetPos, rewardDirection)
    local dx = math.abs(testPathSegment.position.x - targetPos.x)
    local dy = math.abs(testPathSegment.position.y - targetPos.y)
    -- aligned direction becomes increasingly important as belt is closer to the starting entity
    -- Therefore we punish reversed direction when path is close enough
    local directionPunishment = 0
    -- set as 3 since usually we route 4 belts at once, because direction punishment applies,
    -- starting belts will changing direction usually at least 3 blocks later to leave space for other belts
    if (dx + dy) <= 3 then
        directionPunishment = (math.abs(testPathSegment.direction - rewardDirection)) / (dx + dy + 1)
        logging.log("direction reward = " .. tostring(directionPunishment), "reward")
    end
    return (dx + dy + 1 + directionPunishment) * self.greedyLevel -- slightly encourage greedy-first
end

--- @param minDistanceDict MinDistanceDict
function TransportLineConnector:debug_visited_position(minDistanceDict)
    if not release_mode then
        local posDict = {}
        minDistanceDict:forEach(
                function(vector, direction, val)
                    local key = tostring(vector.x) .. "," .. tostring(vector.y)
                    posDict[key] = posDict[key] or { vector = vector, directions = {} }
                    posDict[key].directions[direction] = val
                end)
        local directionMapping = { [0] = "N", [2] = "E", [4] = "S", [6] = "W" }
        for _, dict in pairs(posDict) do
            local vector = dict.vector
            local text = ""
            for direction, val in pairs(dict.directions) do
                text = text .. directionMapping[direction] .. tostring(math.floor(val))
            end
            game.players[1].create_local_flying_text { text = text, position = vector, time_to_live = 100000, speed = 0.000001 }
        end
    end
end

return TransportLineConnector

local costs = {}
local allowedPacks = {}
local upgradeAllowd = {
    "speed-module", "productivity-module", "effectivity-module", "speed-module-2", "productivity-module-2", "effectivity-module-2", "speed-module-3", "productivity-module-3", "effectivity-module-3",
    "speed-module-4", "productivity-module-4", "effectivity-module-4", "speed-module-5", "productivity-module-5", "effectivity-module-5", "speed-module-6", "productivity-module-6", "effectivity-module-6",
    "stack-inserter",
}
local notAllowd = {
    "artillery-shell-range-1", "artillery-shell-speed-1", "artillery-shell-range-2", "artillery-shell-speed-2",
}

local printTrace = false

local tableContains = function(t, s)
    for _, value in ipairs(t) do
        if value == s then
            return true
        end
    end
    return false
end

  hasAllIngredients = function(t, allowedPacks)
    if not allowedPacks or #allowedPacks == 0 then
        return true
    end
    for _, value in pairs(t.research_unit_ingredients) do
        if not tableContains(allowedPacks, value.name) then
            return false
        end
    end
    return true
end

  canEnableTechnology = function(t, force)
    if type(t) == "string" then
        local t1 = force.technologies[t] -- LuaTechnology
        if not t1 then
            log("Technplogy not found! name = '" .. t .. "'")
        end
        t = t1
    end

    if t.upgrade and not tableContains(upgradeAllowd, t.name) then
        if printTrace then
            print(t.name .. " upgrade not allowed")
        end
        return false
    end
    if tableContains(notAllowd, t.name) then
        if printTrace then
            print(t.name .. " not allowed")
        end
        return false
    end
    if not hasAllIngredients(t, allowedPacks) then
        if printTrace then
            print(t.name .. " not all ingedients are availaible")
        end
        return false
    end

    return true
end

  canEnableTechnologyRecursive = function(t, level, force)
    if type(t) == "string" then
        local t1 = force.technologies[t] -- LuaTechnology
        if not t1 then
            log("Technplogy not found! name = '" .. t .. "'")
        end
        t = t1
    end
    if not level then
        level = 1
    end
    --local ind = ""; for i = 2, level, 1 do ind = ind .. "  " end
    --print(ind..tostring(t.name))

    if not canEnableTechnology(t, force) then
        return false
    end

    for _, t1 in pairs(t.prerequisites) do
        -- LuaTechnology
        if not canEnableTechnologyRecursive(t1, level + 1) then
            return false
        end
    end

    return true
end

  enableTechnologyRecursive = function(t, level, force)
    if type(t) == "string" then
        local t1 = force.technologies[t] -- LuaTechnology
        if not t1 then
            log("Technplogy not found! name = '" .. t .. "'")
        end
        t = t1
    end
    if not level then
        level = 1
    end
    --local ind = ""; for i = 2, level, 1 do ind = ind .. "  " end
    --print(ind..tostring(t.name))

    for _, t1 in pairs(t.prerequisites) do
        -- LuaTechnology
        enableTechnologyRecursive(t1, level + 1, costs)
    end

    if not t.researched then
        for _, iValue in pairs(t.research_unit_ingredients) do
            -- array of Ingredient [R]
            costs[iValue.name] = (costs[iValue.name] or 0) + iValue.amount * t.research_unit_count
        end
        t.researched = true
        if printTrace then
            print(t.name .. " researched")
        end
    end
end


  enableAllTechnologies = function()
    for _, force in pairs(game.forces) do

        for _, t in pairs(force.technologies) do
            if printTrace then
                print("try to enable " .. t.name)
            end
            if canEnableTechnologyRecursive(t, nil, force) then
                enableTechnologyRecursive(t, nil, force)
            end
        end
    end
end

script.on_init(function()
    print "Start"
    costs = {}
    allowedPacks = { "automation-science-pack", "logistic-science-pack", "military-science-pack", "chemical-science-pack", "production-science-pack", "utility-science-pack" }
    table.insert(allowedPacks, "basic-tech-card") --Krastorio2
    local endTechnology = "space-science-pack"

    printTrace = true
    --[[
    if canEnableTechnologyRecursive("advanced-radar") then
        enableTechnologyRecursive("advanced-radar")
    end
    --]]

    enableAllTechnologies()

    ---[[
    print("Costs:")
    for key, value in pairs(costs) do
        print(key, value)
    end
    --]]
end)

commands.add_command("skip-land",
        "skip-land 跳过地面科技",
        function(cmd)

            if cmd.player_index == nil then
                return
            end

            local pl = game.get_player(cmd.player_index)

            if pl==nil or pl.valid ~= true then
                return
            end

            if pl.admin == false then
                pl.print("你不是管理员. you are not admin")
                return
            end

            print "Start"
            costs = {}
            allowedPacks = { "automation-science-pack", "logistic-science-pack", "military-science-pack", "chemical-science-pack", "production-science-pack", "utility-science-pack" }
            table.insert(allowedPacks, "basic-tech-card") --Krastorio2
            local endTechnology = "space-science-pack"

            printTrace = true
            --[[
            if canEnableTechnologyRecursive("advanced-radar") then
                enableTechnologyRecursive("advanced-radar")
            end
            --]]

            enableAllTechnologies()

            game.get_player(cmd.player_index).print("操作完成于" .. cmd.tick)

        end)

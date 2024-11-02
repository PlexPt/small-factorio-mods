---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by seancheey.
--- DateTime: 10/1/20 2:40 AM
---

--- @class Logger

--- @type Logger
local logging = {}

logging.E = "Error"
logging.W = "Warning"
logging.I = "Info"
logging.D = "Debug"
logging.V = "Verbose"

logging.categories = {
    [logging.E] = true,
    [logging.W] = true,
    [logging.I] = true,
    [logging.D] = true,
    [logging.V] = true
}

function logging.enableCategory(loggingCategory)
    assert(loggingCategory ~= nil)
    logging.categories[loggingCategory] = true
end

function logging.disableCategory(loggingCategory)
    assert(loggingCategory ~= nil)
    logging.categories[loggingCategory] = false
end

function logging.addCategory(loggingCategory, enabled)
    assert(loggingCategory ~= nil and enabled ~= nil)
    logging.categories[loggingCategory] = enabled
end

function logging.shouldOutput(loggingCategory)
    local should = logging.categories[loggingCategory]
    return should ~= nil and should or false
end

function logging.log(msg, loggingCategory)
    loggingCategory = loggingCategory or logging.D
    if logging.categories[loggingCategory] == nil then
        game.print("WARNING: unknown logging category \"" .. tostring(loggingCategory) .. "\". Please use logging.addCategory() to specify whether to enable or disable it.")
        game.print("WARNING: automatically enable logging category\"" .. tostring(loggingCategory) .. "\".")
        logging.addCategory(loggingCategory, true)
    end
    if logging.shouldOutput(loggingCategory) then
        game.print(tostring(loggingCategory) .. ": " .. (type(msg) == "string" and msg or serpent.line(msg)), { 0.5, 1, 0.5 })
    end
end

--- Executes function only if the logging is enabled, hence save more operations in release mode
--- If loggingCategory is not set enabled, by default it will not be logged
--- @param msgFunc fun():string
function logging.logLazy(msgFunc, loggingCategory)
    if logging.shouldOutput(loggingCategory) then
        logging.log(msgFunc(), loggingCategory)
    end
end

return logging
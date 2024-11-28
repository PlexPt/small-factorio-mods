local function decode(data)
    if type(data) == "string" then
        return data
    end
    local str = {}
    for i = 2, #data do
        str[i - 1] = decode(data[i])
    end
    return table.concat(str, "")
end

local function bigunpack(name)

    if type(name) == "string" then
        local prototype = prototypes.entity["big-data-" .. name]
        if prototype then
            return decode(prototype.localised_description)
        end
    end
end


-- please cache the result
return bigunpack


--- raises error if any value is nil
return function(...)
    local n = select("#", ...)
    local arg_num = 0
    for _, _ in pairs { ... } do
        arg_num = arg_num + 1
    end
    if n ~= arg_num then
        assert(false, "needs " .. n .. " non-nil arguments, but only provided " .. arg_num .. " non-nil arguments" .. "values: " .. serpent.line { ... })
    end
end
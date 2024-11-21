--在这里，我们禁用润滑模式，并强制 loader 使用 昂贵 模式
--启用此 mod 后，您将始终支付 1 铁板 带来制作装载机。




--data.raw["string-setting"]["my-mod-always-difficult"].hidden = true
--data.raw["string-setting"]["my-mod-always-difficult"].allowed_values = {"no"}
--data.raw["string-setting"]["my-mod-always-difficult"].default_value = "no"
--data.raw["string-setting"]["my-mod-always-difficult"].forced_value = "no"


local function change_string(name, value)
    local settingitem = data.raw["string-setting"][name]

    if settingitem then

        settingitem.hidden = true
        settingitem.allowed_values = { value }
        settingitem.default_value = value
        settingitem.forced_value = value
    end
end
local function change_bool(name, value)
    local settingitem = data.raw["bool-setting"][name]

    if settingitem then

        settingitem.hidden = true
        settingitem.allowed_values = { value }
        settingitem.default_value = value
        settingitem.forced_value = value
    end
end

change_string("aai-loaders-mode", "expensive")
change_string("aai-loaders-lubricant-recipe", "auto")

change_bool("mdrn-use-electricity", false)

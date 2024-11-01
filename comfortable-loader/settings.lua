data:extend({
	-- startup

	{
		type = "bool-setting",
		name = "comfortable-strict-fast-replace-loaders",
		order = "g",
		setting_type = "startup",
		default_value = false,
	},
	-- runtime
	{
		type = "bool-setting",
		name = "comfortable-loader-snap-to-belts",
		order = "a",
		setting_type = "runtime-per-user",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "comfortable-loader-snap-to-inventories",
		order = "b",
		setting_type = "runtime-per-user",
		default_value = false,
	},
})

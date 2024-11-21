------------------------------------------------------------------------------------------------------------------------------------------------------

local DBL = require("prototypes.shared")

------------------------------------------------------------------------------------------------------------------------------------------------------

-- table for main public interface
deadlock = {}

------------------------------------------------------------------------------------------------------------------------------------------------------

function deadlock.add_tier(tier_table)
    -- {
    --  transport_belt      = string, -- mandatory, used for speed etc
    --  colour              = table,  -- recommended, default to pink
    --  underground_belt    = string, -- mandatory unless loader_ingredients and beltbox_ingredients specified, used for recipe cost and styling if present
    --  splitter            = string, -- optional, styling only, unused in this mod but passed through to the styling mod if it's present
    --  technology          = string, -- recommended, logistics tech for this tier, defaults to unlocking the recipes right away (also, there will be no beltbox tech to point stacking recipes at)
    --  order               = string, -- recommended, order string for loaders and beltboxes
    --  loader              = string, -- optional, prototype string for the loader that'll be created, defaults to transport_belt.."-loader"
    --  loader_ingredients  = table,  -- mandatory unless underground_belt specified, used for loader recipe cost
    --  loader_recipe       = string, -- optional, only if you need to override the recipe name (for legacy compatibility)
    --  loader_item         = string, -- optional, only if you need to override the item name (for legacy compatibility)
    --  loader_category     = string, -- optional, default to "crafting" but use "crafting-with-fluid" if there's fluid in the recipe
    -- }
    ---- validation ----
    DBL.debug("Beginning data validation for new tier")
    -- parent table
    if not tier_table then
        DBL.log_error("Nothing passed, a table is required")
        return
    end
    if type(tier_table) ~= "table" then
        DBL.log_error("Non-table passed, a table is required")
        return
    end
    -- check transport belt
    if not tier_table.transport_belt then
        DBL.log_error("Transport belt entity not specified.")
        return
    end
    if not data.raw["transport-belt"][tier_table.transport_belt] then
        DBL.log_error(string.format("Transport belt entity %s doesn't exist", tier_table.transport_belt))
        return
    end
    -- check colour
    if not (tier_table.colour and tier_table.colour.r and tier_table.colour.g and tier_table.colour.b) then
        tier_table.colour = { r = 1, g = 0.8, b = 0.8 }
    end
    -- check underground_belt
    if tier_table.underground_belt and not data.raw["underground-belt"][tier_table.underground_belt] then
        DBL.log_error(string.format("Underground belt entity %s doesn't exist", tier_table.underground_belt))
        return
    end
    -- check splitter
    if tier_table.splitter and not data.raw["splitter"][tier_table.splitter] then
        DBL.log_error(string.format("Splitter entity %s doesn't exist", tier_table.splitter))
        return
    end

    -- check ingredients
    if not tier_table.underground_belt then
        if not tier_table.loader_ingredients then
            DBL.log_error(string.format("Missing ingredients table for loader for %s", tier_table.transport_belt))
            return
        elseif type(tier_table.loader_ingredients) ~= "table" then
            DBL.log_error(string.format("Bad ingredients table for loader for %s", tier_table.transport_belt))
            return
        end

    end
    DBL.debug(string.format("Data validation completed for tier for %s", tier_table.transport_belt))

    -- defaults
    if not tier_table.loader_ingredients then
        tier_table.loader_ingredients = data.raw.recipe[tier_table.underground_belt].ingredients
    end
    if not tier_table.loader_category then
        if data.raw.recipe[tier_table.underground_belt] then
            tier_table.loader_category = data.raw.recipe[tier_table.underground_belt].category
        else
            tier_table.loader_category = "crafting"
        end
    end
    if not tier_table.loader then
        tier_table.loader = string.format("%s-loader", tier_table.transport_belt)
    end

    -- pass to styling if present
    if deadlock_belt_styling then
        deadlock_belt_styling.add_tier(tier_table)
    end

    DBL.create_loader(tier_table)

end

------------------------------------------------------------------------------------------------------------------------------------------------------

local function product_prototype_uses_item(proto, item)
    for _, p in pairs(proto) do
        if p.name and p.name == item then
            return true
        elseif p[1] == item then
            return true
        end
    end
    return false
end

local function uses_item_as_ingredient(recipe, item)
    if recipe.ingredients and product_prototype_uses_item(recipe.ingredients, item) then
        return true
    end
    if recipe.normal and recipe.normal.ingredients and product_prototype_uses_item(recipe.normal.ingredients, item) then
        return true
    end
    if recipe.expensive and recipe.expensive.ingredients and product_prototype_uses_item(recipe.expensive.ingredients, item) then
        return true
    end
    return false
end

local function uses_item_as_result(recipe, item)
    if recipe.result == item then
        return true
    end
    if recipe.normal and recipe.normal.result == item then
        return true
    end
    if recipe.expensive and recipe.expensive.result == item then
        return true
    end
    if recipe.results and product_prototype_uses_item(recipe.results, item) then
        return true
    end
    if recipe.normal and recipe.normal.results and product_prototype_uses_item(recipe.normal.results, item) then
        return true
    end
    if recipe.expensive and recipe.expensive.results and product_prototype_uses_item(recipe.expensive.results, item) then
        return true
    end
    return false
end

local function is_value_in_table(t, value)
    if not t or not value then
        return false
    end
    for k, v in pairs(t) do
        if value == v then
            return true
        end
    end
    return false
end

------------------------------------------------------------------------------------------------------------------------------------------------------

-- tables for legacy interfaces from early 0.16 versions
deadlock_loaders = {}
deadlock_stacking = {}

------------------------------------------------------------------------------------------------------------------------------------------------------


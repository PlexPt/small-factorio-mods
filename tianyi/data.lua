-- Debugging functions etc. provided by "CharacterModHelper"
TIANYI = require("__CharacterModHelper__.common")("tianyi")

-- Enable verbose logging? (Change the value of default if you don't have the mod!)
local LOGGING_DEFAULT = false
TIANYI.is_debug = mods["_debug"] and true or LOGGING_DEFAULT


--   We can add data for the new prototypes to the global table we already have
-- ("miniMAXIme" expects that characters have the case insensitive string "skin"
-- somewhere in their name. The name is stored in file name.lua because we also need
-- it in settings-updates.lua, so we must make sure it's the same everywhere.)
TIANYI.character = { name = "tianyi-skin" }
TIANYI.corpse    = { name = TIANYI.character.name .. "-corpse" }

local anims = require("animations")

-- Character                                   --
TIANYI.character.localised_name         = { "entity-name." .. TIANYI.character.name }
TIANYI.character.localised_description  = { "entity-description." .. TIANYI.character.name }
TIANYI.character.animations             = anims.animations_live
TIANYI.character.character_corpse       = TIANYI.corpse.name
TIANYI.character.fast_replaceable_group = "character"


-- Character corpse
TIANYI.corpse.localised_name = { "entity-name." .. TIANYI.corpse.name }
TIANYI.corpse.pictures       = anims.animations_dead

CharModHelper.create_prototypes(TIANYI)

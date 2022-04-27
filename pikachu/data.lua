-- Make this a global variable so you have to load the file just once. Also,
-- make the name unique (e.g. "MIKU" or the initials of your mod, "MBS") so
-- other mods won't touch it.
pikachu = require("__CharacterModHelper__.common")("pikachu")

pikachu.IMG_PATH = pikachu.modRoot .. "/images/pikachu/"
--local my_character = require("my_character")
local character_creator = require("character_creator")

pikachu.new_characters = {}

local char_name = "pikachu" .. "-skin"
pikachu.new_characters[char_name] = character_creator.create(pikachu.IMG_PATH   , char_name)

-- Create prototypes
for name, prototypes in pairs(pikachu.new_characters) do
    CharModHelper.create_prototypes(prototypes)
end

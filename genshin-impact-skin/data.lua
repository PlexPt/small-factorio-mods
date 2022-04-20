-- Make this a global variable so you have to load the file just once. Also,
-- make the name unique (e.g. "MIKU" or the initials of your mod, "MBS") so
-- other mods won't touch it.
GENSHIN = require("__CharacterModHelper__.common")("genshin-impact-skin")

GENSHIN.IMG_PATH = GENSHIN.modRoot.."/images/"
local my_character = require("my_character")
local character_creator = require("character_creator")


------------------------------------------------------------------------------------
--                  Initialize properties of character and corpse                 --
--  Put these in tables so we can easily apply the changes to the new character,  --
--  and keep track of what properties to skip when we copy properties from the    --
--  default character to the new character to retain changes made by other mods.  --
------------------------------------------------------------------------------------
GENSHIN.new_characters = {}

--~ -- Create character and character corpse

--~ --安博
--~ my_character.create(IMG_PATH.."amber/", "genshin-impact-amber-skin")
--~ --刻晴
--~ my_character.create(IMG_PATH.."keqing/", "genshin-impact-keqing-skin")
--~ my_character.create(IMG_PATH.."klee/", "genshin-impact-klee-skin")
--~ my_character.create(IMG_PATH.."xiao/", "genshin-impact-xiao-skin")
--~ my_character.create(IMG_PATH.."yea/", "genshin-impact-yea-skin")
--~ my_character.create(IMG_PATH.."barbara/", "genshin-impact-barbara-skin")
--~ my_character.create(IMG_PATH.."ganyu/", "genshin-impact-ganyu-skin")
--~ my_character.create(IMG_PATH.."paimon-plus/", "genshin-impact-paimon-plus-skin")

--~ character_creator.create(IMG_PATH.."paimon/", "genshin-impact-paimon-skin")
--~ character_creator.create(IMG_PATH.."shenhe/", "genshin-impact-shenhe-skin")
--~ character_creator.create(IMG_PATH.."ganyu-swim/", "genshin-impact-ganyu-swim-skin")
--~ character_creator.create(IMG_PATH.."diluc/", "genshin-impact-diluc-skin")
--~ character_creator.create(IMG_PATH.."fischer/", "genshin-impact-fischer-skin")
--~ character_creator.create(IMG_PATH.."hilichurl/", "genshin-impact-hilichurl-skin")
--~ character_creator.create(IMG_PATH.."jean/", "genshin-impact-jean-skin")
--~ character_creator.create(IMG_PATH.."kaeya/", "genshin-impact-kaeya-skin")
--~ character_creator.create(IMG_PATH.."lisa/", "genshin-impact-lisa-skin")
--~ character_creator.create(IMG_PATH.."ningguang/", "genshin-impact-ningguang-skin")
--~ character_creator.create(IMG_PATH.."traveler/", "genshin-impact-traveler-skin")
--~ character_creator.create(IMG_PATH.."venti/", "genshin-impact-venti-skin")
--~ character_creator.create(IMG_PATH.."xiangling/", "genshin-impact-xiangling-skin")

-- Create character and character corpse

local character_map = {
  my_character = {
      --安博
      "amber",
      --刻晴
      "keqing",
      "klee",
      "xiao",
      "yea",
      "barbara",
      "ganyu",
      "paimon-plus",
  },
  character_creator = {
    "paimon",
    "shenhe",
    "ganyu-swim",
    "diluc",
    "fischer",
    "hilichurl",
    "jean",
    "kaeya",
    "lisa",
    "ningguang",
    "traveler",
    "venti",
    "xiangling",
  }
}

local create, char_name
for func, characters in pairs(character_map) do
  create = (func == "my_character") and my_character.create or character_creator.create

  for c, char in pairs(characters) do
    char_name = "genshin-impact-"..char.."-skin"
    GENSHIN.new_characters[char_name] = create(GENSHIN.IMG_PATH..char.."/", char_name)
  end
end

-- Create prototypes
for name, prototypes in pairs(GENSHIN.new_characters) do
  CharModHelper.create_prototypes(prototypes)
end

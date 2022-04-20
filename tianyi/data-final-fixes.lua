------------------------------------------------------------------------------------
--                 Leave the final changes to CharacterModHelper!                 --
------------------------------------------------------------------------------------
-- Other mods may have modified the default character and corpse. You should respect
-- such changes unless they conflict with the properties you've stored in the global
-- table. "CharacterModHelper" will either (a) copy your stored properties to the
-- default prototype if there is no character selector mod, or it will (b) copy
-- everything except your stored properties from the default to your new prototype.
--
-- In case (a), the new character prototype will be deleted after everything has
-- been copied. If another mod has assigned the new corpse to other characters (for
-- example, "Jetpack" will use it in the flying version of the new character), the
-- corpse will be changed there as well.
--
------------------------------------------------------------------------------------

-- Keep or overwrite the default prototypes?                   --
CharModHelper.check_my_prototypes(TIANYI)

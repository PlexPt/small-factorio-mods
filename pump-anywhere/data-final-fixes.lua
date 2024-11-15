local pump = data.raw['offshore-pump']['offshore-pump']
if not pump then
    return
end

pump.tile_buildability_rules = nil;


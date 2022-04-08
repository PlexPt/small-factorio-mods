local dfd = settings.startup["data-failure-divisor"].value
local probable_data = {
    "se-bio-combustion-data",
    "se-biochemical-resistance-data",
    "se-bioelectrics-data",
    "se-boson-data",
    "se-cryogenics-data",
    "se-dark-energy-data",
    "se-darkmatter-data",
    "se-decompression-resistance-data",
    "se-electromagnetic-field-data",
    "se-entanglement-data",
    "se-forcefield-data",
    "se-gammaray-observation-data",
    "se-gravity-wave-data",
    "se-gravitational-lensing-data",
    "se-infrared-observation-data",
    "se-lepton-data",
    "se-magnetic-monopole-data",
    "se-micro-black-hole-data",
    "se-microwave-observation-data",
    "se-negative-pressure-data",
    "se-neural-anomaly-data",
    "se-polarisation-data",
    "se-quantum-phenomenon-data",
    "se-quark-data",
    "se-radiation-exposure-resistance-data",
    "se-radio-observation-data",
    "se-singularity-data",
    "se-subatomic-data",
    "se-superconductivity-data",
    "se-timespace-anomaly-data",
    "se-uv-observation-data",
    "se-visible-observation-data",
    "se-xray-observation-data",
    "se-zero-point-energy-data",
}

for _, nam in pairs(probable_data) do
    local rcp = data.raw.recipe[nam]
    local cdin = 0
    for _, ing in pairs(rcp.ingredients) do
        local subi = ing[1] or ing.name
        if string.sub(subi, #subi - 3) == "data" then
            cdin = cdin + (ing.probability or ing.amount or ing[2])
        end
    end

    local sout = 0
    local i = 1
    while i <= #rcp.results do
        local rst = rcp.results[i]
        local subr = rst[1] or rst.name
        if subr == nam then
            sout = sout + (rst.probability or rst.amount or rst[2])
        end
        if string.sub(subr, #subr - 3) == "data" then
            table.remove(rcp.results, i)
        else
            i = i + 1
        end
    end

    local fail = (cdin - sout) / dfd
    local succ = cdin - fail

    if fail - math.floor(fail) > 0 then
        table.insert(rcp.results, 1, { name = "se-junk-data", amount = 1, probability = fail - math.floor(fail) })
    end
    if fail >= 1 then
        table.insert(rcp.results, 1, { "se-junk-data", math.floor(fail) })
    end
    if succ - math.floor(succ) > 0 then
        table.insert(rcp.results, 1, { name = nam, amount = 1, probability = succ - math.floor(succ) })
    end
    if succ >= 1 then
        table.insert(rcp.results, 1, { nam, math.floor(succ) })
    end
end

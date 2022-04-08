local data_util = {}
local dfd=settings.startup["data-failure-divisor"].value

-- rcp=string, old={string, ...}, new={recipe, ...}
function data_util.change_ingredients(rcp, old, new)
  ilst = data.raw.recipe[rcp].ingredients or data.raw.recipe[rcp].normal.ingredients
  if old then
    for _, sub in pairs(old) do
      data_util.remove_ingredient(ilst, sub)
    end
  end
  if new then
    for _, sub in pairs(new) do
      data_util.add_ingredient(ilst, sub, sub.name or sub[1])
    end
  end
end

function data_util.remove_ingredient(ilst, ing)
  for i, subi in pairs(ilst) do
      if subi[1] == ing or subi.name == ing then
        table.remove(ilst, i)
    end
  end
end

function data_util.add_ingredient(ilst, ing, nam)
  local fnd = false
  for i, subi in pairs(ilst) do
    if subi[1] == nam or subi.name == nam then
        fnd = true
        ilst[i] = ing
        break
    end
  end
  if not fnd then
    table.insert(ilst, ing)
  end
end

function data_util.change_results(rcp, old, new)
  rlst = data.raw.recipe[rcp].results or data.raw.recipe[rcp].normal.results
  if old then
    for _, sub in pairs(old) do
      data_util.remove_result(rlst, sub)
    end
  end
  if new then
    for _, sub in pairs(new) do
      data_util.add_result(rlst, sub, sub.name or sub[1])
    end
  end
end

function data_util.remove_result(rlst, rst)
  for i, subi in pairs(rlst) do
    if subi[1] == rst or subi.name == rst then
      table.remove(rlst, i)
    end
  end
end

function data_util.add_result(rlst, rst, nam)
  local fnd = false
  for i, subi in pairs(rlst) do
      if subi[1] == nam or subi.name == nam then
        fnd = true
        rlst[i] = rst
        break
    end
  end
  if not fnd then
      table.insert(rlst, rst)
  end
end

return data_util

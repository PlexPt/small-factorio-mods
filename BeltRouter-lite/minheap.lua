
--- isLessThen
-- @param newNum
-- @param nodeNum
-- @return ok
local function isLessThen(newNum, nodeNum)
    return newNum < nodeNum;
end

--- @class MinHeapNode
--- @field num number
--- @field val any
--- @field idx number

--- @class MinHeap
--- @type MinHeap
--- @field len number
local MinHeap = {};

function MinHeap:heapDown(arr, len, idx)
    local node = arr[idx];
    local hsize = math.floor(len / 2);

    while idx < hsize do
        local left = idx * 2 + 1;
        local right = left + 1;
        local child = arr[left];

        if right < len then
            if self.lessFunc(arr[right].num, child.num) then
                left = right;
                child = arr[right];
            end
        end

        if not self.lessFunc(child.num, node.num) then
            break ;
        end

        child.idx = idx;
        arr[idx] = child;
        idx = left;
    end

    node.idx = idx;
    arr[idx] = node;
end


--- @return boolean
function MinHeap:isEmpty()
    return self.len == 0;
end

--- @return MinHeapNode
function MinHeap:peek()
    return self.arr[0];
end


--- @return MinHeapNode
function MinHeap:push(num, val)
    local arr = self.arr;
    local idx = self.len;
    local node = { num = num, val = val, idx = idx };

    self.len = idx + 1;
    arr[idx] = node;

    while idx > 0 do
        local prev = math.floor((idx - 1) / 2);
        local parent = arr[prev];

        if not self.lessFunc(num, parent.num) then
            break ;
        end

        parent.idx = idx;
        arr[idx] = parent;
        idx = prev;
    end

    arr[idx] = node;
    node.idx = idx;

    return node;
end

--- @return MinHeapNode
function MinHeap:pop()
    return self:del(0);
end


--- @return MinHeapNode
function MinHeap:del(idx)
    local arr = self.arr;
    local node = arr[idx];

    if node then
        local len = self.len - 1;

        if idx == len then
            self.len = len;
            arr[idx] = nil;
        else
            self.len = len;
            arr[idx] = arr[len];
            arr[len] = nil;
            self:heapDown(arr, self.len, idx);
        end
    end

    return node;
end

--- @return MinHeap
function MinHeap:new(lessThanFunc)
    return setmetatable({
        arr = {},
        len = 0,
        lessFunc = lessThanFunc or isLessThen
    }, {
        __index = self or MinHeap
    })
end

return MinHeap

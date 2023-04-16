platID = 102

local function Place(x, y,id)
  local player = GetLocal()
  local pkt_punch = {
    type = 3,
    int_data = id,
    pos_x = player.pos_x,
    pos_y = player.pos_y,
    int_x = x,
    int_y = y,
  }
  SendPacketRaw(pkt_punch)
end

function count(id)
local c = 0
for _, inv in pairs(GetInventory()) do
if inv.id == id then
c = c + inv.count
end
end
return c
end

local function GetTile_s(x, y)
  local player = GetLocal()
  if x > 199 or x < 0
  or y > 199 or y < 0
  then return false end
  return GetTile(x, y)
end

function is_odd(num)
  return num & 1 == 1
end

function bruh(varlist)
if varlist[0]:find("OnDialogRequest") then
return true
end
end
AddCallback("Block", "OnVarlist", bruh)

for _ = 0, 2 do
for y = 0, 193 do
for x = 0, 199 do
local tile = GetTile_s(x, y)
if tile.fg == 0 and x > 1 and x < 199 and is_odd(y) and y < 190 then
if count(platID) == 0 or count(platID) == 1 then
SendPacket(2, "action|dialog_return\ndialog_name|item_search\n"..platID.."|1")
Sleep(500)
end


FindPath(x, y - 1)
Place(x, y, platID)
Sleep(200)
if y > 1 and GetTile_s(x, y - 2).fg == 0 then
Place(x, y - 2, platID)
Sleep(200)
end
tile = GetTile_s(x, y)
end
end
end
end
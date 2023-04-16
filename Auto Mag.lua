add = true
bruh = 0
start = true
lmao = 0
local function Punch(x, y)
  local player = GetLocal()
  local pkt_punch = {
    type = 3,
    int_data = 32,
    pos_x = player.pos_x,
    pos_y = player.pos_y,
    int_x = x,
    int_y = y,
  }
  SendPacketRaw(pkt_punch)
end

function hook(varlist)
    if varlist[0]:find("OnConsoleMessage") and varlist[1]:find("This doesn't fit into the Magplant anymore! Maximum is `$5000`` or `$100000`` with Blue Gem Lock!") then
        bruh = bruh + 1
        if bruh > 5 then
        magx = magx + 1
        bruh = 0
        start = true
        end
    end
    if varlist[0]:find("OnDialogRequest") and (varlist[1]:find("Item Finder") or varlist[1]:find("Edit MAGPLANT 5000")) then
        return true
    end
end

AddCallback("Detect", "OnVarlist", hook)

magx = 54
magy = 46
itemID = 1656


while add do
if GetTile(magx, magy - 1).fg == 608 then
if (math.floor(GetLocal().tile_x) /32 ~= magx and math.floor(GetLocal().tile_y) /32 ~= magy - 1) then
FindPath(magx,magy - 1)
end
end

if GetTile(magx, magy + 1).fg == 608 then
if (math.floor(GetLocal().tile_x) /32 ~= magx and math.floor(GetLocal().tile_y) /32 ~= magy + 1) then
FindPath(magx,magy + 1)
end
end
Punch(magx, magy)
SendPacket(2,"action|dialog_return\ndialog_name|item_search\n"..itemID.."|1")
Sleep(100)
SendPacket(2,"action|dialog_return\ndialog_name|magplant_edit\nx|"..magx.."|\ny|"..magy.."|\nbuttonClicked|additems")
Sleep(100)
lmao = lmao + 1
if lmao > 50 then
SendPacket(2, "action|input\ntext|`9Restocking Script")
lmao = 0
end
end

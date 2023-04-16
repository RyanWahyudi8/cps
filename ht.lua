treeid = 13593

local function punch(x,y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = 18
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    pkt.int_x = math.floor(GetLocal().pos_x // 32) + x
    pkt.int_y = math.floor(GetLocal().pos_y // 32) + y
    SendPacketRaw(pkt)
end

for y = 0, 193 do 
for x = 0, 199 do
local tile = GetTile(x,y)
if tile.fg == treeid and tile.ready == true then
FindPath(x,y)
Sleep(200)
punch(0,0)
Sleep(70)
end
end
end
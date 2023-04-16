-- Script by KimPanzi#9709 (DM for questions)

local USE_ARROZ = true -- set to true if you havent used one
local USE_CLOVER = true -- set to true if you havent used one

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

local function Block(var)
   if var[0] == "OnConsoleMessage" then
      if var[1]:find("`oYour luck has worn off.") then
         USE_CLOVER = true
      elseif var[1]:find("`oYour stomach's rumbling.") then
         USE_ARROZ = true
      end
   end
end

AddCallback("?", "OnVarlist", Block)

while true do
   Sleep(2000)

   if USE_CLOVER then
      SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autofarm|0\ncheck_bfg|0\ncheck_gems|1")
      Sleep(500)
      Place(GetLocal().pos_x//32, GetLocal().pos_y//32, 528)
      USE_CLOVER = false
      Sleep(500)
      SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autofarm|1\ncheck_bfg|1\ncheck_gems|1")
   end

   if USE_ARROZ then
      SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autofarm|0\ncheck_bfg|0\ncheck_gems|1")
      Sleep(500)
      Place(GetLocal().pos_x//32, GetLocal().pos_y//32, 4604)
      USE_ARROZ = false
      Sleep(500)
      SendPacket(2, "action|dialog_return\ndialog_name|cheats\ncheck_autofarm|1\ncheck_bfg|1\ncheck_gems|1")
   end
end
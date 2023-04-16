-- Script by Limitz#4889
-- Revised by KimPanzi#9709 (DM for questions)
-- Use Modfly and Anti dc CPS

-- Island World Size X(200) Y(200)
-- Normal World Size X(100) Y(60)

local WORLD_SIZE_X = 200 -- modify this to fit your world size
local WORLD_SIZE_Y = 200 -- modify this to fit your world size
local PLATFORM_ID = 102 -- waterslide strut

local DELAY_FINDPATH = 60
local DELAY_PLANT = 130

local MAG_X = 0 -- do not touch
local MAG_Y = 0 -- do not touch
local WORLD = "" -- do not touch

local ACTIVE = false

function count(id)
   local c = 0
   for _, inv in pairs(GetInventory()) do
      if inv.id == id then
         c = c + inv.count
      end
   end
   return c
end

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

function Hook(varlist)
   if varlist[0]:find("OnDialogRequest") and varlist[1]:find("Edit MAGPLANT 5000") then
      if MAG_X == 0 and MAG_Y == 0 then
         MAG_X = varlist[1]:match('embed_data|x|(%d+)')
         MAG_Y = varlist[1]:match('embed_data|y|(%d+)')
         WORLD = GetLocal().world
      end

      return true
   end

end

AddCallback("?", "OnVarlist", Hook)

local function Dialog()
   local var = {}
   var[0] = "OnDialogRequest"
   var[1] = "set_default_color|`o\nadd_label_with_icon|big|`9Limitz Auto-PLANT``|left|32|\nadd_smalltext|Wrench the magplant that you want to use for planting.|\nadd_spacer|small|\nadd_textbox|`4WARNING:`` You must use `2Modfly``, `3Anti DC CPS``, and `1/ghost``.|left|\nadd_spacer|small|\nend_dialog|||Continue|"
   var.netid = -1
   SendVarlist(var)
end

local function CheckRemote()
   if count(5640) < 1 then
      FindPath(MAG_X, MAG_Y - 1)
      Place(MAG_X,MAG_Y,32)
      SendPacket(2, "action|dialog_return\ndialog_name|magplant_edit\nx|".. (MAG_X) .."|\ny|" .. (MAG_Y) .. "|\nbuttonClicked|getRemote")
   end

   return count(5640) >= 1
end

local function Plant()
   for y = WORLD_SIZE_Y, 0, -1  do
      local startX = 0
      local endX = WORLD_SIZE_X
      local incrementX = 1
      if y % 4 == 2 then
         startX = WORLD_SIZE_X - 1
         endX = -1
         incrementX = -1
      end

      for x = startX, endX, incrementX do
         if GetLocal().world ~= WORLD then return end

         if GetTile(x,y).fg == PLATFORM_ID then
            local PlaceX = x
            local PlaceY = y - 1

            if PlaceX >= 0 and PlaceX < WORLD_SIZE_X and PlaceY >= 0 and PlaceY < WORLD_SIZE_Y and GetTile(PlaceX,PlaceY).fg == 0 then
               FindPath(PlaceX, PlaceY)
               Sleep(DELAY_FINDPATH)
               Place(PlaceX, PlaceY, 5640)
               Sleep(DELAY_PLANT)
            end
         end
      end
   end
end

Dialog()

while true do
   Sleep(1000)
   if (MAG_X ~= 0 and MAG_Y ~= 0) and CheckRemote() then
      Plant()
   end
end

id = 5640
delaypunch = 230 
delayput = 150 

local function place(id,x,y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = id
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    pkt.int_x = math.floor(GetLocal().pos_x // 32) + x
    pkt.int_y = math.floor(GetLocal().pos_y // 32) + y
    SendPacketRaw(pkt)
end

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

function lss7range()
 while true do
 place(id,3,-1)
 Sleep(delayput)
 place(id,2,-1)
 Sleep(delayput)
 place(id,1,-1)
 Sleep(delayput)
 place(id,0,-1)
 Sleep(delayput)
 place(id,-1,-1)
 Sleep(delayput)
 place(id,-2,-1)
 Sleep(delayput)
 place(id,-3,-1)
 Sleep(delayput)
 punch(3,-1)
 Sleep(delaypunch)
 punch(2,-1)
 Sleep(delaypunch)
 punch(1,-1)
 Sleep(delaypunch)
 punch(0,-1)
 Sleep(delaypunch)
 punch(-1,-1)
 Sleep(delaypunch)
 punch(-2,-1)
 Sleep(delaypunch)
 punch(-3,-1)
 Sleep(delaypunch)
end
end

RunThread(lss7range)

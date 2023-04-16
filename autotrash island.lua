seedid = {14,15,1104,1105,1102,1103,5028,5032,5034,12986,12987,12988,12989}

function GetCount(id)
    result = 0
    for __, inv in pairs(GetInventory()) do
        if inv.id == id then
            result = inv.count
        end
    end
    return result
end

function trash()
    for i=1,#seedid do
        if seedid[i] == 12986 then
            GetCount(12986)
            seedids = -154
            SendPacket(2,"action|trash\n|itemID|"..seedids)
            Sleep(3000)
            SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|"..seedids.."|\nitem_count|"..result)
        elseif seedid[i] == 12987 then
            GetCount(12987)
            seedids = -153
            SendPacket(2,"action|trash\n|itemID|"..seedids)
            Sleep(3000)
            SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|"..seedids.."|\nitem_count|"..result)
        elseif seedid[i] == 12988 then
            GetCount(12988)
            seedids = -156
            SendPacket(2,"action|trash\n|itemID|"..seedids)
            Sleep(3000)
            SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|"..seedids.."|\nitem_count|"..result)
        elseif seedid[i] == 12989 then
            GetCount(12989)
            seedids = -155
            SendPacket(2,"action|trash\n|itemID|"..seedids)
            Sleep(3000)
            SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|"..seedids.."|\nitem_count|"..result)
        elseif GetCount(seedid[i]) > 0 then
            SendPacket(2,"action|trash\n|itemID|"..seedid[i])
            Sleep(3000)
            SendPacket(2,"action|dialog_return\ndialog_name|trash\nitem_trash|"..seedid[i].."|\nitem_count|"..result)
        end
    end
end

while true do
trash()
end

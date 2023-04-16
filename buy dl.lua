function hook(varlist, packet)
    if varlist[0]:find("OnDialogRequest") then
        if varlist[1]:find("end_dialog|telephone|Hang Up||") then
            return true
        end
    end
end
AddCallback("Hook", "OnVarlist", hook)
packet = [[action|dialog_return
dialog_name|telephone
num|53785|
x|7|
y|23|
buttonClicked|dlconvert

]]
while true do
    if GetLocal().gems >= 100000 then
        SendPacket(2, packet)
        Sleep(100)
    end
    Sleep(500)
    if GetItemCount(13802) ~= 0 then
        SendPacket(2,"action|dialog_return\ndialog_name|givexgems\nitem_id|-484|\nitem_count|"..tostring(GetItemCount(13802)))
        Sleep(100)
    end
end
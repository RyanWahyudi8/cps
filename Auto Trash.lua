xmag = 33
ymag = 23
id = 1657

while true do
Sleep(100)
SendPacket(2, "action|dialog_return\ndialog_name|magplant_edit\nx|"..xmag.."|\ny|"..ymag.."|\nbuttonClicked|withdraw\n\n")
Sleep(100)
SendPacket(2, "action|dialog_return\ndialog_name|trash\nitem_trash|"..id.."|\nitem_count|250")
end


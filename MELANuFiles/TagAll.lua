function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(TheMalak.."Name:Bot") or "الفخم") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(TheMalak) then
return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(TheMalak.."All:Get:Reides:Commands:Group"..text) or Redis:get(TheMalak.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if neww then
text = neww or text
end
end


----Barlo----

if text == "تاك عام" or text == "@all" or text == "all" or text == "#all" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n* ● هاذا الامر يخص 〘 '..Controller_Num(7)..' 〙* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 70000)
x = 0
tags = 0
local list = Info_Members.members
for k, v in pairs(list) do
local UserInfo = bot.getUser(v.member_id.user_id)
if x == 10 or x == tags or k == 0 then
tags = x + 10
listall = ""
end
x = x + 1
if UserInfo.first_name ~= '' then
listall = listall.." ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id.."),"
end
if x == 10 or x == tags or k == 0 then
send(msg_chat_id,msg_id,listall,"md",true)  
end 
if text and text:match("^all (.*)$") or text:match("^@all (.*)$") or text == "@all" or text == "all" then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*● هاذا الامر يخص⦗ '..Controller_Num(6)..' ⦘* ',"md",true)  
end
if Redis:get(TheMalak.."lockalllll"..msg_chat_id) == "off" then
return send(msg_chat_id,msg_id,'*● تم تعطيل @all من قبل المدراء*',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
x = 0 
tags = 0 
local list = Info_Members.members
for k, v in pairs(list) do 
local UserInfo = bot.getUser(v.member_id.user_id)
if x == 2 or x == tags or k == 0 then 
tags = x + 2 
if ttag then
t = "#all\n "..ttag.."" 
else
t = "#all "
end
end 
x = x + 1 
if UserInfo.first_name ~= '' then
t = t.."› ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n"
if x == 2 or x == tags or k == 0 then 
if ttag then
Text = t:gsub('#all\n '..ttag..',','#all\n '..ttag..'\n') 
else 
Text = t:gsub('#all,','#all\n')
end
send(msg_chat_id,Text,0,'md') 
end 
end 
end 
end
return {TheMalak = reply}
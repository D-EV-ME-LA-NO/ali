function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Melano.."Name:Bot") or "الفخم") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(Melano) then
return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(Melano.."All:Get:Reides:Commands:Group"..text) or Redis:get(Melano.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end

----Barlo----

if text then
if text:match("^all (.*)$") or text:match("^@all (.*)$") or text == "@all" or text == "all" then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,'‹ : هذا الامر يخص ↫ '..Controller_Num(7)..' .\n•-› X').Warning,"md",true)    
end
if Redis:get(Melano.."lockalllll") == "off" then
return merolua.sendText(msg.chat_id,msg.id,'*‹ : تم تعطيل @all من قبل المطور الاساسي\n•-› X*',"md",true)  
end
local Info_Members = merolua.searchChatMembers(msg.chat_id, "*", 200)
x = 0 
tags = 0 
local list = Info_Members.members
for k, v in pairs(list) do 
local data = merolua.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
if ttag then
t = "#all "..ttag.."" 
else
t = "#all "
end
end 
x = x + 1 
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t..", ["..tagname.."](tg://user?id="..v.member_id.user_id..")" 
if x == 5 or x == tags or k == 0 then 
if ttag then
Text = t:gsub('#all '..ttag..',','#all '..ttag..'\n') 
else 
Text = t:gsub('#all,','#all\n')
end
merolua.sendText(msg.chat_id,0,Text,'md',true)
end 
end 
end 
end
end -- GroupBot
return {Melano = reply}
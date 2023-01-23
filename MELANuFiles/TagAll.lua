function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(noor.."Name:Bot") or "الفخم") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(noor) then
return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(noor.."All:Get:Reides:Commands:Group"..text) or Redis:get(noor.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if neww then
text = neww or text
end
end

----Barlo----

if text == "تاك للكل" or text == "Ail" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n* ● هاذا الامر يخص 〘 '..Controller_Num(7)..' 〙* ',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 70000)
x = 0
tags = 0
local list = Info_Members.members
for k, v in pairs(list) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if x == 10 or x == tags or k == 0 then
tags = x + 10
listall = ""
end
x = x + 1
if UserInfo.first_name ~= '' then
listall = listall.." ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id.."),"
end
if x == 10 or x == tags or k == 0 then
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end 
end

end

end
return {noor = reply}
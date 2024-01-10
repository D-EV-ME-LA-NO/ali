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
if text and text:match("^منو ضافني$") and not Redis:get(Melano..'SOFI:wheneAddme:SOFI'..msg.chat_id) and ChCheck(msg) then
local StatusMember = merolua.getChatMember(msg.chat_id,msg.sender_id.user_id).status.Merotele
if (StatusMember == "chatMemberStatusCreator") then
return merolua.sendText(msg.chat_id,msg.id,"‹ : انت منشئ المجموعه","md",true) 
end
local Added_Me = Redis:get(Melano.."Who:Added:Me"..msg.chat_id..':'..msg.sender_id.user_id)
if Added_Me then 
UserInfo = merolua.getUser(Added_Me)
local Name = '['..UserInfo.first_name..'](tg://user?id='..Added_Me..')'
Text = '‹ : الشخص الذي قام باضافتك هو » '..Name
return merolua.sendText(msg.chat_id,msg.id,Text,"md",true) 
else
return merolua.sendText(msg.chat_id,msg.id,"انت دخلت من الرابط محد ضافك","md",true) 
end
end
if text == 'تفعيل اضافني' then
if not msg.Owner then
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,'‹ : هذا الامر يخص ↫ '..Controller_Num(4)..' .\n•-› X').Warning,"md",true)
end
Redis:del(Melano..'SOFI:wheneAddme:SOFI'..msg.chat_id) 
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"‹ : تم تفعيل منو ضافني بنجاح\n•-› ✓").EbDsDrg,"md",true)
end
if text == 'تعطيل اضافني' then
if not msg.Owner then
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,'‹ : هذا الامر يخص ↫ '..Controller_Num(4)..' .\n•-› X').Warning,"md",true)
end
Redis:set(Melano..'SOFI:wheneAddme:SOFI'..msg.chat_id,true)  
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"‹ : تم تعطيل منو ضافني بنجاح\n•-› X").EbDsDrg,"md",true)
end
end
return {Melano = reply}
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
if text and not Redis:get(Melano..'lock_chengname'..msg.chat_id) then   
local UserInfo = merolua.getUser(msg.sender_id.user_id)
if Redis:get(Melano.."chencher"..msg.sender_id.user_id) then 
if Redis:get(Melano.."chencher"..msg.sender_id.user_id) ~= UserInfo.first_name then 
tahan = '['..(Redis:get(Melano.."chencher"..msg.sender_id.user_id) or '')..']'
taham = '['..UserInfo.first_name..']'
local taha ={ 
'\n ليش غيرت اسمك  يا حلو 😹',
'\n شهل اسم الفيطي '..taham.. ' \n رجعه ؏ قديم \n '..tahan..'',
'\nليش غيرت اسمك  '..tahan..' ',
}
merolua.sendText(msg.chat_id,msg.id,taha[math.random(#taha)])
end  
end
Redis:set(Melano.."chencher"..msg.sender_id.user_id, UserInfo.first_name) 
end
if text == "تفعيل تنبيه الاسماء" then

if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Melano..'lock_chengname'..msg.chat_id) then 
return merolua.sendText(msg.chat_id,msg.id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تنبيه الاسماء بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Melano..'lock_chengname'..msg.chat_id) 
return merolua.sendText(msg.chat_id,msg.id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تفعيل تنبيه الاسماء \n✓" )
end 
end
if text == "تعطيل تنبيه الاسماء" then
if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Melano..'lock_chengname'..msg.chat_id) then 
return merolua.sendText(msg.chat_id,msg.id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تنبيه الاسماء بالتأكيد معطلة\n✓" )
else
Redis:set(Melano..'lock_chengname'..msg.chat_id,true)  
return merolua.sendText(msg.chat_id,msg.id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تعطيل تنبيه الاسماء\n✓" )
end   
end


end
return {Melano = reply}
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


if text == "تفعيل القفل التلقائي" then
if not msg.Originators then
return LuaTele.sendText(msg.chat_id,msg.id,"• هذا الامر يخص المدير")
end
Redis:del(noor..msg.chat_id..'chat_lock:lock')
LuaTele.sendText(msg.chat_id,msg.id,"• تم تفعيل قفل الدردشة التلقائي")
end
if text == "تعطيل القفل التلقائي" then
if not msg.Originators then
return LuaTele.sendText(msg.chat_id,msg.id,"• هذا الامر يخص المدير")
end
Redis:set(noor..msg.chat_id..'chat_lock:lock',true)
LuaTele.sendText(msg.chat_id,msg.id,"• تم تعطيل قفل الدردشة التلقائي")
end

if text == "القفل التلقائي" then
if Redis:get(noor..msg.chat_id..'chat_lock:lock') then
state = "معطل"
else
state = "مفعل"
end
if Redis:get(noor..msg.chat_id..'time:chat:lock')  then
lock_time = Redis:get(noor..msg.chat_id..'time:chat:lock') 
else
lock_time = 00
end
if Redis:get(noor..msg.chat_id..'time:chat:on') then
on_time = Redis:get(noor..msg.chat_id..'time:chat:on')
else
on_time = 00
end
local current_time = https.request("https://xnxx.noorbots.ml/apies/time.php")
local txx = "• القفل التلقائي { "..state.." }\n• الوقت الان "..current_time.."\n\n• وقف بدايه القفل » "..lock_time.."\n• وقت نهايه القفل » "..on_time
return LuaTele.sendText(msg.chat_id,msg.id,txx)
end

if text then
if Redis:get(noor..msg.sender_id.user_id..'set:time:chat') then
if text == "الغاء" then
Redis:del(noor..msg.sender_id.user_id..'set:time:chat')
return LuaTele.sendText(msg.chat_id,msg.id,"• تم الغاء الامر")
end
if text:match("(%d+)") then
if tonumber(text) <= 24 then
if tonumber(text) == 24 then
lock_time = 00
else
lock_time = tonumber(text)
end
Redis:del(noor..msg.sender_id.user_id..'set:time:chat')
Redis:set(noor..msg.sender_id.user_id..'set:time:chat:on',true)
Redis:del(noor..msg.chat_id..'time:chat:lock')
Redis:set(noor..msg.chat_id..'time:chat:lock',math.floor(tonumber(lock_time)))
return LuaTele.sendText(msg.chat_id,msg.id,"• تم حفظ وقف القفل الساعة "..text.."\n ارسل الان وقت التفعيل ")
else
return LuaTele.sendText(msg.chat_id,msg.id,"• لقد ارسلت وقت خاطئ")
end
else
return LuaTele.sendText(msg.chat_id,msg.id,"• لقد ارسلت وقت خاطئ")
end
elseif Redis:get(noor..msg.sender_id.user_id..'set:time:chat:on') then
if text == "الغاء" then
Redis:del(noor..msg.sender_id.user_id..'set:time:chat:on')
return LuaTele.sendText(msg.chat_id,msg.id,"• تم الغاء الامر")
end
if text:match("(%d+)") then
if tonumber(text) <= 24 then
if tonumber(text) == 24 then
lock_time = 00
else
lock_time = tonumber(text)
end
Redis:del(noor..msg.sender_id.user_id..'set:time:chat:on')
Redis:del(noor..msg.chat_id..'time:chat:on')
Redis:set(noor..msg.chat_id..'time:chat:on',math.floor(tonumber(lock_time)))
return LuaTele.sendText(msg.chat_id,msg.id,"• تم حفظ وقف الفتح الساعة "..lock_time.."\n")
else
return LuaTele.sendText(msg.chat_id,msg.id,"• لقد ارسلت وقت خاطئ")
end
else
return LuaTele.sendText(msg.chat_id,msg.id,"• لقد ارسلت وقت خاطئ")
end

end
end



if text == "ضع وقت قفل الدردشة" then
if not msg.Originators then
return LuaTele.sendText(msg.chat_id,msg.id,"• هذا الامر يخص المدير")
end
Redis:set(noor..msg.sender_id.user_id..'set:time:chat',true)
LuaTele.sendText(msg.chat_id,msg.id,"• ارسل الان الوقت بنظام 24 ساعة")
end
if not Redis:get(noor..msg.chat_id..'chat_lock:lock') then
if Redis:get(noor..msg.chat_id..'time:chat:lock') then
local current_time = https.request("https://xnxx.noorbots.ml/apies/auto.php")
if tonumber(Redis:get(noor..msg.chat_id..'time:chat:lock')) - tonumber(current_time) == tonumber(0) then
Redis:set(noor.."Lock:text"..msg_chat_id,true)
Redis:del(noor..msg.chat_id..'time:chat:lock')
LuaTele.sendText(msg.chat_id,0,"• تم قفل الدردشة تلقائيا")
end
end
if Redis:get(noor..msg.chat_id..'time:chat:on') then
local current_time = https.request("https://xnxx.noorbots.ml/apies/auto.php")
if tonumber(current_time) == tonumber(Redis:get(noor..msg.chat_id..'time:chat:on')) then
Redis:del(noor.."Lock:text"..msg_chat_id) 
Redis:del(noor..msg.chat_id..'time:chat:on')
LuaTele.sendText(msg.chat_id,0,"• تم فتح الدردشة تلقائيا")
end
end
end


end
return {noor = reply}
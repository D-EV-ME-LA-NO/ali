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
local neww = Redis:get(Melano.."All:Get:Reides:Commands:Group"..text) or Redis:get(Melano.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if neww then
text = neww or text
end
end
if text== "رفع اثول"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."tahaath"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفع العضو اثول الگروب🤪بنجاح\n✯︙تمت إضافته إلى قائمه الثولان😹\n✓️")
elseif text== "تنزيل اثول"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."tahaath"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل العضو من ثولان الكروب\n✯︙تمت الزاله من قامة الثولان😹\n✓️")
elseif text== "رفع جلب"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."klp"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفع المتهم إلى جلب 🐕 بنجاح\n✯︙تمت إضافته إلى قائمه الجلاب😹\n✓️")
elseif text== "رفع مطي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."donke"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفع المتهم إلى مطي ??بنجاح\n✯︙تمت إضافته إلى قائمه المطايه😹\n✓️")
elseif text== "تنزيل مطي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."donke"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل المتهم مطي بنجاح\n✯︙تمت ازالته من قائمه المطايه 🦓😹\n✓️")
elseif text== "رفع فخرنا"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."Fkrna"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفعه فخرنا\n✓️")
elseif text== "تنزيل فخرنا"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."Fkrna"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل فخرنا\n✓️")
elseif text== "رفع بقره"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."bkra"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفع المتهم بقره بنجاح\n✯︙الان اصبح بقرة مقدسه 🐄😹\n✓️")
elseif text== "تنزيل بقره"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."bkra"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل المتهم بقره بنجاح\n✯︙تمت ٳزالته من قائمة البقرات 🐄😺\n✓️")
elseif text== "رفع ملك"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."kink"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهـلا عزيزي\n✯︙تم رفع صديقك ملـ👑ـك بنجاح\n✯︙اصبح ملك الكروب 👨‍🎨😍❗️ \n✓️")
elseif text== "تنزيل ملك"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."kink"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهـلا عزيزي\n✯︙تم تنزيل العضو المهتلف\n✯︙من قائمة ألملـ👑ـوك بنجاح 😹\n✓️")
elseif text== "رفع ملكه"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."Quean"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهـلا عزيزي\n✯︙تم رفع صديقتك ملكـ🥰ــه بنجاح\n✯︙اصبحت ملكة الكروب 💆‍♀😍❗️ \n✓️")
elseif text== "تنزيل ملكه"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."Quean"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهـلا عزيزي\n✯︙تم تنزيل الجكمه🤵‍♀\n✯︙من قائمة ألملكـ👑ـات بنجاح 😹??\n✓️")
elseif text== "تنزيل جلب"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."klp"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي \n✯︙تم تنزيل المتهم جلب 🐶بنجاح\n✯︙تمت إزالته من قائمه الجلاب🐕😹\n✓️")
elseif text== "تنزيل زاحف"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."zahf"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل المتهم زاحف بنجاح\n✯︙تم ازالته من قائمه الزواحف🐊😹\n✓️")
elseif text== "رفع زاحف"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."zahf"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفعه زاحف😹 بنجاح\n✯︙تم اضافته الى قائمه الزواحف🐊😹\n✓️")
elseif text== "رفع صخل"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."sakl"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفع المتهم صخل بنجاح\n✯︙الان اصبح صخل الكروب 🐐😹\n✓️")
elseif text== "تنزيل صخل"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."sakl"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل المتهم صخل بنجاح\n✯︙تمت ٳزالته من قائمة الصخوله🐐😺\n✓️")
elseif text== "رفع بكلبي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."klpe"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفع العضو داخل كلبك❤️\n✯︙تمت ترقيته بنجاح 😻\n✓️")
elseif text== "تنزيل من كلبي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then  


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."klpe"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل من داخل قلبك❤️\n✯︙تمت ازالته من قائمه القلوب😹💔\n✓️")
elseif text== "رفع تاج"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."tagge"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهـلا عزيزي\n✯︙تم رفع صديقك تـ👑ـاج بنجاح  \n✯︙اصبح خط احمر ❗️ \n✓️")
elseif text== "تنزيل تاج"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."tagge"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهـلا عزيزي\n✯︙تم تنزيل العضو المهتلف\n✯︙من قائمة ألتـ👑ـاج بنجاح 😹💔\n✓️")
elseif text== "رفع مرتي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."mrtee"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفع العضو مرتك👫 بنجاح\nالآن يمكنكم أخذ راحتكم🤤😉\n✓️")
elseif text== "تنزيل مرتي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."mrtee"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيل الجكمه👩‍⚕️مرتك بنجاح\nالآن انتم مفترقان☹️💔\n✓️")
elseif text== "رفع لوكي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."loke"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفعه ضمن اللوكيه👨‍🦯😹\n✓️")
elseif text== "تنزيل لوكي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."loke"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيله من اللوكيه😹\n✓️")
elseif text== "رفع غبي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."stope"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفعه بنجاح اصبح غبي الان🧛‍♀️😺\n✓️")
elseif text== "تنزيل غبي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then  
  

local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."stope"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيله من الاغبياء👏😹\n✓️")
elseif text== "رفع طلي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."tele"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهلا عزيزي\n✯︙تم رفع المتهم طلي الكروب\n✯︙اطلع برا ابو البعرور الوصخ 🤢😂")
elseif text== "تنزيل طلي"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."tele"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيله من الطليان👏😹\n✓️")
elseif text== "رفع طامس"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."tams"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهلا عزيزي\n✯︙تم رفع المتهم طامس الكروب")
elseif text== "تنزيل طامس"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."tams"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيله من الطامسين👏😹\n✓️")
elseif text== "رفع عسل"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفعه عسل الكروب 🍯\n✓️")
elseif text== "تنزيل عسل"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيله من العسل 👌😅\n")
elseif text == ("مسح العسل")  then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."asall"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح العسلات ')
elseif text == ("العسل") and ChCheck(msg) then


local list = Redis:smembers(Melano.."asall"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد عسل") end
t = "\n• قائمة العسل\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text== "رفع كيك"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Melano.."asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم رفعه كيكه الكروب 🍰\n✓️")
elseif text== "تنزيل كيك"  and msg.reply_to_message_id and not Redis:get(Melano.."amrthshesh"..msg.chat_id) then    


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Melano.."asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙اهــلا عزيزي\n✯︙تم تنزيله من الكيك 😹\n✓️")
elseif text == ("مسح الكيك")  then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."asall"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح الكيكات ')
elseif text == ("الكيك") and ChCheck(msg) then


local list = Redis:smembers(Melano.."asall"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد كيك") end
t = "\n• قائمة الكيك\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الملوك") and ChCheck(msg) then


local list = Redis:smembers(Melano.."kink"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد ملوك") end
t = "\n• قائمة الملوك\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الفخرنا") and ChCheck(msg) then


local list = Redis:smembers(Melano.."Fkrna"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد فخرنا") end
t = "\n• قائمة الفخرنا\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("البقرات") and ChCheck(msg) then


local list = Redis:smembers(Melano.."bkra"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد بقرات") end
t = "\n• قائمة البقرات\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الملكات") and ChCheck(msg) then


local list = Redis:smembers(Melano.."Quean"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد ملكات") end
t = "\n• قائمة الملكات\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("مسح الملوك") and ChCheck(msg) then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."kink"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح الملوك ')
elseif text == ("مسح البقرات") and ChCheck(msg) then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."bkra"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح البقرات ')
elseif text == ("مسح الملكات")  then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."Quean"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح الملكات ')
elseif text == ("مسح فخرنا")  then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."Fkrna"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح فخرنا ')
elseif text == ("الثولان") and ChCheck(msg) then


local list = Redis:smembers(Melano.."tahaath"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد ثولان") end
t = "\n• قائمة الثولان\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("مسح الطليان")  then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."tele"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح الطليان ')
elseif text == ("الطليان") and ChCheck(msg) then


local list = Redis:smembers(Melano.."tele"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد طليان") end
t = "\n• قائمة الطليان\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("مسح الطامسين")  then


if not msg.Manager then
return merolua.sendText(msg.chat_id,msg.id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Melano.."tams"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'تم مسح الطامسين ')
elseif text == ("الطامسين") and ChCheck(msg) then


local list = Redis:smembers(Melano.."tams"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد طامسين") end
t = "\n• قائمة الطامسين\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الطلاك") and ChCheck(msg) then


local list = Redis:smembers(Melano.."taha1"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد مطلقين") end
t = "\n• قائمة الطلاك\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '[@'..UserInfo.username..']'
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الجلاب") and ChCheck(msg) then


local list = Redis:smembers(Melano.."klp"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد جلاب") end
t = "\n• قائمة الكلاب\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("المطايه") and ChCheck(msg) then


local list = Redis:smembers(Melano.."donke"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد مطايه") end
t = "\n• قائمة المطايه\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الزواحف") and ChCheck(msg) then


local list = Redis:smembers(Melano.."zahf"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد زواحف") end
t = "\n• قائمة الزواحف\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الصخول") and ChCheck(msg) then


local list = Redis:smembers(Melano.."sakl"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد صخول") end
t = "\n• قائمة الصخول\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("قائمه كلبي") and ChCheck(msg) then


local list = Redis:smembers(Melano.."klpe"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد اعضاء بكلبي") end
t = "\n• قائمة كلبي\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("قائمه التاج") and ChCheck(msg) then


local list = Redis:smembers(Melano.."tagge"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد قائمه تاج") end
t = "\n• قائمة التاج\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الزوجات") and ChCheck(msg) then


local list = Redis:smembers(Melano.."mrtee"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد زوجات") end
t = "\n• قائمة الزوجات\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("اللوكيه") and ChCheck(msg) then


local list = Redis:smembers(Melano.."loke"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد لوكيه") end
t = "\n• قائمة اللوكيه\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
elseif text == ("الاغبياء") and ChCheck(msg) then


local list = Redis:smembers(Melano.."stope"..msg.chat_id)
if #list == 0 then return merolua.sendText(msg.chat_id,msg.id, "• لا يوجد اغبياء") end
t = "\n• قائمة الاغبياء\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = merolua.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return merolua.sendText(msg.chat_id,msg.id, t)
end
end
end
end
return {Melano = reply}
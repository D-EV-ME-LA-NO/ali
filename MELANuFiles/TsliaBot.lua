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




if text == "تعطيل التحشيش" then
if not msg.Addictive then
return send(msg_chat_id,msg_id,"\n*⌔︙هذا الامر يخص { "..Controller_Num(7).." }* ","md",true)  
end
if Redis:get(TheMalak.."amrthshesh"..msg.chat_id)  then
return send(msg_chat_id,msg_id,"*⌔︙تم تعطيل التحشيش مسبقا*","md",true )
else
Redis:set(TheMalak.."amrthshesh"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,"*⌔︙تم تعطيل التحشيش*","md",true )
end
end
if text == "تفعيل التحشيش" then
if not msg.Addictive then
return send(msg_chat_id,msg_id,"\n*⌔︙هذا الامر يخص { "..Controller_Num(7).." }* ","md",true)  
end
if not Redis:get(TheMalak.."amrthshesh"..msg.chat_id)  then
return send(msg_chat_id,msg_id,"*⌔︙تم تفعيل التحشيش مسبقا*","md",true )
else
Redis:del(TheMalak.."amrthshesh"..msg.chat_id)
return send(msg_chat_id,msg_id,"*⌔︙تم تفعيل التحشيش*","md",true )
end
end
if text == ("مسح الثولان") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:tahaath'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:tahaath'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من الثولان \n✓")
elseif text == ("مسح الجلاب") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:klp'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:klp'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من الجلاب \n✓")
elseif text == ("مسح المطايه") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:donke'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:donke'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من المطايه \n✓")
elseif text == ("مسح الزواحف") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:zahf'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:zahf'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من الزواحف \n✓")
elseif text == ("مسح الصخول") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:sakl'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:sakl'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من الصخول \n✓")
elseif text == ("مسح قائمه كلبي") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:klpe'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:klpe'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من قائمه كلبي \n✓")
elseif text == ("مسح قائمه التاج") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:tagge'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:tagge'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من قائمه التاج \n✓")
elseif text == ("مسح الزوجات") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:mrtee'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:mrtee'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من قائمه الزوجات \n✓")
elseif text == ("مسح الثولان") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:klp'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'admins:'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."}  \n✓")
elseif text == ("مسح اللوكيه") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:loke'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:loke'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من اللوكيه \n✓")
elseif text == ("مسح الاغبياء") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*℘︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local numtsh = Redis:scard(TheMalak..'TheMalak:stope'..msg.chat_id)
if numtsh ==0 then  
return send(msg_chat_id,msg_id, "℘︙ هنالك خطأ \n℘︙عذرا لا احد ليتم مسحه ✓" )
end
Redis:del(TheMalak..'TheMalak:stope'..msg.chat_id)
return send(msg_chat_id,msg_id, "℘︙أهلا عزيزي "..msg.Name_Controller.."   \n℘︙تم مسح {"..numtsh.."} من الاغبياء \n✓")
end

if text== "رفع اثول"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then
  
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:tahaath"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفع العضو اثول الگروب🤪بنجاح\n⌔︙تمت إضافته إلى قائمه الثولان😹\n✓️")
elseif text== "تنزيل اثول"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:tahaath"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل العضو من ثولان الكروب\n⌔︙تمت الزاله من قامة الثولان😹\n✓️")
elseif text== "رفع جلب"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:klp"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفع المتهم إلى جلب 🐕 بنجاح\n⌔︙تمت إضافته إلى قائمه الجلاب😹\n✓️")
elseif text== "رفع مطي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:donke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفع المتهم إلى مطي ??بنجاح\n⌔︙تمت إضافته إلى قائمه المطايه😹\n✓️")
elseif text== "تنزيل مطي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:donke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل المتهم مطي بنجاح\n⌔︙تمت ازالته من قائمه المطايه 🦓😹\n✓️")
elseif text== "رفع فخرنا"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:Fkrna"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفعه فخرنا\n✓️")
elseif text== "تنزيل فخرنا"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:Fkrna"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل فخرنا\n✓️")
elseif text== "رفع بقره"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:bkra"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفع المتهم بقره بنجاح\n⌔︙الان اصبح بقرة مقدسه 🐄😹\n✓️")
elseif text== "تنزيل بقره"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:bkra"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل المتهم بقره بنجاح\n⌔︙تمت ٳزالته من قائمة البقرات 🐄😺\n✓️")
elseif text== "رفع ملك"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:kink"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهـلا عزيزي\n⌔︙تم رفع صديقك ملـ👑ـك بنجاح\n⌔︙اصبح ملك الكروب 👨‍🎨😍❗️ \n✓️")
elseif text== "تنزيل ملك"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:kink"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهـلا عزيزي\n⌔︙تم تنزيل العضو المهتلف\n⌔︙من قائمة ألملـ👑ـوك بنجاح 😹\n✓️")
elseif text== "رفع ملكه"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:Quean"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهـلا عزيزي\n⌔︙تم رفع صديقتك ملكـ🥰ــه بنجاح\n⌔︙اصبحت ملكة الكروب 💆‍♀😍❗️ \n✓️")
elseif text== "تنزيل ملكه"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:Quean"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهـلا عزيزي\n⌔︙تم تنزيل الجكمه🤵‍♀\n⌔︙من قائمة ألملكـ👑ـات بنجاح 😹??\n✓️")
elseif text== "تنزيل جلب"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:klp"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي \n⌔︙تم تنزيل المتهم جلب 🐶بنجاح\n⌔︙تمت إزالته من قائمه الجلاب🐕😹\n✓️")
elseif text== "تنزيل زاحف"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:zahf"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل المتهم زاحف بنجاح\n⌔︙تم ازالته من قائمه الزواحف🐊😹\n✓️")
elseif text== "رفع زاحف"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:zahf"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفعه زاحف😹 بنجاح\n⌔︙تم اضافته الى قائمه الزواحف🐊😹\n✓️")
elseif text== "رفع صخل"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:sakl"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفع المتهم صخل بنجاح\n⌔︙الان اصبح صخل الكروب 🐐😹\n✓️")
elseif text== "تنزيل صخل"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:sakl"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل المتهم صخل بنجاح\n⌔︙تمت ٳزالته من قائمة الصخوله🐐😺\n✓️")
elseif text== "رفع بكلبي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:klpe"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفع العضو داخل كلبك❤️\n⌔︙تمت ترقيته بنجاح 😻\n✓️")
elseif text== "تنزيل من كلبي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then  


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:klpe"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل من داخل قلبك❤️\n⌔︙تمت ازالته من قائمه القلوب😹💔\n✓️")
elseif text== "رفع تاج"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:tagge"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهـلا عزيزي\n⌔︙تم رفع صديقك تـ👑ـاج بنجاح  \n⌔︙اصبح خط احمر ❗️ \n✓️")
elseif text== "تنزيل تاج"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:tagge"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهـلا عزيزي\n⌔︙تم تنزيل العضو المهتلف\n⌔︙من قائمة ألتـ👑ـاج بنجاح 😹💔\n✓️")
elseif text== "رفع مرتي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:mrtee"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفع العضو مرتك👫 بنجاح\nالآن يمكنكم أخذ راحتكم🤤😉\n✓️")
elseif text== "تنزيل مرتي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:mrtee"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيل الجكمه👩‍⚕️مرتك بنجاح\nالآن انتم مفترقان☹️💔\n✓️")
elseif text== "رفع لوكي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:loke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفعه ضمن اللوكيه👨‍🦯😹\n✓️")
elseif text== "تنزيل لوكي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:loke"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيله من اللوكيه😹\n✓️")
elseif text== "رفع غبي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:stope"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفعه بنجاح اصبح غبي الان🧛‍♀️😺\n✓️")
elseif text== "تنزيل غبي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then  
  

local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:stope"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيله من الاغبياء👏😹\n✓️")
elseif text== "رفع طلي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:tele"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهلا عزيزي\n⌔︙تم رفع المتهم طلي الكروب\n⌔︙اطلع برا ابو البعرور الوصخ 🤢😂")
elseif text== "تنزيل طلي"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:tele"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيله من الطليان👏😹\n✓️")
elseif text== "رفع طامس"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:tams"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهلا عزيزي\n⌔︙تم رفع المتهم طامس الكروب")
elseif text== "تنزيل طامس"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:tams"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيله من الطامسين👏😹\n✓️")
elseif text== "رفع عسل"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفعه عسل الكروب 🍯\n✓️")
elseif text== "تنزيل عسل"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيله من العسل 👌😅\n")
elseif text == ("مسح العسل")  then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:asall"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح العسلات ')
elseif text == ("العسل") then


local list = Redis:smembers(TheMalak.."TheMalak:asall"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد عسل") end
t = "\n• قائمة العسل\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text== "رفع كيك"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(TheMalak.."TheMalak:asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم رفعه كيكه الكروب 🍰\n✓️")
elseif text== "تنزيل كيك"  and msg.reply_to_message_id and not Redis:get(TheMalak.."amrthshesh"..msg.chat_id) then    


local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(TheMalak.."TheMalak:asall"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,"⌔︙اهــلا عزيزي\n⌔︙تم تنزيله من الكيك 😹\n✓️")
elseif text == ("مسح الكيك")  then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:asall"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح الكيكات ')
elseif text == ("الكيك") then


local list = Redis:smembers(TheMalak.."TheMalak:asall"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد كيك") end
t = "\n• قائمة الكيك\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الملوك") then


local list = Redis:smembers(TheMalak.."TheMalak:kink"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد ملوك") end
t = "\n• قائمة الملوك\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الفخرنا") then


local list = Redis:smembers(TheMalak.."TheMalak:Fkrna"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد فخرنا") end
t = "\n• قائمة الفخرنا\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("البقرات") then


local list = Redis:smembers(TheMalak.."TheMalak:bkra"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد بقرات") end
t = "\n• قائمة البقرات\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الملكات") then


local list = Redis:smembers(TheMalak.."TheMalak:Quean"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد ملكات") end
t = "\n• قائمة الملكات\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("مسح الملوك") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:kink"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح الملوك ')
elseif text == ("مسح البقرات") then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:bkra"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح البقرات ')
elseif text == ("مسح الملكات")  then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:Quean"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح الملكات ')
elseif text == ("مسح فخرنا")  then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:Fkrna"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح فخرنا ')
elseif text == ("الثولان") then


local list = Redis:smembers(TheMalak.."TheMalak:tahaath"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد ثولان") end
t = "\n• قائمة الثولان\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("مسح الطليان")  then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:tele"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح الطليان ')
elseif text == ("الطليان") then


local list = Redis:smembers(TheMalak.."TheMalak:tele"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد طليان") end
t = "\n• قائمة الطليان\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("مسح الطامسين")  then


if not msg.Managers then
return send(msg_chat_id,msg_id,'\n*⌔︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheMalak.."TheMalak:tams"..msg.chat_id)
send(msg_chat_id,msg_id,'تم مسح الطامسين ')
elseif text == ("الطامسين") then


local list = Redis:smembers(TheMalak.."TheMalak:tams"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد طامسين") end
t = "\n• قائمة الطامسين\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الطلاك") then


local list = Redis:smembers(TheMalak.."TheMalak:taha1"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد مطلقين") end
t = "\n• قائمة الطلاك\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '[@'..UserInfo.username..']'
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الجلاب") then


local list = Redis:smembers(TheMalak.."TheMalak:klp"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد جلاب") end
t = "\n• قائمة الكلاب\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("المطايه") then


local list = Redis:smembers(TheMalak.."TheMalak:donke"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد مطايه") end
t = "\n• قائمة المطايه\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الزواحف") then


local list = Redis:smembers(TheMalak.."TheMalak:zahf"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد زواحف") end
t = "\n• قائمة الزواحف\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الصخول") then


local list = Redis:smembers(TheMalak.."TheMalak:sakl"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد صخول") end
t = "\n• قائمة الصخول\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("قائمه كلبي") then


local list = Redis:smembers(TheMalak.."TheMalak:klpe"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد اعضاء بكلبي") end
t = "\n• قائمة كلبي\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("قائمه التاج") then


local list = Redis:smembers(TheMalak.."TheMalak:tagge"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد قائمه تاج") end
t = "\n• قائمة التاج\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الزوجات") then


local list = Redis:smembers(TheMalak.."TheMalak:mrtee"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد زوجات") end
t = "\n• قائمة الزوجات\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("اللوكيه") then


local list = Redis:smembers(TheMalak.."TheMalak:loke"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد لوكيه") end
t = "\n• قائمة اللوكيه\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
elseif text == ("الاغبياء") then


local list = Redis:smembers(TheMalak.."TheMalak:stope"..msg.chat_id)
if #list == 0 then return send(msg_chat_id,msg_id, "• لا يوجد اغبياء") end
t = "\n• قائمة الاغبياء\n━━━━━━━━\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
username = '@'..UserInfo.username..''
else
username = v 
end
t = t..""..k.."~ : "..username.."\n"
if #list == k then
return send(msg_chat_id,msg_id, t)
end
end
end

end
return {TheMalak = reply}
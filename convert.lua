
function convert(msg)
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

if text == 'ملصق' and tonumber(msg.reply_to_message_id) > 0    then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(noor..'ch:admin')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n● عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local data = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.photo then
if data.content.photo.sizes[1].photo.remote.id then
idPhoto = data.content.photo.sizes[1].photo.remote.id
elseif data.content.photo.sizes[2].photo.remote.id then
idPhoto = data.content.photo.sizes[2].photo.remote.id
elseif data.content.photo.sizes[3].photo.remote.id then
idPhoto = data.content.photo.sizes[3].photo.remote.id
end
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..idPhoto) ) 
local Name_File = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path, './'..msg.id..'.webp') 
LuaTele.sendSticker(msg.chat_id, msg.id, Name_File)
sleep(2)
os.execute('rm -rf '..Name_File) 
else
send(msg_chat_id,msg_id,'هذه ليست صوره')
end
end
if text == 'صوره' and tonumber(msg.reply_to_message_id) > 0  then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(noor..'ch:admin')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n● عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local data = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.sticker then    
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..data.content.sticker.sticker.remote.id) ) 
local Name_File = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path, './'..msg.id..'.jpg') 
LuaTele.sendPhoto(msg.chat_id, msg.id, Name_File,'')
sleep(2)
os.execute('rm -rf '..Name_File) 
else
send(msg_chat_id,msg_id,'هذا ليس ملصق')
end
end
if text == 'بصمه' and tonumber(msg.reply_to_message_id) > 0    then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(noor..'ch:admin')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n● عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local data = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.audio then    
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..data.content.audio.audio.remote.id) ) 
local Name_File = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path, './'..msg.id..'.ogg') 
LuaTele.sendVoiceNote(msg.chat_id, msg.id, Name_File, '', 'md')
sleep(2)
os.execute('rm -rf '..Name_File) 
else
send(msg_chat_id,msg_id,'هذا ليس ملف صوتي')
end
end
if text == 'صوت' and tonumber(msg.reply_to_message_id) > 0    then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(noor..'ch:admin')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n● عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local data = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.voice_note then
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..data.content.voice_note.voice.remote.id) ) 
local Name_File = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path, msg.id..'.mp3') 
LuaTele.sendAudio(msg.chat_id, msg.id, Name_File, '', "md") 
sleep(2)
os.execute('rm -rf '..Name_File) 
else
send(msg_chat_id,msg_id,'هذا ليس بصمه')
end
end
if text == 'mp3' and tonumber(msg.reply_to_message_id) > 0    then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(noor..'ch:admin')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n● عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local data = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.video then
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..data.content.video.video.remote.id) ) 
local Name_File = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path, msg.id..'.mp3') 
LuaTele.sendAudio(msg.chat_id, msg.id, Name_File, '', "md") 
sleep(2)
os.execute('rm -rf '..Name_File) 
else
send(msg_chat_id,msg_id,'هذا ليس فيديو')
end
end
if text == 'متحركه' and tonumber(msg.reply_to_message_id) > 0    then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(noor..'ch:admin')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n● عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local data = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.video then
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..data.content.video.video.remote.id) ) 
local Name_File = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path, msg.id..'.gif.mp4') 
LuaTele.sendAnimation(msg.chat_id,msg.id, Name_File, '', 'md')
sleep(2)
os.execute('rm -rf '..Name_File) 
else
send(msg_chat_id,msg_id,'هذا ليس فيديو')
end
end
end
return {noor = convert}
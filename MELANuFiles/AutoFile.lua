function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(RMAD.."Name:Bot") or "الفخم") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(RMAD) then
return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(RMAD.."All:Get:Reides:Commands:Group"..text) or Redis:get(RMAD.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if neww then
text = neww or text
end
end
if text == 'تفعيل النسخه التلقائيه' and ChCheck(msg) then   
if not msg.SecondSudo then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:setex(RMAD.."Status:SendFile",28800,true) 
return merolua.sendText(msg_chat_id,msg_id,"✯︙تم تفعيل جلب نسخة الكروبات التلقائيه","md")
end
if text == 'تعطيل النسخه التلقائيه' and ChCheck(msg) then  
if not msg.SecondSudo then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(RMAD.."Status:SendFile") 
return merolua.sendText(msg_chat_id,msg_id,"✯︙تم تعطيل جلب نسخة الكروبات التلقائيه","md")
end

if tonumber(Redis:ttl(RMAD.."Status:SendFile")) <= 1 then
local Get_Json = '{"BotId": '..RMAD..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(RMAD..'ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(RMAD.."List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(RMAD.."Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(RMAD.."Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(RMAD.."Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(RMAD.."Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(RMAD.."Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(RMAD.."Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(RMAD.."Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(RMAD.."Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(RMAD.."Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(RMAD.."Add:Rd:Manager:File"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(RMAD.."Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(RMAD.."Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"abbas":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
merolua.sendDocument(Sudo_Id,0,'./ReplyGroups.json', '', 'md')

local Groups = Redis:smembers(RMAD..'ChekBotAdd')  
local UsersBot = Redis:smembers(RMAD..'Num:User:Pv')  
local Get_Json = '{"BotId": '..RMAD..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(RMAD.."TheBasics:Group"..v)
local Constructor = Redis:smembers(RMAD.."Originators:Group"..v)
local Manager = Redis:smembers(RMAD.."Managers:Group"..v)
local Admin = Redis:smembers(RMAD.."Addictive:Group"..v)
local Vips = Redis:smembers(RMAD.."Distinguished:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"F_T_F"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
merolua.sendDocument(Sudo_Id,0,'./'..UserBot..'.json', '*✯︙تم جلب النسخه الاحتياطيه\n✯︙تحتوي على {'..#Groups..'} مجموعه \n✯︙وتحتوي على {'..#UsersBot..'} مشترك *\n', 'md')
Redis:setex(RMAD.."Status:SendFile",28800,true) 
end
if text == 'جلب نسخه الردود العامه' and ChCheck(msg) then
if not msg.SecondSudo then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Json = '{"BotId": '..RMAD..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
listrep = Redis:smembers(RMAD.."List:Rd:Sudo")
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(RMAD.."Add:Rd:Sudo:Gif"..v) then
db = "gif@"..Redis:get(RMAD.."Add:Rd:Sudo:Gif"..v)
elseif Redis:get(RMAD.."Add:Rd:Sudo:vico"..v) then
db = "Vico@"..Redis:get(RMAD.."Add:Rd:Sudo:vico"..v)
elseif Redis:get(RMAD.."Add:Rd:Sudo:stekr"..v) then
db = "Stekrs@"..Redis:get(RMAD.."Add:Rd:Sudo:stekr"..v)
elseif Redis:get(RMAD.."Add:Rd:Sudo:Text"..v) then
db = "Text@"..Redis:get(RMAD.."Add:Rd:Sudo:Text"..v)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(RMAD.."Add:Rd:Sudo:Photo"..v) then
db = "Photo@"..Redis:get(RMAD.."Add:Rd:Sudo:Photo"..v) 
elseif Redis:get(RMAD.."Add:Rd:Sudo:Video"..v) then
db = "Video@"..Redis:get(RMAD.."Add:Rd:Sudo:Video"..v)
elseif Redis:get(RMAD.."Add:Rd:Sudo:File"..v) then
db = "File@"..Redis:get(RMAD.."Add:Rd:Sudo:File"..v)
elseif Redis:get(RMAD.."Add:Rd:Sudo:Audio"..v) then
db = "Audio@"..Redis:get(RMAD.."Add:Rd:Sudo:Audio"..v)
elseif Redis:get(RMAD.."Add:Rd:Sudo:video_note"..v) then
db = "video_note@"..Redis:get(RMAD.."Add:Rd:Sudo:video_note"..v)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"taha":"ok"'
end

Get_Json = Get_Json..'}}'
local File = io.open('./Groups_all.json', "w")
File:write(Get_Json)
File:close()
return merolua.sendDocument(msg_chat_id,msg_id,'./Groups_all.json', '', 'md')
end
if text == 'رفع نسخه الردود العامه' and ChCheck(msg) and msg.reply_to_message_id ~= 0 then
if not msg.SecondSudo then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for k,v in pairs(Reply_Groups.GroupsBotreply) do
Redis:sadd(RMAD.."List:Rd:Sudo",k)
if v and v:match('gif@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:Gif"..k,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:vico"..k,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:stekr"..k,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
print('&&&')
Redis:set(RMAD.."Add:Rd:Sudo:Text"..k,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:Photo"..k,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:Video"..k,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:File"..k,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:Audio"..k,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(RMAD.."Add:Rd:Sudo:video_note"..k,v:match('video_note@(.*)') )
end
end
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙تم استرجاع ردود العامه* ',"md",true)  
end
end


if text == 'جلب نسخه الردود' and ChCheck(msg) then
if not msg.SecondSudo then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Json = '{"BotId": '..RMAD..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(RMAD..'ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(RMAD.."List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(RMAD.."Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(RMAD.."Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(RMAD.."Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(RMAD.."Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(RMAD.."Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(RMAD.."Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(RMAD.."Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(RMAD.."Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(RMAD.."Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(RMAD.."Add:Rd:Manager:File"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(RMAD.."Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(RMAD.."Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(RMAD.."Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"taha":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
return merolua.sendDocument(msg_chat_id,msg_id,'./ReplyGroups.json', '', 'md')
end
if text == 'رفع نسخه الردود' and ChCheck(msg) and msg.reply_to_message_id ~= 0 then
if not msg.SecondSudo then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.taha == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(RMAD.."List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(RMAD.."Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') )
end
end
end
end
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙تم استرجاع ردود المجموعات* ',"md",true)  
end
end
end
return {RMAD = reply}

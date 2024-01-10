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
if text == '⦗ تفعيل النسخه الاحتياطيه ⦘' and ChCheck(msg) then   
if not msg.SecondSudo then
return merolua.sendText(msg_chat_id,msg_id,'\n*⌔︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:setex(Melano.."Abs:AutoFile:Time",86400,true) 
return merolua.sendText(msg_chat_id,msg_id,"⌔︙تم تفعيل جلب نسخة الكروبات التلقائيه","md")
end
if text == '⦗ تعطيل النسخه الاحتياطيه ⦘' and ChCheck(msg) then  
if not msg.SecondSudo then
return merolua.sendText(msg_chat_id,msg_id,'\n*⌔︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Melano.."Abs:AutoFile:Time") 
return merolua.sendText(msg_chat_id,msg_id,"⌔︙تم تعطيل جلب نسخة الكروبات التلقائيه","md")
end

if tonumber(Redis:ttl(Melano.."Abs:AutoFile:Time")) <= 1 then

local Get_Json = '{"BotId": '..Melano..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(Melano..'SOFI:Groups')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(Melano.."List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Melano.."Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(Melano.."Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(Melano.."Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(Melano.."Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(Melano.."Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(Melano.."Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(Melano.."Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(Melano.."Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Melano.."Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(Melano.."Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(Melano.."Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(Melano.."Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(Melano.."Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(Melano.."Add:Rd:Manager:File"..v..ide)
elseif Redis:get(Melano.."Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(Melano.."Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(Melano.."Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(Melano.."Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"DevSOFI":"true"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
merolua.sendDocument(Sudo_Id,0,'./ReplyGroups.json', '‹ : تم جلب جميع ردود المجموعات\n‹ : لاستعادة ردود المجموعات ↫ ⤈\n‹ : رفع نسخه الردود بالرد علئ النسخه\n•-› ✓', 'md')

local Groups = Redis:smembers(Melano..'SOFI:Groups')  
local UsersBot = Redis:smembers(Melano..'SOFI:Users')  
local Get_Json = '{"BotId": '..Melano..','  
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
local President = Redis:smembers(Melano.."SOFI:BasicConstructor:"..v)
local Constructor = Redis:smembers(Melano.."SOFI:Constructor:"..v)
local Manager = Redis:smembers(Melano.."SOFI:Managers:"..v)
local Admin = Redis:smembers(Melano.."SOFI:Admins:"..v)
local Vips = Redis:smembers(Melano.."SOFI:VipMem:"..v)
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
Get_Json = Get_Json..'"Dev":"s00f4"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
merolua.sendDocument(Sudo_Id,0,'./'..UserBot..'.json', '*‹ : تم جلب النسخه الاحتياطيه\n‹ : تحتوي على {'..#Groups..'} كروب \n‹ : وتحتوي على {'..#UsersBot..'} مشترك *\n', 'md')
Redis:setex(Melano.."Abs:AutoFile:Time",86400,true) 
end


end


return {Melano = reply}
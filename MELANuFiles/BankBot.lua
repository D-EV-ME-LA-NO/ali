function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(TheRMAD.."Name:Bot") or "الفخم") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(TheRMAD) then
return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(TheRMAD.."All:Get:Reides:Commands:Group"..text) or Redis:get(TheRMAD.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if neww then
text = neww or text
end
end
if text == 'تصفير فلوسه' and tonumber(msg.reply_to_message_id) ~= 0 then
if not msg.ControllerBot then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
return false
end
Redis:del(TheRMAD.."nool:flotysb"..Remsg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id, "• تم صفرت فلوسه ","md",true)
end
if text and text:match('اضف فلوس (.*)') and tonumber(msg.reply_to_message_id) ~= 0 then
local denars = text:match('اضف فلوس (.*)') 
if not msg.ControllerBot then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
return false
end
Redis:incrby(TheRMAD.."nool:flotysb"..Remsg.sender_id.user_id,denars)
merolua.sendText(msg.chat_id,msg.id, "• تم ضفتله فلوس : "..denars,"md",true)
end
if text and text:match('تصفير فلوسه @(.*)') and ChCheck(msg) then
local username = text:match('تصفير فلوسه @(.*)') 
if not msg.ControllerBot then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local UserId_Info = merolua.searchPublicChat(username)
if not UserId_Info.id then
return merolua.sendText(msg_chat_id,msg_id,"\n• مافيه حساب كذا ","md",true)  
end
local UserInfo = merolua.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
return false
end
Redis:del(TheRMAD.."nool:flotysb"..UserId_Info.id)
merolua.sendText(msg.chat_id,msg.id, "• تم صفرت فلوسه ","md",true)
end
if text and text:match('اضف فلوس (.*) @(.*)') and ChCheck(msg) then
local denars = {text:match('اضف فلوس (.*) @(.*)')}
if not msg.ControllerBot then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local UserId_Info = merolua.searchPublicChat(denars[2])
if not UserId_Info.id then
return merolua.sendText(msg_chat_id,msg_id,"\n• مافيه حساب كذا ","md",true)  
end
local UserInfo = merolua.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
return false
end
Redis:incrby(TheRMAD.."nool:flotysb"..UserId_Info.id,denars[1])
merolua.sendText(msg.chat_id,msg.id, "• تم ضفتله فلوس : "..denars[1],"md",true)
end



if text == "ميدالياتي" and ChCheck(msg) then
local GetMd = Redis:get(TheRMAD.."MyMdaleateamnay"..msg.sender_id.user_id)
if not GetMd then
return merolua.sendText(msg.chat_id,msg.id,"- لا تملك ميداليات")
end
return merolua.sendText(msg.chat_id,msg.id,"ميداليتك : "..GetMd)
end
if text and text:match('اكشط (.*)') and ChCheck(msg) then
local TextAksht = text:match('اكشط (.*)') 
if not Redis:sismember(TheRMAD.."Akshtd:Games:",TextAksht) then
return merolua.sendText(msg.chat_id,msg.id,"الرمز مستخدم !")
end
local list ={"10000000","20000000","30000000","400000000","5000000000","60000000"}
local Number = tonumber(list[math.random(#list)])
Redis:srem(TheRMAD.."Akshtd:Games:",TextAksht)
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , Number)
local UserInfoo = merolua.getUser(msg.sender_id.user_id)
local GetName = '- ['..UserInfoo.first_name..'](tg://user?id='..msg.sender_id.user_id..')'

return merolua.sendText(msg.chat_id,msg.id,GetName.."\n*- مبروك كشطتها واخذت : "..Number.. " دينار*","md",true)
end

if text == "قائمه اكشطها" and ChCheck(msg) then
local Text = Redis:smembers(TheRMAD.."Akshtd:Games:") 
if #Text == 0 then
return merolua.sendText(msg.chat_id,msg.id,"لا يوجد رموز اكشطها","md",true)  
end
local Texter = "\nقائمه اكشطها : \n\n"
for k, v in pairs(Text) do
Texter = Texter.."*"..k.."-* `"..v.."`\n"
end
return merolua.sendText(msg.chat_id,msg.id,Texter,"md")
end
if text == "صنع اكشطها" and ChCheck(msg) then
if not msg.DevelopersQ then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(TheRMAD.."Akshtd:Games:")
local list ={"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"}
local En = list[math.random(#list)]
local En1 = list[math.random(#list)]
local En2 = list[math.random(#list)]
local En3 = list[math.random(#list)]
local En4 = list[math.random(#list)]
local En5 = list[math.random(#list)]
local En6 = list[math.random(#list)]
local En7 = list[math.random(#list)]
local En8 = list[math.random(#list)]
local En9 = list[math.random(#list)]
local Num = En..En1..En2..En3..En4..En5..En6..En7..En8..En9
local Num1 = En..En1..En9..En8..En6..En7..En5..En4..En3..En2
local Num2 = En1..En2..En3..En4..En5..En6..En7..En8..En9..En
local Num3 = En9..En2..En..En4..En6..En5..En8..En3..En1..En7
local Num4 = En6..En7..En8..En9..En..En1..En2..En3..En4..En5
local Num5 = En5..En4..En3..En2..En1..En..En9..En8..En7..En6
local Num6 = En6..En7..En3..En2..En1..En5..En4..En..En9..En8
local Num7 = En1..En..En2..En7..En4..En3..En6..En5..En9..En8
local Num8 = En2..En4..En5..En6..En4..En8..En3..En7..En..En9
local Num9 = En1..En..En3..En5..En7..En9..En2..En4..En6..En8
Redis:sadd(TheRMAD.."Akshtd:Games:",Num)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num1)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num2)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num3)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num4)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num5)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num6)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num7)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num8)
Redis:sadd(TheRMAD.."Akshtd:Games:",Num9)
return merolua.sendText(msg.chat_id,msg.id,[[
تم صنع قائمة اكشط جديده  :

1 - `]]..Num..[[`

2 - `]]..Num1..[[`

3 - `]]..Num2..[[`

4 - `]]..Num3..[[`

5 - `]]..Num4..[[`

6 - `]]..Num5..[[`

7 - `]]..Num6..[[`

8 - `]]..Num7..[[`

9 - `]]..Num8..[[`

10 - `]]..Num9..[[`
]],"md")
end
if text == "توب الحراميه" and ChCheck(msg) or text == "الحراميه" and ChCheck(msg) then
local bank_users = Redis:smembers(TheRMAD.."zrfffidtf")
if #bank_users == 0 then
return merolua.sendText(msg.chat_id,msg.id,"• لا يوجد حراميه في البنك","md",true)
end
top_mony = "توب اكثر 20 شخص حرامية فلوس:\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(TheRMAD.."zrffdcf"..v) or 0
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇 )" ,
"🥈 )",
"🥉 )",
"4 )",
"5 )",
"6 )",
"7 )",
"8 )",
"9 )",
"10 )",
"11 )",
"12 )",
"13 )",
"14 )",
"15 )",
"16 )",
"17 )",
"18 )",
"19 )",
"20 )"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local banb = merolua.getUser(v[2])
if banb.first_name then
newss = "["..banb.first_name.."]"
else
newss = " لا يوجد"
end
fne = Redis:get(TheRMAD..':toob:Name:'..v[2])
tt =  newss
local mony = v[1]
local emo = emoji[k]
num = num + 1
gflos =string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." *"..gflos.." 💰* l "..tt.." \n"
gflous =string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n*• you)*  *"..gflous.." 💰* l "..news.." "
end
end
return merolua.sendText(msg.chat_id,msg.id,top_mony,"md",true)
end
if text == "توب فلوس" and ChCheck(msg) or text == "توب الفلوس" and ChCheck(msg) then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local bank_users = Redis:smembers(TheRMAD.."ttpppi")
if #bank_users == 0 then
return merolua.sendText(msg.chat_id,msg.id,"• لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 20 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(TheRMAD.."nool:flotysb"..v) or 0
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇 )" ,
"🥈 )",
"🥉 )",
"4 )",
"5 )",
"6 )",
"7 )",
"8 )",
"9 )",
"10 )",
"11 )",
"12 )",
"13 )",
"14 )",
"15 )",
"16 )",
"17 )",
"18 )",
"19 )",
"20 )"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local banb = merolua.getUser(v[2])
if banb.first_name then
newss = "["..banb.first_name.."]"
else
newss = " لا يوجد"
end
fne = Redis:get(TheRMAD..':toob:Name:'..v[2])
tt =  newss
local mony = v[1]
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." *"..gflos.." 💰* l "..tt.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n*• you)*  *"..gflous.." 💰* l "..news.." \n\n\n*ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه*"
end
end
return merolua.sendText(msg.chat_id,msg.id,top_mony..gg,"md",true)
end
if text == "توب المتزوجين" and ChCheck(msg) then
local bank_users = Redis:smembers(TheRMAD.."almtzog"..msg_chat_id)
if #bank_users == 0 then
return merolua.sendText(msg.chat_id,msg.id,"• لا يوجد متزوجين بالقروب","md",true)
end
top_mony = "توب اغنى 10 زوجات بالقروب :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(TheRMAD.."mznom"..msg_chat_id..v) 
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈" ,
"🥉" ,
"4" ,
"5" ,
"6" ,
"7" ,
"8" ,
"9" ,
"10"
}
for k,v in pairs(mony_list) do
if num <= 10 then
local zwga_id = Redis:get(TheRMAD..msg_chat_id..v[2].."rgalll2:")
local user_name = merolua.getUser(v[2]).first_name
fne = Redis:get(TheRMAD..':toob:Name:'..zwga_id)
fnte = Redis:get(TheRMAD..':toob:Name:'..v[2])
local banb = merolua.getUser(zwga_id)
if banb.first_name then
newss = ""..banb.first_name..""
else
newss = " لا يوجد"
end
local banbb = merolua.getUser(v[2])
if banbb.first_name then
newsss = ""..banbb.first_name..""
else
newsss = " لا يوجد"
end

local user_nambe = merolua.getUser(zwga_id).first_name
local user_tag = '['..newsss..'](tg://user?id='..v[2]..')'
local user_zog = '['..newss..'](tg://user?id='..zwga_id..')'
local mony = v[1]
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." - "..user_tag.." 👫 "..user_zog.."  l "..mony.." 💵\n"
end
end
return merolua.sendText(msg.chat_id,msg.id,top_mony,"md",true)
end
if text and text:match('^زواج (.*)$') and ChCheck(msg) and msg.reply_to_message_id ~= 0 then
local UserName = text:match('^زواج (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = tonumber(coniss)
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return merolua.sendText(msg.chat_id,msg.id, "• غبي تبي تتزوج نفسك!\n","md",true)
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(TheRMAD) then
return merolua.sendText(msg.chat_id,msg.id, "• غبي تبي تتزوج بوت!\n","md",true)
end
if Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") then
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local zoog2 = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local albnt = merolua.getUser(zoog2)
fne = Redis:get(TheRMAD..':toob:Name:'..zoog2)
albnt = "["..albnt.first_name.."](tg://user?id="..zoog2..") " 
return merolua.sendText(msg_chat_id,msg_id,"• الحق ي : "..albnt.." زوجك يبي يتزوج ","md")
end
if Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
local zoog2 = Redis:get(TheRMAD..msg_chat_id..zwga_id.."rgalll2:") 
local id_rgal = merolua.getUser(zwga_id)
fne = Redis:get(TheRMAD..':toob:Name:'..zwga_id)
alzog = "["..id_rgal.first_name.."](tg://user?id="..zwga_id..") "
return merolua.sendText(msg_chat_id,msg_id,"• الحقي ي : "..alzog.." زوجتك تبي تتزوج ","md")
end
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 1000 then
return merolua.sendText(msg.chat_id,msg.id, "• المهر لازم اكثر من 1000 دينار 💸\n","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return merolua.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي للمهر\n","md",true)
end
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
if Redis:get(TheRMAD..msg_chat_id..Message_Reply.sender_id.user_id.."rgalll2:") or Redis:get(TheRMAD..msg_chat_id..Message_Reply.sender_id.user_id.."bnttt2:") then
return merolua.sendText(msg.chat_id,msg.id, "• لا تقرب للمتزوجين \n","md",true)
end
UserNameyr = math.floor(coniss / 15)
UserNameyy = math.floor(coniss - UserNameyr)
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
Redis:set(TheRMAD..msg_chat_id..Message_Reply.sender_id.user_id.."bnttt2:", msg.sender_id.user_id)
Redis:set(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:", Message_Reply.sender_id.user_id)
Redis:set(TheRMAD..msg_chat_id..Message_Reply.sender_id.user_id.."mhrrr2:", UserNameyy)
Redis:set(TheRMAD..msg_chat_id..msg.sender_id.user_id.."mhrrr2:", UserNameyy)
local id_rgal = merolua.getUser(msg.sender_id.user_id)
alzog = "["..id_rgal.first_name.."](tg://user?id="..msg.sender_id.user_id..") "
local albnt = merolua.getUser(Message_Reply.sender_id.user_id)
albnt = "["..albnt.first_name.."](tg://user?id="..Message_Reply.sender_id.user_id..") "
Redis:decrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , UserNameyy)
Redis:incrby(TheRMAD.."nool:flotysb"..Message_Reply.sender_id.user_id , UserNameyy)
Redis:incrby(TheRMAD.."mznom"..msg_chat_id..msg.sender_id.user_id , UserNameyy)
Redis:sadd(TheRMAD.."almtzog"..msg_chat_id,msg.sender_id.user_id)
return merolua.sendText(msg_chat_id,msg_id,"• مبرووك تم زواجكم\n• الزوج :"..alzog.."\n• الزوجه :"..albnt.."\n• المهر : "..UserNameyy.." بعد خصم 15% \n• لعرض عقدكم اكتبو زواجي","md")
end
if text == "طلاق" and ChCheck(msg) and msg.reply_to_message_id ~= 0 and Redis:get(TheRMAD..'Alzwag:Chat'..msg.chat_id)  then
local InfoReply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local zogte = Redis:get(TheRMAD.."zogte"..msg.chat_id..InfoReply.sender_id.user_id)
if not zogte then
return merolua.sendText(msg.chat_id,msg.id,"✯︙العضو ليس لديه زوج","md")
end
Redis:del(TheRMAD.."zogte"..msg.chat_id..InfoReply.sender_id.user_id,msg.sender_id.user_id)
Redis:del(TheRMAD.."zogte"..msg.chat_id..msg.sender_id.user_id,InfoReply.sender_id.user_id)
Redis:srem(TheRMAD.."zogatall"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(TheRMAD.."zogatall"..msg.chat_id,InfoReply.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"✯︙تم الطلاق منه","md")
end
if text == "زوجي" and ChCheck(msg) and Redis:get(TheRMAD..'Alzwag:Chat'..msg.chat_id)  then
local zogte = Redis:get(TheRMAD.."zogte"..msg.chat_id..msg.sender_id.user_id)
if zogte then
local UserInfo = merolua.getUser(zogte)
local Teext = "- ["..UserInfo.first_name.."](tg://user?id="..zogte..")"
local reply_markup = merolua.replyMarkup{
type = "inline",
data = {
{
{text="طلاق الزوج",data=zogte.."/tlakkk/"..msg.sender_id.user_id}
},
}
}
return merolua.sendText(msg.chat_id,msg.id,"✯︙زوجك : "..Teext,"md",false, false, false, false, reply_markup)
else
return merolua.sendText(msg.chat_id,msg.id,"✯︙ليس لديك زوج","md")
end
end
if text == "زوجتي" and ChCheck(msg) and Redis:get(TheRMAD..'Alzwag:Chat'..msg.chat_id)  then
local zogte = Redis:get(TheRMAD.."zogte"..msg.chat_id..msg.sender_id.user_id)
if zogte then
local UserInfo = merolua.getUser(zogte)
local Teext = "- ["..UserInfo.first_name.."](tg://user?id="..zogte..")"
local reply_markup = merolua.replyMarkup{
type = "inline",
data = {
{
{text="طلاق الزوجه",data=zogte.."/ttlakkk/"..msg.sender_id.user_id}
},
}
}
return merolua.sendText(msg.chat_id,msg.id,"✯︙زوجتك : "..Teext,"md",false, false, false, false, reply_markup)
else
return merolua.sendText(msg.chat_id,msg.id,"✯︙ليس لديك زوجه","md")
end
end
if text == "زواجي" and ChCheck(msg) then
if not Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") and not Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
return merolua.sendText(msg_chat_id,msg_id,"انت اعزب","md")
end
if Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:")
print()
local zoog2 = Redis:get(TheRMAD..msg_chat_id..zwga_id.."rgalll2:") 
local mhrr = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
local id_rgal = merolua.getUser(zwga_id)
fne = Redis:get(TheRMAD..':toob:Name:'..zwga_id)
alzog = "["..id_rgal.first_name.."](tg://user?id="..zwga_id..") "
local albnt = merolua.getUser(zoog2)
fnte = Redis:get(TheRMAD..':toob:Name:'..zoog2)
albnt = "["..albnt.first_name.."](tg://user?id="..zoog2..") "
return merolua.sendText(msg_chat_id,msg_id,"• عقد زواجكم\n• الزوج : "..alzog.."\n• الزوجه : "..albnt.." \n• المهر : "..mhrr.." دينار ","md")
end
if Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") then
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local zoog2 = Redis:get(TheRMAD..msg_chat_id..zwga_id.."bnttt2:") 
local mhrr = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
local id_rgal = merolua.getUser(zwga_id)
fnte = Redis:get(TheRMAD..':toob:Name:'..zwga_id)
albnt = "["..id_rgal.first_name.."](tg://user?id="..zwga_id..") "
local gg = merolua.getUser(zoog2)
fntey = Redis:get(TheRMAD..':toob:Name:'..zoog2)
alzog = "["..gg.first_name.."](tg://user?id="..zoog2..") "
return merolua.sendText(msg_chat_id,msg_id,"• عقد زواجكم\n• الزوج : "..alzog.."\n• الزوجه : "..albnt.." \n• المهر : "..mhrr.." دينار ","md")
end
end
if text == "خلع" and ChCheck(msg) then
if not Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
return merolua.sendText(msg.chat_id,msg.id, "• الخلع للمتزوجات فقط \n","md",true)
end
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
local zoog2 = Redis:get(TheRMAD..msg_chat_id..zwga_id.."rgalll2:") 
local mhrr = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(mhrr) then
return merolua.sendText(msg.chat_id,msg.id, "عشان تخلعينه لازم تجمعين "..mhrr.." دينار\n-","md",true)
end
local gg = merolua.getUser(zwga_id)
alzog = " "..gg.first_name.." "
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
Redis:incrby(TheRMAD.."nool:flotysb"..zwga_id,mhrr)
Redis:decrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id,mhrr)
Redis:del(TheRMAD.."mznom"..msg_chat_id..zwga_id)
Redis:srem(TheRMAD.."almtzog"..msg_chat_id,zwga_id)
Redis:del(TheRMAD.."mznom"..msg_chat_id..msg.sender_id.user_id)
Redis:srem(TheRMAD.."almtzog"..msg_chat_id,msg.sender_id.user_id)
Redis:del(TheRMAD..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
Redis:del(TheRMAD..msg_chat_id..zwga_id.."mhrrr2:")
Redis:del(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:")
Redis:del(TheRMAD..msg_chat_id..zwga_id.."bnttt2:")
Redis:del(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:")
Redis:del(TheRMAD..msg_chat_id..zwga_id.."rgalll2:")
merolua.sendText(msg_chat_id,msg_id,"• تم خلعت زوجك "..alzog.." \n ورجعت له "..mhrr.." دينار","md")
end
if text == "طالق"  then
if not Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") then
return merolua.sendText(msg.chat_id,msg.id, "• الطلاق للمتزوجين فقط \n","md",true)
end
local zwga_id = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local zoog2 = Redis:get(TheRMAD..msg_chat_id..zwga_id.."bnttt2:") 
local mhrr = Redis:get(TheRMAD..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
local gg = merolua.getUser(zwga_id)
alzog = " "..gg.first_name.." "
merolua.sendText(msg_chat_id,msg_id,"• تم طلقتك من "..alzog.."","md")
Redis:del(TheRMAD.."mznom"..msg_chat_id..zwga_id)
Redis:srem(TheRMAD.."almtzog"..msg_chat_id,zwga_id)
Redis:del(TheRMAD.."mznom"..msg_chat_id..msg.sender_id.user_id)
Redis:srem(TheRMAD.."almtzog"..msg_chat_id,msg.sender_id.user_id)
Redis:del(TheRMAD..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
Redis:del(TheRMAD..msg_chat_id..zwga_id.."mhrrr2:")
Redis:del(TheRMAD..msg_chat_id..msg.sender_id.user_id.."bnttt2:")
Redis:del(TheRMAD..msg_chat_id..zwga_id.."bnttt2:")
Redis:del(TheRMAD..msg_chat_id..msg.sender_id.user_id.."rgalll2:")
Redis:del(TheRMAD..msg_chat_id..zwga_id.."rgalll2:") 
end
if text == 'تصفير النتائج' and ChCheck(msg) or text == 'مسح لعبه البنك' and ChCheck(msg) then
if not msg.DevelopersQ then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local bank_users = Redis:smembers(TheRMAD.."ttpppi")
if #bank_users ~= 0 then
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(TheRMAD.."nool:flotysb"..v) or 0
table.insert(mony_list, {tonumber(mony) , v})
end table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ "🥇 )" ,"🥈 )","🥉 )","4 )","5 )","6 )","7 )","8 )","9 )","10 )","11 )","12 )","13 )","14 )","15 )","16 )","17 )","18 )","19 )","20 )"}
for k,v in pairs(mony_list) do
if num <= 4 then
local mony = v[1]
local emo = emoji[k]
num = num + 1
if emo == "🥇 )" then
gflos = string.format("%.0f", v[1]):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
Redis:set(TheRMAD.."MyMdaleateamnay"..v[2],os.date("%Y/%m/%d")..' - ( '..emo..' - '..gflos)
elseif emo == "🥈 )" then
gflos = string.format("%.0f", v[1]):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
Redis:set(TheRMAD.."MyMdaleateamnay"..v[2],os.date("%Y/%m/%d")..' - ( '..emo..' - '..gflos)
elseif emo == "🥉 )" then
gflos = string.format("%.0f", v[1]):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
Redis:set(TheRMAD.."MyMdaleateamnay"..v[2],os.date("%Y/%m/%d")..' - ( '..emo..' - '..gflos)
end;end;end;end

local bank_users = Redis:smembers(TheRMAD.."noooybgy")
for k,v in pairs(bank_users) do
Redis:del(TheRMAD.."nool:flotysb"..v)
Redis:del(TheRMAD.."zrffdcf"..v)
Redis:del(TheRMAD.."innoo"..v)
Redis:del(TheRMAD.."nnooooo"..v)
Redis:del(TheRMAD.."nnoooo"..v)
Redis:del(TheRMAD.."nnooo"..v)
Redis:del(TheRMAD.."nnoo"..v)
Redis:del(TheRMAD.."polic"..v)
Redis:del(TheRMAD.."ashmvm"..v)
Redis:del(TheRMAD.."hrame"..v)
Redis:del(TheRMAD.."test:mmtlkat6"..v)
Redis:del(TheRMAD.."zahbmm2"..v)
end
Redis:del(TheRMAD.."ttpppi")

merolua.sendText(msg.chat_id,msg.id, "• مسحت لعبه البنك ","md",true)
end


if text == 'تصفير الحراميه' and ChCheck(msg) then
if not msg.DevelopersQ then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local bank_users = Redis:smembers(TheRMAD.."zrfffidtf")
for k,v in pairs(bank_users) do
Redis:del(TheRMAD.."zrffdcf"..v)
end
Redis:del(TheRMAD.."zrfffidtf")
merolua.sendText(msg.chat_id,msg.id, "• مسحت الحراميه ","md",true)
end

--- if bankstok
if not Redis:get(TheRMAD.."lock_getpankiuser"..msg.chat_id) then
if text == 'انشاء حساب بنكي' and ChCheck(msg) or text == 'انشاء حساب البنكي' and ChCheck(msg) or text =='انشاء الحساب بنكي' and ChCheck(msg) or text =='انشاء الحساب البنكي' and ChCheck(msg) then
creditvi = math.random(200,30000000000255);
creditex = math.random(300,40000000000255);
creditcc = math.random(400,80000000000255)

balas = 0
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
return merolua.sendText(msg.chat_id,msg.id, "• لديك حساب بنكي مسبقاً\n\n• لعرض معلومات حسابك اكتب\n↤︎ `حسابي`","md",true)
end
Redis:setex(TheRMAD.."nooolb" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
merolua.sendText(msg.chat_id,msg.id,[[
• اذا حاب تسوي حساب بنكي لازم تختار احد البنوك الاتيه

↤︎ `بنك الرشيد`
↤︎ `بنك الرافدين`
↤︎ `بنك دولي`

- اضغط للنسخ

]],"md",true)  
return false
end
if Redis:get(TheRMAD.."nooolb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
if text == "بنك الرشيد" and ChCheck(msg) then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
gg = "فيزا"
flossst = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local banid = msg.sender_id.user_id
Redis:set(TheRMAD.."nonna"..msg.sender_id.user_id,news)
Redis:set(TheRMAD.."noolb"..msg.sender_id.user_id,creditcc)
Redis:set(TheRMAD.."nnonb"..msg.sender_id.user_id,text)
Redis:set(TheRMAD.."nnonbn"..msg.sender_id.user_id,gg)
Redis:set(TheRMAD.."nonallname"..creditcc,news)
Redis:set(TheRMAD.."nonallbalc"..creditcc,balas)
Redis:set(TheRMAD.."nonallcc"..creditcc,creditcc)
Redis:set(TheRMAD.."nonallban"..creditcc,text)
Redis:set(TheRMAD.."nonallid"..creditcc,banid)
Redis:sadd(TheRMAD.."noooybgy",msg.sender_id.user_id)
Redis:del(TheRMAD.."nooolb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
merolua.sendText(msg.chat_id,msg.id, "\n•  وسوينالك حساب بالبنك  ( بنك الرشيد 💳 )  \n\n• رقم حسابك ↢ ( `"..creditcc.."` )\n• نوع البطاقة ↢ ( "..gg.." )\n• فلوسك ↢ ( `"..flossst.."` دينار 💸 )  ","md",true)  
end 
if text == "بنك الرافدين" and ChCheck(msg) then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
gg = "ماستر كارد"
flossst = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local banid = msg.sender_id.user_id
Redis:set(TheRMAD.."nonna"..msg.sender_id.user_id,news)
Redis:set(TheRMAD.."noolb"..msg.sender_id.user_id,creditvi)
Redis:set(TheRMAD.."nnonb"..msg.sender_id.user_id,text)
Redis:set(TheRMAD.."nnonbn"..msg.sender_id.user_id,gg)
Redis:set(TheRMAD.."nonallname"..creditvi,news)
Redis:set(TheRMAD.."nonallbalc"..creditvi,balas)
Redis:set(TheRMAD.."nonallcc"..creditvi,creditvi)
Redis:set(TheRMAD.."nonallban"..creditvi,text)
Redis:set(TheRMAD.."nonallid"..creditvi,banid)
Redis:sadd(TheRMAD.."noooybgy",msg.sender_id.user_id)
Redis:del(TheRMAD.."nooolb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
merolua.sendText(msg.chat_id,msg.id, "\n• وسوينالك حساب بالبنك  ( بنك الرافدين 💳 ) \n\n• رقم حسابك ↢ ( `"..creditvi.."` )\n• نوع البطاقة ↢ ( "..gg.." )\n• فلوسك ↢ ( `"..flossst.."` دينار 💸 )  ","md",true)   
end 
if text == "بنك دولي" and ChCheck(msg) then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
gg = "مدى"
flossst = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local banid = msg.sender_id.user_id
Redis:set(TheRMAD.."nonna"..msg.sender_id.user_id,news)
Redis:set(TheRMAD.."noolb"..msg.sender_id.user_id,creditex)
Redis:set(TheRMAD.."nnonb"..msg.sender_id.user_id,text)
Redis:set(TheRMAD.."nnonbn"..msg.sender_id.user_id,gg)
Redis:set(TheRMAD.."nonallname"..creditex,news)
Redis:set(TheRMAD.."nonallbalc"..creditex,balas)
Redis:set(TheRMAD.."nonallcc"..creditex,creditex)
Redis:set(TheRMAD.."nonallban"..creditex,text)
Redis:set(TheRMAD.."nonallid"..creditex,banid)
Redis:sadd(TheRMAD.."noooybgy",msg.sender_id.user_id)
Redis:del(TheRMAD.."nooolb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
merolua.sendText(msg.chat_id,msg.id, "\n•  وسوينالك حساب بالبنك ( بنك دولي 💳 ) \n\n• رقم حسابك ↢ ( `"..creditex.."` )\n• نوع البطاقة ↢ ( "..gg.." )\n• فلوسك ↢ ( `"..flossst.."` دينار 💸 )  ","md",true)   
end 
end
if text == 'مسح حساب بنكي' and ChCheck(msg) or text == 'مسح حسابي' and ChCheck(msg) or text == 'حذف حسابي' and ChCheck(msg) or text == 'مسح حساب البنكي' and ChCheck(msg) or text =='مسح الحساب بنكي' and ChCheck(msg) or text =='مسح الحساب البنكي' and ChCheck(msg) or text == "مسح حسابي البنكي" and ChCheck(msg) or text == "مسح حسابي بنكي" and ChCheck(msg) then
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
Redis:srem(TheRMAD.."noooybgy", msg.sender_id.user_id)
Redis:del(TheRMAD.."noolb"..msg.sender_id.user_id)
Redis:del(TheRMAD.."zrffdcf"..msg.sender_id.user_id)
Redis:srem(TheRMAD.."zrfffidtf", msg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id, "• مسحت حسابك البنكي ","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي دز ↢ ( `انشاء حساب بنكي` )","md",true)
end
end



if text == 'فلوسي' and ChCheck(msg) or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 1 then
return merolua.sendText(msg.chat_id,msg.id, "• ماعندك فلوس ارسل انشاء حساب بنكي وجمع الفلوس \n-","md",true)
end
merolua.sendText(msg.chat_id,msg.id, "• فلوسك `"..ballancee.."` دينار 💸","md",true)
end
if text == 'فلوسه' and ChCheck(msg) or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\nغبي هذا بوت","md",true)  
return false
end
ballanceed = Redis:get(TheRMAD.."nool:flotysb"..Remsg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "• فلوسه *"..ballanceed.." دينار* 💸","md",true)
end
if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = merolua.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
if Redis:sismember(TheRMAD.."noooybgy",Remsg.sender_id.user_id) then
cccc = Redis:get(TheRMAD.."noolb"..Remsg.sender_id.user_id)
gg = Redis:get(TheRMAD.."nnonb"..Remsg.sender_id.user_id)
uuuu = Redis:get(TheRMAD.."nnonbn"..Remsg.sender_id.user_id)
pppp = Redis:get(TheRMAD.."zrffdcf"..Remsg.sender_id.user_id) or 0
ballancee = Redis:get(TheRMAD.."nool:flotysb"..Remsg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "• الاسم ↢ "..news.."\n• الحساب ↢ `"..cccc.."`\n• بنك ↢ ( "..gg.." )\n• نوع ↢ ( "..uuuu.." )\n• الرصيد ↢ ( "..ballancee.." دينار 💸 )\n• الخمط ( "..pppp.." دينار 💸 )\n-","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حسابي' and ChCheck(msg) or text == 'حسابي البنكي' and ChCheck(msg) or text == 'رقم حسابي' and ChCheck(msg) then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
cccc = Redis:get(TheRMAD.."noolb"..msg.sender_id.user_id)
gg = Redis:get(TheRMAD.."nnonb"..msg.sender_id.user_id)
uuuu = Redis:get(TheRMAD.."nnonbn"..msg.sender_id.user_id)
pppp = Redis:get(TheRMAD.."zrffdcf"..msg.sender_id.user_id) or 0
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "• الاسم ↢ "..news.."\n• الحساب ↢ `"..cccc.."`\n• بنك ↢ ( "..gg.." )\n• نوع ↢ ( "..uuuu.." )\n• الرصيد ↢ ( "..ballancee.." دينار 💸 )\n• السرقه ( "..pppp.." دينار 💸 )\n-","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مضاربه' and ChCheck(msg) then
if Redis:get(TheRMAD.."nnooooo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."nnooooo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• مايمديك تضارب الحين\n• تعال بعد "..rr.." دقيقة") 
end
merolua.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مضاربه` المبلغ","md",true)
end
if text and text:match('^مضاربه (.*)$') and ChCheck(msg) then
local UserName = text:match('^مضاربه (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = tonumber(coniss)
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
if Redis:get(TheRMAD.."nnooooo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."nnooooo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• مايمديك تضارب الحين\n• تعال بعد "..rr.." دقيقة") 
end
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 199 then
return merolua.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح هو 200 دينار 💸\n-","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return merolua.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
end
local modarba = {"1", "2", "3", "4️",}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = math.floor(coniss / 100 * modarbaa)
ballanceekkku = math.floor(ballancee - ballanceekku)
Redis:decrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , ballanceekku)
Redis:setex(TheRMAD.."nnooooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "• مضاربة فاشلة \n• نسبة الخسارة ↢ "..modarbaa.."%\n• المبلغ الذي خسرته ↢ ( "..ballanceekku.." دينار 💸 )\n• فلوسك صارت ↢ ( "..ballanceekkku.." دينار 💸 )\n-","md",true)
elseif Descriptioontt == "2" or Descriptioontt == "4" then
ballanceekku = math.floor(coniss / 100 * modarbaa)
ballanceekkku = math.floor(ballancee + ballanceekku)
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , math.floor(ballanceekku))
Redis:setex(TheRMAD.."nnooooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "• مضاربة ناجحة \n• نسبة الربح ↢ "..modarbaa.."%\n• المبلغ الذي ربحته ↢ ( "..ballanceekku.." دينار 💸 )\n• فلوسك صارت ↢ ( "..ballanceekkku.." دينار ?? )\n-","md",true)
end
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'استثمار' and ChCheck(msg) then
if Redis:get(TheRMAD.."nnoooo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."nnoooo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• مايمديك تستثمر الحين\n• تعال بعد "..rr.." دقيقة") 
end
merolua.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`استثمار` المبلغ","md",true)
end
if text and text:match('^استثمار (.*)$') and ChCheck(msg) then
local UserName = text:match('^استثمار (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = tonumber(coniss)
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
if Redis:get(TheRMAD.."nnoooo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."nnoooo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• مايمديك تستثمر الحين\n• تعال بعد "..rr.." دقيقة") 
end
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 199 then
return merolua.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح هو 200 دينار 💸\n-","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return merolua.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
end
if Redis:get(TheRMAD.."xxxr" .. msg.sender_id.user_id) then
ballanceekk = math.floor(coniss / 100 * 10)
ballanceekkk = math.floor(ballancee + ballanceekk)
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , math.floor(ballanceekk))
Redis:sadd(TheRMAD.."ttpppi",msg.sender_id.user_id)
Redis:setex(TheRMAD.."nnoooo" .. msg.sender_id.user_id,1200, true)
return merolua.sendText(msg.chat_id,msg.id, "• استثمار ناجح 2x\n• نسبة الربح ↢ 10%\n• مبلغ الربح ↢ ( "..ballanceekk.." دينار 💸 )\n• فلوسك صارت ↢ ( "..ballanceekkk.." دينار 💸 )\n-","md",true)
end
local hadddd = math.random(0,25);
ballanceekk = math.floor(coniss / 100 * hadddd)
ballanceekkk = math.floor(ballancee + ballanceekk)
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , math.floor(ballanceekk))
Redis:setex(TheRMAD.."nnoooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "• استثمار ناجح \n• نسبة الربح ↢ "..hadddd.."%\n• مبلغ الربح ↢ ( "..ballanceekk.." دينار 💸 )\n• فلوسك صارت ↢ ( "..ballanceekkk.." دينار 💸 )\n-","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تصفير فلوسي' and ChCheck(msg) then
Redis:del(TheRMAD.."nool:flotysb"..msg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id, "تم تصفير فلوسك","md",true)
end
if text == 'حظ' and ChCheck(msg) then
if Redis:get(TheRMAD.."nnooo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."nnooo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• مايمديك تلعب لعبة الحظ الحين\n• تعال بعد "..rr.." دقيقة") 
end
merolua.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`حظ` المبلغ","md",true)
end
if text and text:match('^حظ (%d+)$') and ChCheck(msg) then
local coniss = text:match('^حظ (%d+)$')
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
if Redis:get(TheRMAD.."nnooo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."nnooo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• مايمديك تلعب لعبة الحظ الحين\n• تعال بعد "..rr.." دقيقة") 
end
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return merolua.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
end
local daddd = {1,2,3,5,6};
local haddd = daddd[math.random(#daddd)]
if haddd == 1 or haddd == 2 or haddd == 3 then
local ballanceek = math.floor(coniss + coniss)

Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , math.floor(ballanceek))
Redis:setex(TheRMAD.."nnooo" .. msg.sender_id.user_id,1200, true)
ff = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id, "• مبروك فزت بالحظ \n• فلوسك قبل ↢ ( "..ballancee.." دينار 💸 )\n• الربح ↢ ( "..ballanceek.." دينار 💸 )\n• فلوسك الحين ↢ ( "..ff.." دينار 💸 )\n-","md",true)
elseif haddd == 5 or haddd == 6 then
Redis:decrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , coniss)
Redis:setex(TheRMAD.."nnooo" .. msg.sender_id.user_id,1200, true)
ff = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "• للاسف خسرت بالحظ \n• فلوسك قبل ↢ ( "..ballancee.." دينار 💸 )\n• الخساره ↢ ( "..coniss.." دينار 💸 )\n• فلوسك الحين ↢ ( "..ff.." دينار 💸 )\n-","md",true)
end
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end


if text == 'تحويل' and ChCheck(msg) then
merolua.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`تحويل` المبلغ","md",true)
end

if text and text:match('^تحويل (.*)$') and ChCheck(msg) then
local UserName = text:match('^تحويل (.*)$')
local coniss = tostring(UserName)
local coniss = coniss:gsub('٠','0')
local coniss = coniss:gsub('١','1')
local coniss = coniss:gsub('٢','2')
local coniss = coniss:gsub('٣','3')
local coniss = coniss:gsub('٤','4')
local coniss = coniss:gsub('٥','5')
local coniss = coniss:gsub('٦','6')
local coniss = coniss:gsub('٧','7')
local coniss = coniss:gsub('٨','8')
local coniss = coniss:gsub('٩','9')
local coniss = tonumber(coniss)
if not Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
return merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ","md",true)
end
if tonumber(coniss) < 100 then
return merolua.sendText(msg.chat_id,msg.id, "• الحد الادنى المسموح به هو 100 دينار \n-","md",true)
end
ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return merolua.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي \n-","md",true)
end

if tonumber(coniss) > tonumber(ballancee) then
return merolua.sendText(msg.chat_id,msg.id, "• فلوسك ماتكفي\n-","md",true)
end

Redis:set(TheRMAD.."transn"..msg.sender_id.user_id,coniss)
Redis:setex(TheRMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
merolua.sendText(msg.chat_id,msg.id,[[
• ارسل الحين رقم الحساب البنكي الي تبي تحول له

-
]],"md",true)  
return false
end
if Redis:get(TheRMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
cccc = Redis:get(TheRMAD.."noolb"..msg.sender_id.user_id)
gg = Redis:get(TheRMAD.."nnonb"..msg.sender_id.user_id)
uuuu = Redis:get(TheRMAD.."nnonbn"..msg.sender_id.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del(TheRMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(TheRMAD.."transn" .. msg.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"• ارسل رقم حساب بنكي ","md",true)
end
if text == cccc then
Redis:del(TheRMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(TheRMAD.."transn" .. msg.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"• مايمديك تحول لنفسك ","md",true)
end
if Redis:get(TheRMAD.."nonallcc"..text) then
local UserNamey = Redis:get(TheRMAD.."transn"..msg.sender_id.user_id)
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
local fsvhhh = Redis:get(TheRMAD.."nonallid"..text)
local bann = merolua.getUser(fsvhhh)
hsabe = Redis:get(TheRMAD.."nnonb"..fsvhhh)
nouu = Redis:get(TheRMAD.."nnonbn"..fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end

if gg == hsabe then
nsba = "خصمت 5% لبنك "..hsabe..""
UserNameyr = math.floor(UserNamey / 100 * 5)
UserNameyy = math.floor(UserNamey - UserNameyr)
Redis:incrby(TheRMAD.."nool:flotysb"..fsvhhh ,UserNameyy)
Redis:decrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id ,UserNamey)
merolua.sendText(msg.chat_id,msg.id, "حوالة صادرة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nالبنك : "..hsabe.."\nنوع البطاقة : "..nouu.."\n"..nsba.."\nالمبلغ : "..UserNameyy.." دينار 💸","md",true)
merolua.sendText(fsvhhh,0, "حوالة واردة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..UserNameyy.." دينار 💸","md",true)
Redis:del(TheRMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(TheRMAD.."transn" .. msg.sender_id.user_id)
elseif gg ~= hsabe then
nsba = "خصمت 10% من بنك لبنك"
UserNameyr = math.floor(UserNamey / 100 * 10)
UserNameyy = math.floor(UserNamey - UserNameyr)
Redis:incrby(TheRMAD.."nool:flotysb"..fsvhhh ,UserNameyy)
Redis:decrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , UserNamey)
merolua.sendText(msg.chat_id,msg.id, "حوالة صادرة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nالبنك : "..hsabe.."\nنوع البطاقة : "..nouu.."\n"..nsba.."\nالمبلغ : "..UserNameyy.." دينار 💸","md",true)
merolua.sendText(fsvhhh,0, "حوالة واردة من البنك ↢ ( "..gg.." )\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..UserNameyy.." دينار 💸","md",true)
Redis:del(TheRMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(TheRMAD.."transn" .. msg.sender_id.user_id)
end
else
merolua.sendText(msg.chat_id,msg.id, "• مافيه حساب بنكي كذا","md",true)
Redis:del(TheRMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(TheRMAD.."transn" .. msg.sender_id.user_id)
end
end

if text == 'اكراميه' and ChCheck(msg) or text == 'بخشيش' and ChCheck(msg) then
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
if Redis:get(TheRMAD.."nnoo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."nnoo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• من شوي عطيتك انتظر "..rr.." دقيقة") 
end
if Redis:get(TheRMAD.."xxxr" .. msg.sender_id.user_id) then
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , 3000)
Redis:sadd(TheRMAD.."ttpppi",msg.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"• خذ بخشيش المحظوظين 3000 دينار 💸","md",true)
end
local jjjo = math.random(1,2000);
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , jjjo)
Redis:sadd(TheRMAD.."ttpppi",msg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id,"• خذ ي مطفر "..jjjo.." دينار 💸","md",true)
Redis:setex(TheRMAD.."nnoo" .. msg.sender_id.user_id,600, true)
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text and text:match("^فلوس @(%S+)$") and ChCheck(msg) then
local UserName = text:match("^فلوس @(%S+)$")
local UserId_Info = merolua.searchPublicChat(UserName)
if not UserId_Info.id then
return merolua.sendText(msg_chat_id,msg_id,"\n• مافيه حساب كذا ","md",true)  
end
local UserInfo = merolua.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
return merolua.sendText(msg_chat_id,msg_id,"\n• يا غبي ذا بوتتتت ","md",true)  
end
if Redis:sismember(TheRMAD.."noooybgy",UserId_Info.id) then
ballanceed = Redis:get(TheRMAD.."nool:flotysb"..UserId_Info.id) or 0
merolua.sendText(msg.chat_id,msg.id, "• فلوسه "..ballanceed.." دينار 💸","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
end
end

if text == 'سرقه' and tonumber(msg.reply_to_message_id) == 0 then
if Redis:get(TheRMAD.."polic" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."polic" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• ي ظالم توك سارق \n• تعال بعد "..rr.." دقيقة") 
end 
merolua.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`سرقه` بالرد","md",true)
end

if text == 'سرقه' and ChCheck(msg) or text == 'سرقهه' and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)

local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي تبي تسرقه نفسك ؟!","md",true)  
return false
end
if Redis:get(TheRMAD.."polic" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."polic" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• ي ظالم توك سارق \n• تعال بعد "..rr.." دقيقة") 
end 
if Redis:get(TheRMAD.."hrame" .. Remsg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."hrame" .. Remsg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• سارقينه قبلك \n• يمديك تسرقهه بعد "..rr.." دقيقة") 
end 
if Redis:sismember(TheRMAD.."noooybgy",Remsg.sender_id.user_id) then
ballanceed = Redis:get(TheRMAD.."nool:flotysb"..Remsg.sender_id.user_id) or 0
if tonumber(ballanceed) < 2000  then
return merolua.sendText(msg.chat_id,msg.id, "• مايمديك تسرقهه فلوسه اقل من 2000  دينار ??","md",true)
end
local bann = merolua.getUser(msg.sender_id.user_id)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..msg.sender_id.user_id..")"
else
newss = " لا يوجد "
end
local hrame = math.random(2000);
local ballanceed = Redis:get(TheRMAD.."nool:flotysb"..Remsg.sender_id.user_id) or 0
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , hrame)
Redis:decrby(TheRMAD.."nool:flotysb"..Remsg.sender_id.user_id , hrame)
Redis:sadd(TheRMAD.."ttpppi",msg.sender_id.user_id)
Redis:setex(TheRMAD.."hrame" .. Remsg.sender_id.user_id,900, true)
Redis:incrby(TheRMAD.."zrffdcf"..msg.sender_id.user_id,hrame)
Redis:sadd(TheRMAD.."zrfffidtf",msg.sender_id.user_id)
Redis:setex(TheRMAD.."polic" .. msg.sender_id.user_id,300, true)
merolua.sendText(msg.chat_id,msg.id, "• خذ يالحرامي سرقهته "..hrame.." دينار 💸\n","md",true)
local Get_Chat = merolua.getChat(msg_chat_id)
local NameGroup = Get_Chat.title
local id = tostring(msg.chat_id)
gt = string.upper(id:gsub('-100',''))
gtr = math.floor(msg.id/2097152/0.5)
telink = "http://t.me/c/"..gt.."/"..gtr..""
Text = "• الحق الحق على حلالك \n• الشخص ذا : "..newss.."\n• سرقهك "..hrame.." دينار 💸 \n• التاريخ : "..os.date("%Y/%m/%d").."\n• الساعة : "..os.date("%I:%M%p").." \n-"
keyboard = {}  
keyboard.inline_keyboard = {
{{text = NameGroup, url=telink}}, 
} 
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendmessage?chat_id=' .. Remsg.sender_id.user_id .. '&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
merolua.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
end
end
if text and text:match('سرقه @(.*)')  then
local username = text:match('سرقه @(.*)')
local UserId_Info = merolua.searchPublicChat(username)
if not UserId_Info.id then
return merolua.sendText(msg_chat_id,msg_id,"\n• مافيه حساب كذا ","md",true)  
end
local UserInfo = merolua.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي ذا بوتتتت","md",true)  
return false
end
if UserId_Info.id == msg.sender_id.user_id then
merolua.sendText(msg.chat_id,msg.id,"\nيا غبي تبي تسرقه نفسك ؟!","md",true)  
return false
end
if Redis:get(TheRMAD.."polic" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."polic" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• ي ظالم توك سارق \n• تعال بعد "..rr.." دقيقة") 
end 
if Redis:get(TheRMAD.."hrame" .. UserId_Info.id) then  
local check_time = Redis:ttl(TheRMAD.."hrame" .. UserId_Info.id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• سارقينه قبلك \n• يمديك تسرقهه بعد "..rr.." دقيقة") 
end 
if Redis:sismember(TheRMAD.."noooybgy",UserId_Info.id) then
ballanceed = Redis:get(TheRMAD.."nool:flotysb"..UserId_Info.id) or 0
if tonumber(ballanceed) < 2000  then
return merolua.sendText(msg.chat_id,msg.id, "• مايمديك تسرقهه فلوسه اقل من 2000  دينار 💸","md",true)
end
local bann = merolua.getUser(msg.sender_id.user_id)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..msg.sender_id.user_id..")"
else
newss = " لا يوجد "
end
local hrame = math.random(2000);
local ballanceed = Redis:get(TheRMAD.."nool:flotysb"..UserId_Info.id) or 0
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , hrame)
Redis:decrby(TheRMAD.."nool:flotysb"..UserId_Info.id , hrame)
Redis:sadd(TheRMAD.."ttpppi",msg.sender_id.user_id)
Redis:setex(TheRMAD.."hrame" .. UserId_Info.id,900, true)
Redis:incrby(TheRMAD.."zrffdcf"..msg.sender_id.user_id,hrame)
Redis:sadd(TheRMAD.."zrfffidtf",msg.sender_id.user_id)
Redis:setex(TheRMAD.."polic" .. msg.sender_id.user_id,300, true)
merolua.sendText(msg.chat_id,msg.id, "• خذ يالحرامي سرقهته "..hrame.." دينار 💸\n","md",true)
local Get_Chat = merolua.getChat(msg_chat_id)
local NameGroup = Get_Chat.title
local id = tostring(msg.chat_id)
gt = string.upper(id:gsub('-100',''))
gtr = math.floor(msg.id/2097152/0.5)
telink = "http://t.me/c/"..gt.."/"..gtr..""
Text = "• الحق الحق على حلالك \n• الشخص ذا : "..newss.."\n• سرقهك "..hrame.." دينار 💸 \n• التاريخ : "..os.date("%Y/%m/%d").."\n• الساعة : "..os.date("%I:%M%p").." \n-"
keyboard = {}  
keyboard.inline_keyboard = {
{{text = NameGroup, url=telink}}, 
} 
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendmessage?chat_id=' .. UserId_Info.id .. '&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
merolua.sendText(msg.chat_id,msg.id, "• ماعنده حساب بنكي ","md",true)
end
end


if text == 'راتب' and ChCheck(msg) or text == 'راتبي' and ChCheck(msg) then
if Redis:sismember(TheRMAD.."noooybgy",msg.sender_id.user_id) then
if Redis:get(TheRMAD.."innoo" .. msg.sender_id.user_id) then  
local check_time = Redis:ttl(TheRMAD.."innoo" .. msg.sender_id.user_id)
rr = os.date("%M:%S",tonumber(check_time))
return merolua.sendText(msg.chat_id, msg.id,"• راتبك بينزل بعد "..rr.." دقيقة") 
end 
if Redis:get(TheRMAD.."xxxr" .. msg.sender_id.user_id) then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
K = 'محظوظ 2x' 
F = '15000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = 
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
return merolua.sendText(msg.chat_id, msg.id,"اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸","md",true) 
end 
Redis:sadd(TheRMAD.."ttpppi",msg.sender_id.user_id)
local Textinggt = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25};
local sender = Textinggt[math.random(#Textinggt)]
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
if sender == 1 then
K = 'مهندس 👨🏻‍🏭' 
F = '3000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 2 then
    K = ' ممرض 🧑🏻‍⚕' 
    F = '2500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 3 then
    K = ' معلم 👨🏻‍🏫' 
    F = '3800'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 4 then
    K = ' سواق 🧍🏻‍♂' 
    F = '1200'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 5 then
    K = ' دكتور 👨🏻‍⚕️' 
    F = '4500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 6 then
    K = ' محامي ⚖️' 
    F = '6500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار ??\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 7 then
    K = ' حداد 🧑🏻‍??' 
    F = '1500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 8 then
    K = 'طيار 👨🏻‍✈️' 
    F = '5000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 9 then
    K = 'حارس أمن 👮🏻' 
    F = '3500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 10 then
    K = 'حلاق 💇🏻‍♂' 
    F = '1400'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 11 then
    K = 'محقق 🕵🏼‍♂' 
    F = '5000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 12 then
    K = 'ضابط 👮🏻‍♂' 
    F = '7500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 13 then
    K = 'عسكري 👮🏻' 
    F = '6500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 14 then
    K = 'عاطل 🙇🏻' 
    F = '1000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 15 then
    K = 'رسام 👨🏻‍🎨' 
    F = '1600'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 16 then
    K = 'ممثل 🦹🏻' 
    F = '5400'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 17 then
    K = 'مهرج 🤹🏻‍♂' 
    F = '2000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 18 then
    K = 'قاضي 👨🏻‍⚖' 
    F = '8000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 19 then
    K = 'مغني 🎤' 
    F = '3400'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 20 then
    K = 'مدرب 🏃🏻‍♂' 
    F = '2500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 21 then
    K = 'بحار 🛳' 
    F = '3500'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 22 then
    K = 'مبرمج 👨🏼‍💻' 
    F = '3200'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 23 then
    K = 'لاعب ⚽️' 
    F = '4700'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 24 then
    K = 'كاشير 🧑🏻‍💻' 
    F = '3000'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار ??"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
elseif sender == 25 then
    K = 'مزارع 👨🏻‍🌾' 
    F = '2300'
Redis:incrby(TheRMAD.."nool:flotysb"..msg.sender_id.user_id , F)
local ballancee = Redis:get(TheRMAD.."nool:flotysb"..msg.sender_id.user_id) or 0
local teex = "اشعار ايداع "..neews.."\nالمبلغ : "..F.." دينار 💸\nوظيفتك : "..K.."\nنوع العملية : اضافة راتب\nرصيدك الحين : "..ballancee.." دينار 💸"
merolua.sendText(msg.chat_id,msg.id,teex,"md",true)
Redis:setex(TheRMAD.."innoo" .. msg.sender_id.user_id,600, true)
end
else
merolua.sendText(msg.chat_id,msg.id, "• ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
end
end
return {TheRMAD = reply}
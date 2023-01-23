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

if text == 'من سيربح المليون' or text == 'لعبه من سيربح المليون' then
if not Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
conisss = "100000"
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(conisss) > tonumber(ballanceed) then
return LuaTele.sendText(ChatId,Msg_id,  " ● فلوسك  لزم تكون 100,000 لي تلعب \n","md",true)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '🎮 › بدأ العب',  data=msg.sender_id.user_id.."/malion"},
},
{
{text = '🏃 › إنسحاب',  data =msg.sender_id.user_id..'/'.. 'delAmr'},
},
}
}
 LuaTele.sendText(msg.chat_id,msg.id,'*\n🏆 › مرحباً بك عزيزي في لعبه من سيربح المليون\n 📝 › هنعرض عليك اسال اذا حليت أعطيك فلوس اذا خسرت اسحب فلوس من حسابك*',"md",false, false, false, false, reply_markup)
end
if text == "توب من ربح المليون" or text == "توب المليونير" then
local bank_users = Redis:smembers(noor.."hsab:bnk")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
conisss = "100000"
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(conisss) > tonumber(ballanceed) then
return LuaTele.sendText(ChatId,Msg_id,  " ●لا تلعب من قبل \n","md",true)
end
top_mony = "توب اغنى 10 أشخاص  :\n في لعبه من سيربح المليون\n ●○━━━━‌‌‏𝒂𝒍𝒇𝒂𝒌𝒉𝒎━━━━○●"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(noor.."flos:m"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4️⃣",
"5️⃣",
"6⃣",
"7️⃣",
"8️⃣",
"9⃣",
"10⃣",
"11️⃣",
"12⃣",
"13️⃣",
"14️⃣",
"15️⃣",
"16⃣",
"17⃣",
"18⃣",
"19⃣",
"20⃣"
}
for k,v in pairs(mony_list) do
if num <= 10 then
local UserInfo = LuaTele.getUser(v[2])
if UserInfo.first_name ~= '' then
end
local mony = v[1]
local emo = emoji[k]
num = num + 1
local Bnynwu = '['..UserInfo.first_name..'](tg://user?id='..v[2]..')'
top_mony = top_mony..emo.." "..mony.." › "..Bnynwu.." 💵 \n"
end
end
return LuaTele.sendText(msg.chat_id,msg.id,top_mony,"md",true)
end
if text == "عربياتي" or text == "عربيتي" then
local bank_users = Redis:smembers(noor.."hsab:bnk")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
local stya = Redis:get(noor.."Cyrat"..msg.sender_id.user_id) 
t = "\n ● قائمه العربيات \n ●○━━━━‌‌‏𝒂𝒍𝒇𝒂𝒌𝒉𝒎━━━━○●\n"
i = 0
for k,v in pairs(stya.ok) do
i = i + 1
t = t..i.."- `"..v.."` \n"
end
LuaTele.sendText(msg_chat_id,msg_id,t,"md",true) 
end
-----------------------الزواج-------------------------
if text == "توب المتزوجين" then
local bank_users = Redis:smembers(noor.."almtzog"..msg_chat_id)
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id," ● لا يوجد متزوجين بالقروب","md",true)
end
top_mony = "توب اغنى 10 زوجات بالقروب :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(noor.."mznom"..msg_chat_id..v) 
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
local zwga_id = Redis:get(noor..msg_chat_id..v[2].."rgalll2:")
local UserInfo = LuaTele.getUser(v[2])
if UserInfo.first_name ~= '' then
end
local ban = LuaTele.getUser(zwga_id)
if ban.first_name ~= '' then
end
local mony = v[1]
local emo = emoji[k]
num = num + 1
local user_tag = '['..UserInfo.first_name..'](tg://user?id='..v[2]..')'
local user_zog = '['..ban.first_name..'](tg://user?id='..zwga_id..')'
top_mony = top_mony..emo.." - "..mony.." › "..user_tag.."  - "..user_zog.." 💵\n"
end
end
return LuaTele.sendText(msg.chat_id,msg.id,top_mony,"md",true)
end
if text and text:match('^زواج (.*)$') and msg.reply_to_message_id ~= 0 then
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
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, " ● غبي تبي تتزوج نفسك!\n","md",true)
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(noor) then
return LuaTele.sendText(msg.chat_id,msg.id, " ● غبي تبي تتزوج بوت!\n","md",true)
end
if Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") then
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local zoog2 = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local ban = LuaTele.getUser(zoog2)
if ban.first_name ~= '' then
end
local user_tag = '['..ban.first_name..'](tg://user?id='..ban.id..')'
return LuaTele.sendText(msg_chat_id,msg_id," ● الحق ي : "..user_tag.." زوجك يبي يتزوج ","md")
end
if Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
local zoog2 = Redis:get(noor..msg_chat_id..zwga_id.."rgalll2:") 
local ban = LuaTele.getUser(zwga_id)
if ban.first_name ~= '' then
end
local alzog = '['..ban.first_name..'](tg://user?id='..ban.id..')'
return LuaTele.sendText(msg_chat_id,msg_id," ● الحقي ي : "..alzog.." زوجتك تبي تتزوج ","md")
end
ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 1000 then
return LuaTele.sendText(msg.chat_id,msg.id, " ● المهر لازم اكثر من 1000 جنيه 💵\n","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, " ● فلوسك ماتكفي للمهر\n","md",true)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Redis:get(noor..msg_chat_id..Message_Reply.sender_id.user_id.."rgalll2:") or Redis:get(noor..msg_chat_id..Message_Reply.sender_id.user_id.."bnttt2:") then
return LuaTele.sendText(msg.chat_id,msg.id, " ● لا تقرب للمتزوجين \n","md",true)
end
UserNameyr = math.floor(coniss / 15)
UserNameyy = math.floor(coniss - UserNameyr)
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
Redis:set(noor..msg_chat_id..Message_Reply.sender_id.user_id.."bnttt2:", msg.sender_id.user_id)
Redis:set(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:", Message_Reply.sender_id.user_id)
Redis:set(noor..msg_chat_id..Message_Reply.sender_id.user_id.."mhrrr2:", UserNameyy)
Redis:set(noor..msg_chat_id..msg.sender_id.user_id.."mhrrr2:", UserNameyy)
local id_rgal = LuaTele.getUser(msg.sender_id.user_id)
alzog = "["..id_rgal.first_name.."](tg://user?id="..msg.sender_id.user_id..") "
local albnt = LuaTele.getUser(Message_Reply.sender_id.user_id)
albnt = "["..albnt.first_name.."](tg://user?id="..Message_Reply.sender_id.user_id..") "
Redis:decrby(noor.."flos"..msg.sender_id.user_id , UserNameyy)
Redis:incrby(noor.."flos"..Message_Reply.sender_id.user_id , UserNameyy)
Redis:incrby(noor.."mznom"..msg_chat_id..msg.sender_id.user_id , UserNameyy)
Redis:sadd(noor.."almtzog"..msg_chat_id,msg.sender_id.user_id)
return LuaTele.sendText(msg_chat_id,msg_id," ● مبرووك تم زواجكم\n ● الزوج :"..alzog.."\n ● الزوجه :"..albnt.."\n ● المهر : "..UserNameyy.." بعد خصم 15% \n ● لعرض عقدكم اكتبو زواجي","md")
end
if text == "زوجي" then
if Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
local zoog2 = Redis:get(noor..msg_chat_id..zwga_id.."rgalll2:") 
local ban = LuaTele.getUser(zwga_id)
if ban.first_name ~= '' then
end
local alzog = '['..ban.first_name..'](tg://user?id='..ban.id..')'
return LuaTele.sendText(msg.chat_id,msg.id," ● ي : "..alzog.." زوجتك تبيك ","md")
else
return LuaTele.sendText(msg.chat_id,msg.id," ● اطلبي الله ودوري لك ع زوج ","md")
end
end

if text == "زوجتي" then
if Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") then
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local zoog2 = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
local ban = LuaTele.getUser(zoog2)
if ban.first_name ~= '' then
end
local albnt = '['..ban.first_name..'](tg://user?id='..ban.id..')'
return LuaTele.sendText(msg_chat_id,msg_id," ● ي : "..albnt.." زوجك يبيك ","md")
else
return LuaTele.sendText(msg.chat_id,msg.id," ● اطلب الله ودورلك ع زوجه ","md")
end
end
if text == "زواجي" then
if not Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") and not Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
return LuaTele.sendText(msg_chat_id,msg_id,"انت اعزب","md")
end
if Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
local zoog2 = Redis:get(noor..msg_chat_id..zwga_id.."rgalll2:") 
local mhrr = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
local ban = LuaTele.getUser(zwga_id)
if ban.first_name ~= '' then
end
local alzog = '['..ban.first_name..'](tg://user?id='..ban.id..')'
local ban = LuaTele.getUser(zoog2)
if ban.first_name ~= '' then
end
local albnt = '['..ban.first_name..'](tg://user?id='..ban.id..')'
return LuaTele.sendText(msg.chat_id,msg.id," ● عقد زواجكم\n ● الزوج : "..alzog.."\n ● الزوجه : "..albnt.." \n ● المهر : "..mhrr.." جنيه","md")
end
end

if text == "خلع" then
if not Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") then
return LuaTele.sendText(msg.chat_id,msg.id, " ● الخلع للمتزوجات فقط \n","md",true)
end
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
local zoog2 = Redis:get(noor..msg_chat_id..zwga_id.."rgalll2:") 
local mhrr = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(mhrr) then
return LuaTele.sendText(msg.chat_id,msg.id, "عشان تخلعينه لازم تجمعين "..mhrr.." جنيه\n-","md",true)
end
local gg = LuaTele.getUser(zwga_id)
alzog = " "..gg.first_name.." "
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:") 
Redis:incrby(noor.."flos"..zwga_id,mhrr)
Redis:decrby(noor.."flos"..msg.sender_id.user_id,mhrr)
Redis:del(noor.."mznom"..msg_chat_id..zwga_id)
Redis:srem(noor.."almtzog"..msg_chat_id,zwga_id)
Redis:del(noor.."mznom"..msg_chat_id..msg.sender_id.user_id)
Redis:srem(noor.."almtzog"..msg_chat_id,msg.sender_id.user_id)
Redis:del(noor..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
Redis:del(noor..msg_chat_id..zwga_id.."mhrrr2:")
Redis:del(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:")
Redis:del(noor..msg_chat_id..zwga_id.."bnttt2:")
Redis:del(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:")
Redis:del(noor..msg_chat_id..zwga_id.."rgalll2:")
LuaTele.sendText(msg_chat_id,msg_id," ● تم خلعت زوجك "..alzog.." \n ورجعت له "..mhrr.." جنيه","md")
end
if text == "طلاق"  then
if not Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") then
return LuaTele.sendText(msg.chat_id,msg.id, " ● الطلاق للمتزوجين فقط \n","md",true)
end
local zwga_id = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:") 
local zoog2 = Redis:get(noor..msg_chat_id..zwga_id.."bnttt2:") 
local mhrr = Redis:get(noor..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
local gg = LuaTele.getUser(zwga_id)
alzog = " "..gg.first_name.." "
LuaTele.sendText(msg_chat_id,msg_id," ● تم طلقتك من "..alzog.."","md")
Redis:del(noor.."mznom"..msg_chat_id..zwga_id)
Redis:srem(noor.."almtzog"..msg_chat_id,zwga_id)
Redis:del(noor.."mznom"..msg_chat_id..msg.sender_id.user_id)
Redis:srem(noor.."almtzog"..msg_chat_id,msg.sender_id.user_id)
Redis:del(noor..msg_chat_id..msg.sender_id.user_id.."mhrrr2:")
Redis:del(noor..msg_chat_id..zwga_id.."mhrrr2:")
Redis:del(noor..msg_chat_id..msg.sender_id.user_id.."bnttt2:")
Redis:del(noor..msg_chat_id..zwga_id.."bnttt2:")
Redis:del(noor..msg_chat_id..msg.sender_id.user_id.."rgalll2:")
Redis:del(noor..msg_chat_id..zwga_id.."rgalll2:") 
end
------------------------لعبه البنك---------------------------
if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' then
if Redis:ttl(noor.."polic:hkk" .. msg.sender_id.user_id) >= 280 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( ساعه )","md",true)
end
cobnum = tonumber(Redis:get(noor.."bandid"..msg.sender_id.user_id))
if cobnum == msg.sender_id.user_id then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ حسابك محظور من لعبة البنك","md",true)
end
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
neews = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
creditcc = math.random(5000000000000000,5999999999999999);
creditvi = math.random(4000000000000000,4999999999999999);
creditex = math.random(6000000000000000,6999999999999999);
balas = 50
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ لديك حساب بنكي مسبقاً\n\n⇜ لعرض معلومات حسابك اكتب\n⇠ `حسابي`","md",true)
end
Redis:setex(noor.."hsab:bnkb" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'ماستر',  data=msg.sender_id.user_id.."/masar"},{text = 'فيزا',  data=msg.sender_id.user_id.."/feza"},
},
{
{text = 'اكسبرس ',  data=msg.sender_id.user_id.."/exbzrs"},
},
}
}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n– عشان تسوي حساب لازم تختار نوع البطاقة \n– مدة الطلب دقيقة واحدة ويطردك الموظف .*',"md",false, false, false, false, reply_markup)
end
----------
if text == 'مسح حساب بنكي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" then
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
Redis:srem(noor.."hsab:bnk", msg.sender_id.user_id)
Redis:del(noor.."flos"..msg.sender_id.user_id)
Redis:del(noor.."number:bnk"..msg.sender_id.user_id)
Redis:del(noor.."zrfff"..msg.sender_id.user_id)
Redis:srem(noor.."zrfffid", msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مسحت حسابك البنكي 🏦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == 'مسح كل الفلوس' or text == 'مسح كل فلوس' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
local bank_users = Redis:smembers(noor.."hsab:bnk")
for k,v in pairs(bank_users) do
Redis:del(noor.."flos"..v)
Redis:del(noor.."kreednum"..v)
Redis:del(noor.."kreed"..v)
Redis:del(noor.."zrfff"..v)
end
local bank_usersr = Redis:smembers(noor.."zrfffid")
for k,v in pairs(bank_usersr) do
Redis:del(noor.."flos"..v)
Redis:del(noor.."zrfff"..v)
end
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مسحت كل فلوس اللعبة 🏦","md",true)
end
end
----------
if text == 'تصفير النتائج' or text == 'مسح لعبه البنك' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
local bank_users = Redis:smembers(noor.."hsab:bnk")
for k,v in pairs(bank_users) do
Redis:del(noor.."flos"..v)
Redis:del(noor.."kreednum"..v)
Redis:del(noor.."kreed"..v)
Redis:del(noor.."zrfff"..v)
Redis:del(noor.."numattack"..v)
end
local bank_usersr = Redis:smembers(noor.."zrfffid")
for k,v in pairs(bank_usersr) do
Redis:del(noor.."flos"..v)
Redis:del(noor.."zrfff"..v)
end
Redis:del(noor.."zrfffid")
Redis:del(noor.."hsab:bnk")
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مسحت لعبه البنك 🏦","md",true)
end
end
----------
if text == 'فلوسي' or text == 'فلوس' then
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
news = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", news)
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الرصيد ↢ ( "..ballanceed.." دولار 💵 )\n\n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ الفخم ماعندها حساب بالبنك 🤣*","md",true)  
return false
end
if Redis:sismember(noor.."hsab:bnk",Remsg.sender_id.user_id) then
ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسه "..ballanceed.." دولار 💵","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
news = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", news)
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
ccccc = Redis:get(noor.."number:bnk"..msg.sender_id.user_id)
uuuuu = Redis:get(noor.."no3:visa"..msg.sender_id.user_id)
ppppp = Redis:get(noor.."zrfff"..msg.sender_id.user_id) or 0
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( الفخم )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الرصيد ↢ ( "..ballanceed.." دولار 💵 )\n⇜ الزرف ↢ ( "..ppppp.." دولار 💵 )\n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
if msg.ControllerBot then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ الفخم ماعندها حساب بالبنك 🤣*","md",true)  
return false
end
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
news = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", news)
if Redis:sismember(noor.."hsab:bnk",Remsg.sender_id.user_id) then
ccccc = Redis:get(noor.."number:bnk"..Remsg.sender_id.user_id)
uuuuu = Redis:get(noor.."no3:visa"..Remsg.sender_id.user_id)
ppppp = Redis:get(noor.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
Redis:srem(noor.."hsab:bnk", Remsg.sender_id.user_id)
Redis:del(noor.."flos"..Remsg.sender_id.user_id)
Redis:del(noor.."number:bnk"..Remsg.sender_id.user_id)
Redis:del(noor.."zrfff"..Remsg.sender_id.user_id)
Redis:srem(noor.."zrfffid", Remsg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( الفخم )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الرصيد ↢ ( "..ballanceed.." دولار 💵 )\n⇜ الزرف ↢ ( "..ppppp.." دولار 💵 )\n⇜ مسكين مسحت حسابه \n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي اصلاً ","md",true)
end
end
end
if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
neews = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ الفخم ماعندها حساب بالبنك 🤣*","md",true)  
return false
end
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
news = '['..UserInfo.first_name..'](tg://user?id='..Remsg.sender_id.user_id..')'
if Redis:sismember(noor.."hsab:bnk",Remsg.sender_id.user_id) then
ccccc = Redis:get(noor.."number:bnk"..Remsg.sender_id.user_id)
uuuuu = Redis:get(noor.."no3:visa"..Remsg.sender_id.user_id)
ppppp = Redis:get(noor.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( الفخم )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الرصيد ↢ ( "..ballanceed.." دولار 💵 )\n⇜ الزرف ↢ ( "..ppppp.." دولار 💵 )\n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
if text and text:match('^مسح حساب (.*)$') or text and text:match('^مسح حسابه (.*)$') then
if msg.ControllerBot then
local UserName = text:match('^مسح حساب (.*)$') or text:match('^مسح حسابه (.*)$')
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
neews = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
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
local UserInfo = LuaTele.getUser(coniss)
if UserInfo.first_name ~= '' then
end
news = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", news)
if Redis:sismember(noor.."hsab:bnk",coniss) then
ccccc = Redis:get(noor.."number:bnk"..coniss)
uuuuu = Redis:get(noor.."no3:visa"..coniss)
ppppp = Redis:get(noor.."zrfff"..coniss) or 0
ballanceed = Redis:get(noor.."flos"..coniss) or 0
Redis:srem(noor.."hsab:bnk", coniss)
Redis:del(noor.."flos"..coniss)
Redis:del(noor.."number:bnk"..coniss)
Redis:del(noor.."zrfff"..coniss)
Redis:srem(noor.."zrfffid", coniss)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( الفخم )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الرصيد ↢ ( "..ballanceed.." دولار 💵 )\n⇜ الزرف ↢ ( "..ppppp.." دولار 💵 )\n⇜ مسكين مسحت حسابه \n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي اصلاً ","md",true)
end
end
end
if text and text:match('^حساب (.*)$') or text and text:match('^حسابه (.*)$') then
local UserName = text:match('^حساب (.*)$') or text:match('^حسابه (.*)$')
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
neews = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
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
if Redis:get(noor.."Soonllcc"..coniss) then
local yty = Redis:get(noor.."Soonllname"..coniss)
local dfhb = Redis:get(noor.."Soonllbalc"..coniss)
local fsvhh = Redis:get(noor.."Soonllban"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..yty.."\n⇜ الحساب ↢ `"..coniss.."`\n⇜ بنك ↢ ( الفخم )\n⇜ نوع ↢ ( "..fsvhh.." )\n⇜ الرصيد ↢ ( "..dfhb.." دولار 💵 )\n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مافيه حساب بنكي كذا","md",true)
end
end
--------------------
if text == 'مضاربه' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`مضاربه` المبلغ","md",true)
end
if text and text:match('^مضاربه (.*)$') then
local UserName = text:match('^مضاربه (.*)$')
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
neews = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
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
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 1180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 20 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 1120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 19 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 1060 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 18 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 1000 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 17 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 940 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 16 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 15 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 14 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 13 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosooo" .. msg.sender_id.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد ( 1 دقيقة )","md",true)
end
ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 100 دولار 💵\n✦","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✦","md",true)
end
local modarba = {"0", "1", "2", "3", "4️",}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee - ballanceekku
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(noor.."add:flosooo" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مضاربة فاشلة 📉\n⇜ نسبة الخسارة ↢ "..modarbaa.."%\n⇜ المبلغ الذي خسرته ↢ ( "..ballanceekku.." دولار 💵 )\n⇜ فلوسك صارت ↢ ( "..ballanceekkku.." دولار 💵 )\n✦","md",true)
elseif Descriptioontt == "2" or Descriptioontt == "4" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee + ballanceekku
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(noor.."add:flosooo" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مضاربة ناجحة 📈\n⇜ نسبة الربح ↢ "..modarbaa.."%\n⇜ المبلغ الذي ربحته ↢ ( "..ballanceekku.." دولار 💵 )\n⇜ فلوسك صارت ↢ ( "..ballanceekkku.." دولار 💵 )\n✦","md",true)
else
Redis:setex(noor.."add:flosooo" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ تأخرت اليوم والبنك مسكر ارجع بعدين \n✦","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == 'استثمار' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`استثمار` المبلغ","md",true)
end
if text and text:match('^استثمار (.*)$') then
local UserName = text:match('^استثمار (.*)$')
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
neews = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
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
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 1180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 20 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 1120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 19 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 1060 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 18 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 1000 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 17 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 940 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 16 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 15 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 14 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 13 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flosoo" .. msg.sender_id.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد ( 1 دقيقة )","md",true)
end
ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 100 دولار 💵\n✦","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✦","md",true)
end
local hadddd = math.random(0,17);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
Redis:incrby(noor.."flos"..msg.sender_id.user_id , math.floor(ballanceekk))
Redis:setex(noor.."add:flosoo" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ استثمار ناجح 💰\n⇜ نسبة الربح ↢ "..hadddd.."%\n⇜ مبلغ الربح ↢ ( "..ballanceekk.." دولار 💵 )\n⇜ فلوسك صارت ↢ ( "..ballanceekkk.." دولار 💵 )\n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == 'حظ' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\nحظ المبلغ","md",true)
end
if text and text:match('^حظ (.*)$') then
local UserName = text:match('^حظ (.*)$')
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
neews = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
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
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 1180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 20 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 1120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 19 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 1060 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 18 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 1000 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 17 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 940 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 16 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 880 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 15 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 820 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 14 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 760 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 13 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 700 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 12 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 640 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 11 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 10 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 9 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 8 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 7 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 6 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 5 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 4 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 3 دقائق )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 2 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:floso" .. msg.sender_id.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تلعب لعبة الحظ الحين\n⇜ تعال بعد ( 1 دقيقة )","md",true)
end
ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✦","md",true)
end
local daddd = {"1", "2", "3", "4️",}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" or haddd == "3" then
local ballanceek = math.floor(coniss + coniss)
Redis:incrby(noor.."flos"..msg.sender_id.user_id , math.floor(ballanceek))
Redis:setex(noor.."add:floso" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك فزت بالحظ 🎉\n⇜ فلوسك قبل ↢ ( "..ballancee.." دولار 💵 )\n⇜ فلوس الربح ↢ ( "..ballanceek.." دولار 💵 )\n✦","md",true)
else
local ballanceekk = ballancee - coniss
Redis:decrby(noor.."flos"..msg.sender_id.user_id , coniss)
Redis:setex(noor.."add:floso" .. msg.sender_id.user_id,1200, true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ للاسف خسرت بالحظ 😬\n⇜ فلوسك قبل ↢ ( "..ballancee.." دولار 💵 )\n⇜ فلوسك الحين ↢ ( "..ballanceekk.." دولار 💵 )\n✦","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( انشاء حساب بنكي )","md",true)
end
end
----------
if text == 'تحويل' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`تحويل` المبلغ","md",true)
end
if text and text:match('^تحويل (.*)$') then
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
if not Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ","md",true)
end
if tonumber(coniss) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح به هو 100 دولار \n✦","md",true)
end
ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✦","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي\n✦","md",true)
end
Redis:set(noor.."transn"..msg.sender_id.user_id,coniss)
Redis:setex(noor.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
LuaTele.sendText(msg.chat_id,msg.id,[[
⇜ ارسل الحين رقم الحساب البنكي الي تبي تحول له

– معاك دقيقة وحدة والغي طلب التحويل .
✦
]],"md",true)  
return false
end
----------
if Redis:get(noor.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
cccc = Redis:get(noor.."number:bnk"..msg.sender_id.user_id)
uuuu = Redis:get(noor.."no3:visa"..msg.sender_id.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del(noor.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(noor.."transn" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ ارسل رقم حساب بنكي ","md",true)
end
if text == cccc then
Redis:del(noor.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(noor.."transn" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ مايمديك تحول لنفسك ","md",true)
end
if Redis:get(noor.."Soonllcc"..text) then
local UserNamey = Redis:get(noor.."transn"..msg.sender_id.user_id)
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
news = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", news)
local fsvhhh = Redis:get(noor.."Soonllid"..text)
local bann = LuaTele.getUser(fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
local fsvhh = Redis:get(noor.."Soonllban"..text)
UserNameyr = UserNamey / 10
UserNameyy = UserNamey - UserNameyr
Redis:decrby(noor.."flos"..msg.sender_id.user_id , UserNamey)
Redis:incrby(noor.."flos"..fsvhhh , math.floor(UserNameyy))
LuaTele.sendText(msg.chat_id,msg.id, "حوالة صادرة من بنك الفخم\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nنوع البطاقة : "..fsvhh.."\nخصمت 10% رسوم تحويل\nالمبلغ : "..UserNameyy.." دولار ??","md",true)
LuaTele.sendText(fsvhhh,0, "حوالة واردة من بنك الفخم\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..UserNameyy.." دولار 💵","md",true)
Redis:del(noor.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(noor.."transn" .. msg.sender_id.user_id)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مافيه حساب بنكي كذا","md",true)
Redis:del(noor.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(noor.."transn" .. msg.sender_id.user_id)
end
end
----------
if text == 'هجوم' then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end
if text and text:match("^هجوم (%d+)$") and msg.reply_to_message_id == 0 then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`هجوم` المبلغ ( بالرد )","md",true)
end
if text and text:match('^هجوم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^هجوم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(noor.."kreednum"..msg.sender_id.user_id))
if Redis:get(noor.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ تهاجم نفسك 🤡*","md",true)  
return false
end
if Redis:ttl("attack" .. msg.sender_id.user_id) >= 60 then
  local time = Redis:ttl("attack" .. msg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ خسرت بأخر معركة استنى ( "..time.." دقيقة )","md",true)
end
if Redis:ttl("defen" .. Remsg.sender_id.user_id) >= 60 then
local time = Redis:ttl("defen" .. Remsg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ الخصم خسر بأخر معركة\n⇜ يمكنك تهاجمه بعد ( "..time.." دقيقة )","md",true)
end
if Redis:sismember(noor.."hsab:bnk",Remsg.sender_id.user_id) then
ballancope = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
if tonumber(ballancope) < 100000 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ لا يمكنك تهجم فلوسك اقل من 100000 جنيه 💵","md",true)
end
if tonumber(ballanceed) < 100000 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ لا يمكنك تهجم عليه فلوسه اقل من 100000 جنيه 💵","md",true)
end
if tonumber(coniss) < 9999 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 10000 جنيه 💵\n✦","md",true)
end
if tonumber(ballancope) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
if tonumber(ballanceed) < tonumber(coniss) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسه لا تكفي \n✦","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local bann = LuaTele.getUser(Remsg.sender_id.user_id)
if bann.first_name then
neewss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
neewss = " لا يوجد "
end
if Descriptioont == "1" or Descriptioont == "3" then
local ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
zrfne = ballancope - coniss
zrfnee = ballanceed + coniss
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(noor.."flos"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(noor.."attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",coniss)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ لقد خسرت في المعركة "..neews.." 🛡\nالفائز : "..neewss.."\nالخاسر : "..neews.."\nالجائزة : "..convert_mony.." جنيه 💵\n✦","md",true)
elseif Descriptioont == "2" or Descriptioont == "4" or Descriptioont == "5" or  Descriptioont == "6" or Descriptioont == "8" then
local ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
begaatt = Redis:get(noor.."numattack"..msg.sender_id.user_id) or 1000
numattackk = tonumber(begaatt) - 1
if numattackk == 0 then
numattackk = 1
end
attack = coniss / numattackk
zrfne = ballancope + math.floor(attack)
zrfnee = ballanceed - math.floor(attack)
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(noor.."flos"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(noor.."defen" .. Remsg.sender_id.user_id,1800, true)
Redis:set(noor.."numattack"..msg.sender_id.user_id , math.floor(numattackk))
local convert_mony = string.format("%.0f",math.floor(attack))
LuaTele.sendText(msg.chat_id,msg.id, "⇜ لقد فزت في المعركة\nودمرت قلعة "..neewss.." 🏰\nالفائز : "..neews.."\nالخاسر : "..neewss.."\nالجائزة : "..convert_mony.." جنيه 💵\nنسبة قوة المهاجم اصبحت "..numattackk.." 🩸\n✦","md",true)
elseif Descriptioont == "7" then
local ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
halfzrf = coniss / 2
zrfne = ballancope - halfzrf
zrfnee = ballanceed + halfzrf
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(noor.."flos"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(noor.."attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",math.floor(halfzrf))
LuaTele.sendText(msg.chat_id,msg.id, "⇜ لقد خسرت في المعركة "..neews.." 🛡\nولكن استطعت اعادة نصف الموارد\nالفائز : "..neewss.."\nالخاسر : "..neews.."\nالجائزة : "..convert_mony.." جنيه 💵\n✦","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match("^اضف فلوس (.*)$") and msg.reply_to_message_id ~= 0 then
local UserName = text:match('^اضف فلوس (.*)$')
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
if msg.ControllerBot then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ الفخم ماعندها حساب بالبنك 🤣*","md",true)  
return false
end
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
news = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", news)
if Redis:sismember(noor.."hsab:bnk",Remsg.sender_id.user_id) then
Redis:incrby(noor.."flos"..Remsg.sender_id.user_id , coniss)
ccccc = Redis:get(noor.."number:bnk"..Remsg.sender_id.user_id)
uuuuu = Redis:get(noor.."no3:visa"..Remsg.sender_id.user_id)
ppppp = Redis:get(noor.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
LuaTele.sendText(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ `"..ccccc.."`\n⇜ بنك ↢ ( الفخم )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الزرف ↢ ( "..ppppp.." دولار 💵 )\n⇜ صار رصيده ↢ ( "..ballanceed.." دولار 💵 )\n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
end
if text == "توب فلوس" or text == "توب الفلوس" then
local bank_users = Redis:smembers(noor.."hsab:bnk")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 30 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(noor.."flos"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
}
for k,v in pairs(mony_list) do
if num <= 30 then
local user_name = LuaTele.getUser(v[2]).first_name  or Redis:get(noor..v[2].."first_name:") or "يوجد خطأ بلاسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." ●○━━━━‌‌‏𝒂𝒍𝒇𝒂𝒌𝒉𝒎━━━━○●\n "..convert_mony.." 💵  "..user_name.."\n"
end
end
top_monyy = top_mony.."\n\n ●○━━━━‌‌‏𝒂𝒍𝒇𝒂𝒌𝒉𝒎━━━━○●"
return LuaTele.sendText(msg.chat_id,msg.id,top_mony,"md",true)
end

if text == "توب الحراميه" or text == "توب الحرامية" or text == "توب حراميه" or text == "توب الزرف" or text == "توب زرف" then
local ty_users = Redis:smembers(noor.."zrfffid")
if #ty_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يوجد احد","md",true)
end
ty_bannda = "توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(noor.."zrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4️⃣",
"5️⃣",
"6⃣",
"7️⃣",
"8️⃣",
"9⃣",
"10⃣",
"11️⃣",
"12⃣",
"13️⃣",
"14️⃣",
"15️⃣",
"16⃣",
"17⃣",
"18⃣",
"19⃣",
"20⃣"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local UserInfo = LuaTele.getUser(v[2])
if UserInfo.first_name ~= '' then
end
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
local Bnynwu = '['..UserInfo.first_name..'](tg://user?id='..v[2]..')'
top_mony = top_mony..emo.." "..convert_mony.." › "..Bnynwu.." 💵 \n"
end
end
return LuaTele.sendText(msg.chat_id,msg.id,top_mony,"md",true)
end


if text == 'كنز' then
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(noor.."kreednum"..msg.sender_id.user_id))
if Redis:get(noor.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if Redis:get(noor.."yiioooo" .. msg.sender_id.user_id) then
local time = ctime(Redis:ttl(noor.."yiioooo" .. msg.sender_id.user_id))
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ فرصة ايجاد كنز آخر بعد ( "..time.." دقيقة )","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22","23",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
Redis:set(noor..msg.sender_id.user_id.."first_name:", neews)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if Descriptioont == "1" then
local knez = ballancee + 1000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : قطعة اثرية 🗳\nسعره : 1000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 2000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : حجر الايــثــوني 💎\nسعره : 2000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : لباس قديم 🥻\nسعره : 3000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 4000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : عصى سحرية 🪄\nسعره : 4000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 100
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جوال نوكيا 📱\nسعره : 100 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 2700
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : صدف 🏝\nسعره : 2700 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 5000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : ابريق صدئ ⚗️\nسعره : 5000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 10000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : قناع فرعوني 🗿\nسعره : 10000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 50000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جرة ذهب 💰\nسعره : 50000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : مصباح فضي 🔦\nسعره : 36000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : لوحة نحاسية 🌇\nسعره : 29000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 1000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جوارب قديمة 🧦\nسعره : 1000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 16000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : اناء فخاري ⚱️\nسعره : 16000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 12000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : خوذة محارب 🪖\nسعره : 12000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : سيف جدي مرزوق 🗡\nسعره : 19000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : مكنسة جدتي رقية 🧹\nسعره : 14000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : فأس ارطغرل 🪓\nسعره : 26000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 22000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : بندقية 🔫\nسعره : 22000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 11000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : كبريت ناري 🪔\nسعره : 11000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 3300
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : فرو ثعلب 🦊\nسعره : 3300 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 40000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جلد تمساح 🐊\nسعره : 40000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : باقة ورود 💐\nسعره : 17000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "23" then
local Textinggtt = {"1", "2",}
local Descriptioontt = Textinggtt[math.random(#Textinggtt)]
if Descriptioontt == "1" then
local knez = ballancee + 17000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : باقة ورود 💐\nسعره : 17000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioontt == "2" then
local Textinggttt = {"1", "2",}
local Descriptioonttt = Textinggttt[math.random(#Textinggttt)]
if Descriptioonttt == "1" then
local knez = ballancee + 40000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : جلد تمساح 🐊\nسعره : 40000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioonttt == "2" then
local knez = ballancee + 10000000
Redis:set(noor.."flos"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\nالكنز : حقيبة محاسب البنك 💼\nسعره : 10000000 جنيه 💵\nرصيدك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
Redis:setex(noor.."yiioooo" .. msg.sender_id.user_id,1800, true)
end
end
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end




if text == 'حوافز' or text == 'حافز' then
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 10 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 9 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 8 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 7 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 6 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 5 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 4 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 3 دقائق )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 2 دقيقة )","md",true)
elseif Redis:ttl(noor.."BadA:flos" .. msg.sender_id.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يمكنك اخذ حوافز انتظر الوقت  ( 1 دقيقة )","md",true)
end
local BadA = math.random(1,200);
Redis:incrby(noor.."flos"..msg.sender_id.user_id , BadA)
LuaTele.sendText(msg.chat_id,msg.id,"⇜ روقت عليك يزمكس "..BadA.." دولار 💵","md",true)
Redis:setex(noor.."BadA:flos" .. msg.sender_id.user_id,600, true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'بخشيش' or text == 'بقشيش' then
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 580 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 10 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 540 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 9 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 480 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 8 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 420 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 7 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 360 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 6 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 300 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 5 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 4 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 3 دقائق )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 2 دقيقة )","md",true)
elseif Redis:ttl(noor.."add:flos" .. msg.sender_id.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ من شوي اخذت بقشيش استنى ( 1 دقيقة )","md",true)
end
local jjjo = math.random(1,200);
Redis:incrby(noor.."flos"..msg.sender_id.user_id , jjjo)
LuaTele.sendText(msg.chat_id,msg.id,"⇜ خد وبطل شحاته "..jjjo.." دولار 💵","md",true)
Redis:setex(noor.."add:flos" .. msg.sender_id.user_id,600, true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'زرف' and tonumber(msg.reply_to_message_id) == 0 then
LuaTele.sendText(msg.chat_id,msg.id, "استعمل الامر كذا :\n\n`زرف` بالرد","md",true)
end

if text == 'زرف' or text == 'زرفو' or text == 'زرفه' and tonumber(msg.reply_to_message_id) ~= 0 then
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(noor.."kreednum"..msg.sender_id.user_id))
if Redis:get(noor.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
F_Name = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ عايز تزرف نفسك 🤡*","md",true)  
return false
end
if Redis:ttl(noor.."polic" .. msg.sender_id.user_id) >= 280 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 5 دقائق )","md",true)
elseif Redis:ttl(noor.."polic" .. msg.sender_id.user_id) >= 240 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 4 دقائق )","md",true)
elseif Redis:ttl(noor.."polic" .. msg.sender_id.user_id) >= 180 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 3 دقائق )","md",true)
elseif Redis:ttl(noor.."polic" .. msg.sender_id.user_id) >= 120 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 2 دقيقة )","md",true)
elseif Redis:ttl(noor.."polic" .. msg.sender_id.user_id) >= 60 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى ( 1 دقيقة )","md",true)
end
if Redis:ttl(noor.."hrame" .. Remsg.sender_id.user_id) >= 60 then
local time = Redis:ttl(noor.."hrame" .. Remsg.sender_id.user_id)
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ الشخص مزروف من شويه\n⇜ يمكنك تزرفه بعد ( "..time.." دقيقة )","md",true)
end
if Redis:sismember(noor.."hsab:bnk",Remsg.sender_id.user_id) then
ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
if tonumber(ballanceed) < 199 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ لا يمكنك تزرفه فلوسه اقل من 200 جنيه 💵","md",true)
end
local hrame = math.floor(math.random() * 200) + 1;
local hramee = math.floor(math.random() * 5) + 1;
if hramee == 1 or hramee == 2 or hramee == 3 or hramee == 4 then
local ballanceed = Redis:get(noor.."flos"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
zrfne = ballanceed - hrame
zrfnee = ballancope + hrame
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(zrfnee))
Redis:set(noor.."flos"..Remsg.sender_id.user_id , math.floor(zrfne))
Redis:setex(noor.."hrame" .. Remsg.sender_id.user_id,900, true)
local zoropeo = Redis:get(noor.."zrfff"..msg.sender_id.user_id) or 0
zoroprod = zoropeo + hrame
Redis:set(noor.."zrfff"..msg.sender_id.user_id,zoroprod)
Redis:sadd(noor.."zrfffid",msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ خذ يالحرامي زرفته "..hrame.." جنيه 💵\n✦","md",true)
else
Redis:setex(noor.."polic" .. msg.sender_id.user_id,300, true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مسكتك الشرطة وانتا تزرف 🚔\n✦","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'راتب' or text == 'راتبي' then
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(noor.."kreednum"..msg.sender_id.user_id))
if Redis:get(noor.."kreed"..msg.sender_id.user_id) and tonumber(ballanceed) > 5000000 then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ عليك قرض بقيمة "..krses.." جنيه 💵 \nقم بسداده بالامر `تسديد القرض` ","md",true)
end
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
F_Name = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if Redis:get(noor.."iiioo" .. msg.sender_id.user_id) then
local time = ctime(Redis:ttl(noor.."iiioo" .. msg.sender_id.user_id))
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ راتبك بينزل بعد ( "..time.." دقيقة )","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = LuaTele.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if Descriptioont == "1" then
local ratpep = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : كابتن كريم 🚙\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "2" then
local ratpep = ballancee + 3500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 جنيه 💵\nوظيفتك : شرطي 👮🏻‍♂️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "3" then
local ratpep = ballancee + 3500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 جنيه ??\nوظيفتك : بياع حبوب 🍻\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "4" then
local ratpep = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : سواق تاكسي 🚕\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "5" then
local ratpep = ballancee + 5000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : قاضي 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "6" then
local ratpep = ballancee + 2500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 جنيه 💵\nوظيفتك : نوم 🛌\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "7" then
local ratpep = ballancee + 2700
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 جنيه 💵\nوظيفتك : مغني 🎤\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "8" then
local ratpep = ballancee + 2900
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 جنيه 💵\nوظيفتك : كوفيره 💆\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "9" then
local ratpep = ballancee + 2500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2500 جنيه 💵\nوظيفتك : ربة منزل 🤷\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "10" then
local ratpep = ballancee + 2900
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2900 جنيه 💵\nوظيفتك : مربيه اطفال 💁\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "11" then
local ratpep = ballancee + 3700
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3700 جنيه 💵\nوظيفتك : كهربائي 💡\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "12" then
local ratpep = ballancee + 3600
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3600 جنيه 💵\nوظيفتك : نجار ⛏\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "13" then
local ratpep = ballancee + 2400
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2400 جنيه 💵\nوظيفتك : متذوق طعام 🍕\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "14" then
local ratpep = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : فلاح 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "15" then
local ratpep = ballancee + 5000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : كاشير بنده 🙋\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "16" then
local ratpep = ballancee + 6000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه 💵\nوظيفتك : ممرض 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "17" then
local ratpep = ballancee + 3100
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3100 جنيه 💵\nوظيفتك : مهرج 🤹\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "18" then
local ratpep = ballancee + 3300
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3300 جنيه 💵\nوظيفتك : عامل توصيل 🚴\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "19" then
local ratpep = ballancee + 4800
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4800 جنيه 💵\nوظيفتك : عسكري 👮\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "20" then
local ratpep = ballancee + 6000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه 💵\nوظيفتك : مهندس 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "21" then
local ratpep = ballancee + 8000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 8000 جنيه 💵\nوظيفتك : وزير 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "22" then
local ratpep = ballancee + 5500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 جنيه 💵\nوظيفتك : محامي ⚖️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "23" then
local ratpep = ballancee + 5500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5500 جنيه 💵\nوظيفتك : تاجر 💵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "24" then
local ratpep = ballancee + 7000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 جنيه 💵\nوظيفتك : دكتور 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "25" then
local ratpep = ballancee + 2600
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2600 جنيه 💵\nوظيفتك : حفار قبور ⚓\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "26" then
local ratpep = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : حلاق ✂\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "27" then
local ratpep = ballancee + 5000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : إمام مسجد 📿\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "28" then
local ratpep = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : صياد 🎣\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "29" then
local ratpep = ballancee + 2300
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2300 جنيه 💵\nوظيفتك : خياط ??\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "30" then
local ratpep = ballancee + 7100
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7100 جنيه 💵\nوظيفتك : طيار 🛩\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "31" then
local ratpep = ballancee + 5300
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 جنيه 💵\nوظيفتك : مودل 🕴\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "32" then
local ratpep = ballancee + 10000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 10000 جنيه 💵\nوظيفتك : ملك 👑\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "33" then
local ratpep = ballancee + 2700
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 2700 جنيه 💵\nوظيفتك : سباك 🔧\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "34" then
local ratpep = ballancee + 3900
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3900 جنيه 💵\nوظيفتك : موزع 🗺\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "35" then
local ratpep = ballancee + 4100
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4100 جنيه 💵\nوظيفتك : سكيورتي 👮\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "36" then
local ratpep = ballancee + 3500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3500 جنيه 💵\nوظيفتك : معلم شاورما 🌯\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه ??","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "37" then
local ratpep = ballancee + 6700
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6700 جنيه 💵\nوظيفتك : دكتور ولاده 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "38" then
local ratpep = ballancee + 6600
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6600 جنيه 💵\nوظيفتك : مذيع 🗣\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "39" then
local ratpep = ballancee + 3400
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3400 جنيه 💵\nوظيفتك : عامل مساج 💆\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "40" then
local ratpep = ballancee + 6300
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6300 جنيه 💵\nوظيفتك : ممثل 🤵\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "41" then
local ratpep = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : جزار 🥩\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "42" then
local ratpep = ballancee + 7000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 7000 جنيه 💵\nوظيفتك : مدير بنك 💳\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "43" then
local ratpep = ballancee + 6000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه ??\nوظيفتك : مبرمج 👨\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "44" then
local ratpep = ballancee + 5000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5000 جنيه 💵\nوظيفتك : رقاصه 💃\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "45" then
local ratpep = ballancee + 4900
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4900 جنيه 💵\nوظيفتك : 👩🏼‍💻 صحفي\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "46" then
local ratpep = ballancee + 5300
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 5300 جنيه 💵\nوظيفتك : 🥷 حرامي\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "47" then
local ratpep = ballancee + 6000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6000 جنيه 💵\nوظيفتك : 🔮 ساحر\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "48" then
local ratpep = ballancee + 6500
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 6500 جنيه 💵\nوظيفتك : ⚽ لاعب️\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "49" then
local ratpep = ballancee + 4000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 جنيه 💵\nوظيفتك : 🖼 مصور\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "50" then
local ratpep = ballancee + 3000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3000 جنيه 💵\nوظيفتك : ☎️ عامل مقسم\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "51" then
local ratpep = ballancee + 3200
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 3200 جنيه 💵\nوظيفتك : 📖 كاتب\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
elseif Descriptioont == "52" then
local ratpep = ballancee + 4000
Redis:set(noor.."flos"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
LuaTele.sendText(msg.chat_id,msg.id,"اشعار ايداع "..neews.."\nالمبلغ : 4000 جنيه 💵\nوظيفتك : 🧪 مخبري\nنوع العملية : اضافة راتب\nرصيدك حاليا : "..convert_mony.." جنيه 💵","md",true)
Redis:setex(noor.."iiioo" .. msg.sender_id.user_id,600, true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

----------------------------------------------

---------------------------------------------------------------

---------------------------------------
if text == 'تسديد قرضه' and tonumber(msg.reply_to_message_id) ~= 0 then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
F_Name = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", F_Name)
local Remsg = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
LuaTele.sendText(msg.chat_id,msg.id,"\n*⇜ لا يمتلك حسب في البنك*","md",true)  
return false
end
if Redis:sismember(noor.."hsab:bnk",Remsg.sender_id.user_id) then
if Redis:get(noor.."kreed"..msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ سدد قرضك اول شي بعدين اعمل راعي النشامى ","md",true)
end
if not Redis:get(noor.."kreed"..Remsg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعليه قرض","md",true)
else
local ban = LuaTele.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(noor.."kreednum"..Remsg.sender_id.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
nshme = ballanceed - krses
Redis:set(noor.."flos"..msg.sender_id.user_id,math.floor(nshme))
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
Redis:del(noor.."kreed"..Remsg.sender_id.user_id)
Redis:del(noor.."kreednum"..Remsg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ اشعار تسديد قرض عن "..news.."\n\nالقرض : "..krses.." جنيه 💵\nتم اقتطاع المبلغ من فلوسك\nفلوسك حاليا : "..convert_mony.." جنيه 💵 ","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ لا يمتلك حساب بنكي ","md",true)
end
end

if text == 'تسديد قرض' or text == 'تسديد القرض' or text == 'تسديد قرضي' and tonumber(msg.reply_to_message_id) == 0 then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
F_Name = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", F_Name)
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
if not Redis:get(noor.."kreed"..msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ ماعليك قرض ","md",true)
end
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
krses = tonumber(Redis:get(noor.."kreednum"..msg.sender_id.user_id))
if tonumber(ballanceed) < tonumber(krses) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك لا تكفي \n✦","md",true)
end
tsded = ballanceed - krses
Redis:set(noor.."flos"..msg.sender_id.user_id,math.floor(tsded))
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
Redis:del(noor.."kreed"..msg.sender_id.user_id)
Redis:del(noor.."kreednum"..msg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballanceed)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ اشعار تسديد قرض\n\nالقرض : "..krses.." جنيه 💵\nتم اقتطاع المبلغ من فلوسك\nفلوسك حاليا : "..convert_mony.." جنيه 💵","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'القرض' or text == 'قرض' then
local UserInfo = LuaTele.getUser(msg.sender_id.user_id)
if UserInfo.first_name ~= '' then
end
F_Name = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
Redis:set(noor..msg.sender_id.user_id.."first_name:", F_Name)
krses = tonumber(Redis:get(noor.."kreednum"..msg.sender_id.user_id))
if Redis:get(noor.."kreed"..msg.sender_id.user_id) then
return LuaTele.sendText(msg.chat_id,msg.id, "⇜ سحبت قرض قبل بقيمة "..krses.." جنيه 💵","md",true)
end
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
ballanceed = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
if tonumber(ballanceed) < 100000 then
kredd = tonumber(ballanceed) + 900000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,900000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 900000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 200000 then
kredd = tonumber(ballanceed) + 800000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,800000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 800000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 300000 then
kredd = tonumber(ballanceed) + 700000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,700000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 700000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 400000 then
kredd = tonumber(ballanceed) + 600000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,600000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 600000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 500000 then
kredd = tonumber(ballanceed) + 500000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,500000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 500000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 600000 then
kredd = tonumber(ballanceed) + 400000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,400000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 400000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 700000 then
kredd = tonumber(ballanceed) + 300000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,300000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 300000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 800000 then
kredd = tonumber(ballanceed) + 200000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,200000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 200000 جنيه 💵","md",true)
elseif tonumber(ballanceed) < 900000 then
kredd = tonumber(ballanceed) + 100000
Redis:set(noor.."flos"..msg.sender_id.user_id,kredd)
Redis:set(noor.."kreednum"..msg.sender_id.user_id,100000)
Redis:set(noor.."kreed"..msg.sender_id.user_id,true)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ مبروك وهو قرض بقيمة 100000 جنيه 💵","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ فلوسك فوق المليون مايطلعلك قرض","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تثبيت النتائج' or text == 'تثبيت نتائج' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
time = os.date("*t")
month = time.month
day = time.day
local_time = month.."/"..day
local bank_users = Redis:smembers(noor.."hsab:bnk")
if #bank_users == 0 then
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(noor.."flos"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇",
"🥈",
"🥉"
}
for k,v in pairs(mony_list) do
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(noor..v[2].."first_name:") or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(noor.."medal"..v[2],convert_mony)
Redis:set(noor.."medal2"..v[2],emo)
Redis:set(noor.."medal3"..v[2],local_time)
Redis:sadd(noor.."medalid",v[2])
Redis:set(noor.."medal"..v[2],convert_mony)
Redis:set(noor.."medal2"..v[2],emo)
Redis:set(noor.."medal3"..v[2],local_time)
Redis:sadd(noor.."medalid",v[2])
local user_name = LuaTele.getUser(v[2]).first_name or Redis:get(noor..v[2].."first_name:") or "لا يوجد اسم"
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(noor.."medal"..v[2],convert_mony)
Redis:set(noor.."medal2"..v[2],emo)
Redis:set(noor.."medal3"..v[2],local_time)
Redis:sadd(noor.."medalid",v[2])
if num == 4 then
return end
end
LuaTele.sendText(msg.chat_id,msg.id, "⇜ ثبتت النتائج","md",true)
end
end
if text == 'ميدالياتي' or text == 'ميداليات' then
if Redis:sismember(noor.."medalid",msg.sender_id.user_id) then
local medaa2 = Redis:get(noor.."medal2"..msg.sender_id.user_id)
if medaa2 == "🥇" then
local medaa = Redis:get(noor.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(noor.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(noor.."medal3"..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." ??\nالمركز : "..medaa2.." كونكر "..medaa2.."\n✦","md",true)
elseif medaa2 == "🥈" then
local medaa = Redis:get(noor.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(noor.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(noor.."medal3"..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." ايس "..medaa2.."\n✦","md",true)
else
local medaa = Redis:get(noor.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(noor.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(noor.."medal3"..msg.sender_id.user_id)
LuaTele.sendText(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ : "..medaa3.." \nالفلوس : "..medaa.." 💵\nالمركز : "..medaa2.." تاج "..medaa2.."\n✦","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك ميداليات","md",true)
end
end
if text == "ترتيبي" then
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
local bank_users = Redis:smembers(noor.."hsab:bnk")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(noor.."flos"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(msg.sender_id.user_id) then
local mony = v[1]
return LuaTele.sendText(msg.chat_id,msg.id,"⇜ ترتيبك ( "..k.." )","md",true)
end
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^حظر حساب (.*)$') then
local UserName = text:match('^حظر حساب (.*)$')
local coniss = coin(UserName)
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
Redis:set(noor.."bandid"..coniss,coniss)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ تم حظر الحساب "..coniss.." من لعبة البنك\n✦","md",true)
end
end
if text and text:match('^الغاء حظر حساب (.*)$') then
local UserName = text:match('^الغاء حظر حساب (.*)$')
local coniss = coin(UserName)
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
Redis:del(noor.."bandid"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ تم الغاء حظر الحساب "..coniss.." من لعبة البنك\n✦","md",true)
end
end
if text and text:match('^اضف كوبون (.*)$') then
local UserName = text:match('^اضف كوبون (.*)$')
local coniss = coin(UserName)
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then
numcobo = math.random(1000000000000,9999999999999);
Redis:set(noor.."cobonum"..numcobo,numcobo)
Redis:set(noor.."cobon"..numcobo,coniss)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ وصل كوبون \n\nالمبلغ : "..coniss.." جنيه 💵\nرقم الكوبون : `"..numcobo.."`\n\n⇜ طريقة استخدام الكوبون :\nتكتب ( كوبون + رقمه )\nمثال : كوبون 4593875\n✦","md",true)
end
end
if text == "كوبون" or text == "الكوبون" then
LuaTele.sendText(msg.chat_id,msg.id, "⇜ طريقة استخدام الكوبون :\nتكتب ( كوبون + رقمه )\nمثال : كوبون 4593875\n\n- ملاحظة : الكوبون يستخدم لمرة واحدة ولشخص واحد\n✦","md",true)
end
if text and text:match('^كوبون (.*)$') then
local UserName = text:match('^كوبون (.*)$')
local coniss = coin(UserName)
if Redis:sismember(noor.."hsab:bnk",msg.sender_id.user_id) then
cobnum = Redis:get(noor.."cobonum"..coniss)
if coniss == tonumber(cobnum) then
cobblc = Redis:get(noor.."cobon"..coniss)
ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
cobonplus = ballancee + cobblc
Redis:set(noor.."flos"..msg.sender_id.user_id , cobonplus)
local ballancee = Redis:get(noor.."flos"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:del(noor.."cobon"..coniss)
Redis:del(noor.."cobonum"..coniss)
LuaTele.sendText(msg.chat_id,msg.id, "⇜ وصل كوبون \n\nالمبلغ : "..cobblc.." جنيه 💵\nرقم الكوبون : `"..coniss.."`\nفلوسك حاليا : "..convert_mony.." جنيه 💵\n✦","md",true)
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ لا يوجد كوبون بهذا الرقم `"..coniss.."`\n✦","md",true)
end
else
LuaTele.sendText(msg.chat_id,msg.id, "⇜ انت لا تمتلك حساب بنكي ","md",true)
end
end

end
return {noor = reply}
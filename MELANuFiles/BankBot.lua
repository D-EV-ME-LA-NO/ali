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
if text == "اوامر البنك" and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
    local text = [[
    ⌯︙اوامر البنك كـ الاتي ↫ ⤈
    ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
    ⌯︙امر (انشاء حساب بنكي) وبعدها اتبع التعليمات
    ⌯︙امر (فلوسي) لعرض فلوسك 
    ⌯︙امر (فلوسه) بالرد لعرض فلوس المقصود
    ⌯︙امر (حسابي) لعرض حسابك بكامل التفاصيل
    ⌯︙امر (حسابه) بالرد لعرض كامل تفاصيل حساب المقصود
    ⌯︙امر (حساب + الايدي) لعرض كامل تفاصيل حساب الايدي المقصود
    ⌯︙امر (مراهنه + مبلغ المراهنه) يجب ان تمتلك 100$
    ⌯︙امر (استثمار + المبلغ) يجب ان تمتلك 100$
    ⌯︙امر (حظ + المبلغ) لو تفوز لو تخسر
    ⌯︙امر (تحويل) بعدها قم بوضع رقم حساب التريد تحوله
    ⌯︙امر (الاغنياء - الزناكين) لعرض الطاكين
    ⌯︙امر (القفاصه - اكبر الحراميه) يطلع الك اكثر ناس تبوك
    ⌯︙امر (كراميه - بخشيش) حت ينطيك مبلغ من 1 دولار الئ 200
    ⌯︙امر (سرقه) بالرد لتسرق اي واحد 
    ⌯︙امر (راتبي) حت تستلم راتبك كل 20 دقيقة
    ⌯︙امر (مسح حسابي البنكي) لحذف حسابك 
    ⌯︙وامر المطورين  ↫ ⤈
    ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
    ⌯︙امر (مسح لعبه البنك) لحذف جميع الحسابات
    ⌯︙امر (مسح حسابه) بالرد لحذف حساب
    ]]
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,text).EbDsDrg,"md",true)
end
--     Source RMAD     --
local NamesBot = (Redis:get(RMAD.."Name:Bot") or "ميلانو")
if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
creditcc = math.random(5000000000000000,5999999999999999);
creditvi = math.random(4000000000000000,4999999999999999);
creditex = math.random(6000000000000000,6999999999999999);
balas = 50
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙لديك حساب بنكي مسبقاً\n\n⌯︙لعرض معلومات حسابك اكتب\n• `حسابي`","md",true)
end
Redis:setex(RMAD.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
merolua.sendText(msg.chat_id,msg.id,[[
⌯︙ علمود تسوي حساب لازم تختار نوع البطاقة

•-› `ماستر`
•-› `فيزا`
•-› `اكسبرس`

• اضغط للنسخ
• مدة الطلب دقيقة واحدة ويطردك الموظف .
]],"md",true)  
return false
end
if Redis:get(RMAD.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
if text == "ماستر" then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set(RMAD.."bobna"..msg.sender_id.user_id,news)
Redis:set(RMAD.."boob"..msg.sender_id.user_id,balas)
Redis:set(RMAD.."boobb"..msg.sender_id.user_id,creditcc)
Redis:set(RMAD.."bbobb"..msg.sender_id.user_id,text)
Redis:set(RMAD.."boballname"..creditcc,news)
Redis:set(RMAD.."boballbalc"..creditcc,balas)
Redis:set(RMAD.."boballcc"..creditcc,creditcc)
Redis:set(RMAD.."boballban"..creditcc,text)
Redis:set(RMAD.."boballid"..creditcc,banid)
Redis:sadd(RMAD.."booob",msg.sender_id.user_id)
Redis:del(RMAD.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
merolua.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في بنك "..NamesBot.." 🏦\n• وشحنالك 50 دولار 💵 هدية\n\n⌯︙رقم حسابك ↫ ( `"..creditcc.."` )\n⌯︙نوع البطاقة ↫ ( ماستر 💳 )\n⌯︙فلوسك ↫ ( 50 دولار 💵 )  ","md",true)  
end 
if text == "فيزا" then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set(RMAD.."bobna"..msg.sender_id.user_id,news)
Redis:set(RMAD.."boob"..msg.sender_id.user_id,balas)
Redis:set(RMAD.."boobb"..msg.sender_id.user_id,creditvi)
Redis:set(RMAD.."bbobb"..msg.sender_id.user_id,text)
Redis:set(RMAD.."boballname"..creditvi,news)
Redis:set(RMAD.."boballbalc"..creditvi,balas)
Redis:set(RMAD.."boballcc"..creditvi,creditvi)
Redis:set(RMAD.."boballban"..creditvi,text)
Redis:set(RMAD.."boballid"..creditvi,banid)
Redis:sadd(RMAD.."booob",msg.sender_id.user_id)
Redis:del(RMAD.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
merolua.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في بنك "..NamesBot.." 🏦\n• وشحنالك 50 دولار 💵 هدية\n\n⌯︙رقم حسابك ↫ ( `"..creditvi.."` )\n⌯︙نوع البطاقة ↫ ( فيزا 💳 )\n⌯︙فلوسك ↫ ( 50 دولار 💵 )  ","md",true)   
end 
if text == "اكسبرس" then
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = msg.sender_id.user_id
Redis:set(RMAD.."bobna"..msg.sender_id.user_id,news)
Redis:set(RMAD.."boob"..msg.sender_id.user_id,balas)
Redis:set(RMAD.."boobb"..msg.sender_id.user_id,creditex)
Redis:set(RMAD.."bbobb"..msg.sender_id.user_id,text)
Redis:set(RMAD.."boballname"..creditex,news)
Redis:set(RMAD.."boballbalc"..creditex,balas)
Redis:set(RMAD.."boballcc"..creditex,creditex)
Redis:set(RMAD.."boballban"..creditex,text)
Redis:set(RMAD.."boballid"..creditex,banid)
Redis:sadd(RMAD.."booob",msg.sender_id.user_id)
Redis:del(RMAD.."booobb" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
merolua.sendText(msg.chat_id,msg.id, "\n• وسوينا لك حساب في بنك "..NamesBot.." 🏦\n• وشحنالك 50 دولار 💵 هدية\n\n⌯︙رقم حسابك ↫ ( `"..creditex.."` )\n⌯︙نوع البطاقة ↫ ( اكسبرس 💳 )\n⌯︙فلوسك ↫ ( 50 دولار 💵 )  ","md",true)   
end 
end
if text == 'مسح حساب بنكي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
Redis:srem(RMAD.."booob", msg.sender_id.user_id)
Redis:del(RMAD.."boob"..msg.sender_id.user_id)
Redis:del(RMAD.."boobb"..msg.sender_id.user_id)
Redis:del(RMAD.."zrfff"..msg.sender_id.user_id)
Redis:srem(RMAD.."zrfffid", msg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id, "⌯︙مسحت حسابك البنكي 🏦","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تصفير النتائج' or text == 'مسح لعبه البنك' and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if not msg.SecondSudo then
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,'⌯︙هذا الامر يخص ↫ '..Controller_Num(2)..' .\n•-› X').Warning,"md",true) 
end
Redis:del(RMAD.."booob")
Redis:del(RMAD.."boob")
Redis:del(RMAD.."boobb")
Redis:del(RMAD.."zrfff")
Redis:del(RMAD.."zrfffid")
merolua.sendText(msg.chat_id,msg.id, "⌯︙مسحت لعبه البنك 🏦","md",true)
end

if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
ballancee = Redis:get(RMAD.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 1 then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك فلوس ارسل الالعاب وابدأ بجمع الفلوس \n•-› X","md",true)
end
merolua.sendText(msg.chat_id,msg.id, "⌯︙فلوسك "..ballancee.."$ دولار 💵","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\n*⌯︙"..NamesBot.." ماعنده حساب بالبنك 🤣*","md",true)  
return false
end
if Redis:sismember(RMAD.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(RMAD.."boob"..Remsg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "⌯︙فلوسه "..ballanceed.."$ دولار 💵","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعنده حساب بنكي ","md",true)
end
end

if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
cccc = Redis:get(RMAD.."boobb"..msg.sender_id.user_id)
uuuu = Redis:get(RMAD.."bbobb"..msg.sender_id.user_id)
pppp = Redis:get(RMAD.."zrfff"..msg.sender_id.user_id) or 0
ballancee = Redis:get(RMAD.."boob"..msg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "⌯︙الاسم ↫ "..news.."\n⌯︙الحساب ↫ `"..cccc.."`\n⌯︙بنك ↫ ( "..NamesBot.." )\n⌯︙نوع ↫ ( "..uuuu.." )\n⌯︙الرصيد ↫ ( "..ballancee.." دولار 💵 )\n⌯︙السرقه ( "..pppp.." دولار 💵 )\n•-› ✓","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'مسح حسابه' and tonumber(msg.reply_to_message_id) ~= 0 and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if not msg.SecondSudo then
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,'⌯︙هذا الامر يخص ↫ '..Controller_Num(2)..' .\n•-› X').Warning,"md",true) 
end
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\n*⌯︙"..NamesBot.." ماعنده حساب بالبنك 🤣*","md",true)  
return false
end
local ban = merolua.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(RMAD.."booob",Remsg.sender_id.user_id) then
ccccc = Redis:get(RMAD.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(RMAD.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(RMAD.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(RMAD.."boob"..Remsg.sender_id.user_id) or 0
Redis:srem(RMAD.."booob", Remsg.sender_id.user_id)
Redis:del(RMAD.."boob"..Remsg.sender_id.user_id)
Redis:del(RMAD.."boobb"..Remsg.sender_id.user_id)
Redis:del(RMAD.."zrfff"..Remsg.sender_id.user_id)
Redis:srem(RMAD.."zrfffid", Remsg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id, "⌯︙الاسم ↫ "..news.."\n⌯︙الحساب ↫ `"..ccccc.."`\n⌯︙بنك ↫ ( "..NamesBot.." )\n⌯︙نوع ↫ ( "..uuuuu.." )\n⌯︙الرصيد ↫ ( "..ballanceed.." دولار 💵 )\n⌯︙السرقه ↫ ( "..ppppp.." دولار 💵 )\n⌯︙مسكين مسحت حسابه \n•-› X","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعنده حساب بنكي اصلاً ","md",true)
end
end

if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\n*⌯︙"..NamesBot.." ماعنده حساب بالبنك 🤣*","md",true)  
return false
end
local ban = merolua.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(RMAD.."booob",Remsg.sender_id.user_id) then
ccccc = Redis:get(RMAD.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(RMAD.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(RMAD.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(RMAD.."boob"..Remsg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "⌯︙الاسم ↫ "..news.."\n⌯︙الحساب ↫ `"..ccccc.."`\n⌯︙بنك ↫ ( "..NamesBot.." )\n⌯︙نوع ↫ ( "..uuuuu.." )\n⌯︙الرصيد ↫ ( "..ballanceed.." دولار 💵 )\n⌯︙السرقه ↫ ( "..ppppp.." دولار 💵 )\n•-› ✓","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعنده حساب بنكي ","md",true)
end
end

if text and text:match('^مسح حساب (.*)$') or text and text:match('^مسح حسابه (.*)$') and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if not msg.SecondSudo then
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,'⌯︙هذا الامر يخص ↫ '..Controller_Num(2)..' .\n•-› X').Warning,"md",true) 
end
local UserName = text:match('^مسح حساب (.*)$') or text:match('^مسح حسابه (.*)$')
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
local ban = merolua.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
if Redis:sismember(RMAD.."booob",coniss) then
ccccc = Redis:get(RMAD.."boobb"..coniss)
uuuuu = Redis:get(RMAD.."bbobb"..coniss)
ppppp = Redis:get(RMAD.."zrfff"..coniss) or 0
ballanceed = Redis:get(RMAD.."boob"..coniss) or 0
Redis:srem(RMAD.."booob", coniss)
Redis:del(RMAD.."boob"..coniss)
Redis:del(RMAD.."boobb"..coniss)
Redis:del(RMAD.."zrfff"..coniss)
Redis:srem(RMAD.."zrfffid", coniss)
merolua.sendText(msg.chat_id,msg.id, "⌯︙الاسم ↫ "..news.."\n⌯︙الحساب ↫ `"..ccccc.."`\n⌯︙بنك ↫ ( "..NamesBot.." )\n⌯︙نوع ↫ ( "..uuuuu.." )\n⌯︙الرصيد ↫ ( "..ballanceed.." دولار 💵 )\n⌯︙السرقه ↫ ( "..ppppp.." دولار 💵 )\n⌯︙مسكين مسحت حسابه \n•-› ✓","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعنده حساب بنكي اصلاً ","md",true)
end
end

if text and text:match('^حساب (.*)$') or text and text:match('^حسابه (.*)$') and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local UserName = text:match('^حساب (.*)$') or text:match('^حسابه (.*)$')
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
if Redis:get(RMAD.."boballcc"..coniss) then
local yty = Redis:get(RMAD.."boballname"..coniss)
local dfhb = Redis:get(RMAD.."boballbalc"..coniss)
local fsvhh = Redis:get(RMAD.."boballban"..coniss)
merolua.sendText(msg.chat_id,msg.id, "⌯︙الاسم ↫ "..yty.."\n⌯︙الحساب ↫ `"..coniss.."`\n⌯︙بنك ↫ ( "..NamesBot.." )\n⌯︙نوع ↫ ( "..fsvhh.." )\n⌯︙الرصيد ↫ ( "..dfhb.." دولار 💵 )\n•-› ✓","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙لا يوجد حساب بنكي بهذا الرقم","md",true)
end
end

if text == 'مراهنه' and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
merolua.sendText(msg.chat_id,msg.id, "⌯︙استعمل الامر هكذا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n(`مراهنه`) المبلغ\n•-› ?","md",true)
end

if text and text:match('^مراهنه (.*)$') and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local UserName = text:match('^مراهنه (.*)$')
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
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
if Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 1180 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 20 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 1120 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 19 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 1060 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 18 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 1000 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 17 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 940 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 16 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 880 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 15 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 820 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 14 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 760 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 13 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 700 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 12 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 640 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 11 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 580 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 10 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 540 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 9 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 480 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 8 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 420 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 7 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 360 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 6 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 300 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 5 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 240 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 4 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 180 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 3 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 120 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 2 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooooo" .. msg.sender_id.user_id) >= 60 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تراهن الان\n⌯︙تعال بعد ( 1 دقيقة )\n•-› X","md",true)
end
ballancee = Redis:get(RMAD.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙الحد الادنى المسموح هو 100 دولار 💵\n•-› X","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙فلوسك ماتكفي \n•-› X","md",true)
end
local modarba = {"0", "1", "2", "3", "4️",}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee - ballanceekku
Redis:set(RMAD.."boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(RMAD.."iiooooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "⌯︙مراهنة فاشلة 📉\n⌯︙نسبة الخسارة ↫ "..modarbaa.."%\n⌯︙المبلغ الذي خسرته ↫ ( "..ballanceekku.." دولار 💵 )\n⌯︙فلوسك صارت ↫ ( "..ballanceekkku.." دولار 💵 )\n•-› X","md",true)
elseif Descriptioontt == "2" or Descriptioontt == "4" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee + ballanceekku
Redis:set(RMAD.."boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(RMAD.."iiooooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "⌯︙مراهنة ناجحة 📈\n⌯︙نسبة الربح ↫ "..modarbaa.."%\n⌯︙المبلغ الذي ربحته ↫ ( "..ballanceekku.." دولار 💵 )\n⌯︙فلوسك صارت ↫ ( "..ballanceekkku.." دولار 💵 )\n•-› ✓","md",true)
else
Redis:setex(RMAD.."iiooooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "⌯︙تأخرت اليوم والبنك مغلق ارجع بعدين \n•-› X","md",true)
end
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'استثمار' then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
merolua.sendText(msg.chat_id,msg.id, "⌯︙استعمل الامر هكذا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙(`استثمار`) المبلغ\n•-› ?","md",true)
end

if text and text:match('^استثمار (.*)$') and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
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
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
if Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 1180 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 20 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 1120 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 19 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 1060 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 18 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 1000 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 17 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 940 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 16 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 880 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 15 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 820 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 14 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 760 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 13 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 700 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 12 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 640 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 11 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 580 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 10 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 540 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 9 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 480 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 8 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 420 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 7 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 360 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 6 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 300 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 5 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 240 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 4 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 180 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 3 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 120 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 2 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iioooo" .. msg.sender_id.user_id) >= 60 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تستثمر الان\n⌯︙تعال بعد ( 1 دقيقة )\n•-› X","md",true)
end
ballancee = Redis:get(RMAD.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙الحد الادنى المسموح هو 100 دولار 💵\n•-› X","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙فلوسك ماتكفي \n•-› X","md",true)
end
local hadddd = math.random(0,17);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
Redis:incrby(RMAD.."boob"..msg.sender_id.user_id , math.floor(ballanceekk))
Redis:setex(RMAD.."iioooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "⌯︙استثمار ناجح 💰\n⌯︙نسبة الربح ↫ "..hadddd.."%\n⌯︙مبلغ الربح ↫ ( "..ballanceekk.." دولار 💵 )\n⌯︙فلوسك صارت ↫ ( "..ballanceekkk.." دولار 💵 )\n•-› ✓","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'حظ' then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
merolua.sendText(msg.chat_id,msg.id, "⌯︙استعمل الامر هكذا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙(`حظ`) المبلغ\n•-› ?","md",true)
end

if text and text:match('^حظ (.*)$') and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local UserName = text:match('^حظ (.*)$')
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
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
if Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 1180 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 20 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 1120 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 19 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 1060 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 18 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 1000 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 17 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 940 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 16 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 880 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 15 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 820 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 14 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 760 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 13 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 700 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 12 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 640 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 11 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 580 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 10 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 540 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 9 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 480 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 8 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 420 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 7 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 360 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 6 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 300 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 5 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 240 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 4 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 180 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 3 دقائق )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 120 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 2 دقيقة )\n•-› X","md",true)
elseif Redis:ttl(RMAD.."iiooo" .. msg.sender_id.user_id) >= 60 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تلعب لعبة الحظ الان\n⌯︙تعال بعد ( 1 دقيقة )\n•-› X","md",true)
end
ballancee = Redis:get(RMAD.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < tonumber(coniss) then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙فلوسك ماتكفي \n•-› X","md",true)
end
local daddd = {"1", "2", "3", "4️",}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" or haddd == "3" then
local ballanceek = ballancee + coniss
Redis:incrby(RMAD.."boob"..msg.sender_id.user_id , coniss)
Redis:setex(RMAD.."iiooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "⌯︙مبروك فزت بالحظ 🎉\n⌯︙فلوسك قبل ↫ ( "..ballancee.." دولار 💵 )\n⌯︙فلوسك الان ↫ ( "..ballanceek.." دولار 💵 )\n•-› ✓","md",true)
else
local ballanceekk = ballancee - coniss
Redis:decrby(RMAD.."boob"..msg.sender_id.user_id , coniss)
Redis:setex(RMAD.."iiooo" .. msg.sender_id.user_id,1200, true)
merolua.sendText(msg.chat_id,msg.id, "⌯︙للاسف خسرت بالحظ 😬\n⌯︙فلوسك قبل ↫ ( "..ballancee.." دولار 💵 )\n⌯︙فلوسك الان ↫ ( "..ballanceekk.." دولار 💵 )\n•-› X","md",true)
end
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'تحويل' and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
merolua.sendText(msg.chat_id,msg.id, "⌯︙استعمل الامر هكذا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙(`تحويل`) المبلغ\n•-› ?","md",true)
end

if text and text:match('^تحويل (.*)$') and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
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
if not Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ","md",true)
end
if tonumber(coniss) < 100 then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙الحد الادنى المسموح به هو 100 دولار \n•-› X","md",true)
end
ballancee = Redis:get(RMAD.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙فلوسك ماتكفي \n•-› X","md",true)
end

if tonumber(coniss) > tonumber(ballancee) then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙فلوسك ماتكفي\n•-› X","md",true)
end

Redis:set(RMAD.."transn"..msg.sender_id.user_id,coniss)
Redis:setex(RMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
merolua.sendText(msg.chat_id,msg.id,[[
⌯︙ارسل الان رقم الحساب البنكي الي تبي تحول له

– معاك دقيقة وحدة والغي طلب التحويل .
•-› ?
]],"md",true)  
return false
end
if Redis:get(RMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
cccc = Redis:get(RMAD.."boobb"..msg.sender_id.user_id)
uuuu = Redis:get(RMAD.."bbobb"..msg.sender_id.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del(RMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(RMAD.."transn" .. msg.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ارسل رقم حساب بنكي ","md",true)
end
if text == cccc then
Redis:del(RMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(RMAD.."transn" .. msg.sender_id.user_id)
return merolua.sendText(msg.chat_id,msg.id,"⌯︙ماتكدر تحول لنفسك ","md",true)
end
if Redis:get(RMAD.."boballcc"..text) then
local UserNamey = Redis:get(RMAD.."transn"..msg.sender_id.user_id)
local ban = merolua.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
local fsvhhh = Redis:get(RMAD.."boballid"..text)
local bann = merolua.getUser(fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end
local fsvhh = Redis:get(RMAD.."boballban"..text)
UserNameyr = UserNamey / 10
UserNameyy = UserNamey - UserNameyr
Redis:decrby(RMAD.."boob"..msg.sender_id.user_id , UserNamey)
Redis:incrby(RMAD.."boob"..fsvhhh , math.floor(UserNameyy))
merolua.sendText(msg.chat_id,msg.id, "حوالة صادرة من بنك "..NamesBot.."\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمستلم : "..newss.."\nالحساب رقم : `"..text.."`\nنوع البطاقة : "..fsvhh.."\nخصمت 10% رسوم تحويل\nالمبلغ : "..UserNameyy.." دولار 💵","md",true)
merolua.sendText(fsvhhh,0, "حوالة واردة من بنك "..NamesBot.."\n\nالمرسل : "..news.."\nالحساب رقم : `"..cccc.."`\nنوع البطاقة : "..uuuu.."\nالمبلغ : "..UserNameyy.." دولار 💵","md",true)
Redis:del(RMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(RMAD.."transn" .. msg.sender_id.user_id)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙لا يوجد حساب بنكي بهذا الرقم","md",true)
Redis:del(RMAD.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(RMAD.."transn" .. msg.sender_id.user_id)
end
end

if text and text:match("^اضف فلوس (.*)$") and msg.reply_to_message_id ~= 0 and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if msg.DevMain and not Redis:get(RMAD.."add:money") then
local addm = "⌯︙اضف فلوس معطله من قبل مطور السورس\n⌯︙انتبه حبيبي لتفعل هيج ميزه تسخف اللعبه وتخربها\n⌯︙جمال اللعبه لما تكون صعبه تحصل ع الفلوس\n⌯︙اذا تريدها اطلبها من مطور السورس"
local reply_markup = merolua.replyMarkup{
    type = 'inline',
    data = {
    {{text='•  مطـوࢪ سـوࢪس دࢪاڪـون •',url="t.me/or_33"}},
    }
    }
merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,addm).Warning,"md",true, false, false, false, reply_markup)
return false
end
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
if not msg.DevMain then
return merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,'⌯︙هذا الامر يخص ↫ '..Controller_Num(1)..' .\n•-› X').Warning,"md",true) 
end
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
merolua.sendText(msg.chat_id,msg.id,"\n*⌯︙"..NamesBot.." ماعنده حساب بالبنك 🤣*","md",true)  
return false
end
local ban = merolua.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(RMAD.."booob",Remsg.sender_id.user_id) then
Redis:incrby(RMAD.."boob"..Remsg.sender_id.user_id , coniss)
ccccc = Redis:get(RMAD.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(RMAD.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(RMAD.."zrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(RMAD.."boob"..Remsg.sender_id.user_id) or 0
merolua.sendText(msg.chat_id,msg.id, "⌯︙الاسم ↫ "..news.."\n⌯︙الحساب ↫ `"..ccccc.."`\n⌯︙بنك ↫ ( "..NamesBot.." )\n⌯︙نوع ↫ ( "..uuuuu.." )\n⌯︙السرقه ↫ ( "..ppppp.." دولار 💵 )\n⌯︙صار رصيده ↫ ( "..ballanceed.." دولار 💵 )\n•-› ✓","md",true)
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعنده حساب بنكي ","md",true)
end
end

if text == "توب فلوس" or text == "توب الفلوس" or text == "الزناكين" or text == "الاغنياء" and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local bank_users = Redis:smembers(RMAD.."booob")
if #bank_users == 0 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 20 شخص ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(RMAD.."boob"..v)
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
"1️⃣0⃣",
"1️⃣1️⃣",
"1️⃣2⃣",
"1️⃣3️⃣",
"1️⃣4️⃣",
"1️⃣5️⃣",
"1️⃣6⃣",
"1️⃣7⃣",
"1️⃣8⃣",
"1️⃣9⃣",
"2⃣0⃣"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = merolua.getUser(v[2]).first_name
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local emo = emoji[k]
num = num + 1
top_mony = top_mony.."ͺ"..emo.."ͺ •-› $"..mony.." | "..user_tag.." 💵 \n"
end
end
return merolua.sendText(msg.chat_id,msg.id,top_mony,"md",true)
end

if text == "توب الحراميه" or text == "توب الحرامية" or text == "توب حراميه" or text == "توب السرقه" or text == "توب سرقه" or text == "اكبر الحراميه" or text == "القفاصه" and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local ty_users = Redis:smembers(RMAD.."zrfffid")
if #ty_users == 0 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙لا يوجد احد","md",true)
end
ty_anubis = "اكثر 20 شخص قفاص باكو فلوس ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(RMAD.."zrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4️⃣",
"5️⃣",
"6⃣",
"7️⃣",
"8️⃣",
"9⃣",
"1️⃣0⃣",
"1️⃣1️⃣",
"1️⃣2⃣",
"1️⃣3️⃣",
"1️⃣4️⃣",
"1️⃣5️⃣",
"1️⃣6⃣",
"1️⃣7⃣",
"1️⃣8⃣",
"1️⃣9⃣",
"2⃣0⃣"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = merolua.getUser(v[2]).first_name
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local emoo = emojii[k]
num_ty = num_ty + 1
ty_anubis = ty_anubis.."ͺ"..emoo.."ͺ •-› $"..mony.." | "..user_tag.." 💵 \n"
end
end
return merolua.sendText(msg.chat_id,msg.id,ty_anubis,"md",true)
end

if text == 'بخشيش' or text == 'بقشيش' or text == "كراميه" and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
local ay = math.floor(Redis:ttl(RMAD.."iioo"..msg.sender_id.user_id) / 60)
if Redis:ttl(RMAD.."iioo"..msg.sender_id.user_id) >= 1 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙من شويه اخذت بخشيش انتظر ( "..ay.." دقائق )\n•-› X","md",true)
end
local jjjo = math.random(1,200)
Redis:incrby(RMAD.."boob"..msg.sender_id.user_id, jjjo)
Redis:setex(RMAD.."iioo"..msg.sender_id.user_id,600, true)
return merolua.sendText(msg.chat_id,msg.id,"⌯︙تكرم وهذا بخشيش "..jjjo.." دولار 💵","md",true)
else
return merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'سرقه' or text == 'بوكه' or text == 'خمطه' or text == 'خمط' or text == 'تقفيص' and tonumber(msg.reply_to_message_id) ~= 0 and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
local Remsg = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
if Remsg.Merotele == "error" then
return merolua.sendText(msg.chat_id,msg.id,"\n⌯︙عذرا هذا المستخدم غير مدعوم ","md",true)  
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
merolua.sendText(msg.chat_id,msg.id,"\n*⌯︙ها ارنب تريد تسرق نفسك  🤡*","md",true)  
return false
end
local polic = math.floor(Redis:ttl(RMAD.."polic"..msg.sender_id.user_id) / 60)
local hrame = math.floor(Redis:ttl(RMAD.."hrame"..msg.sender_id.user_id) / 60)
if Redis:ttl(RMAD.."polic"..msg.sender_id.user_id) >= 1 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙انته بالسجن 🏤 انتظر ( "..polic.." دقائق )\n•-› X","md",true)
end
if Redis:ttl(RMAD.."hrame"..Remsg.sender_id.user_id) >= 1 then
return merolua.sendText(msg.chat_id,msg.id,"⌯︙هذا خطيه مبيوك قبل شويه\n⌯︙تكدر تسرقه بعد ( "..hrame.." دقيقة )\n•-› X","md",true)
end
if Redis:sismember(RMAD.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(RMAD.."boob"..Remsg.sender_id.user_id) or 0
if tonumber(ballanceed) < 199 then
return merolua.sendText(msg.chat_id,msg.id, "⌯︙ماتكدر تسرقه فلوسه اقل من 200 دولار 💵","md",true)
end
local hrame = math.floor(math.random() * 200) + 1
local hramee = math.floor(math.random() * 5) + 1
if hramee == 1 or hramee == 2 or hramee == 3 or hramee == 4 then
Redis:incrby(RMAD.."boob"..msg.sender_id.user_id, hrame)
Redis:decrby(RMAD.."boob"..Remsg.sender_id.user_id, hrame)
Redis:setex(RMAD.."hrame"..Remsg.sender_id.user_id, 900, true)
Redis:incrby(RMAD.."zrfff"..msg.sender_id.user_id, hrame)
Redis:sadd(RMAD.."zrfffid", msg.sender_id.user_id)
merolua.sendText(msg.chat_id,msg.id, "⌯︙اخذ يا حرامي خمطته  "..hrame.." دولار 💵\n•-› ✓","md",true)
else
Redis:setex(RMAD.."polic"..msg.sender_id.user_id,300, true)
merolua.sendText(msg.chat_id,msg.id, "⌯︙لزمتك الشرطة وانته تسرقه انتظر 5 دقائق 🚔\n•-› X","md",true)
end
else
merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعنده حساب بنكي ","md",true)
end
end

if text == 'راتب' or text == 'راتبي' and ChCheck(msg) then
if Redis:get(RMAD.. "Bank"..msg.chat_id) then
    if Redis:get(RMAD..'Warning:Chat'..msg.chat_id)  then
        merolua.sendText(msg.chat_id,msg.id,Reply_Status(msg.sender_id.user_id,"⌯︙البنك معطله من قبل مالك المجموعة \n•-› X").Warning,"md",true)
    end
    return false
end
if Redis:sismember(RMAD.."booob",msg.sender_id.user_id) then
if Redis:ttl(RMAD.."iiioo"..msg.sender_id.user_id) >= 1 then
local ay = math.floor(Redis:ttl(RMAD.."iiioo"..msg.sender_id.user_id) / 60)
return merolua.sendText(msg.chat_id,msg.id,"⌯︙راتبك ينزل بعد ( "..ay.." دقيقة )\n•-› X","md",true)
end
Redis:setex(RMAD.."iiioo"..msg.sender_id.user_id,620, true)
local Textinggt = {"كابتن كريم 🚙","شرطي 👮🏻‍♂️","بياع حبوب 🍻","سواق تاكسي 🚕","قاضي 👨","نوم 🛌","مغني 🎤","كوفيره 💆","ربة منزل 🤷","مربيه اطفال 💁","كهربائي 💡","نجار ⛏","متذوق طعام 🍕","فلاح 👨","كاشير بنده 🙋","ممرض 👨","مهرج 🤹","عامل توصيل 🚴","عسكري 👮","مهندس 👨","وزير 👨","محامي ⚖️","حفار قبور ⚓","حلاق ✂","إمام مسجد 📿","صياد 🎣","خياط 🧵","طيار 🛩","مودل 🕴","ملك 👑","سباك 🔧","موزيع 🗺","سكيورتي 👮","معلم شاورما 🌯","دكتور ولاده 👨","مذيع 🗣","عامل مساج 💆","ممثل 🤵","جزار 🥩","مدير بنك 💳","مبرمج 👨","رقاصه 💃","صحفي 👩🏼‍💻","حرامي 🥷","ساحر 🔮","لاعب️ ⚽","مصور 🖼","عامل مقسم ☎️","كاتب 📖","مخبري 🧪"}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local user = merolua.getUser(msg.sender_id.user_id)
local neews = '['..user.first_name..'](tg://user?id='..user.id..')'
local dec = {
["كابتن كريم 🚙"] = 50,
["شرطي 👮🏻‍♂️"] = 75,
["بياع حبوب 🍻"] = 75,
["سواق تاكسي 🚕"] = 50,
["قاضي 👨"] = 150,
["نوم 🛌"] = 15,
["مغني 🎤"] = 30,
["كوفيره 💆"] = 35,
["ربة منزل 🤷"] = 25,
["مربيه اطفال 💁"] = 35,
["كهربائي 💡"] = 55,
["نجار ⛏"] = 65,
["متذوق طعام 🍕"] = 15,
["فلاح 👨"] = 27,
["كاشير بنده 🙋"] = 50,
["ممرض 👨"] = 160,
["مهرج 🤹"] = 46,
["عامل توصيل 🚴"] = 59,
["عسكري 👮"] = 130,
["مهندس 👨"] = 200,
["وزير 👨"] = 450,
["محامي ⚖️"] = 200,
["حفار قبور ⚓"] = 50,
["حلاق ✂"] = 40,
["إمام مسجد 📿"] = 50,
["صياد 🎣"] = 70,
["خياط 🧵"] = 30,
["طيار 🛩"] = 230,
["مودل 🕴"] = 160,
["ملك 👑"] = 500,
["سباك 🔧"] = 20,
["موزيع 🗺"] = 100,
["سكيورتي 👮"] = 90,
["معلم شاورما 🌯"] = 85,
["دكتور ولاده 👨"] = 160,
["مذيع 🗣"] = 170,
["عامل مساج 💆"] = 40,
["ممثل 🤵"] = 190,
["جزار 🥩"] = 50,
["مدير بنك 💳"] = 200,
["مبرمج 👨"] = 180,
["رقاصه 💃"] = 55,
["صحفي 👩🏼‍💻"] = 90,
["حرامي 🥷"] = 160,
["ساحر 🔮"] = 100,
["لاعب️ ⚽"] = 200,
["مصور 🖼"] = 90,
["عامل مقسم ☎️"] = 50,
["كاتب 📖"] = 40,
["مخبري 🧪"] = 80
}
Redis:incrby(RMAD.."boob"..msg.sender_id.user_id , dec[Descriptioont])
local ballancee = Redis:get(RMAD.."boob"..msg.sender_id.user_id) or 0
return merolua.sendText(msg.chat_id,msg.id,"اشعار ايداع ↫ "..neews.."\nالمبلغ : "..dec[Descriptioont].." دولار 💵\nوظيفتك : "..Descriptioont.."\nنوع العملية : اضافة راتب\nرصيدك الان : "..ballancee.." دولار 💵","md",true)
else
return merolua.sendText(msg.chat_id,msg.id, "⌯︙ماعندك حساب بنكي ارسل ↫ ( `انشاء حساب بنكي` )","md",true)
end
end
end
end
return {RMAD = reply}

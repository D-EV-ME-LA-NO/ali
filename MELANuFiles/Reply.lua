
function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Melano.."Name:Bot") or "ميلانو") 
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
local neww = Redis:get(Melano.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Melano.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end

----Barlo----
if not Redis:get(Melano..'SOFI:Lock:Reply'..msg.chat_id) then
if text == "انجب" or text == "نجب" or text == "انجبي" or text == "نجبي" or text == "انجبو" or text == "نجبو" then
if msg.SecondSudo then
rd = 'مطوريي اغلط شكد متريد نورتنه ، ♥️💪🏿'
elseif msg.SudoBot then
rd = 'احترم نفسكك لا عبالكك رافعيك مطور ، 🖕🏿♥️'
elseif msg.Owner then
rd = 'تاج راسيي غير انت منشئ المجموعه ،🖐🏿♥️'
elseif msg.BasicConstructor then
rd = 'تاج راسيي انت المنشئ الاساسي ،🖐🏿♥️'
elseif msg.BasicConstructor then
rd = 'حبيبي المنشئ استقبلها منكك ،👍🏿♥️'
elseif msg.Manager then
rd = 'حبيبي راح اسامحكك لان مدير وع راسي ، 🖐🏿♥️'
elseif msg.Admin then
rd = 'راح اسامحكك هلمره لانك ادمن ، ☝🏿♥️'
elseif msg.VipMem then
rd = 'راح احترمكك تره بس هلمره لانك مميز عندي ، ☝🏿♥️'
else
rd = 'لكك هوه انت عضو وجاي تغلط ؟، 🖕🏿♥️'
end
return merolua.sendText(msg.chat_id,msg.id, rd, 'html',true)
end
if text == 'دي' or text == 'ديي' or text == 'دي بابه' then 
Melano =  "آخلُِآقٌڪڪ لُِڪڪ 𖠙 😒🔪"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'سلام' or text == 'سلام عليكم' or text == 'السلام عليكم' or text == 'سلامم عليكم' or text == 'السلامم عليكم' or text == 'سلامم' or text == 'السلام على من رد السلام' then
local Melano = {"و ؏ـليڪم ؏ـمࢪي 🤍","و ؏ـليڪم السلام ❤️‍🔥","و ؏ـليڪم حـَبـيبيَ ♥️","و ؏ـليڪم السلام يَابُةه 💖"," آطلـقْ سـلامَ 😔🍇","و ؏ـليڪم السلام و رحمه الله 🤍"}
merolua.sendText(msg.chat_id,msg.id,''..Melano[math.random(#Melano)]..'',"md",true)  
return false
end 
if text == '😭💔' or text == '😭😭' or text == '😭😭😭' or text == '😿💔' or text == '😭😭😭' or text == '😭😭😭😭' then 
Melano =  "مآآعٍآشُ آلُِي يزعٍلُِڪڪ 𖠙 😏♥️"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == '🌚💔' or text == '💔🌚' or text == '🚶‍♂💔' or text == '💔' or text == '😔💔' or text == '🚶‍♀💔' or text == '😭' then 
Melano =  "شبّيي اﻟ̣̣פﻟ̣̣و 𖠙 😿💔"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'باي' or text == 'بااي' or text == 'اروح' or text == 'اروح احسن' or text == 'اولي احسن' or text == 'راح اروح' or text == 'باي انام' then 
Melano =  "أُرٌجُعُ عٍيدِهآآ مٍوو تنِْسةه 𖠙 🤤♥️"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'هلو' or text == 'هلا' or text == 'هلاو' or text == 'ههلا' or text == 'ههلاو' or text == 'هلاو' or text == 'هاي' or text == 'ههاي' then
local Melano = {"ۿهـلاٱ ؏ـمࢪي 🤍","هٓهَـلاٱ گ̲ـلبي❤️‍🔥","ۿـلاٱ حـَبـيبيَ ♥️","ڪل الۿـلاآ يَابُةه 💖"," آطلـق ۿهَـلآو ❤️‍🩹🧸","هُهَـلاٱ يـٰٰرﯞحـًٛيہ🙊💞","ۿـلاٱ بَلحـبَ ﻣﻣـَاُلتي 😔💖"}
Melano2 = math.random(#Melano) 
merolua.sendText(msg.chat_id,msg.id,Melano[Melano2],"md",true)  
return false
end
if text == 'شونك' or text == 'شونج' or text == 'شلونك' or text == 'شلونج' or text == 'شونكم' or text == 'شلونكم' or text == 'شلخبار' or text == 'شلون الاخبار' or text == 'شخبارك' then 
local Melano = {"ماﺷ͠ يةھَہّ يﻋ̝̚مريي ۅاﻧﺗ̲ت 𖠙 🤤♥️" ,"الحۡمۘدللهۂَ ٰوانۨہتت 𖠙 🤤♥️","تمۘامۘ عمۘري ٰوانۨہتت 𖠙 🤤♥️"} 
Melano2 = math.random(#Melano) 
merolua.sendText(msg.chat_id,msg.id,Melano[Melano2] ,"md",true)  
return false
end
if text == 'وينك' or text == 'وينج' then
Melano =  "مْوٌجہوٌدِ يہمْگُ يحلوُ 𖠙 😉♥️"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'بوت عواي' or text == 'بوت زربه' or text == 'البوت عاوي' or text == 'البوت زربه' then
Melano =  "اطردكك تجرب ؟ ، 😕🔪"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'نايمين' or text == 'ميتين' then
Melano =  "طُآمسين ووعٍيوونڪ 𖠙 😪🖤ۦ"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'هلوباي' or text == 'هلو باي' then  
Melano =  "شحۡسۜيت مۘنۨہ هيجۚ ּكتبت ؟ 🌝♥️"
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'اكلك' or text == 'اكلج' or text == 'اكلكم' then 
Melano =  "ڪوولُِ مآڪوولُِ لُِآحٍدِ 𖠙 😉♥️"
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == 'فرخ' or text == 'فرخه' then
Melano =  "ٰوينۨہهۂَ خۡل احۡصرهۂَ 𖠙 😹♥️" 
merolua.sendText(msg.chat_id,msg.id,Melano,"md",true)  
return false
end
if text == 'سورس صوفي' or text == 'سورس دراكون' or text == 'سورس دراكون' or text == 'سورس زربه' or text == 'السورس زربه' or text == 'سورس عاوي' or text == 'السورس عاوي' then 
Melano =  "لُِآ سوورس خآلُِتڪ دِي لُِڪ 𖠙 😒🔪" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == 'بوسني' or text == 'بوسيني' then 
Melano =  "-محِااﭑةه ، ݪسِقق  🥺♥️♥️؟." 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "صباحوا" or text == "صباح الخير" or text == "صباحو" then
Melano =  "صَباحيّ ، ﭑنتةه🥺💞💞." 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "اكو بوت" or text == "اكو بوت؟" or text == "عدكم بوت" or text == "عندكم بوت" or text == "عدكم بوت؟" or text == "عندكم بوت؟" or text == "تردون بوت" or text == "تردون بوت؟" or text == "وين البوت" or text == "وين البوت؟" then
Melano =  "-موَ بعَينڪۃ ، شنيَ ، 🌝🌝." 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "جاو" or text == "ججاو" then
Melano =  "- ۅَتعۅفنيَ ؟." 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "تف" or text == "تفف" then
Melano =  "چا غير مَي ، ۅࢪدَ ،" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "تحبني" or text == "تحبني؟" or text == "تحبني؟؟" then
Melano =  "شعندِيّ ، غيࢪكَ🥵♥️♥️♥️" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "جوعان" or text == "جوعانه" then
Melano =  "ټعاَل ﭑڪلنيَ ، 🌝." 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "ههه" or text == "هههه" or text == "ههههه" or text == "هههههه" or text == "ههههههه" then
Melano =  "جَعل ، محدَ غيݛكَ ، يضحكَ  ، ♥️♥️" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "وينكم" then
Melano =  "حَيݪيٰ ، 🥺💞" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "احبك" or text == "حبك" then
Melano =  "ﭑنيۿمَ ، قسمَہ، 🥺💞" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == "بوت ملطلط" then
Melano =  "ربي صبرني 😞🌾" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end
if text == 'وينك' or text == 'وينج' then
Melano =  "مْوٌجہوٌدِ يہمْگُ يحلوُ  😉♥️" 
merolua.sendText(msg.chat_id,msg.id,Melano, "md",true)  
return false
end

if msg.Manager then
if text == 'تفعيل ردود البوت' or text == 'تفعيل الردود' then
if not Redis:get(Melano..'SOFI:Lock:Reply'..msg.chat_id) then
merolua.sendText(msg.chat_id,msg.id,'‹ : ردود البوت بالتاكيد مفعله ', "md",true)  
else
merolua.sendText(msg.chat_id,msg.id,'‹ : تم تفعيل ردود البوت', "md",true)  
Redis:del(Melano..'SOFI:Lock:Reply'..msg.chat_id)
end end
if text == 'تعطيل ردود البوت' or text == 'تعطيل الردود' then
if Redis:get(Melano..'SOFI:Lock:Reply'..msg.chat_id) then
merolua.sendText(msg.chat_id,msg.id,'‹ : ردود البوت بالتاكيد معطله ', "md",true)  
else
Redis:set(Melano..'SOFI:Lock:Reply'..msg.chat_id,true)
merolua.sendText(msg.chat_id,msg.id,'‹ : تم تعطيل ردود البوت', "md",true)  
end
end

end


end
return {Melano = reply}

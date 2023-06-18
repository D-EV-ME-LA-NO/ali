function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Dragon.."Name:Bot") or "كرستين") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(Dragon) then
return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(Dragon.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Dragon.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end

----Barlo----
if not Redis:get(Dragon..'SOFI:Lock:Reply'..msg.chat_id) then
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
Dragon =  "آخلُِآقٌڪڪ لُِڪڪ 𖠙 😒🔪"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'سلام' or text == 'سلام عليكم' or text == 'السلام عليكم' or text == 'سلامم عليكم' or text == 'السلامم عليكم' or text == 'سلامم' or text == 'السلام على من رد السلام' then
local Dragon = {"و ؏ـليڪم ؏ـمࢪي 🤍","و ؏ـليڪم السلام ❤️‍🔥","و ؏ـليڪم حـَبـيبيَ ♥️","و ؏ـليڪم السلام يَابُةه 💖"," آطلـقْ سـلامَ 😔🍇","و ؏ـليڪم السلام و رحمه الله 🤍"}
merolua.sendText(msg.chat_id,msg.id,''..Dragon[math.random(#Dragon)]..'',"md",true)  
return false
end 
if text == '😭💔' or text == '😭😭' or text == '😭😭😭' or text == '😿💔' or text == '😭😭😭' or text == '😭😭😭😭' then 
Dragon =  "مآآعٍآشُ آلُِي يزعٍلُِڪڪ 𖠙 😏♥️"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == '🌚💔' or text == '💔🌚' or text == '🚶‍♂💔' or text == '💔' or text == '😔💔' or text == '🚶‍♀💔' or text == '😭' then 
Dragon =  "شبّيي اﻟ̣̣פﻟ̣̣و 𖠙 😿💔"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'باي' or text == 'بااي' or text == 'اروح' or text == 'اروح احسن' or text == 'اولي احسن' or text == 'راح اروح' or text == 'باي انام' then 
Dragon =  "أُرٌجُعُ عٍيدِهآآ مٍوو تنِْسةه 𖠙 🤤♥️"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'هلو' or text == 'هلا' or text == 'هلاو' or text == 'ههلا' or text == 'ههلاو' or text == 'هلاو' or text == 'هاي' or text == 'ههاي' then
local Dragon = {"ۿهـلاٱ ؏ـمࢪي 🤍","هٓهَـلاٱ گ̲ـلبي❤️‍🔥","ۿـلاٱ حـَبـيبيَ ♥️","ڪل الۿـلاآ يَابُةه 💖"," آطلـق ۿهَـلآو ❤️‍🩹🧸","هُهَـلاٱ يـٰٰرﯞحـًٛيہ🙊💞","ۿـلاٱ بَلحـبَ ﻣﻣـَاُلتي 😔💖"}
Dragon2 = math.random(#Dragon) 
merolua.sendText(msg.chat_id,msg.id,Dragon[Dragon2],"md",true)  
return false
end
if text == 'شونك' or text == 'شونج' or text == 'شلونك' or text == 'شلونج' or text == 'شونكم' or text == 'شلونكم' or text == 'شلخبار' or text == 'شلون الاخبار' or text == 'شخبارك' then 
local Dragon = {"ماﺷ͠ يةھَہّ يﻋ̝̚مريي ۅاﻧﺗ̲ت 𖠙 🤤♥️" ,"الحۡمۘدللهۂَ ٰوانۨہتت 𖠙 🤤♥️","تمۘامۘ عمۘري ٰوانۨہتت 𖠙 🤤♥️"} 
Dragon2 = math.random(#Dragon) 
merolua.sendText(msg.chat_id,msg.id,Dragon[Dragon2] ,"md",true)  
return false
end
if text == 'وينك' or text == 'وينج' then
Dragon =  "مْوٌجہوٌدِ يہمْگُ يحلوُ 𖠙 😉♥️"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'بوت عواي' or text == 'بوت زربه' or text == 'البوت عاوي' or text == 'البوت زربه' then
Dragon =  "اطردكك تجرب ؟ ، 😕🔪"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'نايمين' or text == 'ميتين' then
Dragon =  "طُآمسين ووعٍيوونڪ 𖠙 😪🖤ۦ"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'هلوباي' or text == 'هلو باي' then  
Dragon =  "شحۡسۜيت مۘنۨہ هيجۚ ּكتبت ؟ 🌝♥️"
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'اكلك' or text == 'اكلج' or text == 'اكلكم' then 
Dragon =  "ڪوولُِ مآڪوولُِ لُِآحٍدِ 𖠙 😉♥️"
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == 'فرخ' or text == 'فرخه' then
Dragon =  "ٰوينۨہهۂَ خۡل احۡصرهۂَ 𖠙 😹♥️" 
merolua.sendText(msg.chat_id,msg.id,Dragon,"md",true)  
return false
end
if text == 'سورس صوفي' or text == 'سورس دراكون' or text == 'سورس دراكون' or text == 'سورس زربه' or text == 'السورس زربه' or text == 'سورس عاوي' or text == 'السورس عاوي' then 
Dragon =  "لُِآ سوورس خآلُِتڪ دِي لُِڪ 𖠙 😒🔪" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == 'بوسني' or text == 'بوسيني' then 
Dragon =  "-محِااﭑةه ، ݪسِقق  🥺♥️♥️؟." 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "صباحوا" or text == "صباح الخير" or text == "صباحو" then
Dragon =  "صَباحيّ ، ﭑنتةه🥺💞💞." 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "اكو بوت" or text == "اكو بوت؟" or text == "عدكم بوت" or text == "عندكم بوت" or text == "عدكم بوت؟" or text == "عندكم بوت؟" or text == "تردون بوت" or text == "تردون بوت؟" or text == "وين البوت" or text == "وين البوت؟" then
Dragon =  "-موَ بعَينڪۃ ، شنيَ ، 🌝🌝." 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "جاو" or text == "ججاو" then
Dragon =  "- ۅَتعۅفنيَ ؟." 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "تف" or text == "تفف" then
Dragon =  "چا غير مَي ، ۅࢪدَ ،" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "تحبني" or text == "تحبني؟" or text == "تحبني؟؟" then
Dragon =  "شعندِيّ ، غيࢪكَ🥵♥️♥️♥️" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "جوعان" or text == "جوعانه" then
Dragon =  "ټعاَل ﭑڪلنيَ ، 🌝." 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "ههه" or text == "هههه" or text == "ههههه" or text == "هههههه" or text == "ههههههه" then
Dragon =  "جَعل ، محدَ غيݛكَ ، يضحكَ  ، ♥️♥️" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "وينكم" then
Dragon =  "حَيݪيٰ ، 🥺💞" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "احبك" or text == "حبك" then
Dragon =  "ﭑنيۿمَ ، قسمَہ، 🥺💞" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == "بوت ملطلط" then
Dragon =  "ربي صبرني 😞🌾" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end
if text == 'وينك' or text == 'وينج' then
Dragon =  "مْوٌجہوٌدِ يہمْگُ يحلوُ  😉♥️" 
merolua.sendText(msg.chat_id,msg.id,Dragon, "md",true)  
return false
end

if msg.Manager then
if text == 'تفعيل ردود البوت' or text == 'تفعيل الردود' then
if not Redis:get(Dragon..'SOFI:Lock:Reply'..msg.chat_id) then
merolua.sendText(msg.chat_id,msg.id,'‹ : ردود البوت بالتاكيد مفعله ', "md",true)  
else
merolua.sendText(msg.chat_id,msg.id,'‹ : تم تفعيل ردود البوت', "md",true)  
Redis:del(Dragon..'SOFI:Lock:Reply'..msg.chat_id)
end end
if text == 'تعطيل ردود البوت' or text == 'تعطيل الردود' then
if Redis:get(Dragon..'SOFI:Lock:Reply'..msg.chat_id) then
merolua.sendText(msg.chat_id,msg.id,'‹ : ردود البوت بالتاكيد معطله ', "md",true)  
else
Redis:set(Dragon..'SOFI:Lock:Reply'..msg.chat_id,true)
merolua.sendText(msg.chat_id,msg.id,'‹ : تم تعطيل ردود البوت', "md",true)  
end
end

end


end
return {Dragon = reply}

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
if text == "تفعيل ردود السورس عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌔︙هذا الامر يخص { "..Controller_Num(1).." }* ","md",true)  
end
Redis:del(noor.."noor:Status:repleall") 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌔︙تم تفعيل ردود السورس عام*","md",true )
end
if text == "تعطيل ردود السورس عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*⌔︙هذا الامر يخص { "..Controller_Num(1).." }* ","md",true)  
end
Redis:set(noor.."noor:Status:repleall",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"*⌔︙تم تعطيل ردود السورس عام*","md",true )
end

if text== "انجب"  or text== "نجب"  or text=="انجبي"  or text=="نجبي"  then
if msg.ControllerBot then  
return LuaTele.sendText(msg.chat_id,msg.id,"تامر امر سيادة المطور تاج راسي 😊")
elseif msg.TheBasicsQ then 
return LuaTele.sendText(msg.chat_id,msg.id,"انت المالك على راسي على راسسيي بصوت ابو علوش العراقي😂")
elseif msg.Originators then 
return LuaTele.sendText(msg.chat_id,msg.id,"حبيبي والله المنشئ بعد اخذلك راشدي فد مره 😒😂")
elseif msg.Managers then 
return LuaTele.sendText(msg.chat_id,msg.id,"اكلك شنو واذا مدير عود ؟ يله راح اسكت لخاطر البقية 🙂🙂")
elseif msg.Addictive then 
return LuaTele.sendText(msg.chat_id,msg.id,"فوك ممنطيك رتبةادمن هيج تجازيني ؟ انت انجب 😑")
else 
return LuaTele.sendText(msg.chat_id,msg.id,"انجب لك لا اشحتك 😒")
end 
end
if Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
if msg.ControllerBot and text=="هلو" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
LuaTele.sendText(msg.chat_id,msg.id,sh[math.random(#sh)])
end
if not msg.ControllerBot and text=="هلو" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,ns[math.random(#ns)])
end
if not msg.ControllerBot and (text== "شلونكم" or text== "شلونك"  or text== "شونك"  or text== "شلونج"  or text== "شلونكم")  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,sss[math.random(#sss)])
end
if not msg.ControllerBot and (text==" باي" or text == "باي")  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,dr[math.random(#dr)])
end
if msg.ControllerBot and text== "احبك" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,"اموت عليك حياتي 🥰❤️")
end
if msg.ControllerBot and (text== "تحبني" or text=="حبك")  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,"اموت عليك حياتي 😍❤️")
end
if not msg.ControllerBot and (text== "احبك" or text=="حبك")  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,lovm[math.random(#lovm)])
end
if not msg.ControllerBot and text== "تحبني" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,lovm[math.random(#lovm)])
end
if text=="اطربنه" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,song[math.random(#song)])
end
if text== "تف" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"عليك 😂")
end
if text== "صاكه"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ويـــنههااا دلينييي عليههاااا 😂😍")
end
if text== "وينك"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"يمك ولك 👌")
end
if text== "منورين"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"مۘنۨــہ نۨــہورڪ ﻋـمـرّي ❤️🌺")
end
if text== "هاي"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"هايات عمري 😍🍷")
end
if text== "🙊"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"فديت الخجول 🥰 😍")
end
if text== "😢"  or text== "😭😭"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"شبيك تبجي بوجه الله 🤨")
end
if text== "منور"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"نورك يابعدهم كلهم ❤️")
end
if text== "😒" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"شبيك حب ؟")
end
if text== "مح"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"مممحح شهالعسل 🙈❤")
end
if text== "شكرا"  or text== "ثكرا" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return  LuaTele.sendText(msg.chat_id,msg.id,"العفو ححــب 💕")
end
if text== "انته وين"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"بالبيت ، شتريد ؟")
end
if text== "😍"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ها عاشك ؟ 🤣")
end
if text== "اكرهك"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ليش منو كلك احبك اني ؟ 😒😂")
end
if text== "اريد اكبل" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"تعال نكبل يله 😂💕")
end
if text== "ضوجه"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"غير ماعندك حبيبه")
end
if text== "صاك"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ويينهههه دزززي صورته 😍")
end
if text== "اجيت"  or text=="اني اجيت" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return  LuaTele.sendText(msg.chat_id,msg.id,"ههــلا ورححب 🔥")
end
if text== "حفلش"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"افلش راسك وربك")
end
if text== "نايمين" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"اني سهران احرسكم")
end
if text== "اكو احد" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"اي حبيبي انـي موجـود")
end
if text== "شكو" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"كلشي ماكو سلامتك️")
end
if text== "انت منو"  or text=="منو انت" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"⌔︙انآ بوت بوت أسمي ["..Bot_Name.."] ✓ \n⌔︙آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت\n\n⌔︙مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...\n\n⌔︙ضيفني لكروبك وارفعني مشرف وارسل تفعيل داخل الكروب")
end
if text== "كلخرا"  or text== "اكل خره" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"تمام حط نفسك بماعون وتعال")
end
if text== "😔"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ليش الحلو ضايج")
end
if text== "☹️"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"لضوج حبيبي")
end
if text== "جوعان"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"تعال اكلني 😂")
end
if text== "خاصك"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ها ها ها زحفففتت")
end
if text== "لتحجي"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"وانت شعليك حاجي من حلگگ😏")
end
if text== "معليك"  or text== "شعليك" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"عليه ونص 😂🤨")
end
if text== "شدسون"  or text== "شداتسوون"  or text== "شدتسون" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return  LuaTele.sendText(msg.chat_id,msg.id,"ناكل")
end
if text and text:match(Bot_Name.." شلونك$")   and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,"بخير والعافيه عيونك")
end
if text== "يومه فدوه"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"فدؤه الج حياتي 😍😙")
end
if text== "افلش"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"فلش حتى افشل راسك وراس الخلفك")
end
if text== "احبج"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ياخي احترم شعوري اني حديقه")
end
if text== "شكو ماكو"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"كلشي ماكو سلامتك️")
end
if text== "😋"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ضم لسانك جوه عيب")
end
if text== "مرحبا"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"مرحبتين اهلا")
end
if text== "سلام"  or text== "السلام عليكم"  or text== "سلام عليكم"  or text=="سلامن عليكم"  or text=="السلامن عليكم" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,"عليكم السلام حياك" )
end
if text== "عضه"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"شكلولك عليه جلب ؟ دروح بابا روح" )
end
if text== "🚶🏻‍♂"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"وين رايح ؟ اكعد خلينا متونسين")
end
if text== "البوت واكف" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ليش تجذب عود ؟")
end
if text== "ضايج"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ليش ضايج شبيك ؟")
end
if text== "ضايجه"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"منو مضوجج كوليلي خل اسحله ؟")
end
if text== "😳"  or text== "😳😳"  or text== "😳😳😳" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"هاي شبيك يمعووود 😳")
end
if text== "صدك"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"شايفني مجذب قبل ؟؟")
end
if text== "تخليني"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"اخليك بزاويه 90 درجه وانته تعرف الباقي 😂")
end
if text== "فديتك"  or text== "فديتنك"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return  LuaTele.sendText(msg.chat_id,msg.id,"فداكـ/چ ثولان العالـم😍😂" )
end
if text== "مساعدة"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"لعرض قائمة المساعدة اكتب الاوامر")
end
if text== "زاحف"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"زاحف ع خالتك الشكره 🌝")
end
if text== "حلو"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ٱنۨــہت ٱلٱحۡلى 🌚❤️،")
end
if text== "عاش"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"وانت العايش 💕")
end
if text== "ورده"  or text== "وردة" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"انت عطرها 💕")
end
if text== "شسمك"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"⌔︙أسمي ["..Bot_Name.."]\n⌔︙آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت\n⌔︙مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...\n⌔︙ضيفني لكروبك ورفعني مشرف بلكروب وارسل تفعيل داخل الكروب")
end
if text== "فديت"  or text=="فطيت" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"فداك الكون وماي العيون 😘💕")
end
if text== "زاحفه"  or text== "زاحفة" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return  LuaTele.sendText(msg.chat_id,msg.id,"لو زاحفتلك جان ماكلت زاحفه 😒")
end
if text== "حبيبي"  or text=="حبي" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return  LuaTele.sendText(msg.chat_id,msg.id,"ها عمري 💕")
end
if text== "حبيبتي" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"حبيبتك مشغوله وي غيرك 😰")
end
if text== "حياتي" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ها عمري 💕")
end
if text== "عمري" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"فديت عمرك 💕")
end
if text== "اسكت" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ليش اسكت ؟")
end
if text== "بتحبني" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"اعشقك اني بس انت متصدك 😊💕")
end
if text== "المعزوفه"  or text=="المعزوفة"  or text=="معزوفه" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,"والله ماعرف اغني")
end
if text== "موجود" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"اي حبي كول ؟")
end
if text== "اكلك" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,".كول حياتي")
end
if text== "فدوه"  or text=="فدوة"  or text=="فطوه"  or text=="فطوة" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"لطولك وجمالك 💕")
end
if text== "دي"  or text== "ديي" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"امشيك بيها")
end
if text== "اشكرك" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"بخدمتك/ج حبي ❤")
end
if text== "😊"  or text== "😊😊"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"فدوه لخدودك 💕")
end
if text== "😑"  or text==  "😑😑"  or text==  "😑😑😑" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"وجه تنكه")
end
if text== "اطردني"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"واني شعليه ؟")
end
if text== "شسمج"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"انت متستحي تسال الرايحه والجايه ع اسمائهن ؟")
end
if text== "اني"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"انت منو ؟")
end
if text== "نورت"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"بعد روحي احمدددد قاااسم")
end
if text== "نورتي"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then 
return LuaTele.sendText(msg.chat_id,msg.id,"اويي شككرااا")
end
if text== "صباح الخير"  or text== "صباحو"  or text== "صباح الورد"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"صباح العسل يعسل")
end
if text== "مساء الخير"  or text== "مساو"  or text== "مساء الورد"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"مساء الفل والياسمين")
end
if text== "منو ضافني"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"والله مادري اسال غيري")
end
if text== "منو ضافني هنا"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"بالعكس كول الحمدلله لان ضافوك باحسن كروب بالعالم")
end
if text== "وينكم"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"والله ياحبي كلها طامسه هههع")
end
if text== "محح"  or text== "ممح"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"عسلايه 🤤")
end
if text== "🤔"  or text== "🤔🤔"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"شبيك بشنو تفكر ؟")
end
if text== "💃"  or text== "💃💃"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"شد شد يمين يمين يسار يسار فوك فوك فوك لحم لحممم")
end
if text== "😂"  or text== "😂😂"  or text== "😹" and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"دايمه حب 💕")
end
if text== "😉"  or text== "😉😉"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"عفيه تغامزو عفيه")
end
if text== "هلا"  or text== "هلاو"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"يااهلا وسههلااا")
end
if text== "تعال خاص"  or text== "تعالي خاص"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ٰهههاااااا شعدكم بالخاااصصص")
end
if text== "🦉"  or text== "🦉🦉"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ٰهلأ بہومہه 😻🙈")
end
if text== "الابراج"  or text== "ابراج"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ٰ⌔︙يرجى كتابة اسم برجك !")
end
if text== "الابراج"  or text== "ابراج"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"ٰ⌔︙يرجى كتابة اسم برجك !\n⌔︙مثال : برج الحوت")
end
if text== "همسه"  or text== "همسة"  and Redis:get(noor..'noor:Status:repleall'..msg.chat_id) then
return LuaTele.sendText(msg.chat_id,msg.id,"⌔︙هلا بك عزيزي\n⌔︙ضع معرف البوت  في الرساله ثم فراغ ثم تكتب رسالتك ثم معرف الشخص ثم معرف الشخص بعدها تضغط هذه همسه سرية الى...")
end

end


end
return {noor = reply}

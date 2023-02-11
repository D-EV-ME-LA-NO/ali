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

----Barlo----
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) then
local reply_markup = merolua.replyMarkup{
type = 'inline',
data = {
{
{text = '- قناة السورس .', url = 't.me/oooox6'}, 
},
}
}
local TextHelp = [[*
✯︙قائمــه العــاب البــوت
— — — — — — — — —
✯︙المختلف »  لعبة المختلف
✯︙امثله » لعبة الامثله 
✯︙العكس « لعبة عكس الكلمه
✯︙حزوره « لعبة الحزوره
✯︙معاني « لعبة المعاني
✯︙بات « لعبة البات 
✯︙خمن » لعبة التخمين
✯︙ترتيب » لعبة  ترتيب الحروف
✯︙سمايلات » لعبة السمايلات
✯︙اسئله » اسئله منوعه
✯︙اسالني » اسئله عامه متجدده
✯︙لغز  » الغاز الذكاء متجدده
✯︙روليت » الروليت بالمعرفات 
✯︙الروليت » الروليت بالانضمام
✯︙رياضيات » مسائل رياضيه 
✯︙انكليزي » معاني الكلمات 
✯︙كت تويت ،كت » اسئله ترفيهيه
✯︙لو خيروك » لعبة لو خيروك
✯︙صراحه » لعبة الصراحه
✯︙اعلام » لعبة اعلام الدول
✯︙مقالات » لعبة المقالات
✯︙عواصم » لعبة عواصم الدول
✯︙كلمات » لعبة كتابة الكلمات
✯︙الحظ » لعبة الحظ شفافه
✯︙حظي » لعبة ربح او خساره
✯︙عربي » لعبة مفرد او جمع 
✯︙دين » لعبة اسئله دينيه
✯︙فكك » لعبة تفكيك الحروف
✯︙حجره » لعبة حجره ورق مقص
— — — — — — — — —
✯︙نقاطي ← لعرض عدد النقاط 
✯︙بيع نقاطي + { العدد } 
لبيع كل نقطه مقابل {50} رساله
*]]
return merolua.sendText(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
end
if text == "سمايلات" and ChCheck(msg) or text == "سمايل" and ChCheck(msg) then
if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
Random = {"??","🍎","🍐","??","🍋","🍉","??","🍓","🍈","🍒","🍑","🍍","🥥","??","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","??","🥚","🍳","??","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🥤","🍶","🍺","??","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","??","🌡","💣","✯","📍","📓","📗","📂","📅","📪","??","✯","📭","⏰","??","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(TheRMAD.."Game:Smile"..msg.chat_id,SM)
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يدز هذا السمايل ? ~ {`"..SM.."`}","md",true)  
end
end

if text == "الاسرع" and ChCheck(msg) or text == "ترتيب" and ChCheck(msg) then
if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(TheRMAD.."Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يرتبها ~ {"..name.."}","md",true)  
end
end
if text == "حزوره" and ChCheck(msg) then


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(TheRMAD.."Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يحل الحزوره ↓\n {"..name.."}","md",true)  
end
end
if text == "معاني" and ChCheck(msg) then


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
Redis:del(TheRMAD.."Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(TheRMAD.."Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يدز معنى السمايل ~ {"..name.."}","md",true)  
end
end
if text == "العكس" and ChCheck(msg) then


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
Redis:del(TheRMAD.."Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","قصير","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
Redis:set(TheRMAD.."Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"قصير","طويل")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يدز العكس ~ {"..name.."}","md",true)  
end
end
if text == "بات" and ChCheck(msg) or text == "محيبس" and ChCheck(msg) then   


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then 
local reply_markup = merolua.replyMarkup{
type = 'inline',
data = {
{
{text = '➀ » { 👊 }', data = '/Mahibes1'}, {text = '➁ » { 👊 }', data = '/Mahibes2'}, 
},
{
{text = '➂ » { 👊 }', data = '/Mahibes3'}, {text = '➃ » { ?? }', data = '/Mahibes4'}, 
},
{
{text = '➄ » { ?? }', data = '/Mahibes5'}, {text = '➅ » { 👊 }', data = '/Mahibes6'}, 
},
}
}
return merolua.sendText(msg_chat_id,msg_id, [[*
✯︙ لعبه المحيبس هي لعبة الحظ 
✯︙جرب حظك ويه البوت واتونس 
✯︙كل ما عليك هوا الضغط على اليد في الازرار
*]],"md",false, false, false, false, reply_markup)
end
end
if text == "خمن" and ChCheck(msg) or text == "تخمين" and ChCheck(msg) then   


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(TheRMAD.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id,Num)  
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n".."✯︙ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."✯︙سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true)  
end
end
if text == 'اسئله' and ChCheck(msg) then   
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو

✯︙ارسل  الجواب الصحيح فقط
]]
t2 = [[
ماعدد عظام الوجه؟
1- 15
2- 13
3- 14 

✯︙ارسل  الجواب الصحيح فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون؟

1- الفم 
2- الاذن
3- الثلاجه

✯︙ارسل  الجواب الصحيح فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب؟

1- 7
2- 15
3- 11

✯︙ارسل  الجواب الصحيح فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم؟

1- 60
2- 70
3- 30 

✯︙ارسل  الجواب الصحيح فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم؟

1- ترامب
2- اوباما
3- بوتين  

✯︙ارسل  الجواب الصحيح فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- ستيف جوبر

✯︙ارسل  الجواب الصحيح فقط
]]
t8 =[[
ماهي عاصمه فرنسا؟

1- باريس 
2- لوين 
3- موسكو 

✯︙ارسل  الجواب الصحيح فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

✯︙ارسل  الجواب الصحيح فقط
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه؟
1-الفيل
2- النمل  
3- الثور

✯︙ارسل  الجواب الصحيح فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  

✯︙ارسل  الجواب الصحيح فقط
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر

✯︙ارسل  الجواب الصحيح فقط
]]
t14 =[[
م̷ـــِْن هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 

✯︙ارسل  الجواب الصحيح فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر

✯︙ارسل  الجواب الصحيح فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الاسم

✯︙ارسل  الجواب الصحيح فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب

✯︙ارسل  الجواب الصحيح فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
 1- حرف الباء
 2- حرف الام 
3- حرف الراء

✯︙ارسل  الجواب الصحيح فقط
]]
t19 =[[
على قدر اصل العزم تأتي؟
1- العزائم 
2- المكارم
3- المبائب

✯︙ارسل  الجواب الصحيح فقط
]]

t20 =[[
ماهي جمع كلمه انسه ؟
1- سيدات
2- انسات 
3- قوانص

✯︙ارسل  الجواب الصحيح فقط
]]
t21 =[[
اله اتسعلمت قديما في الحروب؟
1- الصاروخ
2- المسدس
3- المنجنيق 

✯︙ارسل  الجواب الصحيح فقط
]]
t22 =[[
تقع لبنان في قاره؟
1- افريقيا 
2- اسيا  
3- امركيا الشماليه

✯︙ارسل  الجواب الصحيح فقط
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه؟
1-الفيل
2- الاسد 
3- النمر

✯︙ارسل  الجواب الصحيح فقط
]]
t24 =[[
كم صفرا للمليون ؟
1- 4 
2- 3
3-6

✯︙ارسل  الجواب الصحيح فقط
]]
t25 =[[
ما اسم صغير الحصان؟
1- مهر  
2- جرو
3- عجل

✯︙ارسل  الجواب الصحيح فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه؟

1- القرش
2- الدلفين 
3- الثعلب

✯︙ارسل  الجواب الصحيح فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز؟

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 

✯︙ارسل  الجواب الصحيح فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق 
 
✯︙ارسل  الجواب الصحيح فقط
]]
t29 =[[
ماهي عاصمه انجلترا؟
1- لندن  
2- لفرسول
3- تركيا

✯︙ارسل  الجواب الصحيح فقط
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 

✯︙ارسل  الجواب الصحيح فقط
]]
t31 =[[
ماهي عاصمه اليابان ؟
1- بانكول
2- نيو دلهي
3- طوكيو 

✯︙ارسل  الجواب الصحيح فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ؟

1- حفضه
2- زينب 
3- خديجه 

✯︙ارسل  الجواب الصحيح فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'النيل') 
elseif SENDTEXT:find('14') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'14') 
elseif SENDTEXT:find('الفم') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'الفم') 
elseif SENDTEXT:find('11') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'11') 
elseif SENDTEXT:find('30') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'30') 
elseif SENDTEXT:find('بوتين') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'باريس') 
elseif SENDTEXT:find('10') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'10') 
elseif SENDTEXT:find('النمل') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'سحاب') 
elseif SENDTEXT:find('الاسم') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'الاسم') 
elseif SENDTEXT:find('ذهب') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'العزائم') 
elseif SENDTEXT:find('انسات') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'اسيا') 
elseif SENDTEXT:find('الاسد') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'الاسد') 
elseif SENDTEXT:find('6') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'6') 
elseif SENDTEXT:find('مهر') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'مهر') 
elseif SENDTEXT:find('الدلفين') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'الزئبق') 
elseif SENDTEXT:find('لندن') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'لندن') 
elseif SENDTEXT:find('الانسان') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
Redis:set(TheRMAD.."GAME:CHER"..msg.chat_id,'خديجه') 
end
merolua.sendText(msg.chat_id,msg.id,SENDTEXT)     
return false  
end
end
if Redis:get(TheRMAD.."GAME:CHER"..msg.chat_id) and (text == Redis:get(TheRMAD.."GAME:CHER"..msg.chat_id)) then  
if text then
merolua.sendText(msg.chat_id,msg.id,'*✯︙احسنت اجابتك صحيحه ✓*',"md")     
Redis:incrby(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(TheRMAD.."GAME:CHER"..msg.chat_id)
elseif text == 'الفيل' or text == 'الثور' or text == 'الحصان' or text == '7' or text == '9' or text == '8' or text == 'لوين' or text == 'موسكو' or text == 'مانكو' or text == '20' or text == '30' or text == '28' or text == 'ترامب' or text == 'اوباما' or text == 'كيم جونغ' or text == '50' or text == '70' or text == '40' or text == '7' or text == '3' or text == '10' or text == '4' or text == 'الاذن' or text == 'الثلاجه' or text == 'الغرفه' or text == '15' or text == '17' or text == '25' or text == 'الفرات' or text == 'نهر الكونغو' or text == 'المسيبي' or text == 'بيا بايج' or text == 'لاري بيج' or text == 'بيا مارك زوكيربرج' or text == 'الفيل' or text == 'النمر' or text == 'الفهد' or text == 'بانكول' or text == 'نيو دلهي' or text == 'بيكن' or text == 'الهاتف' or text == 'التلفاز' or text == 'المذياع' or text == 'لفرسول' or text == 'تركيا' or text == 'كريزي' or text == 'النحاس' or text == 'الحديد' or text == 'الفضه' or text == 'امريكا الشماليه' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'القرش' or text == 'الثعلب' or text == 'الكلب' or text == 'للجرو' or text == 'العجل' or text == 'الحمار' or text == '3' or text == '5' or text == '6' or text == 'اوربا' or text == 'افريقيا' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'امريكا الشماليه' or text == 'اوربا' or text == 'الصاروخ' or text == 'المسدس' or text == 'الطائرات' or text == 'سيدات' or text == 'قوانص' or text == 'عوانس' or text == 'المكارم' or text == 'المبائم' or text == 'المعازم' or text == 'حرف الغاء' or text == 'حرف الواو' or text == 'حرف النون' or text == 'نحاس' or text == 'الماس' or text == 'حديد' or text == 'العمر' or text == 'ساعه' or text == 'الحذاء' or text == 'بئر' or text == 'نهر' or text == 'شلال' or text == 'ادم' or text == 'نوح' or text == 'عيسئ' or text == 'الاضافر' or text == 'الاسنان' or text == 'الدموع' or text == 'الاخلاق' or text == 'الضل' or text == 'حرف النون'  then
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if text ~= v then
Redis:del(TheRMAD.."GAME:CHER"..msg.chat_id)
merolua.sendText(msg.chat_id,msg.id,'✯︙اجابتك خاطئه للاسف ,')     
return false  
end
end
end
end
if text == 'رياضيات' and ChCheck(msg) then
if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
xxx = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = xxx[math.random(#xxx)]
print(name)
Redis:set(TheRMAD..'bot:bkbk6'..msg.chat_id,name)
name = string.gsub(name,'9','7 + 2 = ?') name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?') name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?') name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?') name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?') name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?') name = string.gsub(name,'5','12 + 1 - 8 = ?') name = string.gsub(name,'16','16 + 16 - 16 = ?')
merolua.sendText(msg_chat_id,msg_id,'✯︙ اكمل المعادله ،\n - {'..name..'} .')     
end 
end
if text == 'انكليزي' and ChCheck(msg) then
if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
yyy = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = yyy[math.random(#yyy)]
Redis:set(TheRMAD..'bot:bkbk7'..msg.chat_id,name)
name = string.gsub(name,'ذئب','Wolf') name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels') name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book') name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money') name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile') name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid') name = string.gsub(name,'صداقه','Friendchip')
name = string.gsub(name,'ذكي','Smart') 
merolua.sendText(msg_chat_id,msg_id,' ✯︙ما معنى كلمه {'..name..'} ، ')     
end
end
if text == 'روليت' and ChCheck(msg) then
if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
Redis:del(TheRMAD..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
Redis:del(TheRMAD..':List_Rolet:'..msg.chat_id)  
Redis:setex(TheRMAD..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id,3600,true)  
return merolua.sendText(msg_chat_id,msg_id, '*✯︙* حسننا لنلعب , ارسل عدد اللاعبين للروليت .',"md")
end
end
if text == 'نعم' and Redis:get(TheRMAD..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id) then
local list = Redis:smembers(TheRMAD..':List_Rolet:'..msg.chat_id) 
if #list == 1 then 
return merolua.sendText(msg_chat_id,msg_id,"✯︙لم يكتمل العدد الكلي للاعبين .!؟" )
elseif #list == 0 then 
return merolua.sendText(msg_chat_id,msg_id,"✯︙عذرا لم تقوم باضافه اي لاعب .؟!" )
end 
local UserName = list[math.random(#list)]
local data = merolua.searchPublicChat(UserName)
Redis:incrby(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 5)  
Redis:del(TheRMAD..':List_Rolet:'..msg.chat_id) 
Redis:del(TheRMAD..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id)
return merolua.sendText(msg_chat_id,msg_id,'✯︙تم اختيار الشخص الاتي\n✯︙صاحب الحظ {'..UserName..'}\n✯︙ربحت معنا 5 نقاط' )
end
if text == 'الاعبين' and ChCheck(msg) then
local list = Redis:smembers(TheRMAD..':List_Rolet:'..msg.chat_id) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return merolua.sendText(msg_chat_id,msg_id, '*✯︙* لا يوجد لاعبين هنا ' )
end 
for k, v in pairs(list) do 
Text = Text..k.."•  » [" ..v.."] »\n"  
end 
return Text
end
if text and text:match("^(%d+)$") and Redis:get(TheRMAD..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id) then  --// استقبال اللعبه الدمبله
if text == "1" then
Text = "*✯︙* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
Redis:set(TheRMAD..":Number_Add:"..msg.chat_id..msg.sender_id.user_id,text)  
Text = '✯︙تم بدء تسجيل اللسته \n✯︙يرجى ارسال المعرفات \n✯︙الفائز يحصل على (5) مجوهره\n✯︙عدد الاعبين المطلوبه { *'..text..'* } لاعب \n 🏹'
end
Redis:del(TheRMAD..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id)  
return merolua.sendText(msg_chat_id,msg_id,Text)    
end
if text and text:match('^(@[%a%d_]+)$') and Redis:get(TheRMAD..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) then    --// استقبال الاسماء
if Redis:sismember(TheRMAD..':List_Rolet:'..msg.chat_id,text) then
return merolua.sendText(msg_chat_id,msg_id,'*✯︙* المعرف {['..text..']} موجود اساسا' ,"md")
end
Redis:sadd(TheRMAD..':List_Rolet:'..msg.chat_id,text)
local CountAdd = Redis:get(TheRMAD..":Number_Add:"..msg.chat_id..msg.sender_id.user_id)
local CountAll = Redis:scard(TheRMAD..':List_Rolet:'..msg.chat_id)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
Redis:del(TheRMAD..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
Redis:setex(TheRMAD..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id,1400,true)  
return merolua.sendText(msg_chat_id,msg_id,"*✯︙*تم ادخال المعرف { ["..text.."] } \n✯**وتم اكتمال العدد الكلي \n✯︙هل انت مستعد ؟ اجب بـ {* نعم *}","md")
end 
return merolua.sendText(msg_chat_id,msg_id,"*✯︙* تم ادخال المعرف { ["..text.."] } \n✯︙تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n✯︙ارسل المعرف التالي ",'md')
end
if text == ''..(Redis:get(TheRMAD..'bot:bkbk6'..msg.chat_id) or 'لفاتع')..'' then
merolua.sendText(msg_chat_id,msg_id,'✯︙مبروك لقد ربحت ،\nللعب مره اخرى ارسل رياضيات . ',"md")   
Redis:del(TheRMAD..'bot:bkbk6'..msg.chat_id)  
Redis:incrby(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end 
if text == ''..(Redis:get(TheRMAD..'bot:bkbk7'..msg.chat_id) or 'لفاتع')..'' then
merolua.sendText(msg_chat_id,msg_id,'✯︙مبروك لقد ربحت ،\nللعب مره اخرى ارسل انكليزي . ')     
Redis:del(TheRMAD..'bot:bkbk7'..msg.chat_id)  
Redis:incrby(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end

if text == "المختلف" and ChCheck(msg) then


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
mktlf = {"??","☠","🐼","??","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","??‍🔬","👨‍💻","??‍🔧","??‍♀","??‍♂","🧝‍♂","🙍‍♂","🧖‍♂","??","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(TheRMAD.."Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹??????😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠??💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻??👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑??🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫??💫💫💫✨??💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨??🌨⛈??🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍??👩‍‍💻👩‍‍??👩‍‍💻👨‍💻??‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","??‍🔧👩‍🔧??‍🔧??‍🔧??‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍??","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂??‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀??‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂??‍♀🧝‍♀??‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️??‍♀️")
name = string.gsub(name,"👬","👭👭👭👭??👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍??‍👦👨‍👨‍??")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅????")
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يدز الاختلاف ~ {"..name.."}","md",true)  
end
end
if text == "امثله" and ChCheck(msg) then


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(TheRMAD.."Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يكمل المثل ~ {"..name.."}","md",true)  
end
end
if text == 'مسح رسائله' and ChCheck(msg) and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(TheRMAD..'Num:Message:User'..msg_chat_id..':'..Message_Reply.sender_id.user_id) 
return merolua.sendText(msg_chat_id,msg_id,"✯︙تم مسح رسائله ", "md")
end
if text == 'مسح نقاطه' and ChCheck(msg) and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(TheRMAD.."Num:Add:Games"..msg.chat_id..Message_Reply.sender_id.user_id)
return merolua.sendText(msg_chat_id,msg_id,"✯︙تم مسح نقاطه ", "md")
end
if text == 'مسح سحكاته' and ChCheck(msg) and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end


local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(TheRMAD..'Num:Message:Edit'..msg.chat_id..Message_Reply.sender_id.user_id)
return merolua.sendText(msg_chat_id,msg_id,"✯︙تم مسح سحكاته ", "md")
end

if text and text:match("^بيع نقاطي (%d+)$") and ChCheck(msg) then
local NumGame = text:match("^بيع نقاطي (%d+)$") 


if tonumber(NumGame) == tonumber(0) then
return merolua.sendText(msg_chat_id,msg_id,"\n*✯︙لا استطيع البيع اقل من 1 *","md",true)  
end
local NumberGame = Redis:get(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NumberGame) == tonumber(0) then
return merolua.sendText(msg_chat_id,msg_id,"✯︙ليس لديك جواهر من الالعاب \n✯︙اذا كنت تريد ربح النقاط \n✯︙ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙ليس لديك جواهر بهذا العدد \n✯︙لزيادة نقاطك في اللعبه \n✯︙ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (NumGame * 50)
Redis:decrby(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,NumGame)  
Redis:incrby(TheRMAD.."Num:Message:User"..msg.chat_id..":"..msg.sender_id.user_id,NumberGet)  
return merolua.sendText(msg_chat_id,msg_id,"✯︙تم خصم *~ { "..NumGame.." }* من نقاطك \n✯︙وتم اضافة* ~ { "..NumberGet.." } رساله الى رسائلك *","md",true)  
end 
if text and text:match("^اضف نقاط (%d+)$") and ChCheck(msg) and msg.reply_to_message_id ~= 0 and Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then


if not msg.TheBasics then
if Redis:get(TheRMAD.."lock_addnumber"..msg.chat_id) then
return merolua.sendText(msg.chat_id,msg.id,"✯︙عذرا الاضافات معطله")
end
end
if not msg.Managers then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(TheRMAD.."Num:Add:Games"..msg.chat_id..Message_Reply.sender_id.user_id, text:match("^اضف نقاط (%d+)$"))  
return merolua.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"✯︙تم اضافه له { "..text:match("^اضف نقاط (%d+)$").." } من النقاط").Reply,"md",true)  
end
if text and text:match("^اضف سحكات (%d+)$") and ChCheck(msg) and msg.reply_to_message_id ~= 0 and Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then


if not msg.TheBasics then
if Redis:get(TheRMAD.."lock_addnumber"..msg.chat_id) then
return merolua.sendText(msg.chat_id,msg.id,"عذرا الاضافات معطله")
end
end
if not msg.Managers then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(TheRMAD..'Num:Message:Edit'..msg.chat_id..Message_Reply.sender_id.user_id, text:match("^اضف سحكات (%d+)$"))  
return merolua.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"✯︙تم اضافه له { "..text:match("^اضف سحكات (%d+)$").." } من السحكات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and ChCheck(msg) and msg.reply_to_message_id ~= 0 and Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then


if not msg.TheBasics then
if Redis:get(TheRMAD.."lock_addnumber"..msg.chat_id) then
return merolua.sendText(msg.chat_id,msg.id,"✯︙عذرا الاضافات معطله")
end
end
if not msg.Managers then
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = merolua.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = merolua.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Merotele == "userTypeBot" then
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(TheRMAD.."Num:Message:User"..msg.chat_id..":"..Message_Reply.sender_id.user_id, text:match("^اضف رسائل (%d+)$"))  
return merolua.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"✯︙تم اضافه له { "..text:match("^اضف رسائل (%d+)$").." } من الرسائل").Reply,"md",true)  
end
if text == "نقاطي" and ChCheck(msg) then 


local Num = Redis:get(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if Num == 0 then 
return merolua.sendText(msg_chat_id,msg_id, "✯︙ليس لديك نقاط ارسل الالعاب وابدأ اللعب ","md",true)  
else
return merolua.sendText(msg_chat_id,msg_id, "✯︙عدد النقاط التي ربحتها *← "..Num.." *","md",true)  
end
if text == "علام" and ChCheck(msg) or text == "اعلام" and ChCheck(msg) then
if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
KlamSpeed = {
"أمريكا",
"فرنسا",
"روسيا",
"بريطانيا",
"اوكرانيا",
"الجزائر",
"العراق",
"لبنان",
"سوريا",
"ايطاليا",
"المانيا",
"كوريا الشمالية",
"الإمارات",
"السعودية",
"فلسطين",
"قطر",
"البحرين",
"بولندا",
"باكستان",
"المغرب",
"ليبيا",
"السودان",
"تركيا",
"الصين",
"استراليا",
"اليابان",
"ايران",
"أذربيجان",
"تونس",
"النمسا",
"الصومال",
"مصر",
"اليونان",
"إثيوبيا",
"الكويت",
"رومانيا",
"اسبانيا",
"موريتانيا",
"فنزويلا",
"جزر القمر",
"الاردن",
"عمان",
"السويد",
"المجر",
"سويسرا"
};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(TheRMAD.."Game:alam"..msg.chat_id,name)
name = string.gsub(name,"أمريكا","🇺🇸")
name = string.gsub(name,"فرنسا","🇫🇷")
name = string.gsub(name,"روسيا","🇷🇺")
name = string.gsub(name,"بريطانيا","🇬🇧")
name = string.gsub(name,"اوكرانيا","🇺🇦")
name = string.gsub(name,"الجزائر","🇩🇿")
name = string.gsub(name,"العراق","🇮??")
name = string.gsub(name,"لبنان","🇱🇧")
name = string.gsub(name,"سوريا","🇸🇾")
name = string.gsub(name,"ايطاليا","🇮🇹")
name = string.gsub(name,"المانيا","🇩🇪")
name = string.gsub(name,"كوريا الشمالية","🇰🇵")
name = string.gsub(name,"الإمارات","🇦🇪")
name = string.gsub(name,"السعودية","🇸🇦")
name = string.gsub(name,"فلسطين","🇵🇸")
name = string.gsub(name,"قطر","🇶🇦")
name = string.gsub(name,"البحرين","🇧🇭")
name = string.gsub(name,"بولندا","🇵🇱")
name = string.gsub(name,"باكستان","🇵🇰")
name = string.gsub(name,"المغرب","🇲🇦")
name = string.gsub(name,"ليبيا","🇱🇾")
name = string.gsub(name,"السودان","🇸🇩")
name = string.gsub(name,"تركيا","🇹🇷")
name = string.gsub(name,"الصين","🇨🇳")
name = string.gsub(name,"استراليا","🇦🇺")
name = string.gsub(name,"اليابان","🇯🇵")
name = string.gsub(name,"ايران","🇮🇷")
name = string.gsub(name,"أذربيجان","🇦🇿")
name = string.gsub(name,"تونس","🇹🇳")
name = string.gsub(name,"النمسا","🇦🇹")
name = string.gsub(name,"الصومال","🇸🇴")
name = string.gsub(name,"مصر","🇪🇬")
name = string.gsub(name,"اليونان","🇬🇷")
name = string.gsub(name,"إثيوبيا","🇪🇹")
name = string.gsub(name,"الكويت","🇰🇼")
name = string.gsub(name,"رومانيا","🇷🇴")
name = string.gsub(name,"اسبانيا","🇪🇸")
name = string.gsub(name,"موريتانيا","🇲🇷")
name = string.gsub(name,"فنزويلا","🇻🇪")
name = string.gsub(name,"جزر القمر","🇰🇲")
name = string.gsub(name,"الاردن","🇯🇴")
name = string.gsub(name,"عمان","🇴🇲")
name = string.gsub(name,"السويد","??🇪")
name = string.gsub(name,"المجر","🇭🇺")
name = string.gsub(name,"سويسرا","🇨🇭")
return merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يكتب اسم الدولة للعلم↫{ "..name.." }","md",true)  
end
end
if text == "منشن" and not Redis:get(TheRMAD.."mnshntezt"..msg.chat_id) then
local listmnshn = {
"@ل7 كله ننام سوا بفراش واحد ؟",
"@ل10 تشتريلي رانج ونفتر سوا ؟",
"@ل5 كله تحبني",
"@ل2 كله شلابس ؟",
"@ل2 كله اذا دخلت النار تجي وياي؟",
"@ل10 كله نصعد اتصال ٣ ساعات ؟",
"@ل7 كله اذا متت تجي بفاتحتي؟",
"@ل2 كله نتزوج",
"@ل6 كله همسة لطيفة",
"@ل10 كله ممكن علاقة جادة",
"@ل8 كله اسألني سؤال",
"@ل2 كله شلون تعرفت عليه؟",
"@ل8 كله نخلف جهال سوا ؟",
"@ل7 كله اذا جوعان تسويلي اكل",
"@ل4 كله شكد تحبني من 10",
"@ل8 كله غنيلي",
"@ل8 كله تعال اتنفسك صدكني مخنوك",
"@ل9 كله نطيني بوسه",
"@ل7 كله ننام سوا بفراش واحد ؟",
"@ل10 تشتريلي رانج ونفتر سوا ؟",
"@ل1 كله شلون تعرفت عليه؟",
"@ل9 كله اغنية لطيفة",
"@ل1 كله مشتاقلي؟",
"@ل3 كله كامش عليك فضيحه",
"@ل1 كله بشنو مستفاد منك ؟",
"@ل1 كله نرتبط بالسر",
"@ل2 كله بشنو مستفاد منك ؟",
"@ل3 كله يجي يوم ونتفارك؟",
"@ل3 كله اذا متت تجي بفاتحتي؟",
"@ل8 كله اهديلي اغنيه",
"@ل3 كله احجيلي سر عنك بهمسة ؟",
"@ل3 كله نسافر لباريس سوه",
"@ل4 كله حن واني احن",
"@ل10 كله كلشي بغيابك يختلف ؟",
"@ل3 تزوجني اخوك/اختك ؟",
"@ل10 كله سكرين لخاصك ؟",
"@ل6 كله هم تحس بيه؟"
}
namemnshn = listmnshn[math.random(#listmnshn)]
return merolua.sendText(msg_chat_id,msg_id,"✯︙"..namemnshn,"md",true)  
end
if text == "عواصم" and ChCheck(msg) or text == "عاصمه" and ChCheck(msg) then


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
KlamSpeed = {
"الولايات المتحدة",
"روسيا",
"الصين",
"المانيا",
"إيطاليا",
"فرنسا",
"بريطانيا",
"اليابان",
"كوريا الجنوبية",
"إندونيسيا",
"المانيا",
"مصر",
"إيران",
"كولومبيا",
"تايلاند",
"بنغلادش",
"السعودية",
"العراق",
"فيتنام",
"إسبانيا",
"كوريا الشمالية",
"أفغانستان",
"إثيوبيا",
"أوكرانيا",
"تايوان",
"أوزبكستان",
"أذربيجان",
"رومانيا",
"فنزويلا",
"السودان",
"المغرب",
"بولندا",
"لبنان",
"قطر",
"الاردن",
"البحرين",
"النمسا",
"الجزائر",
"اليمن",
"ماليزيا",
"ليبيا",
"التشيك",
"بلغاريا",
"أرمينا",
"السنغال",
"السويد",
"هولندا",
"اليونان",
"موريتانيا",
"كازاخستان",
"كرواتيا",
"الإمارات",
"أستراليا",
"الهند",
"سويسرا",
"فلسطين",
"تركيا"
};
name = KlamSpeed[math.random(#KlamSpeed)]
merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يكتب اسم عاصمه البلد↫{ "..name.." }","md",true)  
name = string.gsub(name,"الولايات المتحدة","واشنطن")
name = string.gsub(name,"روسيا","موسكو")
name = string.gsub(name,"الصين","بكين")
name = string.gsub(name,"المانيا","برلين")
name = string.gsub(name,"إيطاليا","روما")
name = string.gsub(name,"فرنسا","باريس")
name = string.gsub(name,"بريطانيا","لندن")
name = string.gsub(name,"اليابان","طوكيو")
name = string.gsub(name,"كوريا الجنوبية","سيؤول")
name = string.gsub(name,"إندونيسيا","جاكارتا")
name = string.gsub(name,"المانيا","برلين")
name = string.gsub(name,"مصر","القاهرة")
name = string.gsub(name,"إيران","طهران")
name = string.gsub(name,"كولومبيا","بوغوتا")
name = string.gsub(name,"تايلاند","بانكوك")
name = string.gsub(name,"بنغلادش","دكا")
name = string.gsub(name,"السعودية","الرياض")
name = string.gsub(name,"العراق","كريزي")
name = string.gsub(name,"فيتنام","هانوي")
name = string.gsub(name,"إسبانيا","مدريد")
name = string.gsub(name,"كوريا الشمالية","بيونغ يانغ")
name = string.gsub(name,"أفغانستان","كابول")
name = string.gsub(name,"إثيوبيا","اديس ابابا")
name = string.gsub(name,"أوكرانيا","كييف")
name = string.gsub(name,"تايوان","تايبيه")
name = string.gsub(name,"أوزبكستان","طشقند")
name = string.gsub(name,"أذربيجان","باكو")
name = string.gsub(name,"رومانيا","بوخاريست")
name = string.gsub(name,"فنزويلا","كاراكاس")
name = string.gsub(name,"السودان","الخرطوم")
name = string.gsub(name,"المغرب","الرباط")
name = string.gsub(name,"بولندا","وارسو")
name = string.gsub(name,"لبنان","بيروت")
name = string.gsub(name,"قطر","الدوحة")
name = string.gsub(name,"الاردن","عمان")
name = string.gsub(name,"البحرين","المنامة")
name = string.gsub(name,"النمسا","فيينا")
name = string.gsub(name,"الجزائر","الجزائر")
name = string.gsub(name,"اليمن","صنعاء")
name = string.gsub(name,"ماليزيا","كوالالمبور")
name = string.gsub(name,"ليبيا","طرابلس")
name = string.gsub(name,"التشيك","براغ")
name = string.gsub(name,"بلغاريا","صوفيا")
name = string.gsub(name,"أرمينا","يريفان")
name = string.gsub(name,"السنغال","داكار")
name = string.gsub(name,"السويد","ستوكهولم")
name = string.gsub(name,"هولندا","امستردام")
name = string.gsub(name,"اليونان","اثينا")
name = string.gsub(name,"موريتانيا","نواكشوط")
name = string.gsub(name,"كازاخستان","استاتا")
name = string.gsub(name,"كرواتيا","زغرب")
name = string.gsub(name,"الإمارات","ابو ظبي")
name = string.gsub(name,"أستراليا","كانبرا")
name = string.gsub(name,"الهند","نيودلهي")
name = string.gsub(name,"سويسرا","برن")
name = string.gsub(name,"فلسطين","القدس")
name = string.gsub(name,"تركيا","انقره")
Redis:set(TheRMAD.."Game:ausm"..msg.chat_id,name)
return false
end
end
if Redis:get(TheRMAD.."Game:klmaa"..msg.chat_id) then
if text == Redis:get(TheRMAD.."Game:klmaa"..msg.chat_id) then
Redis:del(TheRMAD.."Game:klmaa"..msg.chat_id)
Redis:incrby(TheRMAD.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return merolua.sendText(msg_chat_id,msg_id,"\n✯︙لقد فزت في اللعبه \n✯︙اللعب مره اخرى وارسل - كلمات","md",true)  
end
end 

if text == "كلمات" and ChCheck(msg) or text == "كلمه" and ChCheck(msg) then


if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
KlamSpeed = {
"مقاتل",

"سائق",

"غرفة",

"بطانية",

"طامس",

"شجاع",

"هاتف",

"تلكرام",

"مسافر",

"نعسان",

"بطيخ",

"عصبي",

"هادئ",

"عصير",

"دولمه",

"قدح",

"صباغ",

"كارتون",

"مدرسة",

"منزل",

"عاشق",

"فطور",

"مجموعة",

"اصدقاء",

"طلاب",

"فتيات",

"جميل",

"ذكي",

"فنان",

"نائم",

"دراجة",

"طائرة",

"صاروخ",

"الارض",

"الحلم",

"نبات",

"حيوان",

"انسان",

"دولة",

"حزين",

"سعيد",

"موظف",

"شركة",

"اتصال",

"حديقة",

"شارع",

"مستشفى",

"سيارة"

};
name = KlamSpeed[math.random(#KlamSpeed)]
merolua.sendText(msg_chat_id,msg_id,"✯︙اسرع واحد يكتب الكلمه↫{ "..name.." }","md",true)  
Redis:set(TheRMAD.."Game:klmaa"..msg.chat_id,name)
return false
end
end
if text == "اضف سؤال مقالات" and ChCheck(msg) then
if not msg.ControllerBot then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(TheRMAD.."makal:bots:set"..msg.sender_id.user_id..":"..msg.chat_id,true)
return merolua.sendText(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == "مسح سؤال مقالات" and ChCheck(msg) then
if not msg.ControllerBot then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(TheRMAD.."makal:bots:del"..msg.sender_id.user_id..":"..msg.chat_id,true)
return merolua.sendText(msg_chat_id,msg_id,"ارسل الي السؤال")
end
if text == "مسح المقالات" and ChCheck(msg) then
if not msg.ControllerBot then 
return merolua.sendText(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(TheRMAD.."makal:bots")
return merolua.sendText(msg_chat_id,msg_id,"تم مسح المقالات")
end
if text and text:match("^(.*)$") then
if Redis:get(TheRMAD.."makal:bots:del"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(TheRMAD.."makal:bots:del"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:srem(TheRMAD.."makal:bots", text)
return merolua.sendText(msg_chat_id,msg_id, '\n✯︙تم مسح السؤال بنجاح')
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheRMAD.."makal:bots:set"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(TheRMAD.."makal:bots:set"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:sadd(TheRMAD.."makal:bots", text)
return merolua.sendText(msg_chat_id,msg_id, '\nتم حفظ السؤال بنجاح')
end
end
if text == 'مقالات' and ChCheck(msg) then
if Redis:get(TheRMAD.."Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(TheRMAD.."Status:Games"..msg.chat_id) then
local list = {
"الممكن/والمستطاع*يقيم في/أحلام العاجز",

"الكلمة اللينة*تصريح/بالدخول*إلى القلوب",

" حاسبوا/أنفسكم*أولاً ثم/غيركم",

"زمان/أطفالكم*غير/زمانكم",

" من السهل*أن تصبح/عاقل بعد فوات*الأوان",

" فانظر*إليها بقلبك/وليس*بعينيك",

"خاف/الله*أينما/كنت",

"أحسن/لقول ما*نطق بالعدل/والحق",
 
"أن تحافظ على/رجولتك خير من*حفاظك على أموالك",

"أكثروا*الرزق/بالصدقة",

"غالبا*ماتصبح/البيضة/سلاحا",

"كن*عادلاً/قبل أن*تكون*كريماً",

"كلما أحب/الشخص*نفسه كلما*كره الناس",

"من يسخر/من المرض*هو من لا يشعر/بالألم.",

"يظن*الرجل أنه*حكيم/إذا قلت*حكمته.",

 "اللسان/ليس سلاح*لكنه/يقتل*القلب",

"أسد مفترس*أمام عينيك/خير من*ثعلب خائن وراء/ظهرك",

"لسان*لعاقل وراء قلبه*وقلب الأحمق/وراء لسانه",

"أحقر الناس*من لا يقدر*على/كتمان السر",

" جميع/لصفات*الحميدة*تتلخص/في العدل",

" أفضل/عناصر*العدل هي/محاسبة*النفس",

"لم يعرف*الناس العدل/إلا بوجود*الظلم",

"العدل*ميزان/الملك",

"سيف*العدالة*لا ينام/ولا*يسهو",

"لا تلجأ*إلى ظالم*لكي ينصرك/على ظالم، فتكون*فريسة/هما",

"تحدثوا مع*الناس/على حسب*عقولهم",

" لو أنصت*الجاهل/ما اختلف*الناس",

"إذا تم*العقل قل/الكلام",

" لا تعد/ما لا تستطيع*الوفاء*به",

" القليل من*الطعام*يجلب/النوم*المريح",

 
"كرم المفسد*رشوة/لجلب*المنفعة",

"يدوم*الحال/بالرضا*والصبر",

" تتفاقم*المحن/عندما تكثر*الفتن",

"ربما*انفرج/الامر إذا/ضاق",

"سامح*الناس/قبل أن*تسامح/نفسك",

"شر الناس*من*خاف/الناس/من شره",

"قلب*العاقل/صندوق*أسراره",

"ضربة*اللسان أسوأ/من طعنة*السيف",

"من/سار على*الدرب/وصل",

"الدهر*يومان*يوم لك/ويوم*عليك",
" لا تدع/عاطفتك*تخسرك/نفسك",

"كن*قويا/لأجل/نفسك",

"ما يستهلك*عقلك/يسيطر على/حياتك"
}
if #list ~= 0 then
quschen = list[math.random(#list)]
quschen1 = string.gsub(quschen,"-"," ")
quschen1 = string.gsub(quschen1,"*"," ")
quschen1 = string.gsub(quschen1,"•"," ")
quschen1 = string.gsub(quschen1,"_"," ")
quschen1 = string.gsub(quschen1,","," ")
quschen1 = string.gsub(quschen1,"/"," ")
print(quschen1)
merolua.sendText(msg_chat_id,msg_id,'['..quschen..']\n\n✯︙اكتبها بدون فواصل',"md")
Redis:set(TheRMAD.."makal:bots:qus"..msg.chat_id,quschen1)
Redis:setex(TheRMAD.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 60, true) 
end
end
end
if text == ""..(Redis:get(TheRMAD.."makal:bots:qus"..msg.chat_id) or '').."" then
local timemkall = Redis:ttl(TheRMAD.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
local timemkal = (60 - timemkall)
if tonumber(timemkal) == 1 then
merolua.sendText(msg_chat_id,msg_id,'  استمر ي وحش ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 2 then
merolua.sendText(msg_chat_id,msg_id,'  اكيد محد ينافسك ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 3 then
merolua.sendText(msg_chat_id,msg_id,'  اتوقع محد ينافسك ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 4 then
merolua.sendText(msg_chat_id,msg_id,'  مركب تيربو !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 5 then
merolua.sendText(msg_chat_id,msg_id, '  صح عليك !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 6 then
merolua.sendText(msg_chat_id,msg_id,'   صحيح !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 7 then
merolua.sendText(msg_chat_id,msg_id,'   شد حيلك ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 8 then
merolua.sendText(msg_chat_id,msg_id, '  عندك اسرع ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 9 then
merolua.sendText(msg_chat_id,msg_id,'   يجي ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 10 then
merolua.sendText(msg_chat_id,msg_id,'   كفو ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 11 then
merolua.sendText(msg_chat_id,msg_id,'   ماش !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 12 then
merolua.sendText(msg_chat_id,msg_id,'   مستوى مستوى !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 13 then
merolua.sendText(msg_chat_id,msg_id,'   تدرب ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 14 then
merolua.sendText(msg_chat_id,msg_id,'   مدري وش اقول ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 15 then
merolua.sendText(msg_chat_id,msg_id,'   بطه ! \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 16 then
merolua.sendText(msg_chat_id,msg_id,'   ي بطوط !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 17 then
merolua.sendText(msg_chat_id,msg_id,'   مافي اسرع  !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 18 then
merolua.sendText(msg_chat_id,msg_id,'   بكير  !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 19 then
merolua.sendText(msg_chat_id,msg_id,'   وش هذا !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 20 then
merolua.sendText(msg_chat_id,msg_id,'   الله يعينك !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 21 then
merolua.sendText(msg_chat_id,msg_id,'   كيبوردك يعلق ههههه  !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 22 then
merolua.sendText(msg_chat_id,msg_id,'   يبي لك تدريب  !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 23 then
merolua.sendText(msg_chat_id,msg_id,'   انت اخر واحد رسلت وش ذا !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 24 then
merolua.sendText(msg_chat_id,msg_id,'   ههههه بطى !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 25 then
merolua.sendText(msg_chat_id,msg_id,'   ابك وش العلم !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 26 then
merolua.sendText(msg_chat_id,msg_id,'  اخر مرا تلعب !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 27 then
merolua.sendText(msg_chat_id,msg_id,'   ي بطي !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 28 then
merolua.sendText(msg_chat_id,msg_id,'   ليه انت بطى يخوي !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 29 then
merolua.sendText(msg_chat_id,msg_id,'   تدبر زين بس  !  \n عدد الثواني {'..timemkal..'}')
elseif tonumber(timemkal) == 30 then
merolua.sendText(msg_chat_id,msg_id,'  مستوى بس !  \n عدد الثواني {'..timemkal..'}')
end
Redis:del(TheRMAD.."makal:bots:qus"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(TheRMAD.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
end
end

end
return {TheRMAD = reply}
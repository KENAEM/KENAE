--[[
BY : KENAE 
Channel Files : https://t.me/KENAE Files
]]
local function keko_KENAE (data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
https = require("ssl.https")
bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_keko[1])
JSON = (loadfile  "./libs/dkjson.lua")()
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = {ID = "TextParseModeMarkdown"}
  tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = 1,
  reply_markup_ = nil,
  input_message_content_ = {
  ID = "InputMessageText",
  text_ = text,
  disable_web_page_preview_ = disable_web_page_preview,
  clear_draft_ = 0,
  entities_ = {},
  parse_mode_ = TextParseMode,
  },
  }, dl_cb, nil)
  end
  function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('KENAE :'..bot_id..'admins:', user_id)  
local owner = database:sismember('KENAE :'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('KENAE :'..bot_id..'creator:'..chat_id, user_id)  
if owner then var = true
end if admin then
var = true end if creator then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local keko_add_sudo = redis:get('KENAE :'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end
local msg = data.message_
text = msg.content_.text_
if not database:get('KENAE :'..bot_id..'rep:mute'..msg.chat_id_) then
if text == 'هلو' then
moody = "• هَٰہۧـﮧﮧلْٰاَٰوٍّ໑اَٰتّٰ 🌝☄ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end

if text == 'كيناي' then
moody = "• نٍٰـعٍِّـﮧﮧمٍٰ تّٰفِٰـہضلْٰ 🍁🌛ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شلونكم' then
moody = "• تّٰمٍٰـﮧاَٰمٍٰ وٍّاَٰنٍٰتّٰـہهَٰہۧ 😽⚡️ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شلونك' then
moody = "• اَٰلْٰـحٌٰمٍٰـﮧﮧدِٰاَٰلْٰلْٰهَٰہۧ وٍّ୭اَٰنٍٰتّٰـهَٰہۧ 😼💛ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تمام' then
moody = "• دِٰوٍّ൭مٍٰ يَٰـﮧﮧاَٰرِٰبٌِٰ 😻🌪ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هلاو' then
moody = "• هَٰہۧـہ୪وٍّ୭اَٰتّٰ حٌٰبٌِٰـﮧيَٰ 🤗🌟ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😐' then
moody = "• شَُـبٌِٰيَٰـكٍٰ صُِـﮧﮧاَٰفِٰنٍٰ عٍِّ خّٰاَٰلْٰتّٰـہكٍٰ😹🖤ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هاي' then
moody = "• هَٰہۧـاَٰيَٰـﮧﮧاَٰتّٰ يَٰـرِٰوٍّحٌٰـہيَٰ 🙋🏼‍♂💙ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'بوت' then
moody = "• تّٰفِٰـضـﮧلْٰ حٌٰبٌِٰـہيَٰ 🌚💫ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اريد اكبل' then
moody = "• شَُـوٍّ໑فِٰلْٰيَٰ وٍّيَٰـاَٰكٍٰ حٌٰدِٰيَٰـہقٍٰهَٰہۧ وٍّدِٰاَٰيَٰـﮧحٌٰ رِٰسٌٍمٍٰـہيَٰ😾😹💜ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'لتزحف' then
moody = "• دِٰعٍِّـوٍّ໑فِٰهَٰہۧ زًَاَٰحٌٰـﮧفِٰ عٍِّ خّٰاَٰلْٰـتّٰكٍٰ خّٰـلْٰيَٰ يَٰسٌٍـہتّٰفِٰاَٰدِٰ😾🌈ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كلخرا' then
moody = "• خّٰـﮧرِٰاَٰ يَٰتّٰـہرِٰسٌٍ حٌٰلْٰكٍٰـﮧكٍٰ يَٰاَٰخّٰـﮧرِٰاَٰاَٰ💩ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'زاحف' then
moody = "• زًَاَٰحٌٰـﮧفِٰ عٍِّ اَٰخّٰتّٰـﮧكٍٰ؟ كٍٰضيَٰـﮧتّٰ عٍِّمٍٰرِٰكٍٰ جًِّرِٰجًِّـﮧفِٰ😾😹ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'دي' then
moody = "• خّٰلْٰيَٰنٍٰـﮧيَٰ اَٰحٌٰبٌِٰـﮧكٍٰ 😾ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'فرخ' then
moody = "• وٍّيَٰنٍٰـﮧهَٰہۧ؟ خّٰ اَٰحٌٰضـﮧرِٰهَٰہۧ 😾😹ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تعالي خاص' then
moody = "• اَٰهَٰہۧـﮧوٍّ໑ ضـﮧلْٰ ضـﮧلْٰ سٌٍـﮧاَٰحٌٰفِٰ كٍٰبٌِٰـﮧرِٰ طَُِمٍٰـہكٍٰ😗😂💚ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اكرهك' then
moody = "•دِٰيَٰلْٰـﮧهَٰہۧ شَُـﮧوٍّ୭نٍٰ اَٰطَُِيَٰـقٍٰكٍٰ نٍٰـيَٰ 🙎🏼‍♂🖤ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'احبك' then
moody = "•حٌٰبٌِٰيَٰبٌِٰـﮧيَٰ وٍّنٍٰـﮧيَٰ هَٰہۧــمٍٰ😻👅ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'باي' then
moody = "• وٍّيَٰـﮧنٍٰ رِٰاَٰيَٰـہحٌٰ خّٰلْٰيَٰنٍٰـﮧهَٰہۧ مٍٰتّٰوٍّنٍٰسٌٍيَٰـﮧنٍٰ🙁💔ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'واكف' then
moody = "• بٌِٰنٍٰلْٰخّٰـﮧرِٰاَٰ وٍّيَٰـﮧنٍٰ وٍّاَٰكٍٰـﮧفِٰ😐😒ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'وين المدير' then
moody = "• لْٰيَٰـﮧشَُ شَُتّٰـﮧرِٰيَٰدِٰ🤔ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'انجب' then
moody = "• صُِـﮧاَٰرِٰ سٌٍتّٰـﮧاَٰدِٰيَٰ🐸❤️ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'تحبني' then
moody = "• مٍٰـﮧاَٰدِٰرِٰيَٰ اَٰفِٰكٍٰـﮧرِٰ🙁😹ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🌚' then
moody = "• فِٰـﮧدِٰيَٰتّٰ صُِخّٰـﮧاَٰمٍٰكٍٰ🙊👄ֆ "
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙄' then
moody = "• نٍٰـہزًَلْٰ عٍِّيَٰـنٍٰكٍٰ عٍِّيَٰـﮧبٌِٰ🌚😹ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😒' then
moody = "• شَُبٌِٰيَٰـﮧكٍٰ كٍٰاَٰلْٰـﮧبٌِٰ خّٰلْٰقٍٰتّٰـﮧكٍٰ😟🐈ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😳' then
moody = "• هَٰہۧـاَٰ بٌِٰسٌٍ لْٰاَٰ شَُفِٰـﮧتّٰ عٍِّمٍٰتّٰـﮧكٍٰ اَٰلْٰعٍِّـﮧوٍّ໑بٌِٰهَٰہۧ😐😹ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙁' then
moody = "• تّٰعٍِّـﮧاَٰلْٰ اَٰشَُكٍٰيَٰلْٰـﮧيَٰ هَٰہۧمٍٰوٍّمٍٰـﮧكٍٰ لْٰيَٰـشَُ • ضاَٰيَٰـﮧجًِّ🙁💔ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🚶💔' then
moody = "• تّٰعٍِّـﮧاَٰلْٰ اَٰشَُكٍٰيَٰلْٰـﮧيَٰ هَٰہۧمٍٰوٍّمٍٰـﮧكٍٰ لْٰيَٰـشَُ • ضاَٰيَٰـﮧجًِّ🙁💔ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🙂' then
moody = "• ثِْْكٍٰيَٰـﮧلْٰ نٍٰهَٰہۧنٍٰهَٰہۧنٍٰهَٰہۧنٍٰهَٰہۧ🐛ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '🌝' then
moody = "• مٍٰنٍٰـﮧوٍّ໑رِٰ حٌٰبٌِٰـعٍِّمٍٰـہرِٰيَٰ😽💚ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباحو' then
moody = "• صُِبٌِٰاَٰحٌٰـہكٍٰ عٍِّسٌٍـہلْٰ يَٰعٍِّسٌٍـﮧلْٰ😼🤞ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'صباح الخير' then
moody = "• صُِبٌِٰاَٰحٌٰـہكٍٰ عٍِّسٌٍـہلْٰ يَٰعٍِّسٌٍـﮧلْٰ😼🤞ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كفو' then
moody = "• اَٰهَٰہۧ كٍٰفِٰـﮧوٍّ໑ يَٰبٌِٰہوٍّ୭ اَٰلْٰضـلْٰہوٍّ୭عٍِّ😹ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😌' then
moody = "• اَٰلْٰمٍٰطَُِلْٰـﮧوٍّ໑بٌِٰ !😕💞ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اها' then
moody = "• يَٰبٌِٰ قٍٰاَٰبٌِٰـﮧلْٰ اَٰغِِٰشَُـﮧكٍٰ شَُسٌٍاَٰلْٰفِٰـﮧهَٰہۧ حٌٰبٌِٰ😐🌝ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شسمج' then
moody = "• اَٰسٌٍـمٍٰهَٰہۧـﮧاَٰ جًِّعٍِّجًِّـﮧوٍّ໑عٍِّهَٰہۧ😹👊ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شسمك' then
moody = "• اَٰسٌٍمٍٰـﮧهَٰہۧ عٍِّبٌِٰـﮧوٍّ໑سٌٍيَٰ لْٰـوٍّ૭سٌٍہيَٰ😾😹💛ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شوف' then
moody = "• شَُشَُـﮧﮧوٍّ໑فِٰ 🌝🌝ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'مساء الخير' then
moody = "• مٍٰسٌٍـﮧاَٰء اَٰلْٰحٌٰـﮧبٌِٰ يَٰحٌٰہبٌِٰحٌٰہبٌِٰ🌛🔥ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'المدرسه' then
moody = "• لْٰتّٰجًِّيَٰـﮧبٌِٰ اَٰسٌٍمٍٰـﮧهَٰہۧ لْٰاَٰ اَٰطَُِـﮧرِٰدِٰكٍٰ🌞✨ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'منو ديحذف رسائلي' then
moody = "• خّٰـﮧاَٰلْٰتّٰـہكٍٰ 🌚ֆ🌝"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'البوت واكف' then
moody = "• لْٰجًِّـﮧذَْبٌِٰ حٌٰبٌِٰـہيَٰ 🌞⚡️ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'غلس' then
moody = "• وٍّ໑كٍٰ بٌِٰـﮧسٌٍ سٌٍـﮧوٍّ୭لْٰفِٰلْٰيَٰ اَٰلْٰسٌٍـﮧاَٰلْٰفِٰهَٰہۧ بٌِٰعٍِّـﮧدِٰيَٰنٍٰ🌝🦅ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'حارة' then
moody = "• تّٰسٌٍـہمٍٰطَُِ سٌٍمٍٰـﮧطَُِ غِِٰيَٰـﮧرِٰ يَٰرِٰحٌٰمٍٰنٍٰـﮧهَٰہۧ اَٰلْٰاَٰعٍِّبٌِٰـاَٰدِٰيَٰ وٍّيَٰنٍٰـہطَُِيَٰ عٍِّطَُِلْٰـﮧهَٰہۧ 😾💔ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'هههه' then
moody = "• نٍٰشَُـﮧاَٰلْٰلْٰهَٰہۧ دِٰاَٰيَٰمٍٰـﮧهَٰہۧ💆🏻‍♂💘ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'ههههه' then
moody = "• نٍٰشَُـﮧاَٰلْٰلْٰهَٰہۧ دِٰاَٰيَٰمٍٰـﮧهَٰہۧ💆🏻‍♂💘ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == '😹' then
moody = "• نٍٰشَُـﮧاَٰلْٰلْٰهَٰہۧ دِٰاَٰيَٰمٍٰـﮧهَٰہۧ💆🏻‍♂💘ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'وين' then
moody = "• بٌِٰـﮧﮧأرِٰض اَٰلْٰلْٰهَٰہۧ اَٰلْٰـہوٍّاَٰسٌٍعٍِّـﮧهَٰہۧ😽💜ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'كافي لغوة' then
moody = "• كٍٰـيَٰفِٰنٍٰـﮧهَٰہۧ نٍٰتّٰـﮧهَٰہۧ شَُعٍِّـہلْٰيَٰكٍٰ😼👊ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'نايمين' then
moody = "• اَٰنٍٰـﮧيَٰ سٌٍهَٰہۧـہرِٰاَٰنٍٰ اَٰحٌٰرِٰسٌٍـﮧكٍٰمٍٰ مٍٰـﮧטּ تّٰـرِٰاَٰمٍٰـﮧبٌِٰ😿😹🙌ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اكو احد' then
moody = "• يَٰ عٍِّيَٰـنٍٰـﮧيَٰ اَٰنٍٰـہيَٰ مٍٰـوٍّ૭جًِّـﮧوٍّدِٰ🌝✨ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'فديت' then
moody = "•فِٰـﮧﮧدِٰاَٰكٍٰ/جًِّ ثِْْـﮧوٍّ୪لْٰاَٰنٍٰ اَٰلْٰكٍٰـرِٰوٍّ୭بٌِٰ😟😂💚ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'شكو' then
moody = "• كٍٰلْٰـشَُـﮧﮧيَٰ مٍٰـہاَٰكٍٰـﮧوٍّ اَٰرِٰجًِّـعٍِّ نٍٰـاَٰمٍٰ🐼🌩ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'اوف' then
moody = "• هَٰہۧـﮧﮧاَٰيَٰ اَٰوٍّفِٰ مٍٰنٍٰ يَٰـاَٰ نٍٰـوٍّ୭عٍِّ صُِـاَٰرِٰتّٰ اَٰلْٰـسٌٍاَٰلْٰفِٰهَٰہۧ مٍٰتّٰـنٍٰعٍِّرِٰفِٰ🌚🌙ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'احبج' then
moody = "•جًِّـﮧذَْاَٰبٌِٰ يَٰـرِٰيَٰدِٰ يَٰطَُِـہكٍٰجًِّ😹🌞⚡️ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end
if text == 'انتة منو' then
moody = "• اَٰنٍٰـﮧﮧيَٰ بٌِٰـوٍّ໑تّٰ💨🌝ֆ"
send(msg.chat_id_, msg.id_, 1, moody, 1, 'md')
end

end
if  (text and text == 'تفعيل ردود البوت') and is_owner(msg) then
    if not database:get('KENAE :'..bot_id..'rep:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ردود البوت بالفعل تم تفعيلها', 1, 'md')
    else
  send(msg.chat_id_, msg.id_, 1, '☑┇تم تفعيل ردود البوت', 1, 'md')
   database:del('KENAE :'..bot_id..'rep:mute'..msg.chat_id_)
  end
  end
  if(text and text == 'تعطيل ردود البوت') and is_owner(msg) then
    if database:get('KENAE :'..bot_id..'rep:mute'..msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '☑┇ردود البوت بالفعل تم تعطيلها', 1, 'md')
  else
  send(msg.chat_id_, msg.id_, 1, '☑┇تم تعطيل ردود البوت', 1, 'md')
    database:set('KENAE :'..bot_id..'rep:mute'..msg.chat_id_,true)
  end
    end

end
return {
	keko_KENAE = keko_KENAE ,
}
--[[
BY : KENAE 
Channel Files : https://t.me/KENAE Files
]]
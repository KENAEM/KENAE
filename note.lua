--[[
BY : KENAE
Channel Files :https://telegram.me/KENAEFiles
]]

local function keko_KENAE(data)
    JSON = (loadfile  "./libs/dkjson.lua")()
    local msg = data.message_
    URL = require('socket.url')
local text = msg.content_.text_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    HTTPS = require("ssl.https")
    bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
    bot_id = tonumber(bot_id_keko[1])
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
function is_mod(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('KENAE:'..bot_id..'mods:'..chat_id, user_id)
local admin = database:sismember('KENAE:'..bot_id..'admins:', user_id)
local owner = database:sismember('KENAE:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('KENAE:'..bot_id..'creator:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('KENAE:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end

function is_vip(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('KENAE:'..bot_id..'mods:'..chat_id, user_id)
local admin = database:sismember('KENAE:'..bot_id..'admins:', user_id)
local owner = database:sismember('KENAE:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('KENAE:'..bot_id..'creator:'..chat_id, user_id)
local vip = database:sismember('KENAE:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true end end
local keko_add_sudo = redis:get('KENAE:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var end

function ck_mod(user_id,chat_id)
local var = false
local mod = database:sismember('KENAE:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('KENAE:'..bot_id..'admins:', user_id)  
local owner = database:sismember('KENAE:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('KENAE:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('KENAE:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local keko_add_sudo = redis:get('KENAE:'..bot_id..'sudoo'..user_id..'')
if keko_add_sudo then var = true end
return var
end

local function getMessage(chat_id, message_id,cb)
    tdcli_function ({
  ID = "GetMessage",
  chat_id_ = chat_id,
  message_id_ = message_id
    }, cb, nil)
end

function resolve_username(username,cb)
  tdcli_function ({
ID = "SearchPublicChat",
username_ = username
  }, cb, nil)
end
if (not is_mod(msg) and not is_vip(msg)) then
local text = msg.content_.text_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if database:get("lock_chat.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end 
end
end
if msg.content_.ID == "MessageSticker" then
if database:get("lock_stecker.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessageContact" then
if database:get("lock_contect.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark.note:KENAE"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
end
end
end
 if text then 
  if  text:match("^المقيدين$") and is_mod(msg) then
  local hash =   'KENAE:'..bot_id..'res:'..msg.chat_id_
    local list = database:smembers(hash)
    text = "👥┇قائمة المقيدين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
    local user_info = database:hgetall('KENAE'..bot_id.."user:"..v)
  if user_info and user_info.username then
  local username = user_info.username
  text = text.."*|"..k.."|*~⪼(@"..username..")\n"
  else
  text = text.."*|"..k.."|*~⪼(`"..v.."`)\n"
  end
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖️┇لايوجد اعضاء مقيدين"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end

  if  text:match("^مسح المقيدين$") and is_mod(msg) then
  local hash =   'KENAE:'..bot_id..'res:'..msg.chat_id_
    local list = database:smembers(hash) 
    for k,v in pairs(list) do database:del('KENAE:'..bot_id..'res:'..msg.chat_id_) 
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. v .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
end
  send(msg.chat_id_, msg.id_, 1, '☑️┇تم مسح قائمه المقيدين', 1, 'md')
  end  

   function tsX000(value,msg,text)
if value == "lock" then
function keko333(extra,result,success)
info = '💬┇بواسطه ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'KENAEteam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
 end
getUser(msg.sender_user_id_, keko333)
end
if value == "prore" then
function get_KENAEX(KENAEx1,KENAEx2,KENAEx3)
local id_KENAEx = KENAEx2.sender_user_id_
function keko333(extra,result,success)
info = '👤┇العضو ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'KENAEteam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
 end
getUser(id_KENAEx, keko333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_KENAEX)
end
if value ~= "prore" and value~= "lock"  then
function keko333(extra,result,success)
info = '👤┇العضو ~⪼ ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'KENAEteam')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, keko333)
end
end
  
  if text:match("^تقيد$")  and is_mod(msg) and msg.reply_to_message_id_ then
  function res_by_reply(extra, result, success)
    local hash =  'KENAE:'..bot_id..'res:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع تقييد \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
  if database:sismember(hash, result.sender_user_id_) then
  tsX000("prore",msg,'☑️┇بالفعل تم تقييده')
  else
  HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "")
  database:sadd(hash, result.sender_user_id_)
  tsX000("prore",msg,'☑️┇تم تقييده')
  end
  end
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,res_by_reply)
  end
  if text:match("^تقيد @(.*)$") and is_mod(msg) then
  local res = {string.match(text, "^(تقيد) @(.*)$")}
  function res_by_username(extra, result, success)
    if result.id_ then
    if ck_mod(result.id_, msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع تقييد \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
  HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "")
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, result.id_)
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(res[2] or 'KENAEteam')..')\n☑️┇تم تقييده'
  end
  else
  texts = '✖️┇خطاء'
  end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(res[2],res_by_username)
  end
  if text:match("^تقيد (%d+)$") and is_mod(msg) then
  local res = {string.match(text, "^(تقيد) (%d+)$")}
      if ck_mod(apba[2], msg.chat_id_) then
  send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع تقييد \n🔘┇(مدراء،ادمنيه،اعضاء مميزين)البوت', 1, 'md')
  else
  HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. res[2] .. "")
  database:sadd('KENAE:'..bot_id..'res:'..msg.chat_id_, res[2])
  tsX000(res[2],msg,"☑️┇تم تقييده")
  end
  end
  if text:match("^الغاء تقيد$") and is_mod(msg) and msg.reply_to_message_id_ then
  function res_by_reply(extra, result, success)
  local hash =  'KENAE:'..bot_id..'res:'..msg.chat_id_
  if not database:sismember(hash, result.sender_user_id_) then
    tsX000("prore",msg,"☑️┇ بالفعل تم الغاء تقييده")
  else
  HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
  database:srem(hash, result.sender_user_id_)
      tsX000("prore",msg,"☑️┇ تم الغاء تقييده")
  end
  end
  getMessage(msg.chat_id_, msg.reply_to_message_id_,res_by_reply)
  end
  if text:match("^الغاء تقيد @(.*)$") and is_mod(msg) then
  local hash =  'KENAE:'..bot_id..'res:'..msg.chat_id_
  local res = {string.match(text, "^(الغاء تقيد) @(.*)$")}
  function res_by_username(extra, result, success)
  if result.id_ then
  HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
  database:srem(hash, result.id_)
  texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(res[2] or 'KENAEteam')..')\n☑️┇تم الغاء تقييده'
  else
  texts = '✖️┇خطاء'
  end
  send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
  end
  resolve_username(res[2],res_by_username)
  end
  if text:match("^الغاء تقيد (%d+)$") and is_mod(msg) then
  local hash =  'KENAE:'..bot_id..'res:'..msg.chat_id_
  local res = {string.match(text, "^(الغاء تقيد) (%d+)$")}
  HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. res[2] .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
  database:srem(hash, res[2])
    tsX000(res[2],msg,"☑️┇ تم الغاء تقييده")
  end

if is_mod(msg) then
if (text == "قفل التاك بالتقيد") then
  local tsX_o = database:get("lock_tag.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل التاك بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل التاك بالتقييد")
  database:set("lock_tag.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الشارحه بالتقيد") then
  local tsX_o = database:get("lock_sarha.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الشارحه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الشارحه بالتقييد")
  database:set("lock_sarha.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل المتحركه بالتقيد") then
  local tsX_o = database:get("lock_gif.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل المتحركه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل المتحركه بالتقييد")
  database:set("lock_gif.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الملفات بالتقيد") then
  local tsX_o = database:get("lock_files.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الملفات بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الملفات بالتقييد")
  database:set("lock_files.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الماركدون بالتقيد") then
  local tsX_o = database:get("lock_mark.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الماكدون بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الماركدون بالتقييد")
  database:set("lock_mark.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الصور بالتقيد") then
  local tsX_o = database:get("lock_photo.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الصور بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الصور بالتقييد")
  database:set("lock_photo.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الملصقات بالتقيد") then
  local tsX_o = database:get("lock_stecker.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الملصقات بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الملصقات بالتقييد")
  database:set("lock_stecker.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الفيديو بالتقيد") then
  local tsX_o = database:get("lock_video.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الفيديو بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الفيديو بالتقييد")
  database:set("lock_video.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الانلاين بالتقيد") then
  local tsX_o = database:get("lock_inline.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الانلاين بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الانلاين بالتقييد")
  database:set("lock_inline.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الدردشه بالتقيد") then
  local tsX_o = database:get("lock_chat.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الدردشه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الدردشه بالتقييد")
  database:set("lock_chat.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل التوجيه بالتقيد") then
  local tsX_o = database:get("lock_fwd.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل التوجيه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل التوجيه بالتقييد")
  database:set("lock_fwd.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الاغاني بالتقيد") then
  local tsX_o = database:get("lock_audeo.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الاغاني بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الاغاني بالتقييد")
  database:set("lock_audeo.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الصوت بالتقيد") then
  local tsX_o = database:get("lock_voice.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الصوت بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الصوت بالتقييد")
  database:set("lock_voice.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الجهات بالتقيد") then
  local tsX_o = database:get("lock_contact.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الجهات بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الجهات بالتقييد")
  database:set("lock_contact.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل العربيه بالتقيد") then
  local tsX_o = database:get("lock_ar.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
    tsX000("lock",msg,"☑️┇بالفعل تم قفل العربيه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل العربيه بالتقييد")
  database:set("lock_ar.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الانكليزيه بالتقيد") then
  local tsX_o = database:get("lock_en.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل الانكليزيه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الانكليزيه بالتقييد")
  database:set("lock_en.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل الروابط بالتقيد") then
  local tsX_o = database:get("lock_link.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
    tsX000("lock",msg,"☑️┇بالفعل تم قفل الروابط بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل الروابط بالتقييد")
  database:set("lock_link.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل المعرف بالتقيد") then
  local tsX_o = database:get("lock_username.note:KENAE"..msg.chat_id_..bot_id)
  if tsX_o then
   tsX000("lock",msg,"☑️┇بالفعل تم قفل المعرف بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل المعرف بالتقييد")
  database:set("lock_username.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "قفل بصمه الفيديو بالتقيد") then
  local tsX_o = database:get("lock_note.note:"..msg.chat_id_..bot_id)
  if tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم قفل بصمه الفيديو بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم قفل بصمه الفيديو بالتقييد")
  database:set("lock_note.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
end
if is_mod(msg) then
  if (text == "فتح التاك بالتقيد") then
  local tsX_o = database:get("lock_tag.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح التاك بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح التاك بالتقييد")
  database:del("lock_tag.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الشارحه بالتقيد") then
  local tsX_o = database:get("lock_sarha.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الشارحه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الشارحه بالتقييد")
  database:del("lock_sarha.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح المتحركه بالتقيد") then
  local tsX_o = database:get("lock_gif.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
   tsX000("lock",msg,"☑️┇بالفعل تم فتح المتحركه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح المتحركه بالتقييد")
  database:del("lock_gif.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الملفات بالتقيد") then
  local tsX_o = database:get("lock_files.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الملفات بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الملفات بالتقييد")
  database:del("lock_files.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الماركدون بالتقيد") then
  local tsX_o = database:get("lock_mark.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الماركدون بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الماركدون بالتقييد")
  database:del("lock_mark.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الصور بالتقيد") then
  local tsX_o = database:get("lock_photo.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الصور بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الصور بالتقييد")
  database:del("lock_photo.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الملصقات بالتقيد") then
  local tsX_o = database:get("lock_stecker.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الملصقات بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الملصقات بالتقييد")
  database:del("lock_stecker.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الفيديو بالتقيد") then
  local tsX_o = database:get("lock_video.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الفيديو بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الفيديو بالتقييد")
  database:del("lock_video.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الانلاين بالتقيد") then
  local tsX_o = database:get("lock_inline.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الانلاين بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الانلاين بالتقييد")
  database:del("lock_inline.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الدردشه بالتقيد") then
  local tsX_o = database:get("lock_chat.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الدردشه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الدردشه بالتقييد")
  database:del("lock_chat.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح التوجيه بالتقيد") then
  local tsX_o = database:get("lock_fwd.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح التوجيه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح التوجيه بالتقييد")
  database:del("lock_fwd.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الاغاني بالتقيد") then
  local tsX_o = database:get("lock_audeo.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الاغاني بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الاغاني بالتقييد")
  database:del("lock_audeo.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الصوت بالتقيد") then
  local tsX_o = database:get("lock_voice.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الصوت بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الصوت بالتقييد")
  database:del("lock_voice.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الجهات بالتقيد") then
  local tsX_o = database:get("lock_contact.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الجهات بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الجهات بالتقييد")
  database:del("lock_contact.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح العربيه بالتقيد") then
  local tsX_o = database:get("lock_ar.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح العربيه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح العربيه بالتقييد")
  database:del("lock_ar.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الانكليزيه بالتقيد") then
  local tsX_o = database:get("lock_en.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الانكليزيه بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الانكليزيه بالتقييد")
  database:del("lock_en.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح المعرف بالتقيد") then
  local tsX_o = database:get("lock_username.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح المعرف بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح المعرف بالتقييد")
  database:del("lock_username.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح بصمه الفيديو بالتقيد") then
  local tsX_o = database:get("lock_note.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح بصمه الفيديو بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح بصمه الفيديو بالتقييد")
  database:del("lock_note.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  if (text == "فتح الروابط بالتقيد") then
  local tsX_o = database:get("lock_link.note:KENAE"..msg.chat_id_..bot_id)
  if not tsX_o then
  tsX000("lock",msg,"☑️┇بالفعل تم فتح الروابط بالتقييد")
  else
  tsX000("lock",msg,"☑️┇تم فتح الروابط بالتقييد")
  database:del("lock_link.note:KENAE"..msg.chat_id_..bot_id,"ok")
  end
  end
  end
       if text:match("^اعدادات التقيد$") and is_mod(msg) then
       if database:get("lock_chat.note:KENAE"..msg.chat_id_..bot_id) then
       mute_text = '✔┇'
       else
       mute_text = '✖┇'
       end
       ------------
       if database:get("lock_photo.note:KENAE"..msg.chat_id_..bot_id) then
       mute_photo = '✔┇'
       else
       mute_photo = '✖┇'
       end
       ------------
       if database:get("lock_video.note:KENAE"..msg.chat_id_..bot_id) then
       mute_video = '✔┇'
       else
       mute_video = '✖┇'
       end
       if database:get("lock_note.note:KENAE"..msg.chat_id_..bot_id) then
       mute_note = '✔┇'
       else
       mute_note = '✖┇'
       end
       ------------
       if database:get("lock_gif.note:KENAE"..msg.chat_id_..bot_id) then
       mute_gifs = '✔┇'
       else
       mute_gifs = '✖┇'
       end
       ------------
       if database:get("lock_audeo.note:KENAE"..msg.chat_id_..bot_id) then
       mute_music = '✔┇'
       else
       mute_music = '✖┇'
       end
       ------------
       if database:get("lock_inline.note:KENAE"..msg.chat_id_..bot_id) then
       mute_in = '✔┇'
       else
       mute_in = '✖┇'
       end
       ------------
       if database:get("lock_voice.note:KENAE"..msg.chat_id_..bot_id) then
       mute_voice = '✔┇'
       else
       mute_voice = '✖┇'
       end
       ------------
       if database:get("lock_link.note:KENAE"..msg.chat_id_..bot_id) then
       mute_links = '✔┇'
       else
       mute_links = '✖┇'
       end
   ------------
       if database:get("lock_files.note:KENAE"..msg.chat_id_..bot_id) then
       mute_doc = '✔┇'
       else
       mute_doc = '✖┇'
     end
       if database:get("lock_mark.note:KENAE"..msg.chat_id_..bot_id) then
       mute_mdd = '✔┇'
       else
       mute_mdd = '✖┇'
       end
   ------------
       if database:get("lock_stecker.note:KENAE"..msg.chat_id_..bot_id) then
       lock_sticker = '✔┇'
       else
       lock_sticker = '✖┇'
       end
       ------------
   if database:get("lock_tag.note:KENAE"..msg.chat_id_..bot_id) then
       lock_htag = '✔┇'
       else
       lock_htag = '✖┇'
     end

  if database:get("lock_sarha.note:KENAE"..msg.chat_id_..bot_id) then
       lock_cmd = '✔┇'
       else
       lock_cmd = '✖┇'
       end
       ------------
   if database:get("lock_username.note:KENAE"..msg.chat_id_..bot_id) then
       lock_tag = '✔┇'
       else
       lock_tag = '✖┇'
       end
       ------------
  if database:get("lock_contact.note:KENAE"..msg.chat_id_..bot_id) then
       lock_contact = '✔┇'
       else
       lock_contact = '✖┇'
       end
       ------------
   if database:get("lock_en.note:KENAE"..msg.chat_id_..bot_id) then
       lock_english = '✔┇'
       else
       lock_english = '✖┇'
       end
       ------------
   if database:get("lock_ar.note:KENAE"..msg.chat_id_..bot_id) then
       lock_arabic = '✔┇'
       else
       lock_arabic = '✖┇'
     end
       ------------
   if database:get("lock_fwd.note:KENAE"..msg.chat_id_..bot_id) then
       lock_forward = '✔┇'
       else
       lock_forward = '✖┇'
     end
local ex = database:ttl( 'KENAE:'..bot_id.."charge:"..msg.chat_id_)
  if ex == -1 then
  exp_dat = 'لا نهائي'
  else
  exp_dat = math.floor(ex / 86400) + 1
        end
     ------------
     local TXT = "🗑┇اعدادات المجموعه بالتقييد\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇~⪼ مفعل\n✖┇~⪼ معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
  ..mute_links.." الروابط".."\n"
  ..lock_english.." اللغه الانكليزيه".."\n"
  ..lock_forward.." اعاده التوجيه".."\n"
  ..lock_arabic.." اللغه العربيه".."\n"
  ..lock_htag.." التاكات".."\n"
  ..lock_tag.." المعرفات".."\n"
  ..mute_text.." الدردشه".."\n"
  ..mute_gifs.." الصور المتحركه".."\n"
  ..mute_voice.." الصوتيات".."\n\n"
  ..mute_music.." الاغاني".."\n"
  ..mute_in.." الانلاين".."\n"
  ..lock_sticker.." الملصقات".."\n"
  ..lock_contact.." جهات الاتصال".."\n"
  ..mute_video.." الفيديوهات".."\n"
  ..lock_cmd.." الشارحه".."\n"
  ..mute_mdd.." الماركدون".."\n"
  ..mute_doc.." الملفات".."\n"
  ..mute_photo.." الصور".."\n"
  ..mute_note.." بصمه الفيديو".."\n"
  .."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉  \n"
  ..'🔗┇انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
   send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
    end
end

  if (text and text == 'تغير امر اوامر التقيد') or (text and text == 'تغير امر اوامر التقييد') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
  send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
  redis:set('KENAE:'..bot_id..'hres1'..msg.sender_user_id_..'', 'msg')
    return false end
  local keko2 = redis:get('KENAE:'..bot_id..'hres1'..msg.sender_user_id_..'')
  if keko2 == 'msg' then
  if text:match("^(.*)$") then
  send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
  redis:set('KENAE:'..bot_id..'hres1'..msg.sender_user_id_..'', 'no')
  redis:set('KENAE:'..bot_id..'hres', text)
  send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
    return false end
   end
     if text == "اوامر التقيد" or text == "اوامر التقييد" and is_mod(msg) then
  local hres = redis:get('KENAE:'..bot_id..'hres')
     local text =  [[
📮┇ اوامر حمايه المجموعه بالتقييد
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔒┇قفل ~⪼ لقفل امر
  🔓┇فتح ~⪼ لفتح امر
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🔐┇الروابط بالتقيد
  🔐┇المعرف بالتقيد
  🔐┇التاك بالتقيد
  🔐┇الشارحه بالتقيد
  🔐┇المتحركه بالتقيد
  🔐┇الملفات بالتقيد
  🔐┇الصور بالتقيد
  🔐┇الملصقات بالتقيد
  🔐┇الفيديو بالتقيد
  
  🔐┇الانلاين بالتقيد
  🔐┇الدردشه بالتقيد
  🔐┇التوجيه بالتقيد
  🔐┇الاغاني بالتقيد
  🔐┇الصوت بالتقيد
  🔐┇الجهات بالتقيد
  🔐┇الماركدون بالتقيد
  🔐┇العربيه بالتقيد
  🔐┇الانكليزية بالتقيد
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  🚹┇تقيد
  🚹┇الغاء تقيد
  🚹┇المقيدين
  🚹┇مسح المقيدين
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  📡┇Ch ~⪼ @KENAE
]]
  send(msg.chat_id_, msg.id_, 1, (hres or text), 1, 'md')
     end

end
return {
    keko_KENAE = keko_KENAE,
}
--[[
 BY : KENAE,
 Channel Files : https://telegram.me/KENAEFiles
]]
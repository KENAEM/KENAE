sudo_KENAE = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local KENAE_dev = io.open("KENAE_online.lua")
if KENAE_dev then
KENAE_on = {string.match(KENAE_dev:read('*all'), "^(.*)/(%d+)")}
local KENAE_file = io.open("sudo.lua", 'w')
KENAE_file:write("token = '" ..KENAE_on[1].."'\n\nsudo_add = "..KENAE_on[2].."" )
KENAE_file:close()
https.request("https://api.telegram.org/bot"..KENAE_on[1].."/sendMessage?chat_id="..KENAE_on[2].."&text=Bot_KENAE_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf KENAE_online.lua')  
os.execute('./tg -s ./KENAE.lua $@ --bot='..KENAE_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ تم\27[m \27[1;34m»»ارسل ايدي المبرمج الاساسي««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ تم\27[m")
local KENAE_file = io.open("sudo.lua", 'w')
KENAE_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
KENAE_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./KENAE.lua $@ --bot='..tokenCk)
else
print("\27[31m»»التوكن غير صحيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»ارسل توكن البوت««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_KENAE = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./KENAE.lua $@ --bot='..token)
else
print("\27[31mالتوكن غير صيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end

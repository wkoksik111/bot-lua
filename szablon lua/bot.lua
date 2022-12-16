local discordia = require('discordia')
local client = discordia.Client()
local coro = require("coro-http")
local json = require("json")
local parse = require('url').parse
discordia.extensions()

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)		


client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message:addReaction('↪️')
                message:delete()
		message.channel:send(message.author.name.." pong!")
	end
end)


client:on('messageCreate', function(message)
	if message.author.bot then return end
    local args = message.content:split(" ")
    local wiadomoscc = table.remove(args, 1)
    if wiadomoscc == 'WOclear' then
		if message.member:hasPermission('administrator') then
			if os.time() > cooldown then
				message:addReaction('✅')
				message:delete()
				local w = table.concat(args, " ")
				local wd = message.channel:getMessages(w)
				local wdp = (1)
				message.channel:bulkDelete(wd)
				local wiadomosc1 = message:reply("**🗑️ "..message.author.name.." usunął "..w.." wiadomości**")
				cooldown = os.time() + 10
				require('timer').sleep(1350)
				wiadomosc1:delete()
			else
				message:reply("odczekaj jeszcze kilka sekund")
			return end
		else
			message:reply("nie masz permisji aby wykonać tę czynność")
        end
    end
end)


client:run('Bot TOKEN')

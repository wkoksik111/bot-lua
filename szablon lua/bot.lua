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

client:run('Bot TOKEN')
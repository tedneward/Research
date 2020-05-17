title=Webscript.io
tags=cloud
summary=Webscripts are short scripts, written in Lua, that run on our servers. They can respond to HTTP requests or run as cron jobs.
~~~~~~

Ceased operations in 2017. Shame, really; I liked the premise. Kept here for historical purposes.

"Webscripts respond to HTTP requests, making them easy to call from web and mobile apps. Webscripts have all the features you need, like password hashing and persistent storage, plus the full programmability of [Lua](/languages/lua.html). Many developer tools, such as GitHub and Stripe, offer webhooks as a way of delivering notifications. Webscripts are a fast and easy way to receive those webhooks. Our built-in request logging makes them equally easy to debug on-the-fly. Webscripts can also be activated on a schedule, providing a simple way to build monitoring or other automation. Webscript Easy integration with any gaming platforms."

[Website](https://www.webscript.io/)

[Example: TicTacToe server](https://www.webscript.io/examples/tictactoe/):

Script /start:
```
local id = math.random(1, 100000)
local board = {}
for i = 1,9 do board[i] = '' end
local state = {board=board, players={X=request.form.secret}}
storage['game:'..id] = json.stringify(state)
return {id=id, state=state}
```

Script /join:
```
local pusher = require('pusher')
local id = request.form.id
local state = json.parse(storage['game:'..id])
if state.players.O ~= nil then
	return 403
else
	state.players.O = request.form.secret
	state.turn = 'X'
	storage['game:'..id] = json.stringify(state)
	pusher.send('<pusher app id>', '<pusher auth key>', '<pusher auth secret>',
		request.form.id, 'update', json.stringify(state))
	return state
end
```

Script /move:
```
local pusher = require('pusher')
function getwinner(board)
	local lines = {
		{1,2,3},{4,5,6},{7,8,9},	-- horizontal wins
		{1,4,7},{2,5,8},{3,6,9},	-- vertical wins
		{1,5,9},{3,5,7}						-- diagonal wins
	}
	for i,line in ipairs(lines) do
		local winner = nil
		for i,index in ipairs(line) do
			winner = winner or board[index]
			if board[index] == '' or board[index] ~= winner then
				winner = nil
				break
			end
		end
		if winner ~= nil then
			return winner
		end
	end
	return nil
end
function isfull(board)
	for i,v in ipairs(board) do
		if v == '' then return false end
	end
	return true
end
local state = json.parse(storage['game:'..request.form.id])
local index = tonumber(request.form.index)
if state.turn ~= request.form.player -- not his turn
	or request.form.secret ~= state.players[request.form.player] -- imposter
	or index == nil or index < 1 or index > 9 -- out of range
	or state.board[index] ~= '' then -- already taken
	return 403
else
	state.board[index] = request.form.player
	winner = getwinner(state.board)
	if winner ~= nil then
		state.winner = winner
		state.turn = nil
	elseif isfull(state.board) then
		state.draw = true
		state.turn = nil
	else
		state.turn = ({X='O', O='X'})[request.form.player]
	end
	if state.turn == nil then -- game over
		storage['game:'..request.form.id] = nil
	else
		storage['game:'..request.form.id] = json.stringify(state)
	end
	pusher.send('<pusher app id>', '<pusher auth key>', '<pusher auth secret>',
		request.form.id, 'update', json.stringify(state))
	return 200
end
```

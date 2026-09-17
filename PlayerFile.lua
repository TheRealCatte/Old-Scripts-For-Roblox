--PlayerFile

function SendNotifcation(Title, Text, Duration, Button1, Button2)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Duration = Duration;
		Button1 = Button1;
		Button2 = Button2;
	})
end

if not (readfile) or not (writefile) then
	SendNotifcation("Error!", "You are not able to use this script! (chat '/console' for more info)",15, nil,nil)
	warn([[
	Error!
	Your executor is unable to use the following:
	readfile and/or writefile ;
	Please use an supported executor than can run those commands!
	Synapse X is highly recommended to be used for this script and others!
	]])
	return
end

wait(game:IsLoaded())
HttpService = game:GetService("HttpService")
_G.DataTable = {

}
Data = _G.DataTable
filename = "PlayerFile"..math.random(1,999999999).."_"..game.JobId..".txt"

PlayerNames = {

}

function loadData(file, DataTable)
	if (readfile) then
		if pcall(function() readfile(fileName) end) then
			if readfile(fileName) ~= nil then
				local success, response = pcall(function()
					DataTable = HttpService:JSONDecode(readfile(file))
				end)
				if not success then
					warn("Save data error:", response)
					warn("Overwriting save file")
					local json = HttpService:JSONEncode(DataTable)
					writefile(file, json)
				end
			else
				local json = HttpService:JSONEncode(DataTable)
				writefile(file, json)
			end
		else
			local json = HttpService:JSONEncode(DataTable)
			writefile(file, json)
		end
	end
end

function saveData(file, DataTable)
	local json
	if (writefile) then
		json = HttpService:JSONEncode(DataTable)
		writefile(file, json)
	end
end

PlayerC = game.Players:GetPlayers()
Player = game.Players.LocalPlayer

SendNotifcation("Commands:","'/save', '/data', '/rawdata' (chat '/console' for more info)",999, "Noted")
warn([[
Commands:
'/save' Saves data taken from game.Players,
'/data' prints out a table for you to view with the Player's UserId in a decoded form,
'/rawdata' same for '/data' but ,
]])
SendNotifcation("Hey!", "It is recommended to chat '/c system' before running a command! (This hides your chat)", 15, "Okay!",nil)

Player.Chatted:Connect(function(msg)
	if msg == "/save" then
		for _, Plr in pairs(PlayerC) do
			PlayerNames[Plr.Name] = Plr.UserId
		end
		for _, Plr in pairs(PlayerC) do
			Data[Plr.Name] = Plr.UserId
		end
		saveData(filename, Data)
	elseif msg == "/data" then
		loadData(filename, Data)
		print("Table = {")
		for _, dataString in pairs(Data) do
			print(dataString)
		end
		print("}")
	elseif msg == "/rawdata" then
		print("Table = {")
		for _, rawDataString in pairs(PlayerC) do
			print(rawDataString)
		end
		print("}")
	end
end)
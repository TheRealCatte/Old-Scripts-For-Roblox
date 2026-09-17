--Booth Game sign script

local Stopped = false

function MakeNewMsg(Text, WaitTime)
    local args = {
    [1] = {
        [1] = "SignServer",
        [2] = game:GetService("Players").LocalPlayer.Character.TextSign,
        [3] = Text
    }
}

game:GetService("ReplicatedStorage").Remotes.SettingsRem:FireServer(unpack(args))
wait(WaitTime)
end

function SayMsg(Text, WaitTime)
   local args = {
    [1] = Text,
    [2] = "All"
}

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
wait(WaitTime)
end

while Stopped == false do wait()
    MakeNewMsg("IF", -5)
    MakeNewMsg("YOU", -5)
    MakeNewMsg("CAN", -5)
    MakeNewMsg("READ", -5)
    MakeNewMsg("THIS", -5)
    MakeNewMsg("YOU", -5)
    MakeNewMsg("ARE", -5)
    MakeNewMsg("NOT COOL", -5)
end

game.Players.LocalPlayer.Chatted:Connect(function(msg)
   if msg == "/stop" then
       Stopped = true
    end
end)
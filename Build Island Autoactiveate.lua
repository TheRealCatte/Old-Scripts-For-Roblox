--Build Island Autoactiveate

local NotificationBindable = Instance.new("BindableFunction")
local Msgreq = function(Title,Text,Duration,Button1Text,Button2Text)
	game.StarterGui:SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Icon = "";
		Duration = Duration;
		Button1 = Button1Text;
		Button2 = nil;
		Callback = NotificationBindable;
	})
end

Msgreq("Commands","startauto/ , stopauto/ , endscript/", 120, "Noted", nil)

function MakeHint(Text)
    if workspace:FindFirstChildOfClass("Hint") then
        workspace:FindFirstChildOfClass("Hint"):Remove()
    end
    local Hint = Instance.new("Hint", workspace)
    Hint.Text = Text
end

local Sound = Instance.new("Sound", workspace)
Sound.SoundId = "rbxassetid://4590662766"
local Active = false
local Ended = false

Sound:Play()

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if Ended == false then
       if msg == "startauto/" then
            print("Auto ActivateBeacon enabled")
            Msgreq("Enabled","Auto ActivateBeacon is now enabled, chat '/stop' to disable",5,nil)
            MakeHint("Auto ActivateBeacon enabled")
            Sound:Play()
            
            Active = true
            while Active == true and Ended == false do
                wait()
                game:GetService("ReplicatedStorage").ActivateBeacon:InvokeServer()
            end
        end
    
        if msg == "stopauto/" then
            Active = false
            print("Auto ActivateBeacon disabled")
            Msgreq("Disabled","Auto ActivateBeacon is now disabled",5,nil)
            MakeHint("Auto ActivateBeacon disabled")
            Sound:Play()
            wait(5)
            if workspace:FindFirstChildOfClass("Hint") then
                workspace:FindFirstChildOfClass("Hint"):Remove()
            end
        end 
        
        if msg == "endscript/" then
            Ended = true
            warn("Ended Script")
            Msgreq("Stopped Script","yay",5,nil)
            Sound:Play()
            if workspace:FindFirstChildOfClass("Hint") then
                workspace:FindFirstChildOfClass("Hint"):Remove()
            end
        end
    end
end)

Msgreq("Script loaded","Have fun :)",5,nil)
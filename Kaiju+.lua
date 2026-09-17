--Kaiju+ (In Dev)

--[[
/--------------------------------------\
|									   |
|	Stuff needed to load before Main   |
|									   |
\--------------------------------------/
]]
--Mains
ScriptStopped = false
ImportedStuff = Instance.new("Folder", workspace)
Players = game.Players
Player = Players.LocalPlayer
Backpack = Player.Backpack

--Sounds
NotificationSound = Instance.new("Sound", ImportedStuff)
NotificationSound.SoundId = "rbxassetid://8623821480"
NotificationSound.Volume = 1
NotificationSound.PlaybackSpeed = 0.7

--LoadingScreen
-- LoadingUi = Instance.new("ScreenGui", Player.PlayerGui)
-- LoadingFrame = Instance.new("Frame", LoadingUi)
-- LoadingFrame.Position = UDim2.new(-0.041, 0,-0.174, 0)
-- LoadingFrame.Size = UDim2.new(1.083, 0,1.174, 0)
-- LoadingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
-- LoadingText1 = Instance.new("TextLabel", LoadingFrame)
-- LoadingText1.Size = UDim2.new(1,0,1,0)
-- LoadingText1.BackgroundTransparency = 1
-- LoadingText1.Text = "Loading..."
-- LoadingText1.TextColor3 = Color3.fromRGB(255,255,255)
-- LoadingText1.TextScaled = true
-- LoadingText2 = Instance.new("TextLabel", LoadingFrame)
-- LoadingText2.Position = UDim2.new(0,0,0.95,0)
-- LoadingText2.Size = UDim2.new(1, 0,0.05, 0)
-- LoadingText2.BackgroundTransparency = 1
-- LoadingText2.Text = "thx uuu for using meh script!!"
-- LoadingText2.TextColor3 = Color3.fromRGB(255, 105, 105)
-- LoadingText2.TextScaled = true

-- wait(game:IsLoaded())
-- wait(1)

-- LoadingFrame.Transparency = 1
-- LoadingUi.Enabled =false

--Services
HttpService = game:GetService("HttpService")

--Sounds
ErrorSound = Instance.new("Sound", ImportedStuff)

function SendNotifcation(Title, Text, Duration, Button1, Button2)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title;
		Text = Text;
		Duration = Duration;
		Button1 = Button1;
		Button2 = Button2;
	})
end

function MakeText(Text, Color)
    NotificationSound:Play()
    local Path = game:GetService("Players").RadioactiveCatt.PlayerGui.MessageGui.Frame
    Path.ChildAdded:Connect(function(instance)
        wait(7.25)
        instance:Remove()
    end)
    local textlabel = Instance.new("TextLabel")
    textlabel.Text = Text
    textlabel.BackgroundTransparency = 1
    textlabel.TextSize = 20
    textlabel.TextColor3 = Color
    textlabel.Parent = Path
end

MakeText("Script is loading..", Color3.fromRGB(55, 235, 0))

--TempData
WriteFileError = false
ReadFileError = false

--Data
_G.DataTable = {
	Stercoins = 0,
	TotalTickets = 0,
	Fak3PupFound = false,
}
Data = _G.DataTable

fileName = "Kaiju_Paradise_Important_Data.txt" --Do not change if data is already made in-game

function loadData()
	if (readfile) then
		if pcall(function() readfile(fileName) end) then
			if readfile(fileName) ~= nil then
				local success, response = pcall(function()
					_G.DataTable = HttpService:JSONDecode(readfile(fileName))
				end)
				if not success then
					warn("Save data error:", response)
					warn("Overwriting save file")
					local json = HttpService:JSONEncode(Data)
					writefile(fileName, json)
				end
			else
				local json = HttpService:JSONEncode(Data)
				writefile(fileName, json)
			end
		else
			local json = HttpService:JSONEncode(Data)
			writefile(fileName, json)
		end
	elseif ReadFileError == false then
		SendNotifcation("Error!", "Your executor is not supported to load data! (Type /console for more info)", 15, nil, nil)
		warn([[Error!
		Your executor is not supported to run this function!
		Your data made in this game will NOT load
		It is reconmmended to use a executor that has ( readfile ) for a better experience!]])
	end
end

function saveData()
	local json
	if (writefile) then
		json = HttpService:JSONEncode(Data)
		writefile(fileName, json)
	elseif WriteFileError == false then
		WriteFileError = true
		SendNotifcation("Error!", "Your executor is not supported to save data! (Type /console for more info)", 15, nil, nil)
		warn([[Error!
		Your executor is not supported to run this function!
		Your data made in this game will NOT save
		It is reconmmended to use a executor that has ( writefile ) for a better experience!]])
	end
end

loadData()
print("Data")
for Name,Value in pairs(Data) do
	print(Name,":",Value)
end
--[[
/--------------------------------------\
|									   |
|			 Main Script			   |
|									   |
\--------------------------------------/
]]

--Workspace Items
Scripted = workspace.Scripted
Other = workspace.Scripted.Other
BestiaryProx = Other.BestiaryArea.Attachment.BestiaryInteract
SterRadio = Scripted.Radio.Radio

--Fuctions

--Npc Make
function NpcMake1()
	local MainNpcModel = Instance.new("Model", ImportedStuff)
	local NpcHumanoid = Instance.new("Humanoid", MainNpcModel)
	local NpcHumanoidRootPart = Instance.new("Part", MainNpcModel)
	NpcHumanoidRootPart.Name = "HumanoidRootPart"
	NpcHumanoidRootPart.Size = Vector3.new(2, 2, 1)
	NpcHumanoidRootPart.Transparency = 1
	NpcHumanoidRootPart.CanCollide = false
	local NpcHead = Instance.new("Part", MainNpcModel)
	NpcHead.Name = "Head"
	NpcHead.Size = Vector3.new(2, 1, 1)
	local NpcHeadMesh = Instance.new("SpecialMesh", NpcHead)
	NpcHeadMesh.Scale = Vector3.new(1.25,1.25,1.25)
	local NpcTorso = Instance.new("Part", MainNpcModel)
	NpcTorso.Name = "Torso"
	NpcTorso.Size = Vector3.new(2, 2, 1)
	local NpcLeftLeg = Instance.new("Part", MainNpcModel)
	NpcLeftLeg.Name = "Left Leg"
	NpcLeftLeg.Size = Vector3.new(1, 2, 1)
	local NpcRightLeg = Instance.new("Part", MainNpcModel)
	NpcRightLeg.Name = "Right Leg"
	NpcRightLeg.Size = Vector3.new(1, 2, 1)
	local NpcLeftArm = Instance.new("Part", MainNpcModel)
	NpcLeftArm.Name = "Left Arm"
	NpcLeftArm.Size = Vector3.new(1, 2, 1)
	local NpcRightArm = Instance.new("Part", MainNpcModel)
	NpcRightArm.Name = "Right Arm"
	NpcRightArm.Size = Vector3.new(1, 2, 1)
	local NpcRootHip = Instance.new("Motor6D", NpcHumanoidRootPart)
	NpcRootHip.Name = "Root Hip"
	NpcRootHip.MaxVelocity = 0.1
	NpcRootHip.Part0 = NpcHumanoidRootPart
	NpcRootHip.Part1 = NpcTorso
	local NpcLeftHip = Instance.new("Motor6D", NpcTorso)
	NpcLeftHip.Name = "Left Hip"
	NpcLeftHip.MaxVelocity = 0.1
	NpcLeftHip.Part0 = NpcTorso
	NpcLeftHip.Part1 = NpcLeftLeg
	local NpcRightHip = Instance.new("Motor6D", NpcTorso)
	NpcRightHip.Name = "Right Hip"
	NpcRightHip.MaxVelocity = 0.1
	NpcRightHip.Part0 = NpcTorso
	NpcRightHip.Part1 = NpcRightLeg
	local NpcLeftShoulder = Instance.new("Motor6D", NpcTorso)
	NpcLeftShoulder.Name = "Left Shoulder"
	NpcLeftShoulder.MaxVelocity = 0.1
	NpcLeftShoulder.Part0 = NpcTorso
	NpcLeftShoulder.Part1 = NpcLeftArm
	local NpcRightShoulder = Instance.new("Motor6D", NpcTorso)
	NpcRightShoulder.Name = "Right Shoulder"
	NpcRightShoulder.MaxVelocity = 0.1
	NpcRightShoulder.Part0 = NpcTorso
	NpcRightShoulder.Part1 = NpcRightArm
	local NpcNeck = Instance.new("Motor6D", NpcTorso)
	NpcNeck.Name = "Neck"
	NpcNeck.MaxVelocity = 0.1
	NpcNeck.Part0 = NpcTorso
	NpcNeck.Part1 = NpcHead

	NpcHead.Position=NpcHead.Position+Vector3.new(0,1.5,0)
	NpcRightArm.Position=NpcRightArm.Position-Vector3.new(1.5,0,0)
	NpcLeftArm.Position=NpcLeftArm.Position+Vector3.new(1.5,0,0)
	NpcRightLeg.Position=NpcRightLeg.Position-Vector3.new(-.5,2,0)
	NpcLeftLeg.Position=NpcLeftLeg.Position+Vector3.new(-.5,-2,0)

	NpcHumanoidRootPart.CFrame = CFrame.new(Vector3.new(482,-10,-162))
	wait(0.5)
	NpcHumanoidRootPart.Anchored = true
end
NpcMake1()

--Additional Models/Maps/Features
--Abble's shop edit
AbbleShop = Player.PlayerGui.AbbleShop
AbbleShopPage = AbbleShop.Menu.Page
AbbleShopPageMenu = AbbleShopPage.Menu

KaijuShopButton = AbbleShopPageMenu[":)"]
KaijuShopButton.Frame.TextLabel.Text = "Kaiju+ Shop"
KaijuShopButton.Frame.UIStroke.Color = Color3.fromRGB(255,255,255)

KaijuLogo = AbbleShopPageMenu.Inventory.Frame.ImageLabel:Clone()
KaijuLogo.Parent = KaijuShopButton.Frame
KaijuLogo.Image = "http://www.roblox.com/asset/?id=12877932328"

KaijuShop = AbbleShopPage.ToolShop:Clone()
KaijuShop.Parent = AbbleShopPage
KaijuShop.Name = "KaijuShop"
--

--Connect Functions
KaijuShopButton.MouseButton1Click:Connect(function()
    MakeText("This is currently being built..", Color3.fromRGB(66, 66, 66))
end)

BestiaryOpen = false
BestiaryProx.Triggered:Connect(function()
	if ScriptStopped == false then
		local BestiaryMenu = Player.PlayerGui.Bestiary.Menu
		
		if BestiaryOpen == false then
		    BestiaryOpen = true
			wait(2)
			local FakePupPicture = Player.PlayerGui.Bestiary.Menu.Page.List["1NormalList"].SlimePup:Clone()
			FakePupPicture.Parent = Player.PlayerGui.Bestiary.Menu.Page.List["3BlackoutList"]
			FakePupPicture.Frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
			FakePupPicture.Frame.TextLabel.Text = "???"
			FakePupPicture.Frame.Image.Image = "rbxassetid://691319439"
			FakePupPicture.Frame.Image.ImageColor3 = Color3.fromRGB(0,0,0)
			if Data.Fak3PupFound == true then
				FakePupPicture.Frame.BackgroundColor3 = Color3.fromRGB(30,0,0)
				FakePupPicture.Frame.TextLabel.Text = "Fak3 Pup"
				FakePupPicture.Frame.TextLabel.TextColor3 = Color3.new(255,255,255)
				FakePupPicture.Frame.Image.Image = "rbxassetid://12524425423"
				FakePupPicture.Frame.Image.ImageColor3 = Color3.fromRGB(255,255,255)
			end
		end
	end
end)

Player.PlayerGui.Bestiary.Menu.TopBar.Leave.MouseButton1Click:Connect(function()
    BestiaryOpen = false
end)

--Stuff you need to do to enter Stermention
ErrorSaid = 1
PartToTalkTo = Instance.new("Part", ImportedStuff)
PartToTalkTo.Position = Vector3.new(487,-12,24)
Player.Chatted:Connect(function(msg)
	if ScriptStopped == false then
		if msg == "/stop" then
			ImportedStuff:Remove()
			ScriptStopped = true
			MakeText("Script ended!", Color3.fromRGB(255,0,0))
			error("Stopped script", 999999999)
		end
		
		if (Player.Character.HumanoidRootPart.Position - PartToTalkTo.Position).magnitude < 20 then
			if ErrorSaid == 1 then
				if msg == "aluha" then
					ErrorSaid=ErrorSaid+1
				end
			elseif ErrorSaid == 2 then
				if msg == "kalbea" then
					ErrorSaid=ErrorSaid+1
				end
			elseif ErrorSaid == 3 then
				if msg == "yaha" then
					local BackpackC = Backpack:GetChildren()
					local HasPlushie = false
					local HasMedkit = false
					local HasBanana = false
					for _, item in pairs(BackpackC) do
						if item.Name == "Plushie" then
							HasPlushie = true
						elseif item.Name == "Medkit" then
							HasMedkit = true
						elseif item.Name == "Banana" then
							HasBanana = true
						end
					end

					if HasBanana == true and HasMedkit == true and HasPlushie == true then
						if SterRadio.SoundEmitter.ParticleEmitter.Enabled == false then
							SendNotifcation("YAY!", "You found it out lol", 5, nil,nil)
						end
					end
					ErrorSaid = 0
				end
			end
		end
	end
end)

MakeText("Script loaded!", Color3.fromRGB(55, 235, 0))
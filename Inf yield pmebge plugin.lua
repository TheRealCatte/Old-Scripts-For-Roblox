writefile("Pmebge.iy",[[
local function getroot(speaker: plr): BasePart
	local char = speaker.Character
	local Humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
	return Humanoid and Humanoid.RootPart or char and char.PrimaryPart
end

local function FindSpawnSelect(team)
	local path = workspace.Interactables.TeamSelection
	for i,Spawn in pairs(path:GetChildren()) do
		if Spawn:FindFirstChild(team) then
			return Spawn[team]
		end
	end
end

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

keycodeMap = {
	["0"] = 0x30,
	["1"] = 0x31,
	["2"] = 0x32,
	["3"] = 0x33,
	["4"] = 0x34,
	["5"] = 0x35,
	["6"] = 0x36,
	["7"] = 0x37,
	["8"] = 0x38,
	["9"] = 0x39,
	["a"] = 0x41,
	["b"] = 0x42,
	["c"] = 0x43,
	["d"] = 0x44,
	["e"] = 0x45,
	["f"] = 0x46,
	["g"] = 0x47,
	["h"] = 0x48,
	["i"] = 0x49,
	["j"] = 0x4A,
	["k"] = 0x4B,
	["l"] = 0x4C,
	["m"] = 0x4D,
	["n"] = 0x4E,
	["o"] = 0x4F,
	["p"] = 0x50,
	["q"] = 0x51,
	["r"] = 0x52,
	["s"] = 0x53,
	["t"] = 0x54,
	["u"] = 0x55,
	["v"] = 0x56,
	["w"] = 0x57,
	["x"] = 0x58,
	["y"] = 0x59,
	["z"] = 0x5A,
	["enter"] = 0x0D,
	["shift"] = 0x10,
	["ctrl"] = 0x11,
	["alt"] = 0x12,
	["pause"] = 0x13,
	["capslock"] = 0x14,
	["spacebar"] = 0x20,
	["space"] = 0x20,
	["pageup"] = 0x21,
	["pagedown"] = 0x22,
	["end"] = 0x23,
	["home"] = 0x24,
	["left"] = 0x25,
	["up"] = 0x26,
	["right"] = 0x27,
	["down"] = 0x28,
	["insert"] = 0x2D,
	["delete"] = 0x2E,
	["f1"] = 0x70,
	["f2"] = 0x71,
	["f3"] = 0x72,
	["f4"] = 0x73,
	["f5"] = 0x74,
	["f6"] = 0x75,
	["f7"] = 0x76,
	["f8"] = 0x77,
	["f9"] = 0x78,
	["f10"] = 0x79,
	["f11"] = 0x7A,
	["f12"] = 0x7B,
}

local infStaminaEnabled = false
local SlowFling = false

local GlobalShopUi = nil
local GlobalShopKeyUi = nil
local SuccessfullyMadeGlobalShop = false
local GlobalShopEnabled = true
local GlobalShopSuccess,GlobalShopError = pcall(function()
	local PlayerGui = game.Players.LocalPlayer.PlayerGui
	--local Path = PlayerGui.MainUI.Controls.PC
	--local ButtonFrame = Path.Run:Clone()
	
	--ButtonFrame.Parent = Path
	--ButtonFrame.Name = "GlobalShop"
	--ButtonFrame.Key.Text = "G"
	--ButtonFrame.Key.BackgroundColor3 = Color3.fromRGB(0,0,150)
	--ButtonFrame.Description.Text = "GLOBAL SHOP"
	
	--GlobalShopKeyUi = ButtonFrame
	
--GlobalShop Ui
GlobalShopUi = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")

GlobalShopUi.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
GlobalShopUi.Name = "Global Shop"
GlobalShopUi.Enabled = false
GlobalShopUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = GlobalShopUi
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.600
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, 370, 0, 190)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Background

TextLabel.Parent = Background
TextLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextLabel.BackgroundTransparency = 0.500
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.024324324, 0, 0.036842104, 0)
TextLabel.Size = UDim2.new(0, 352, 0, 32)
TextLabel.Font = Enum.Font.Arcade
TextLabel.Text = "Global Shop"
TextLabel.TextColor3 = Color3.fromRGB(0, 47, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 41.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = TextLabel

ScrollingFrame.Parent = Background
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.024324324, 0, 0.268421054, 0)
ScrollingFrame.Size = UDim2.new(0, 352, 0, 129)
ScrollingFrame.SizeConstraint = Enum.SizeConstraint.RelativeXX
ScrollingFrame.BottomImage = ""
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 20, 0)
ScrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame.MidImage = ""
ScrollingFrame.ScrollBarThickness = 1
ScrollingFrame.TopImage = ""

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 50, 0, 50)
end)

local function ShopBuy(Item)
	local args = {
    	[1] = Item,
    	[2] = false,
    	[3] = true
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ShopService"):WaitForChild("RF"):WaitForChild("Shop"):InvokeServer(unpack(args))
end
local function ShopSell(Item)
	local args = {
   		[1] = "caik",
    	[2] = false,
    	[3] = false
	}

	game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ShopService"):WaitForChild("RF"):WaitForChild("Shop"):InvokeServer(unpack(args))
end

if GlobalShopSuccess then
	SuccessfullyMadeGlobalShop = true
	
	UIS.InputBegan:Connect(function(input, chatting)
		if input.KeyCode == Enum.KeyCode.G and GlobalShopEnabled and not chatting then
			GlobalShopUi.Enabled = not GlobalShopUi.Enabled
		end
	end)
end

local PastCollisonInstances = {}
local ArrowDodgeEnabled = false
local SwordDodgeEnabled = false
local AntiFlingEnabled = false
local Stalking = false

local Plugin = {
	["PluginName"] = "Pmebge Stuffff",
	["PluginDescription"] = "Scripted by furboy",
	["Commands"] = {
		["Stalk"] = {
			["ListName"] = "Stalk [player name]",
			["Description"] = "Stalks a player",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				
			end
		},
		["AntiFling"] = {
			["ListName"] = "AntiFling",
			["Description"] = "Prevents you from being flinged",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				AntiFlingEnabled = not AntiFlingEnabled
				
				while AntiFlingEnabled do
					local char = speaker.Character
					if char.HumanoidRootPart.Orientation.X ~= 0 then
						local oldCFrame = char.HumanoidRootPart.CFrame
						char.Humanoid.Sit = true
						wait()
						char.Humanoid.Sit = false
						
						local t = tick()
						repeat wait()
							char.HumanoidRootPart.CFrame = oldCFrame
						until char.HumanoidRootPart.Orientation.X == 0 or tick() - t > 3
					end
				end
			end
		},
		["NoSwim"] = {
			["ListName"] = "NoSwim",
			["Description"] = "Makes you not be able to swim lol",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				if speaker.Character:FindFirstChild("NewSwim") then
					speaker.Character.NewSwim:Remove()
				end
			end
		},
		["SwordDodge"] = {
			["ListName"] = "SwordDodge",
			["Description"] = "Dodges swords",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Players = game.Players
				
				SwordDodgeEnabled = not SwordDodgeEnabled
				
				while SwordDodgeEnabled do wait()
					local HRP = speaker.Character:FindFirstChild("HumanoidRootPart")
					
					task.defer(function()
					if HRP then
						for i,Instance in pairs(Players:GetChildren()) do
							task.defer(function()
							local sword = Instance.Character:FindFirstChild("sword")
							if sword then
								local Dist = (HRP.Position - sword.Handle.Position).Magnitude
								
								if Dist < 20 and sword.Parent.Name ~= speaker.Name then
									HRP.CFrame *= CFrame.new(0,0,10)
								end
							end
							end)
						end
					end
					end)
				end
			end
		},
		["ArrowDodge"] = {
			["ListName"] = "ArrowDodge",
			["Description"] = "Dodges arrows",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Debris = workspace.Debris
				
				ArrowDodgeEnabled = not ArrowDodgeEnabled
				
				while ArrowDodgeEnabled do wait()
					local HRP = speaker.Character:FindFirstChild("HumanoidRootPart")
					
					task.defer(function()
					if HRP then
						for i,Instance in pairs(Debris:GetChildren()) do
							if Instance.Name:lower():find("arrow") then
								local Dist
								local s,e = pcall(function()
									Dist = (HRP.Position - Instance.Position).Magnitude
								end)
								
								if s then
								if Dist < 10 then
									HRP.CFrame *= CFrame.new(10,0,10)
									task.defer(function()
										wait(0.2)
										Instance:Remove()
									end)
								end
								end
							end
						end
					end
					end)
				end
			end
		},
		["M"] = {
			["ListName"] = "M [Text]",
			["Description"] = "Spams a message idk lol",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Message = ""
				for i,v in pairs(args) do
					Message = Message.." "..v
				end
				
				for i=1,7 do
					local args = {
    					[1] = Message,
   						[2] = "All"
					}

					game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(unpack(args))
				end
			end
		},
		["FlingAll"] = {
			["ListName"] = "FlingAll",
			["Description"] = "Flings everyone if possible",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local PressedButton = false
				UIS.InputBegan:Connect(function(Input)
					if Input.KeyCode == Enum.KeyCode.Equals and PressedButton == false then
						PressedButton = true
						notify("Notification", "Ended FlingAll")
					end
				end)
				
				while PressedButton == false do
				for i,Plr in pairs(game.Players:GetPlayers()) do wait()
					if PressedButton == false and i ~= 1 then
						if Plr.Team ~= "choosing" then
							local Char = Plr.Character
							local PHRP = Char:FindFirstChild("HumanoidRootPart")
							local HRP = speaker.Character:FindFirstChild("HumanoidRootPart")
							
							if PHRP and HRP then
								execCmd("Fling")
							
								local t = tick()
								repeat wait()
									HRP.Anchored = false
									HRP.CFrame = PHRP.CFrame + Vector3.new(math.random(-1,1),math.random(-3,3),math.random(-1,1))
									HRP.CFrame *= CFrame.fromEulerAnglesXYZ(90,90,90)
									--execCmd("deletevelocity")
								until tick() - t > 1 or Char ~= Plr.Character or PressedButton == true
								execCmd("deletevelocity")
							end
						end
					end
				end
				end
			end
		},
		["BlockPlayer"] = {
			["ListName"] = "BlockPlayer [Player]",
			["Description"] = "Removes a players character forever (Not reversable)",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local function FindPlayer()
					for i,v in pairs(game.Players:GetChildren()) do
						if v.Name:lower():find(args[1]) then
							return v
						end
					end
					return false
				end
				local Target = FindPlayer()
				
				if Target then print(1)
					pcall(function()
						while wait() do
							Target.Character:Remove()
						end
					end)
				end
			end
		},
		["TeamAs"] = {
			["ListName"] = "TeamAs [TeamName]",
			["Description"] = "Teleports a choosing island sign to you to change teams",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local ChoosingSignsPath = workspace.Map.Islands["Choosing Island"]
				
				if ChoosingSignsPath:FindFirstChild(args[1]) then
					local Sign = ChoosingSignsPath:FindFirstChild(args[1])
					local HRP = speaker.Character:FindFirstChild("HumanoidRootPart")
					
					if Sign:FindFirstChild("Sign") and HRP then
						local ProxPart = Sign.Sign
						local Prox = Sign.Sign.Join
						
						for i=1,10 do wait()
							HRP.CFrame = ProxPart.CFrame
							fireproximityprompt(Prox)
						end
					end
				else
					notify("Error", "Unable to find team you wanted to team as ("..args[1]..")")
				end
			end
		},
		["makemapnocollisions"] = {
			["ListName"] = "makemapnocollisions",
			["Description"] = "Makes everything have no collision",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				for i,v in pairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		},
		["makemaphavecollisions"] = {
			["ListName"] = "makemaphavecollisions",
			["Description"] = "Reverts makemapnocollisions if ran",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				for i,v in pairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = true
					end
				end
			end
		},
		["rat"] = {
			["ListName"] = "rat",
			["Description"] = "turns you into a rat lol",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				execCmd("makemapnocollisions")
				wait(0.15)
				execCmd("blockhats")
				execCmd("noclip")
				execCmd("float")
				
				if speaker.Character:FindFirstChild("NewSwim") then
					speaker.Character.NewSwim:Remove()
				end
				
				local c = speaker.Character
				repeat wait() until c ~= speaker.Character
				execCmd("makemaphavecollisions")
			end
		},
		["globalshop"] = {
			["ListName"] = "globalshop [true/false]",
			["Description"] = "Shows gobal shop ui",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				if SuccessfullyMadeGlobalShop then print(args[1])
					if args[1] == false or args[1] == "false" then
						GlobalShopEnabled = false
						ButtonFrame.Visible = false
					elseif args[1] == true or args[1] == "true" then
						GlobalShopEnabled = true
						ButtonFrame.Visible = true
					end
				else
					notify("Error", "Oops! Looks like plugin failed to make global shop! (Error: "..GlobalShopError..")")
				end
			end
		},
		["LoopBagMe"] = {
			["ListName"] = "LoopBagMe [Player]",
			["Description"] = "Turns you into a bag lol",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local function FindPlayer()
					for i,v in pairs(workspace:GetChildren()) do
						if v.Name:lower():find(args[1]) then
							return v
						end
					end
					return false
				end
				local n = FindPlayer().Name
				
				local PressedButton = false
				UIS.InputBegan:Connect(function(Input)
					if Input.KeyCode == Enum.KeyCode.Equals and PressedButton == false then
						PressedButton = true
						notify("Notification", "Ended loopbagme")
					end
				end)
				
				while PressedButton == false do wait() 
					for i=1,5 do wait()
						execCmd("noclip")
						--execCmd("nolimbs")
						pcall(function() speaker.Character["Left Arm"]:Remove()
						speaker.Character["Left Leg"]:Remove()
						speaker.Character["Right Leg"]:Remove() end)
						execCmd("float")
						execCmd("hipheight 2")
						execCmd("bang "..n.." 0")
					end
					
					local Char = speaker.Character
					repeat wait() until Char ~= speaker.Character
				end
			end
		},
		["BagMe"] = {
			["ListName"] = "BagMe [Player]",
			["Description"] = "Turns you into a bag lol",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local function FindPlayer()
					for i,v in pairs(workspace:GetChildren()) do
						if v.Name:lower():find(args[1]) then
							return v
						end
					end
					return false
				end
				local n = FindPlayer().Name
			
				execCmd("noclip")
				execCmd("nolimbs")
				execCmd("float")
				execCmd("hipheight 2")
				execCmd("bang "..n.." 0")
			end
		},
		["Range"] = {
			["ListName"] = "Range [Numb] [Numb] [Numb]",
			["Description"] = "Gives a tool a bigger size",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local tool = speaker.Character:FindFirstChildOfClass("Tool")
				if tool then print(1)
					local handle = tool:FindFirstChild("Handle")
					if handle then print(2)
						execCmd("noclip")
						handle.Size = Vector3.new(args[1],args[2],args[3])
						handle.Transparency = 0.95
						local h = Instance.new("Highlight", handle)
						h.FillTransparncy = 0.7
					end
				end
			end
		},
        ["EpicGamerGodMode"] = {
			["ListName"] = "EpicGamerGodMode [Tool Range]",
			["Description"] = "You become a epic gamer god!!!",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
            local h = Instance.new("Highlight", speaker.Character.sword.Handle)
            h.FillTransparency = 0.75
            speaker.Character.sword.Handle.Transparency = 0.9
                speaker.Character.sword.Handle.Size = Vector3.new(50,50,50)
                execCmd("noclip")
                execCmd("spin 50")
                execCmd("tpwalk 15")
                execCmd("flyjump")
			end
		},
		["SlowerFling"] = {
			["ListName"] = "SlowerFling",
			["Description"] = "Same as fling but a much less chance of falling through the ground",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				for _, child in pairs(speaker.Character:GetDescendants()) do
					if child:IsA("BasePart") then
						child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
					end
				end
				wait(.1)
				local bambam = Instance.new("BodyAngularVelocity")
				bambam.Name = "AAAAAAAAAAAAAAAA"
				bambam.Parent = getRoot(speaker.Character)
				bambam.AngularVelocity = Vector3.new(0,99999,0)
				bambam.MaxTorque = Vector3.new(0,math.huge,0)
				bambam.P = math.huge
				local Char = speaker.Character:GetChildren()
				for i, v in pairs(Char) do
					if v:IsA("BasePart") then
						v.CanCollide = false
						v.Massless = true
						v.Velocity = Vector3.new(0, 0, 0)
					end
				end
				SlowFling = true
				repeat
					bambam.AngularVelocity = Vector3.new(0,99,0)
					wait(.2)
					bambam.AngularVelocity = Vector3.new(0,0,0)
					wait(.1)
				until SlowFling == false
			end
		},
		["UnslowerFling"] = {
			["ListName"] = "UnslowerFling",
			["Description"] = "Same as fling but a much less chance of falling through the ground",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				SlowFling = false
			end
		},
		["AutoTreeFarm"] = {
			["ListName"] = "AutoTreeFarm",
			["Description"] = "Chops down every tree over and over until stopped (ax MUST be in first slot to work)",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Character = speaker.Character

				if not Character:FindFirstChild("ax") then
					keypress(keycodeMap["1"])
				end
				wait()
				if not Character:FindFirstChild("ax") then
					notify("Error", "Unable to do tree farm due to ax not being in first slot!")
					return
				else
					notify("Notification", "Press =/+ to end")
					local PressedButton = false
					UIS.InputBegan:Connect(function(Input)
						if Input.KeyCode == Enum.KeyCode.Equals and PressedButton == false then
							PressedButton = true
							notify("Notification", "Ended KillVr [PlayerName]")
						end
					end)

					while PressedButton == false do wait()
						local function FindTrees(C)
							for _, item in pairs(C:GetChildren()) do
								if PressButton == false then
                                    pcall(function()
                                    local ItemC = item:GetChildren()
									local Number = 0
									for i=1,#ItemC do Number=Number+1 end
									if Number ~= 0 then
										FindTrees(item)
									end
                                end)
                                    if item.Parent.Name:find("Tree") and not item.Parent.Name:find("Palm") then
									if item.Name == "Base" and item:FindFirstChild("ChopTree") and PressedButton == false then
										char.HumanoidRootPart.CFrame = item.CFrame
										char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
										wait(0.1)
										keypress(keycodeMap["f"])
										wait()
										keyrelease(keycodeMap["f"])
										keypress(keycodeMap["f"])
										wait()
										keyrelease(keycodeMap["f"]) 
									elseif item.Name == "Wood" and item:FindFirstChild("ChopTree") then
										char.HumanoidRootPart.CFrame = item.CFrame
										char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
										wait(0.1)
										keypress(keycodeMap["f"])
										wait()
										keyrelease(keycodeMap["f"])
										keypress(keycodeMap["f"])
										wait()
										keyrelease(keycodeMap["f"]) 
									end
								end
								end
							end
						end
                        FindTrees(workspace)
						for i=1,150 do
							local args = {
								[1]="wood",
								[2]=false,
								[3]=false
							}

							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Shop"):FireServer(unpack(args))
						end
					end
				end
			end
		},
		["DisableMusic"] = {
			["ListName"] = "DisableMusic",
			["Description"] = "Disables the background music of the game",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				workspace.Music.SoundId = "rbxassetid://0"
			end
		},
		["EnableMusic"] = {
			["ListName"] = "EnableMusic",
			["Description"] = "Enables the background music of the game",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				workspace.Music.SoundId = "rbxassetid://1846631912"
			end
		},
		["ChoosingTeam"] = {
			["ListName"] = "ChoosingTeam",
			["Description"] = "Sends you to the choosing team even if your unable to",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BackToChoosing"):FireServer()
			end
		},
		["AbuseTeam"] = {
			["ListName"] = "AbuseTeam [TeamName]",
			["Description"] = "Kills an entire team if possible",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Team = args[1]
				local function FindTeam()
					for i,TeamE in pairs(game.Teams:GetChildren()) do
						if TeamE.Name:lower():find(Team) then
							return TeamE
						end
					end
					return false
				end

				if FindTeam() then
					Team = FindTeam()
					wait(1)
					if not speaker.Character:FindFirstChild("sword") then
						keypress(keycodeMap["1"])
					end

					local Character = speaker.Character
					execCmd("SlowerFling")
					execCmd("noclip")
					local Players = game.Players
					for i,Player in pairs(Players:GetPlayers()) do
						if Character == speaker.Character then
							if Player.TeamColor == Team.TeamColor then
								if Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character:FindFirstChild("Torso") then
									local ti = tick(0.1)
									repeat wait()
										local Character = Player.Character
										getRoot(speaker.Character).CFrame = getRoot(Character).CFrame + Vector3.new(math.random(-2,2),0,math.random(-2,2))
										mouse1click()
									until ti < tick() - 0.5
									getRoot(speaker.Character).CFrame = CFrame.new(Vector3.new(0,10,0))
									wait(0.5)
								end
							end
						end
					end
				else
					notify("Error", "Unable to find team wanted to kill (Make sure its the same as the team name)")
				end
				execCmd("UnslowerFling")
				execCmd("unfling")
				execCmd("unnoclip")
			end
		},
		["KillVr"] = {
			["ListName"] = "KillVr [PlayerName]",
			["Description"] = "Kill a player on a vr team! (This can ONLY effect vr players)",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Target = args[1]
				local function FindPlayer()
					for i,v in pairs(workspace:GetChildren()) do
						if v.Name:lower():find(Target) then
							return v
						end
					end
					return false
				end

				if FindPlayer() then
					Target = FindPlayer()
					if Target:FindFirstChild("VRFolder") then
						notify("Notification", "Press =/+ to end")
						local PressedButton = false
						UIS.InputBegan:Connect(function(Input)
							if Input.KeyCode == Enum.KeyCode.Equals and PressedButton == false then
								PressedButton = true
								notify("Notification", "Ended KillVr [PlayerName]")
							end
						end)

						if speaker.TeamColor ~= BrickColor.new("Bright red") or speaker.TeamColor == BrickColor.new("Medium stone grey") then
							execCmd("TeamAs viking")
						end
						wait(3)
						if not speaker.Character:FindFirstChild("sword") then
							keypress(keycodeMap["1"])
						end

						local Head = Target.VRFolder.Base.Head.Head
						local Health = Target.VRFolder.Base.VRHealth
						execCmd("SlowerFling")
						execCmd("noclip")
						repeat wait()
							getRoot(speaker.Character).CFrame = Head.CFrame + Vector3.new(math.random(-2,2),0,math.random(-2,2))
							mouse1click()
						until Health.Value < 0 or PressedButton == true
						execCmd("ChoosingTeam")
						wait(1.5)
						execCmd("UnslowerFling")
						execCmd("unfling")
						execCmd("unnoclip")
					else
						notify("Error", "This player is NOT a vr player! (Make sure they are on ascended team!)")
					end
				else
					notify("Error", "Unable to find player! (Make sure its the same as the players name)")
				end
			end
		},
		["KillTeam"] = {
			["ListName"] = "KillTeam [TeamName]",
			["Description"] = "Kills an entire team as a viking (This may cause the anti-cheat to kick you!)",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Team = args[1]
				local function FindTeam()
					for i,TeamE in pairs(game.Teams:GetChildren()) do
						if TeamE.Name:lower():find(Team) then
							return TeamE
						end
					end
					return false
				end

				if FindTeam() then
					local Team = FindTeam()
					if speaker.TeamColor ~= BrickColor.new("Bright red") or speaker.TeamColor == BrickColor.new("Medium stone grey") then
						execCmd("TeamAs viking")
					end
					wait(3)
					if not speaker.Character:FindFirstChild("sword") then
						keypress(keycodeMap["1"])
					end

					local Character = speaker.Character
					execCmd("SlowerFling")
					execCmd("noclip")
					local Players = game.Players
					for i,Player in pairs(Players:GetPlayers()) do
						if Character == speaker.Character then
							if Player.TeamColor == Team.TeamColor then
								if Player.Character:FindFirstChild("HumanoidRootPart") or Player.Character:FindFirstChild("Torso") then
									local ti = tick(0.1)
									repeat wait()
										local Character = Player.Character
										getRoot(speaker.Character).CFrame = getRoot(Character).CFrame + Vector3.new(math.random(-2,2),0,math.random(-2,2))
										mouse1click()
									until ti < tick() - 0.5
									getRoot(speaker.Character).CFrame = CFrame.new(Vector3.new(0,10,0))
									wait(0.5)
								end
							end
						end
					end
				else
					notify("Error", "Unable to find team wanted to kill (Make sure its the same as the team name)")
				end
				execCmd("UnslowerFling")
				execCmd("unfling")
				execCmd("unnoclip")
			end
		},
		["KillPlayer"] = {
			["ListName"] = "KillPlayer [TeamName]",
			["Description"] = "Kills a targeted person (This may cause the anti-cheat to kick you!)",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Target = args[1]
				local function FindPlayer()
					for i,v in pairs(workspace:GetChildren()) do
						if v.Name:lower():find(Target) then
							return v
						end
					end
					return false
				end

				if FindPlayer() then
					Target = FindPlayer()
					if speaker.TeamColor ~= BrickColor.new("Bright red") or speaker.TeamColor == BrickColor.new("Medium stone grey") then
						execCmd('ChoosingTeam')
						wait(1)
						getRoot(speaker.Character).CFrame = FindSpawnSelect("viking").CFrame
					end
					wait(1)
					if not speaker.Character:FindFirstChild("sword") then
						keypress(keycodeMap["1"])
					end

					local Character = speaker.Character
					execCmd("SlowerFling")
					execCmd("noclip")
					local Players = game.Players
					for i,Player in pairs(Players:GetPlayers()) do
						if Character == speaker.Character then
							if Player.Name == Target.Name then
								if getRoot(Player.Character) then
									local ti = tick(0.1)
									repeat wait()
										local Character = Player.Character
										getRoot(speaker.Character).CFrame = getRoot(Character).CFrame + Vector3.new(math.random(-2,2),0,math.random(-2,2))
										mouse1click()
									until ti < tick() - 0.5
									execCmd("ChoosingTeam")
								end
							end
						end
					end
				else
					notify("Error", "Unable to find player you wanted to kill (Make sure its the same as the users name)")
				end
				execCmd("UnslowerFling")
				execCmd("unfling")
				execCmd("unnoclip")
			end
		},
		["KillAll"] = {
			["ListName"] = "KillAll",
			["Description"] = "Kills EVERY team as a viking if possible (This may cause the anti-cheat to kick you!)",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				if speaker.TeamColor ~= BrickColor.new("Bright red") or speaker.TeamColor == BrickColor.new("Medium stone grey") then
					execCmd('ChoosingTeam')
					wait(1)
					getRoot(speaker.Character).CFrame = FindSpawnSelect("viking").CFrame
				end
				wait(1)
				if not speaker.Character:FindFirstChild("sword") then
					keypress(keycodeMap["1"])
				end

				local Character = speaker.Character
				execCmd("SlowerFling")
				execCmd("noclip")
				local Players = game.Players
				for i,Player in pairs(Players:GetPlayers()) do
					if Character == speaker.Character then
						if getRoot(Player.Character) then
							local ti = tick(0.1)
							repeat wait()
								local Character = Player.Character
								getRoot(speaker.Character).CFrame = getRoot(Character).CFrame + Vector3.new(math.random(-2,2),0,math.random(-2,2))
								mouse1click()
							until ti < tick() - 0.5
							getRoot(speaker.Character).CFrame = CFrame.new(Vector3.new(0,10,0))
							wait(math.random(2,3))
						end
					end
				end
				execCmd("UnslowerFling")
				execCmd("unfling")
				execCmd("unnoclip")
			end
		},
		["InfStamina"] = {
			["ListName"] = "InfStamina",
			["Description"] = "Gives you inf stamina forever",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				local Character = speaker.Character

				infStaminaEnabled = true
				while infStaminaEnabled == true do wait()
					if Character == speaker.Character then
						if Character:FindFirstChild("Stamina") then
							Character.Stamina.Value = math.huge
							Character.Stamina.Max.Value = math.huge
						end
					else
						Character = speaker.Character
					end
				end
			end
		},
		["NoInfStamina"] = {
			["ListName"] = "NoInfStamina",
			["Description"] = "Disables Inf Stamina",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				if infStaminaEnabled == true then
					notify("Notification", "You will lose inf stamina when you respawn")
				end
				infStaminaEnabled = false
			end
		},
		["KillBrickGod"] = {
			["ListName"] = "KillBrickGod",
			["Description"] = "Attacks brick god until death",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
				if speaker.TeamColor ~= BrickColor.new("Bright red") or speaker.TeamColor == BrickColor.new("Medium stone grey") then
					notify("Notification", "You need to be a viking to run this command!")
				else
					wait(1)
				keypress(keycodeMap["1"])
				getRoot(speaker.Character).CFrame = workspace.NPCs.BrickGod.Head.CFrame + Vector3.new(0,0,5)

				local Character = speaker.Character
				execCmd("SlowerFling")
				execCmd('noclip')
				local t = tick()
				repeat wait()
					if tick() - t > 1 then
						game:GetService("Players").LocalPlayer.Character.sword.HeavyAttack:FireServer()
						t = tick()
					end
				
					mouse1click()
					getRoot(speaker.Character).CFrame = workspace.NPCs.BrickGod.Head.CFrame + Vector3.new(math.random(-5,5),0,math.random(-5,5))
				until speaker.Character.Humanoid.Health < 0 or Character ~= speaker.Character
				execCmd("UnslowerFling")
				execCmd('unnoclip')
				end
			end
		},
		["LoopKillBrickGod"] = {
			["ListName"] = "LoopKillBrickGod",
			["Description"] = "Loop attacks brick god until death (Can be disabled by pressing =/+)",
			["Aliases"] = {},
			["Function"] = function(args,speaker)
			if speaker.TeamColor ~= BrickColor.new("Bright red") or speaker.TeamColor == BrickColor.new("Medium stone grey") then
					notify("Notification", "You need to be a viking to run this command!")
			else
				notify("Notification", "Press =/+ to end")
				local PressedButton = false
				UIS.InputBegan:Connect(function(Input)
					if Input.KeyCode == Enum.KeyCode.Equals and PressedButton == false then
						PressedButton = true
						notify("Notification", "Ended loopkillbrickgod")
					end
				end)

				while PressedButton == false do wait()
					pcall(function()
						wait(1)
						keypress(keycodeMap["1"])
						getRoot(speaker.Character).CFrame = workspace.NPCs.BrickGod.Head.CFrame + Vector3.new(0,0,5)

						local Character = speaker.Character
						execCmd("SlowerFling")
						execCmd('noclip')
						local t = tick()
						repeat wait()
							if tick() - t > 1 then
								game:GetService("Players").LocalPlayer.Character.sword.HeavyAttack:FireServer()
								t = tick()
							end
						
							mouse1click()
							getRoot(speaker.Character).CFrame = workspace.NPCs.BrickGod.Head.CFrame + Vector3.new(math.random(-5,5),0,math.random(-5,5))
						until speaker.Character.Humanoid.Health < 0 or Character ~= speaker.Character or PressedButton == true
						execCmd("UnslowerFling")
						execCmd('unnoclip')
					end)
				end
			end
			end
		},
	}
}
return Plugin
]])

local success = pcall(function() readfile("pmebge.iy") end) if success then print([[
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
----------------------------------------------- uploaded plugin ---------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
]]) end
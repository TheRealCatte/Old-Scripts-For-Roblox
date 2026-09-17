--Choose BG or EBG to attack
while wait() do
    pcall(function()
    WhichGodToAttack = "BG"

RunService = game:GetService("RunService")

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local Clip = true
function Noclip(Char)
    Clip = false
	wait(0.1)
	local function NoclipLoop()
		if Clip == false and Char ~= nil then
			for _, child in pairs(Char:GetChildren()) do
				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = RunService.Stepped:Connect(NoclipLoop)
end

local flinging = false
function Spin(Char)
task.defer(function()
for _, child in pairs(Char:GetDescendants()) do
		if child:IsA("BasePart") then
			child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
		end
	end
    Noclip(Char)
	wait(.1)
	local bambam = Instance.new("BodyAngularVelocity")
	bambam.Name = "AAAAAAAAAAAAAAAA"
	bambam.Parent = getRoot(Char)
	bambam.AngularVelocity = Vector3.new(0,99999,0)
	bambam.MaxTorque = Vector3.new(0,math.huge,0)
	bambam.P = math.huge
	local Char = Char:GetChildren()
	for i, v in next, Char do
		if v:IsA("BasePart") then
			v.CanCollide = false
			v.Massless = true
			v.Velocity = Vector3.new(0, 0, 0)
		end
	end
	flinging = true
	repeat
		bambam.AngularVelocity = Vector3.new(0,99,0)
		wait(.2)
		bambam.AngularVelocity = Vector3.new(0,0,0)
		wait(.1)
	until flinging == false
end)
end

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

Player = game.Players.LocalPlayer
Character = Player.Character

BGSpawn = workspace.BGSpawn
EBGSpawn = workspace.EBGSpawn

if WhichGodToAttack == "BG" then
    if Player.Team ~= "viking" then
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BackToChoosing"):FireServer()
    wait(1)
    Character = Player.Character
    getRoot(Character).CFrame = CFrame.new(Vector3.new(-9, 6, -5060))
    wait(1)
    end
    Character = Player.Character
    keypress(keycodeMap["1"])
    getRoot(Character).CFrame = BGSpawn.CFrame + Vector3.new(0,0,5)

    Spin(Character)
    repeat wait()
    mouse1click()

    getRoot(Character).CFrame = BGSpawn.CFrame + Vector3.new(math.random(-5,5),1.5,math.random(-5,5))

    until Character.Humanoid.Health < 0 or Character ~= Player.Character
    flinging = false
    Clip = true
end

    end)
end
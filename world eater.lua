--World Eater

Speed = 1 --The lower, the faster the game gets deleted
--Recommended to execute more than one time if its a huge game
HeartbeatSpeed = true --Does a wait time for a game's heartbeat
--The wait time is usualy 0.1 to 0.01, depending on how slow your device is

local DoNotDeleteFolder = Instance.new("Folder", workspace)
DoNotDeleteFolder.Name = "no delete"

function Effect(Pos, Item)
	DoNotDeleteFolder.ChildAdded:Connect(function(Part)
		wait(0.5)
		Part:Remove()
	end)

	local Part = Instance.new("Part", DoNotDeleteFolder)
	Part.Position = Pos
	Part.Anchored = true
	Part.Transparency = 1
	Part.Size = Item.Size
	local Particle = Instance.new("ParticleEmitter", Part)
	Particle.Texture = "rbxassetid://114885896"
	Particle.Size = NumberSequence.new(5)
	Particle.Rate = math.huge
	Particle.Lifetime = NumberRange.new(1,10)
	Particle.SpreadAngle = Vector2.new(-360,360)
	local SoundPart = Instance.new("Part", DoNotDeleteFolder)
	SoundPart.Position = Pos
	SoundPart.Transparency = 1
	SoundPart.Size = Vector3.new(1,1,1)
	local Sound = Instance.new("Sound", Part)
	Sound.SoundId = "rbxassetid://634504313"
	Sound.PlaybackSpeed = 0.7
	Sound:Play()
end

function EatWorld(Module)
	--pcall(function()
	local C = Module:GetChildren()
	for _, item in pairs(C) do
		if HeartbeatSpeed == true then
			game:GetService("RunService").Heartbeat:Wait()
		else
			wait(Speed)
		end
		if not item:IsA("Terrain") and not item:IsA("Camera") and item.Name ~= game.Players.LocalPlayer.Name and item.Name ~= "no delete" then
			local ItemC = item:GetChildren()
			local Number = 0
			for i=1,#ItemC do Number=Number+1 end
			if Number ~= 0 then
				EatWorld(item)
			else
				if item:IsA("Part") or item:IsA("BasePart") or item:IsA("WedgePart") or item:IsA("CornerWedgePart") or item:IsA("MeshPart") or item:IsA("TrussPart") then
					Effect(item.Position, item)
				end
				print(item.ClassName)
				item:Remove()
			end
		end
	end
	if not Module:IsA("Terrain") and not Module:IsA("Workspace") and not Module:IsA("Camera") and Module.Name ~= game.Players.LocalPlayer.Name and Module.Name ~= "no delete" then
		local Numb = 0
		for i=1,#C do Numb=Numb+1 end
		if Numb ~= 0 then
			EatWorld(Module)
		else
			Module:Remove()
		end
	end
	--end)
end

EatWorld(workspace)
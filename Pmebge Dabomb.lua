--Dabomb

workspace.ChildAdded:Connect(function(thing)
	if thing.Name == "Bomb" then
		repeat wait() until thing.Main.Explode.Playing == true
		local Part = Instance.new("Part", workspace)
		Part.CanCollide = false
		Part.Anchored = true
		Part.Position = thing.Main.Position + Vector3.new(0,500,0)
		local Sound1 = Instance.new("Sound", Part)
		Sound1.SoundId = "rbxassetid://9066063881"
		Sound1.RollOffMaxDistance = 1000
		Sound1.PlaybackSpeed = 0.5
		Sound1.Volume = 10
		local Distor = Instance.new("DistortionSoundEffect", Sound1)
		local Sound2 = Instance.new("Sound", Part)
		Sound2.SoundId = "rbxassetid://923073285"
		Sound2.RollOffMaxDistance = math.huge
		Sound2.Looped = true
		Sound2.Volume = 10
		
		game.Lighting.Brightness = 20
		
		local Mesh = Instance.new("SpecialMesh", Part)
		Mesh.MeshType = Enum.MeshType.FileMesh
		Mesh.MeshId = "rbxassetid://4559980469"
		Mesh.TextureId = "rbxassetid://4559980570"
		Mesh.Scale = Vector3.new(0.001, 0.0015, 0.001)
		
		Sound1:Play()
		Sound2:Play()
		
		for i=1,500 do wait()
			Mesh.Scale=Mesh.Scale+Vector3.new(0.0001,0.0001,0.0001)
		end
	end
end)
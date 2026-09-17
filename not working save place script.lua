fileName = nil
CodeStuff = {}

function saveData(Table)
	if (writefile) then
		local json = game:GetService("HttpService"):JSONEncode(Table)
		writefile(fileName, json)
	end
end

local function AddInstance(name, className)
	local s,e = pcall(function()
		table.insert(CodeStuff, "local "..name.." = Instance.new("..className..")")
	end)
	
	if not s then
		print(e)
	end
end

local GetFullNameNeeded = {
	"Parent",
	"PrimaryPart",
	
}
local function IsGetFullNameNeeded(name)
	for i,v in pairs(GetFullNameNeeded) do
		if name == v then
			return true
		end
	end
	return false
end

local function AddValue(instance, name)
	local s,e = pcall(function()
		if IsGetFullNameNeeded(name) then
			table.insert(CodeStuff, instance.Name.."."..name.." = "..tostring(instance[name]:GetFullName()))
		else
			table.insert(CodeStuff, instance.Name.."."..name.." = "..tostring(instance[name]))
		end
	end)
	
	--if not s then
	--	print(e)
	--end
end

local function ConvertInstanceToLua(Group)
	for i,instance in pairs(Group:GetDescendants()) do
		AddInstance(instance.Name, instance.ClassName)
		if instance:IsA("BasePart") then
			--Apperance
			AddValue(instance, "BrickColor", CodeStuff)
			AddValue(instance, "CastShadow", CodeStuff)
			AddValue(instance, "Color", CodeStuff)
			AddValue(instance, "Material", CodeStuff)
			AddValue(instance, "MaterialVariant", CodeStuff)
			AddValue(instance, "Reflectance", CodeStuff)
			AddValue(instance, "Transparency", CodeStuff)
			--Data
			AddValue(instance, "Locked", CodeStuff)
			AddValue(instance, "Name", CodeStuff)
			AddValue(instance, "Parent", CodeStuff)
			AddValue(instance, "Rotation", CodeStuff)
			--Transform
			AddValue(instance, "Size", CodeStuff)
			AddValue(instance, "CFrame", CodeStuff)
			--Behavior
			AddValue(instance, "Archivable", CodeStuff)
			AddValue(instance, "EnableFluidForces", CodeStuff)
			--Pivot
			AddValue(instance, "PivotOffset", CodeStuff)
			--Collision
			AddValue(instance, "CanCollide", CodeStuff)
			AddValue(instance, "CanQuery", CodeStuff)
			AddValue(instance, "CanTouch", CodeStuff)
			AddValue(instance, "CollisionGroup", CodeStuff)
			AddValue(instance, "Anchored", CodeStuff)
			AddValue(instance, "CenterOfMass", CodeStuff)
			AddValue(instance, "CurrentPhysicalProperties", CodeStuff)
			AddValue(instance, "CustomPhysicalProperties", CodeStuff)
			AddValue(instance, "Mass", CodeStuff)
			AddValue(instance, "RootPriority", CodeStuff)
			AddValue(instance, "Shape", CodeStuff)
			--Surface
			AddValue(instance, "BackSurface", CodeStuff)
			AddValue(instance, "BottomSurface", CodeStuff)
			AddValue(instance, "FrontSurface", CodeStuff)
			AddValue(instance, "LeftSurface", CodeStuff)
			AddValue(instance, "RightSurface", CodeStuff)
			AddValue(instance, "TopSurface", CodeStuff)
		end
	end
	
	fileName = Group.Name.."-"..game.PlaceId.."-"..math.random(0,10000)
	saveData(CodeStuff)
end

ConvertInstanceToLua(workspace.NPCs)
print("Stole map")
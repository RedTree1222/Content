-- CatMode made by jacob, image modified by me

if getgenv().CatModeExecuted == true then
	return
end

getgenv().CatModeExecuted = true

local url = "https://raw.githubusercontent.com/RedTree1222/Content/refs/heads/main/contentcat.png"
writefile("contentcat.png", game:HttpGet(url))
local img = getcustomasset("contentcat.png")

local cm = {}

local function fn(obj)
	if not obj:IsA("BasePart") and not obj:IsA("Sound") and not obj:IsA("ImageLabel") and not obj:IsA("ImageButton") and not obj:IsA("ParticleEmitter") then
		return
	end

	if obj:IsA("BasePart") then
		local dcs = {}
		local fcs = {
			Enum.NormalId.Front, Enum.NormalId.Back,
			Enum.NormalId.Top, Enum.NormalId.Bottom,
			Enum.NormalId.Left, Enum.NormalId.Right
		}
		
		for _, f in ipairs(fcs) do
			local dec = Instance.new("Decal")
			dec.Face = f
			dec.Texture = img
			dec.Parent = obj
			table.insert(dcs, dec)
		end

		if obj.Transparency > 0 or obj.LocalTransparencyModifier > 0 then
			for _, d in ipairs(dcs) do d.Transparency = 1 end
		end

		obj:GetPropertyChangedSignal("Transparency"):Connect(function()
			for _, d in ipairs(dcs) do d.Transparency = obj.Transparency end
		end)

		obj:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
			if obj.LocalTransparencyModifier > 0 then
				for _, d in ipairs(dcs) do d.Transparency = 1 end
			else
				for _, d in ipairs(dcs) do d.Transparency = obj.Transparency end
			end
		end)
	elseif obj:IsA("Sound") then
		obj.SoundId = "rbxassetid://131785245835838"
		obj:GetPropertyChangedSignal("SoundId"):Connect(function()
			obj.SoundId = "rbxassetid://131785245835838"
		end)
	elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
		obj.Image = img
		obj:GetPropertyChangedSignal("Image"):Connect(function()
			obj.Image = img
		end)
	elseif obj:IsA("ParticleEmitter") then
		obj.Texture = img
		obj:GetPropertyChangedSignal("Texture"):Connect(function()
			obj.Texture = img
		end)
	end
end

for _, obj in pairs(game:GetDescendants()) do
	task.spawn(function() fn(obj) end)
end

local cn = game.DescendantAdded:Connect(function(obj)
	task.spawn(function() fn(obj) end)
end)

function cm:Disable()
	cn:Disconnect()
end

getgenv().CatMode = cm

return cm

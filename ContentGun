local ts = game:GetService("TweenService")
local p = game.Players.LocalPlayer
local m = p:GetMouse()
local c = p.Character or p.CharacterAdded:Wait()
local h = c:WaitForChild("Humanoid")

local tool = game:GetObjects("rbxassetid://94173860700516")[1]
tool.Parent = p.Backpack

local sp = tool:WaitForChild("SpawnItem")

local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://10526835827"
local track

local fcs = {
	Enum.NormalId.Front, Enum.NormalId.Back, 
	Enum.NormalId.Top, Enum.NormalId.Bottom, 
	Enum.NormalId.Left, Enum.NormalId.Right
}

tool.Equipped:Connect(function()
	track = h:LoadAnimation(anim)
	track:Play()
	track:AdjustSpeed(0)
end)

tool.Unequipped:Connect(function()
	if track then track:Stop() end
end)

tool.Activated:Connect(function()
	local pL = Instance.new("Part")
	pL.Size = Vector3.new(0.05, 0.05, 3)
	pL.Color = Color3.fromRGB(255, 255, 255)
	pL.Material = Enum.Material.Neon
	pL.CanCollide = false
	pL.Anchored = true
	pL.CFrame = CFrame.new(sp.Position, m.Hit.Position)
	pL.Parent = workspace
	
	local dst = (m.Hit.Position - sp.Position).Magnitude
	local spd = 180
	local dur = dst / spd
	
	local mv = ts:Create(pL, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
		CFrame = CFrame.new(m.Hit.Position, m.Hit.Position + pL.CFrame.LookVector)
	})
	
	mv:Play()
	
	mv.Completed:Connect(function()
		pL:Destroy()
		
		local hit = m.Target
		if hit and not hit:IsDescendantOf(c) then
			local s = Instance.new("Sound")
			s.SoundId = "rbxassetid://18731843231"
			s.Volume = 1
			s.Parent = hit
			s:Play()
			game:GetService("Debris"):AddItem(s, 3)
			
			for _, f in ipairs(fcs) do
				local dec = Instance.new("Decal")
				dec.Texture = "http://www.roblox.com/asset/?id=118955218442919"
				dec.Face = f
				dec.Parent = hit
			end
		end
	end)
end)

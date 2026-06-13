local s = "http://www.roblox.com/asset/?id=118955218442919"
local d = {"Top", "Bottom", "Left", "Right", "Front", "Back"}

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Content Seek loaded",
	Text = "Wait for seek to spawn in the first or second chase",
	Duration = 5
})

local function a(o)
	if o:IsA("BasePart") then
		for _, f in ipairs(d) do
			local c = Instance.new("Decal")
			c.Texture = s
			c.Face = f
			c.Parent = o
		end
	end
end

local function f(sr)
	for _, o in ipairs(sr:GetDescendants()) do
		a(o)
	end
	sr.DescendantAdded:Connect(a)
end

local function c(o)
	if o.Name == "SeekRig" and o.Parent and o.Parent.Name == "SeekMovingNewClone" then
		f(o)
	end
end

workspace.DescendantAdded:Connect(c)

for _, o in ipairs(workspace:GetDescendants()) do
	c(o)
end

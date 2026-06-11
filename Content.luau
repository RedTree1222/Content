local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local p = game.Players.LocalPlayer
local m = p:GetMouse()
local c = p.Character or p.CharacterAdded:Wait()
local h = c:WaitForChild("Humanoid")
local hrp = c:WaitForChild("HumanoidRootPart")

local tool = game:GetObjects("rbxassetid://85838882884629")[1]
tool.Parent = p.Backpack

local p1 = tool:WaitForChild("Empty.001")
local p2 = tool:WaitForChild("Sphere")

local s1 = p1.Size
local s2 = p2.Size

local ti = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local jti = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local bti = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)

local jumping = false
local mouseMode = false

local function sq(part, orig)
	if jumping then return end
	local target = Vector3.new(orig.X * 0.5, orig.Y * 1.5, orig.Z * 0.5)
	local t1 = ts:Create(part, ti, {Size = target})
	local t2 = ts:Create(part, ti, {Size = orig})
	
	t1:Play()
	t1.Completed:Connect(function()
		t2:Play()
	end)
end

tool.Equipped:Connect(function()
	local rh = c:WaitForChild("RightHand", 2)
	if rh then
		local rg = rh:WaitForChild("RightGrip", 2)
		if rg then rg:Destroy() end
	end
end)

tool.Activated:Connect(function()
	sq(p1, s1)
	sq(p2, s2)
end)

local loop = true
task.spawn(function()
	while loop do
		task.wait(0.3)
		if tool.Parent == c and h.MoveDirection.Magnitude > 0 and not jumping then
			sq(p1, s1)
			sq(p2, s2)
		end
	end
end)

local handle = tool:FindFirstChild("Handle")
if handle then
	handle.CanCollide = false
	handle.Anchored = true
	
	task.spawn(function()
		while loop do
			task.wait()
			if tool.Parent == c and not jumping then
				if mouseMode then
					local targetPos = m.Hit.Position + Vector3.new(0, 1.5, 0)
					handle.CFrame = CFrame.new(targetPos, hrp.Position) * CFrame.Angles(0, math.pi, 0)
				else
					handle.CFrame = hrp.CFrame * CFrame.new(0, -2.0, -3) * CFrame.Angles(0, math.pi, 0)
				end
			end
		end
	end)
end

local function jumpScare()
	if jumping or mouseMode or tool.Parent ~= c or not handle then return end
	jumping = true

	local p1_squat = Vector3.new(s1.X * 1.5, s1.Y * 0.4, s1.Z * 1.5)
	local p2_squat = Vector3.new(s2.X * 1.5, s2.Y * 0.4, s2.Z * 1.5)
	
	local c1 = ts:Create(p1, TweenInfo.new(0.2), {Size = p1_squat})
	local c2 = ts:Create(p2, TweenInfo.new(0.2), {Size = p2_squat})
	c1:Play()
	c2:Play()
	task.wait(0.2)

	local origP1Size = ts:Create(p1, TweenInfo.new(0.1), {Size = s1})
	local origP2Size = ts:Create(p2, TweenInfo.new(0.1), {Size = s2})
	origP1Size:Play()
	origP2Size:Play()

	local head = c:WaitForChild("Head")
	local faceTarget = head.CFrame * CFrame.new(0, 0, -2)
	
	local j1 = ts:Create(handle, jti, {CFrame = faceTarget})
	j1:Play()
	j1.Completed:Wait()
	
	task.wait(0.3)
	
	local returnPos = hrp.CFrame * CFrame.new(0, -2.0, -3) * CFrame.Angles(0, math.pi, 0)
	local b1 = ts:Create(handle, bti, {CFrame = returnPos})
	b1:Play()
	b1.Completed:Wait()
	
	jumping = false
end

uis.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.UserInputType == Enum.UserInputType.MouseButton2 then
		jumpScare()
	elseif input.KeyCode == Enum.KeyCode.B and tool.Parent == c and not jumping then
		mouseMode = not mouseMode
	end
end)

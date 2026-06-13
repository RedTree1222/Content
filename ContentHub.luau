local uis = game:GetService("UserInputService")
local p = game.Players.LocalPlayer
local pg = p:FindFirstChildOfClass("PlayerGui") or p:WaitForChild("PlayerGui")

local url = "https://github.com/RedTree1222/Content/raw/refs/heads/main/ContentHub.rbxm"
writefile("ContentHub.rbxm", game:HttpGet(url))

local hg = game:GetObjects(getcustomasset("ContentHub.rbxm"))[1]
hg.Parent = pg

local cn = hg:WaitForChild("Container")
local hd = cn:WaitForChild("Header")
local cb = hd:WaitForChild("CloseButton")

local faa = cn:WaitForChild("FrameAa")
local fa = faa:WaitForChild("FrameA")
local fb = fa:WaitForChild("FrameB")

local cs = fb:WaitForChild("Content Scripts")

hg.Enabled = true
cn.Visible = false

local function tgl()
    cn.Visible = not cn.Visible
end

cb.MouseButton1Click:Connect(tgl)

uis.InputBegan:Connect(function(i, gpe)
    if gpe then return end
    if i.KeyCode == Enum.KeyCode.RightControl then
        tgl()
    end
end)

if cs:FindFirstChild("Content") then
    cs.Content.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RedTree1222/Content/refs/heads/main/Content.luau"))()
    end)
end

if cs:FindFirstChild("ContentGun") then
    cs.ContentGun.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RedTree1222/Content/refs/heads/main/ContentGun.luau"))()
    end)
end

if cs:FindFirstChild("ContentCatMode") then
    cs.ContentCatMode.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RedTree1222/Content/refs/heads/main/ContentCatMode.luau"))()
    end)
end

if cs:FindFirstChild("ContentSeek") then
    cs.ContentSeek.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RedTree1222/Content/refs/heads/main/ContentSeek.luau"))()
    end)
end

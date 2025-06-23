-- Sigma Hub V4 (Ultimate by Bot418)

--===[ Anti Lag ]===--
for _, v in pairs(game:GetDescendants()) do
	if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Explosion") then
		v:Destroy()
	elseif v:IsA("Decal") or v:IsA("Texture") then
		v.Transparency = 1
	end
end
local lighting = game:GetService("Lighting")
lighting.FogEnd = 100000
lighting.Brightness = 1
lighting.GlobalShadows = false

--===[ Services & Player Setup ]===--
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

--===[ GUI Setup ]===--
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "SigmaHubV4"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 260)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Text = "Sigma Hub V4"
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(1, 1, 1)

--===[ Tab Buttons ]===--
local tabs = Instance.new("Frame", frame)
tabs.Size = UDim2.new(0, 100, 1, -35)
tabs.Position = UDim2.new(0, 0, 0, 35)
tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

local content = Instance.new("Frame", frame)
content.Size = UDim2.new(1, -100, 1, -35)
content.Position = UDim2.new(0, 100, 0, 35)
content.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local function newTab(name)
	local btn = Instance.new("TextButton", tabs)
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Text = name
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.TextColor3 = Color3.new(1, 1, 1)

	local tabFrame = Instance.new("Frame", content)
	tabFrame.Name = name
	tabFrame.Size = UDim2.new(1, 0, 1, 0)
	tabFrame.BackgroundTransparency = 1
	tabFrame.Visible = false

	btn.MouseButton1Click:Connect(function()
		for _, f in pairs(content:GetChildren()) do
			if f:IsA("Frame") then f.Visible = false end
		end
		tabFrame.Visible = true
	end)

	return tabFrame
end

local function newButton(parent, text, action)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(0, 200, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, #parent:GetChildren() * 45)
	btn.Text = text
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 14
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
	btn.MouseButton1Click:Connect(action)
end

--===[ Tabs ]===--
local mainTab = newTab("Main")
mainTab.Visible = true
local miscTab = newTab("Misc")

--===[ Main Tab Buttons ]===--

-- Infinite Yield
newButton(mainTab, "Load Infinite Yield", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- Speed Toggle
local speedOn = false
newButton(mainTab, "Toggle Speed", function()
	speedOn = not speedOn
	local hum = player.Character and player.Character:FindFirstChild("Humanoid")
	if hum then
		hum.WalkSpeed = speedOn and 80 or 16
	end
end)

-- Noclip Toggle
local noclip = false
newButton(mainTab, "Toggle Noclip", function()
	noclip = not noclip
	RS.Stepped:Connect(function()
		if noclip and player.Character then
			for _, part in pairs(player.Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end
	end)
end)

-- Fly Toggle
local flying = false
local flyspeed = 2
local vel, gyro

newButton(mainTab, "Toggle Fly", function()
	flying = not flying
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local root = char:FindFirstChild("HumanoidRootPart")

	if flying then
		vel = Instance.new("BodyVelocity", root)
		gyro = Instance.new("BodyGyro", root)
		vel.Velocity = Vector3.zero
		vel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		gyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		gyro.CFrame = root.CFrame

		RS.RenderStepped:Connect(function()
			if flying and root then
				gyro.CFrame = workspace.CurrentCamera.CFrame
				local move = Vector3.zero
				if UIS:IsKeyDown(Enum.KeyCode.W) then move = move + workspace.CurrentCamera.CFrame.LookVector end
				if UIS:IsKeyDown(Enum.KeyCode.S) then move = move - workspace.CurrentCamera.CFrame.LookVector end
				if UIS:IsKeyDown(Enum.KeyCode.A) then move = move - workspace.CurrentCamera.CFrame.RightVector end
				if UIS:IsKeyDown(Enum.KeyCode.D) then move = move + workspace.CurrentCamera.CFrame.RightVector end
				vel.Velocity = move * flyspeed
			end
		end)
	else
		if vel then vel:Destroy() end
		if gyro then gyro:Destroy() end
	end
end)

--===[ Teleport to Player ]===--
newButton(mainTab, "Teleport to Player", function()
	local name = tostring(game:GetService("StarterGui"):PromptInput("Enter player name:"))
	local target = Players:FindFirstChild(name)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		local myChar = player.Character
		if myChar and myChar:FindFirstChild("HumanoidRootPart") then
			myChar:MoveTo(target.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
		end
	else
		warn("Player not found!")
	end
end)

--===[ Misc Tab ]===--
newButton(miscTab, "Re-Apply Anti Lag", function()
	for _, v in pairs(game:GetDescendants()) do
		if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Explosion") then
			v:Destroy()
		elseif v:IsA("Decal") or v:IsA("Texture") then
			v.Transparency = 1
		end
	end
	lighting.FogEnd = 100000
	lighting.Brightness = 1
	lighting.GlobalShadows = false
end)

-- Sigma Hub V3 (Remake by Bot418)

--===[ Anti Lag Script ]===--
for _, v in pairs(game:GetDescendants()) do
	if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Explosion") then
		v:Destroy()
	elseif v:IsA("Decal") or v:IsA("Texture") then
		v.Transparency = 1
	end
end
game:GetService("Lighting").FogEnd = 100000
game:GetService("Lighting").Brightness = 1
game:GetService("Lighting").GlobalShadows = false

--===[ GUI Setup ]===--
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
local Title = Instance.new("TextLabel", MainFrame)
local TabButtons = Instance.new("Frame", MainFrame)
local ContentFrame = Instance.new("Frame", MainFrame)
local UICorner = Instance.new("UICorner", MainFrame)

ScreenGui.Name = "SigmaHub"
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
UICorner.CornerRadius = UDim.new(0, 10)

Title.Text = "Sigma Hub V3"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = MainFrame

TabButtons.Size = UDim2.new(0, 100, 1, -40)
TabButtons.Position = UDim2.new(0, 0, 0, 40)
TabButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabButtons.Parent = MainFrame

ContentFrame.Size = UDim2.new(1, -100, 1, -40)
ContentFrame.Position = UDim2.new(0, 100, 0, 40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ContentFrame.Parent = MainFrame

local function createTab(name)
	local button = Instance.new("TextButton", TabButtons)
	button.Size = UDim2.new(1, 0, 0, 40)
	button.Text = name
	button.TextColor3 = Color3.new(1, 1, 1)
	button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14

	local frame = Instance.new("Frame", ContentFrame)
	frame.Name = name
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.Visible = false
	frame.BackgroundTransparency = 1

	button.MouseButton1Click:Connect(function()
		for _, tab in pairs(ContentFrame:GetChildren()) do
			if tab:IsA("Frame") then tab.Visible = false end
		end
		frame.Visible = true
	end)

	return frame
end

local function createButton(parent, text, callback)
	local btn = Instance.new("TextButton", parent)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position =

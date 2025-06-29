-- ✅ Stable Version: GPT Executor Universal Edition local CoreGui = game:GetService("CoreGui") local Players = game:GetService("Players") local success, err = pcall(function()

-- Cleanup old instance
if CoreGui:FindFirstChild("GPTExecutor") then
    CoreGui.GPTExecutor:Destroy()
end

-- GUI Root
local gui = Instance.new("ScreenGui")
gui.Name = "GPTExecutor"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 500, 0, 320)
frame.Position = UDim2.new(0.25, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", frame)

-- TextBox input
local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(0, 480, 0, 180)
textbox.Position = UDim2.new(0, 10, 0, 10)
textbox.Text = "-- Paste script here"
textbox.TextXAlignment = Enum.TextXAlignment.Left
textbox.TextYAlignment = Enum.TextYAlignment.Top
textbox.ClearTextOnFocus = false
textbox.MultiLine = true
textbox.Font = Enum.Font.Code
textbox.TextSize = 16
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Execute Button
local execBtn = Instance.new("TextButton", frame)
execBtn.Size = UDim2.new(0, 150, 0, 35)
execBtn.Position = UDim2.new(0, 10, 0, 200)
execBtn.Text = "▶️ Execute"
execBtn.Font = Enum.Font.SourceSansBold
execBtn.TextSize = 20
execBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
execBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

execBtn.MouseButton1Click:Connect(function()
    local input = textbox.Text
    if input and input ~= "" then
        local ok, result = pcall(function()
            loadstring(input)()
        end)
        if not ok then
            warn("[Executor] Script Error:", result)
        end
    end
end)

-- Load Sigma Hub
local sigmaBtn = Instance.new("TextButton", frame)
sigmaBtn.Size = UDim2.new(0, 200, 0, 30)
sigmaBtn.Position = UDim2.new(0, 180, 0, 200)
sigmaBtn.Text = "Load Sigma Hub V4"
sigmaBtn.Font = Enum.Font.SourceSans
sigmaBtn.TextSize = 18
sigmaBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
sigmaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

sigmaBtn.MouseButton1Click:Connect(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bot418/Sigma-hub-v4-Ability/main/sigma-hub-v4.lua"))()
    end)
end)

-- Require ID Input
local requireBox = Instance.new("TextBox", frame)
requireBox.Size = UDim2.new(0, 280, 0, 30)
requireBox.Position = UDim2.new(0, 10, 0, 250)
requireBox.PlaceholderText = "Masukkan Module ID di sini"
requireBox.Text = ""
requireBox.TextSize = 16
requireBox.Font = Enum.Font.Code
requireBox.TextColor3 = Color3.fromRGB(255, 255, 255)
requireBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local requireBtn = Instance.new("TextButton", frame)
requireBtn.Size = UDim2.new(0, 180, 0, 30)
requireBtn.Position = UDim2.new(0, 300, 0, 250)
requireBtn.Text = "🔄 Require Module"
requireBtn.Font = Enum.Font.SourceSans
requireBtn.TextSize = 18
requireBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
requireBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

requireBtn.MouseButton1Click:Connect(function()
    local id = tonumber(requireBox.Text)
    if id then
        pcall(function()
            require(id)
        end)
    else
        warn("[Executor] ID harus berupa angka valid")
    end
end)

end)

if not success then warn("[GPT Executor] Failed to load:", err) end


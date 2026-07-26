-- [[ 1. THÔNG BÁO BẮT ĐẦU LOAD SCRIPT ]]
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "★ MRGHOST HUB ★",
        Text = "Đang tải dữ liệu, vui lòng chờ...",
        Duration = 3
    })
end)

-- Services
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- ScreenGui Container
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MrGhostHub_UI"
ScreenGui.Parent = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Dynamic RGB Color Helper
local function getRGBColor()
    local hue = (tick() % 4) / 4
    return Color3.fromHSV(hue, 0.9, 1)
end

-- Main Frame (Menu)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 150)
MainFrame.Position = UDim2.new(0.5, -160, 0.4, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- RGB Border (Viền 7 màu)
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

-- Title Bar Header
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 16)
TitleBarCorner.Parent = TitleBar

-- Fix góc bo dưới TitleBar
local TitleBarFix = Instance.new("Frame")
TitleBarFix.Size = UDim2.new(1, 0, 0, 10)
TitleBarFix.Position = UDim2.new(0, 0, 1, -10)
TitleBarFix.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
TitleBarFix.BorderSizePixel = 0
TitleBarFix.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "👻  MRGHOST HUB  👻"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 19
Title.Font = Enum.Font.FredokaOne
Title.Parent = TitleBar

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 240, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 0))
}
TitleGradient.Parent = Title

-- Container Content
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -24, 1, -65)
Container.Position = UDim2.new(0, 12, 0, 60)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- Full Light Toggle Box
local LightCard = Instance.new("Frame")
LightCard.Name = "LightCard"
LightCard.Size = UDim2.new(1, 0, 0, 60)
LightCard.BackgroundColor3 = Color3.fromRGB(25, 25, 36)
LightCard.Parent = Container

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 12)
CardCorner.Parent = LightCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Thickness = 1
CardStroke.Color = Color3.fromRGB(45, 45, 65)
CardStroke.Parent = LightCard

-- Label Text
local CardLabel = Instance.new("TextLabel")
CardLabel.Size = UDim2.new(0.65, 0, 1, 0)
CardLabel.Position = UDim2.new(0, 15, 0, 0)
CardLabel.BackgroundTransparency = 1
CardLabel.Text = "💡  Full Light"
CardLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
CardLabel.TextSize = 16
CardLabel.Font = Enum.Font.SourceSansBold
CardLabel.TextXAlignment = Enum.TextXAlignment.Left
CardLabel.Parent = LightCard

-- Toggle Switch Frame
local SwitchBg = Instance.new("TextButton")
SwitchBg.Name = "SwitchBg"
SwitchBg.Size = UDim2.new(0, 50, 0, 26)
SwitchBg.Position = UDim2.new(1, -62, 0.5, -13)
SwitchBg.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
SwitchBg.Text = ""
SwitchBg.AutoButtonColor = false
SwitchBg.Parent = LightCard

local SwitchCorner = Instance.new("UICorner")
SwitchCorner.CornerRadius = UDim.new(1, 0)
SwitchCorner.Parent = SwitchBg

local SwitchDot = Instance.new("Frame")
SwitchDot.Name = "SwitchDot"
SwitchDot.Size = UDim2.new(0, 20, 0, 20)
SwitchDot.Position = UDim2.new(0, 3, 0.5, -10)
SwitchDot.BackgroundColor3 = Color3.fromRGB(180, 180, 190)
SwitchDot.Parent = SwitchBg

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = SwitchDot

-- Floating Toggle Menu Button (Nút con ma 👻)
local ToggleMenuBtn = Instance.new("TextButton")
ToggleMenuBtn.Name = "ToggleMenuBtn"
ToggleMenuBtn.Size = UDim2.new(0, 52, 0, 52)
ToggleMenuBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
ToggleMenuBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
ToggleMenuBtn.Text = "👻"
ToggleMenuBtn.TextSize = 26
ToggleMenuBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleMenuBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 2.5
ToggleStroke.Parent = ToggleMenuBtn

--- =====================================================
---                 ANIMATION & LOGIC
--- =====================================================

-- Viền RGB + Gradient Xoay
RunService.RenderStepped:Connect(function()
    local rainbowColor = getRGBColor()
    UIStroke.Color = rainbowColor
    ToggleStroke.Color = rainbowColor
    TitleGradient.Rotation = (tick() * 80) % 360
end)

-- Dragging (Kéo thả)
local function makeDraggable(gui)
    local dragging, dragInput, dragStart, startPos
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(MainFrame)
makeDraggable(ToggleMenuBtn)

-- Toggle Show/Hide Menu
local menuVisible = true
ToggleMenuBtn.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    MainFrame.Visible = menuVisible
    
    TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 44, 0, 44)
    }):Play()
    task.wait(0.1)
    TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 52, 0, 52)
    }):Play()
end)

-- LOGIC FULL LIGHT
local fullLightEnabled = false
local brightnessConn, clockConn, fogConn, childConn

local function forceFullBright()
    pcall(function()
        Lighting.Brightness = 4
        Lighting.ClockTime = 14
        Lighting.FogEnd = 1e6
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    end)
end

local function clearDarkEffects()
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Atmosphere") or child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") or child:IsA("DepthOfFieldEffect") then
            pcall(function() child:Destroy() end)
        end
    end
end

local function attachSuperLight(character)
    if not character then return end
    local root = character:WaitForChild("HumanoidRootPart", 5)
    if not root then return end
    if root:FindFirstChild("GhostLight") then root.GhostLight:Destroy() end
    
    local light = Instance.new("PointLight")
    light.Name = "GhostLight"
    light.Brightness = 10
    light.Range = 250
    light.Shadows = false
    light.Parent = root
end

local function removeSuperLight(character)
    if character and character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart:FindFirstChild("GhostLight") then
        character.HumanoidRootPart.GhostLight:Destroy()
    end
end

local function setFullLightState(state)
    fullLightEnabled = state
    
    if fullLightEnabled then
        -- Tween Switch sang ON
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 230, 120)}):Play()
        TweenService:Create(SwitchDot, TweenInfo.new(0.2), {
            Position = UDim2.new(1, -23, 0.5, -10),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        TweenService:Create(CardStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 230, 120)}):Play()
        
        clearDarkEffects()
        forceFullBright()
        if LocalPlayer.Character then attachSuperLight(LocalPlayer.Character) end
        
        brightnessConn = Lighting:GetPropertyChangedSignal("Brightness"):Connect(forceFullBright)
        clockConn = Lighting:GetPropertyChangedSignal("ClockTime"):Connect(forceFullBright)
        fogConn = Lighting:GetPropertyChangedSignal("FogEnd"):Connect(forceFullBright)
        childConn = Lighting.ChildAdded:Connect(function(child)
            if child:IsA("Atmosphere") or child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") or child:IsA("DepthOfFieldEffect") then
                task.wait()
                pcall(function() child:Destroy() end)
            end
        end)
    else
        -- Tween Switch sang OFF
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 60)}):Play()
        TweenService:Create(SwitchDot, TweenInfo.new(0.2), {
            Position = UDim2.new(0, 3, 0.5, -10),
            BackgroundColor3 = Color3.fromRGB(180, 180, 190)
        }):Play()
        TweenService:Create(CardStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(45, 45, 65)}):Play()
        
        if brightnessConn then brightnessConn:Disconnect() end
        if clockConn then clockConn:Disconnect() end
        if fogConn then fogConn:Disconnect() end
        if childConn then childConn:Disconnect() end
        
        if LocalPlayer.Character then removeSuperLight(LocalPlayer.Character) end
    end
end

SwitchBg.MouseButton1Click:Connect(function()
    setFullLightState(not fullLightEnabled)
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    if fullLightEnabled then
        task.wait(1)
        attachSuperLight(char)
        forceFullBright()
    end
end)

-- [[ 2. THÔNG BÁO HOÀN TẤT ]]
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "★ MRGHOST HUB ★",
        Text = "Đã kích hoạt! Bấm nút 👻 để ẩn/hiện menu.",
        Duration = 5
    })
end)

print("[★ MRGHOST HUB ★] Loaded successfully with Premium UI!")

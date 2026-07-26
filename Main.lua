-- [[ 1. THÔNG BÁO BẮT ĐẦU LOAD SCRIPT ]]
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "★ MRGHOST HUB VIP ★",
        Text = "Đang tải giao diện Premium Cyberpunk...",
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
ScreenGui.Name = "MrGhostHub_VIP_UI"
ScreenGui.Parent = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Helper RGB Dynamic Color
local function getRGBColor(speed)
    speed = speed or 4
    local hue = (tick() % speed) / speed
    return Color3.fromHSV(hue, 0.85, 1)
end

-- =========================================================
-- MAIN FRAME (CYBERPUNK GLASSES)
-- =========================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 200)
MainFrame.Position = UDim2.new(0.5, -170, 0.4, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = MainFrame

-- Viền LED Neon Glow kép
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame

-- =========================================================
-- TITLE HEADER
-- =========================================================
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
TitleBar.BackgroundTransparency = 0.2
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 18)
TitleBarCorner.Parent = TitleBar

local TitleBarFix = Instance.new("Frame")
TitleBarFix.Size = UDim2.new(1, 0, 0, 12)
TitleBarFix.Position = UDim2.new(0, 0, 1, -12)
TitleBarFix.BackgroundColor3 = Color3.fromRGB(18, 18, 28)
TitleBarFix.BackgroundTransparency = 0.2
TitleBarFix.BorderSizePixel = 0
TitleBarFix.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "👻  MRGHOST HUB VIP  👻"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 19
Title.Font = Enum.Font.FredokaOne
Title.Parent = TitleBar

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 240, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 180)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 150))
}
TitleGradient.Parent = Title

-- Line phân cách Neon
local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(1, -24, 0, 1)
Separator.Position = UDim2.new(0, 12, 0, 50)
Separator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Separator.BorderSizePixel = 0
Separator.Parent = MainFrame

local SepGradient = Instance.new("UIGradient")
SepGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 240, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
SepGradient.Parent = Separator

-- =========================================================
-- CONTAINER & CARDS
-- =========================================================
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -24, 1, -65)
Container.Position = UDim2.new(0, 12, 0, 58)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local LightCard = Instance.new("Frame")
LightCard.Name = "LightCard"
LightCard.Size = UDim2.new(1, 0, 1, 0)
LightCard.BackgroundColor3 = Color3.fromRGB(22, 22, 34)
LightCard.BackgroundTransparency = 0.3
LightCard.Parent = Container

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 14)
CardCorner.Parent = LightCard

local CardStroke = Instance.new("UIStroke")
CardStroke.Thickness = 1.5
CardStroke.Color = Color3.fromRGB(50, 50, 75)
CardStroke.Parent = LightCard

-- Label Full Light
local CardLabel = Instance.new("TextLabel")
CardLabel.Size = UDim2.new(0.6, 0, 0, 45)
CardLabel.Position = UDim2.new(0, 14, 0, 2)
CardLabel.BackgroundTransparency = 1
CardLabel.Text = "⚡  Full Light Mode"
CardLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CardLabel.TextSize = 16
CardLabel.Font = Enum.Font.FredokaOne
CardLabel.TextXAlignment = Enum.TextXAlignment.Left
CardLabel.Parent = LightCard

-- Switch Button
local SwitchBg = Instance.new("TextButton")
SwitchBg.Name = "SwitchBg"
SwitchBg.Size = UDim2.new(0, 50, 0, 26)
SwitchBg.Position = UDim2.new(1, -64, 0, 12)
SwitchBg.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
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
SwitchDot.BackgroundColor3 = Color3.fromRGB(150, 150, 170)
SwitchDot.Parent = SwitchBg

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = SwitchDot

-- =========================================================
-- SLIDER CYBERPUNK
-- =========================================================
local SliderValLabel = Instance.new("TextLabel")
SliderValLabel.Name = "SliderValLabel"
SliderValLabel.Size = UDim2.new(1, -28, 0, 20)
SliderValLabel.Position = UDim2.new(0, 14, 0, 50)
SliderValLabel.BackgroundTransparency = 1
SliderValLabel.Text = "Cường độ sáng:  4.0  (40%)"
SliderValLabel.TextColor3 = Color3.fromRGB(0, 240, 255)
SliderValLabel.TextSize = 13
SliderValLabel.Font = Enum.Font.SourceSansBold
SliderValLabel.TextXAlignment = Enum.TextXAlignment.Left
SliderValLabel.Parent = LightCard

local SliderFrame = Instance.new("Frame")
SliderFrame.Name = "SliderFrame"
SliderFrame.Size = UDim2.new(1, -28, 0, 16)
SliderFrame.Position = UDim2.new(0, 14, 0, 78)
SliderFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
SliderFrame.Parent = LightCard

local SliderFrameCorner = Instance.new("UICorner")
SliderFrameCorner.CornerRadius = UDim.new(1, 0)
SliderFrameCorner.Parent = SliderFrame

local SliderFill = Instance.new("Frame")
SliderFill.Name = "SliderFill"
SliderFill.Size = UDim2.new(0.4, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
SliderFill.Parent = SliderFrame

local SliderFillCorner = Instance.new("UICorner")
SliderFillCorner.CornerRadius = UDim.new(1, 0)
SliderFillCorner.Parent = SliderFill

local SliderBtn = Instance.new("TextButton")
SliderBtn.Name = "SliderBtn"
SliderBtn.Size = UDim2.new(1, 0, 1, 0)
SliderBtn.BackgroundTransparency = 1
SliderBtn.Text = ""
SliderBtn.Parent = SliderFrame

-- =========================================================
-- FLOATING TOGGLE BUTTON (Nút con ma 👻)
-- =========================================================
local ToggleMenuBtn = Instance.new("TextButton")
ToggleMenuBtn.Name = "ToggleMenuBtn"
ToggleMenuBtn.Size = UDim2.new(0, 55, 0, 55)
ToggleMenuBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
ToggleMenuBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
ToggleMenuBtn.BackgroundTransparency = 0.1
ToggleMenuBtn.Text = "👻"
ToggleMenuBtn.TextSize = 28
ToggleMenuBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(1, 0)
ToggleCorner.Parent = ToggleMenuBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 3
ToggleStroke.Parent = ToggleMenuBtn

-- =========================================================
-- ANIMATIONS & LOGIC
-- =========================================================

-- Viền LED RGB Chạy mượt
RunService.RenderStepped:Connect(function()
    local rainbowColor = getRGBColor(3)
    UIStroke.Color = rainbowColor
    ToggleStroke.Color = rainbowColor
    TitleGradient.Rotation = (tick() * 90) % 360
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

-- Toggle Menu Anim
local menuVisible = true
ToggleMenuBtn.MouseButton1Click:Connect(function()
    menuVisible = not menuVisible
    MainFrame.Visible = menuVisible
    
    TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 45, 0, 45)
    }):Play()
    task.wait(0.12)
    TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.12, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 55, 0, 55)
    }):Play()
end)

-- LOGIC FULL LIGHT & SLIDER
local fullLightEnabled = false
local currentBrightness = 4
local maxBrightness = 10
local minBrightness = 0.5
local brightnessConn, clockConn, fogConn, childConn

local function forceFullBright()
    pcall(function()
        Lighting.Brightness = currentBrightness
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
    light.Brightness = currentBrightness * 2.5
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
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 240, 255)}):Play()
        TweenService:Create(SwitchDot, TweenInfo.new(0.2), {
            Position = UDim2.new(1, -23, 0.5, -10),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
        TweenService:Create(CardStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(0, 240, 255)}):Play()
        
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
        TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 55)}):Play()
        TweenService:Create(SwitchDot, TweenInfo.new(0.2), {
            Position = UDim2.new(0, 3, 0.5, -10),
            BackgroundColor3 = Color3.fromRGB(150, 150, 170)
        }):Play()
        TweenService:Create(CardStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(50, 50, 75)}):Play()
        
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

-- SLIDER DRAGGING LOGIC
local isSliding = false
local function updateSlider(input)
    local posX = input.Position.X - SliderFrame.AbsolutePosition.X
    local percent = math.clamp(posX / SliderFrame.AbsoluteSize.X, 0, 1)
    
    SliderFill.Size = UDim2.new(percent, 0, 1, 0)
    currentBrightness = math.round((minBrightness + (percent * (maxBrightness - minBrightness))) * 10) / 10
    
    local intPercent = math.round(percent * 100)
    SliderValLabel.Text = "Cường độ sáng:  " .. string.format("%.1f", currentBrightness) .. "  (" .. intPercent .. "%)"
    
    if fullLightEnabled then
        forceFullBright()
        if LocalPlayer.Character then attachSuperLight(LocalPlayer.Character) end
    end
end

SliderBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isSliding = true
        updateSlider(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isSliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updateSlider(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isSliding = false
    end
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
        Title = "★ MRGHOST HUB VIP ★",
        Text = "Kích hoạt thành công! Giao diện Cyberpunk đã sẵn sàng.",
        Duration = 5
    })
end)

print("[★ MRGHOST HUB ★] Loaded successfully with Cyberpunk VIP UI!")

-- [[ TỰ KIỂM TRA LỖI LOAD SCRIPT ]]
local success, err = pcall(function()

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
    ScreenGui.Name = "MrGhostHub_UltraVIP_UI"
    ScreenGui.Parent = (gethui and gethui()) or CoreGui or LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    -- Helper RGB Dynamic Color
    local function getRGBColor(speed)
        speed = speed or 3
        local hue = (tick() % speed) / speed
        return Color3.fromHSV(hue, 0.85, 1)
    end

    -- =========================================================
    -- MAIN FRAME (CYBERPUNK ULTRA PREMIUM)
    -- =========================================================
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 360, 0, 220)
    MainFrame.Position = UDim2.new(0.5, -180, 0.4, -110)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
    MainFrame.BackgroundTransparency = 0.15
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = false
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 20)
    MainCorner.Parent = MainFrame

    -- Viền LED RGB Chạy Mượt
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Thickness = 2.5
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Parent = MainFrame

    -- =========================================================
    -- TITLE HEADER VIP WITH ANIMATED ICON TTTT
    -- =========================================================
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 52)
    TitleBar.BackgroundColor3 = Color3.fromRGB(18, 14, 28)
    TitleBar.BackgroundTransparency = 0.2
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame

    local TitleBarCorner = Instance.new("UICorner")
    TitleBarCorner.CornerRadius = UDim.new(0, 20)
    TitleBarCorner.Parent = TitleBar

    local TitleBarFix = Instance.new("Frame")
    TitleBarFix.Size = UDim2.new(1, 0, 0, 15)
    TitleBarFix.Position = UDim2.new(0, 0, 1, -15)
    TitleBarFix.BackgroundColor3 = Color3.fromRGB(18, 14, 28)
    TitleBarFix.BackgroundTransparency = 0.2
    TitleBarFix.BorderSizePixel = 0
    TitleBarFix.Parent = TitleBar

    -- Badge VIP
    local VipBadge = Instance.new("TextLabel")
    VipBadge.Size = UDim2.new(0, 40, 0, 22)
    VipBadge.Position = UDim2.new(0, 12, 0.5, -11)
    VipBadge.BackgroundColor3 = Color3.fromRGB(255, 0, 120)
    VipBadge.Text = "VIP"
    VipBadge.TextColor3 = Color3.fromRGB(255, 255, 255)
    VipBadge.TextSize = 12
    VipBadge.Font = Enum.Font.FredokaOne
    VipBadge.Parent = TitleBar

    local BadgeCorner = Instance.new("UICorner")
    BadgeCorner.CornerRadius = UDim.new(0, 6)
    BadgeCorner.Parent = VipBadge

    -- Title Text Main
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 165, 1, 0)
    Title.Position = UDim2.new(0, 58, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "MRGHOST HUB VIP"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.Font = Enum.Font.FredokaOne
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TitleBar

    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 180)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 240, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 220, 0))
    }
    TitleGradient.Parent = Title

    -- ICON HOẠT ĐỘNG (ANIMATED ICON 💖 TTTT)
    local AnimatedIconLabel = Instance.new("TextLabel")
    AnimatedIconLabel.Name = "AnimatedIconLabel"
    AnimatedIconLabel.Size = UDim2.new(0, 85, 1, 0)
    AnimatedIconLabel.Position = UDim2.new(0, 225, 0, 0)
    AnimatedIconLabel.BackgroundTransparency = 1
    AnimatedIconLabel.Text = "💖 TTTT"
    AnimatedIconLabel.TextColor3 = Color3.fromRGB(255, 100, 180)
    AnimatedIconLabel.TextSize = 13
    AnimatedIconLabel.Font = Enum.Font.FredokaOne
    AnimatedIconLabel.TextXAlignment = Enum.TextXAlignment.Left
    AnimatedIconLabel.Parent = TitleBar

    -- Hiệu ứng Nhịp Thở Phồng To Thu Nhỏ Cho Icon TTTT
    task.spawn(function()
        while task.wait() do
            TweenService:Create(AnimatedIconLabel, TweenInfo.new(0.8, Enum.EasingStyle.Sin, Enum.EasingDirection.InOut), {TextSize = 15}):Play()
            task.wait(0.8)
            TweenService:Create(AnimatedIconLabel, TweenInfo.new(0.8, Enum.EasingStyle.Sin, Enum.EasingDirection.InOut), {TextSize = 12}):Play()
            task.wait(0.8)
        end
    end)

    -- Status Dot
    local StatusDot = Instance.new("Frame")
    StatusDot.Size = UDim2.new(0, 8, 0, 8)
    StatusDot.Position = UDim2.new(1, -18, 0.5, -4)
    StatusDot.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
    StatusDot.Parent = TitleBar

    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = StatusDot

    -- Line phân cách Neon
    local Separator = Instance.new("Frame")
    Separator.Size = UDim2.new(1, -24, 0, 1)
    Separator.Position = UDim2.new(0, 12, 0, 52)
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
    Container.Size = UDim2.new(1, -24, 1, -68)
    Container.Position = UDim2.new(0, 12, 0, 60)
    Container.BackgroundTransparency = 1
    Container.Parent = MainFrame

    local LightCard = Instance.new("Frame")
    LightCard.Name = "LightCard"
    LightCard.Size = UDim2.new(1, 0, 1, 0)
    LightCard.BackgroundColor3 = Color3.fromRGB(20, 16, 28)
    LightCard.BackgroundTransparency = 0.25
    LightCard.Parent = Container

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 14)
    CardCorner.Parent = LightCard

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Thickness = 1.5
    CardStroke.Color = Color3.fromRGB(60, 45, 80)
    CardStroke.Parent = LightCard

    -- Label Full Light
    local CardLabel = Instance.new("TextLabel")
    CardLabel.Size = UDim2.new(0.6, 0, 0, 45)
    CardLabel.Position = UDim2.new(0, 14, 0, 2)
    CardLabel.BackgroundTransparency = 1
    CardLabel.Text = "⚡  Full Light Mode"
    CardLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CardLabel.TextSize = 15
    CardLabel.Font = Enum.Font.FredokaOne
    CardLabel.TextXAlignment = Enum.TextXAlignment.Left
    CardLabel.Parent = LightCard

    -- Switch Button
    local SwitchBg = Instance.new("TextButton")
    SwitchBg.Name = "SwitchBg"
    SwitchBg.Size = UDim2.new(0, 52, 0, 26)
    SwitchBg.Position = UDim2.new(1, -66, 0, 12)
    SwitchBg.BackgroundColor3 = Color3.fromRGB(40, 32, 55)
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
    SwitchDot.BackgroundColor3 = Color3.fromRGB(160, 140, 180)
    SwitchDot.Parent = SwitchBg

    local SwitchDotCorner = Instance.new("UICorner")
    SwitchDotCorner.CornerRadius = UDim.new(1, 0)
    SwitchDotCorner.Parent = SwitchDot

    -- =========================================================
    -- SLIDER CYBERPUNK ULTRA
    -- =========================================================
    local SliderValLabel = Instance.new("TextLabel")
    SliderValLabel.Name = "SliderValLabel"
    SliderValLabel.Size = UDim2.new(1, -28, 0, 20)
    SliderValLabel.Position = UDim2.new(0, 14, 0, 52)
    SliderValLabel.BackgroundTransparency = 1
    SliderValLabel.Text = "Cường độ sáng:  4.0  (40%)"
    SliderValLabel.TextColor3 = Color3.fromRGB(255, 100, 200)
    SliderValLabel.TextSize = 13
    SliderValLabel.Font = Enum.Font.SourceSansBold
    SliderValLabel.TextXAlignment = Enum.TextXAlignment.Left
    SliderValLabel.Parent = LightCard

    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = "SliderFrame"
    SliderFrame.Size = UDim2.new(1, -28, 0, 18)
    SliderFrame.Position = UDim2.new(0, 14, 0, 80)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 25, 50)
    SliderFrame.Parent = LightCard

    local SliderFrameCorner = Instance.new("UICorner")
    SliderFrameCorner.CornerRadius = UDim.new(1, 0)
    SliderFrameCorner.Parent = SliderFrame

    local SliderFrameStroke = Instance.new("UIStroke")
    SliderFrameStroke.Thickness = 1
    SliderFrameStroke.Color = Color3.fromRGB(100, 60, 140)
    SliderFrameStroke.Parent = SliderFrame

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
    -- FLOATING TOGGLE BUTTON (ICON 👻 NHẢY TƯNG TƯNG - KHÔNG SỢ MẤT ẢNH)
    -- =========================================================
    local ToggleMenuBtn = Instance.new("TextButton")
    ToggleMenuBtn.Name = "ToggleMenuBtn"
    ToggleMenuBtn.Size = UDim2.new(0, 52, 0, 52)
    ToggleMenuBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
    ToggleMenuBtn.BackgroundColor3 = Color3.fromRGB(14, 10, 20)
    ToggleMenuBtn.BackgroundTransparency = 0.1
    ToggleMenuBtn.Text = "👻"
    ToggleMenuBtn.TextSize = 28
    ToggleMenuBtn.AutoButtonColor = false
    ToggleMenuBtn.Parent = ScreenGui

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleMenuBtn

    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Thickness = 2.5
    ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    ToggleStroke.Parent = ToggleMenuBtn

    -- HIỆU ỨNG NHẢY TƯNG TƯNG (BOUNCE) & LẮC LƯ 2 BÊN KHÔNG BAO GIỜ MẤT
    task.spawn(function()
        local basePos = ToggleMenuBtn.Position
        while task.wait() do
            -- Nhảy lên + Lắc trái
            TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(basePos.X.Scale, basePos.X.Offset, basePos.Y.Scale, basePos.Y.Offset - 10),
                Rotation = -12
            }):Play()
            task.wait(0.35)

            -- Trở về vị trí cũ
            TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                Position = basePos,
                Rotation = 0
            }):Play()
            task.wait(0.3)

            -- Nhảy lên + Lắc phải
            TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(basePos.X.Scale, basePos.X.Offset, basePos.Y.Scale, basePos.Y.Offset - 10),
                Rotation = 12
            }):Play()
            task.wait(0.35)

            -- Trở về vị trí cũ
            TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                Position = basePos,
                Rotation = 0
            }):Play()
            task.wait(0.5)
        end
    end)

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

    -- Toggle Menu
    local menuVisible = true
    ToggleMenuBtn.MouseButton1Click:Connect(function()
        menuVisible = not menuVisible
        MainFrame.Visible = menuVisible
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
            TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 120)}):Play()
            TweenService:Create(SwitchDot, TweenInfo.new(0.2), {
                Position = UDim2.new(1, -23, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            TweenService:Create(CardStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(255, 0, 120)}):Play()
            
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
            TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 32, 55)}):Play()
            TweenService:Create(SwitchDot, TweenInfo.new(0.2), {
                Position = UDim2.new(0, 3, 0.5, -10),
                BackgroundColor3 = Color3.fromRGB(160, 140, 180)
            }):Play()
            TweenService:Create(CardStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(60, 45, 80)}):Play()
            
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

    -- [[ THÔNG BÁO THÀNH CÔNG (3 GIÂY) ]]
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "★ MRGHOST HUB VIP ★",
            Text = "Tải giao diện thành công!",
            Duration = 3
        })
    end)
end)

-- [[ NẾU SCRIPT BỊ LỖI -> BÁO LỖI NÀY HIỂN THỊ TRONG 10 GIÂY ]]
if not success then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "⚠️ [SYSTEM ERROR] MRGHOST HUB VIP",
            Text = "mrghost hub vip ko tải đc",
            Duration = 10
        })
    end)
    warn("[MRGHOST HUB VIP ERROR]: " .. tostring(err))
end
 

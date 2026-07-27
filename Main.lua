-- [[ TỰ KIỂM TRA LỖI LOAD SCRIPT ]]
local success, err = pcall(function()

    -- Services
    local CoreGui = game:GetService("CoreGui")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Lighting = game:GetService("Lighting")
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local HttpService = game:GetService("HttpService")

    local LocalPlayer = Players.LocalPlayer

    -- Config Key System
    local CORRECT_KEY = "TTTT" -- Key hệ thống: TTTT
    local KEY_LINK = "https://discord.gg/KDTDZjYSR" -- Link Discord lấy key
    local BACKUP_LINK = "https://fnote.net/notes/jv9G9J" -- Link Fnote dự phòng
    local CACHE_FILE = "MrGhostVIP_KeyCache.json"
    local EXPIRE_TIME = 86400 -- 24 Tiếng (24 * 3600)

    -- Container ScreenGui
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

    -- Hàm Kéo Thả (Draggable) Chuẩn Không Lỗi
    local function makeDraggable(gui, onDragStart, onDragEnd)
        local dragging, dragInput, dragStart, startPos
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
                if onDragStart then onDragStart() end
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then 
                        dragging = false 
                        if onDragEnd then onDragEnd() end
                    end
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

    -- =========================================================
    -- KIỂM TRA CACHE KEY 24H
    -- =========================================================
    local function isKeySavedValid()
        if readfile and isfile and isfile(CACHE_FILE) then
            local successRead, data = pcall(function()
                return HttpService:JSONDecode(readfile(CACHE_FILE))
            end)
            if successRead and data and data.key == CORRECT_KEY and data.time then
                if (os.time() - data.time) < EXPIRE_TIME then
                    return true
                end
            end
        end
        return false
    end

    local function saveKeyCache(key)
        if writefile then
            pcall(function()
                local data = {
                    key = key,
                    time = os.time()
                }
                writefile(CACHE_FILE, HttpService:JSONEncode(data))
            end)
        end
    end

    -- =========================================================
    -- HÀM KHỞI TẠO MAIN HUB (CHỈ CHẠY KHI KEY ĐÚNG)
    -- =========================================================
    local function loadMainHub()
        -- MAIN FRAME (CYBERPUNK ULTRA PREMIUM)
        local MainFrame = Instance.new("Frame")
        MainFrame.Name = "MainFrame"
        MainFrame.Size = UDim2.new(0, 360, 0, 220)
        MainFrame.Position = UDim2.new(0.5, -180, 0.4, -110)
        MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
        MainFrame.BackgroundTransparency = 0.15
        MainFrame.BorderSizePixel = 0
        MainFrame.Parent = ScreenGui

        local MainCorner = Instance.new("UICorner")
        MainCorner.CornerRadius = UDim.new(0, 20)
        MainCorner.Parent = MainFrame

        local UIStroke = Instance.new("UIStroke")
        UIStroke.Thickness = 2.5
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Parent = MainFrame

        -- TITLE HEADER VIP
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

        local AnimatedIconLabel = Instance.new("TextLabel")
        AnimatedIconLabel.Size = UDim2.new(0, 85, 1, 0)
        AnimatedIconLabel.Position = UDim2.new(0, 225, 0, 0)
        AnimatedIconLabel.BackgroundTransparency = 1
        AnimatedIconLabel.Text = "💖 TTTT"
        AnimatedIconLabel.TextColor3 = Color3.fromRGB(255, 100, 180)
        AnimatedIconLabel.TextSize = 13
        AnimatedIconLabel.Font = Enum.Font.FredokaOne
        AnimatedIconLabel.TextXAlignment = Enum.TextXAlignment.Left
        AnimatedIconLabel.Parent = TitleBar

        task.spawn(function()
            while task.wait() do
                TweenService:Create(AnimatedIconLabel, TweenInfo.new(0.8, Enum.EasingStyle.Sin, Enum.EasingDirection.InOut), {TextSize = 15}):Play()
                task.wait(0.8)
                TweenService:Create(AnimatedIconLabel, TweenInfo.new(0.8, Enum.EasingStyle.Sin, Enum.EasingDirection.InOut), {TextSize = 12}):Play()
                task.wait(0.8)
            end
        end)

        -- CONTAINER & CARDS
        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(1, -24, 1, -68)
        Container.Position = UDim2.new(0, 12, 0, 60)
        Container.BackgroundTransparency = 1
        Container.Parent = MainFrame

        local LightCard = Instance.new("Frame")
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

        local SwitchBg = Instance.new("TextButton")
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
        SwitchDot.Size = UDim2.new(0, 20, 0, 20)
        SwitchDot.Position = UDim2.new(0, 3, 0.5, -10)
        SwitchDot.BackgroundColor3 = Color3.fromRGB(160, 140, 180)
        SwitchDot.Parent = SwitchBg

        local SwitchDotCorner = Instance.new("UICorner")
        SwitchDotCorner.CornerRadius = UDim.new(1, 0)
        SwitchDotCorner.Parent = SwitchDot

        -- SLIDER
        local SliderValLabel = Instance.new("TextLabel")
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
        SliderFrame.Size = UDim2.new(1, -28, 0, 18)
        SliderFrame.Position = UDim2.new(0, 14, 0, 80)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 25, 50)
        SliderFrame.Parent = LightCard

        local SliderFrameCorner = Instance.new("UICorner")
        SliderFrameCorner.CornerRadius = UDim.new(1, 0)
        SliderFrameCorner.Parent = SliderFrame

        local SliderFill = Instance.new("Frame")
        SliderFill.Size = UDim2.new(0.4, 0, 1, 0)
        SliderFill.BackgroundColor3 = Color3.fromRGB(0, 240, 255)
        SliderFill.Parent = SliderFrame

        local SliderFillCorner = Instance.new("UICorner")
        SliderFillCorner.CornerRadius = UDim.new(1, 0)
        SliderFillCorner.Parent = SliderFill

        local SliderBtn = Instance.new("TextButton")
        SliderBtn.Size = UDim2.new(1, 0, 1, 0)
        SliderBtn.BackgroundTransparency = 1
        SliderBtn.Text = ""
        SliderBtn.Parent = SliderFrame

        -- FLOATING TOGGLE BUTTON (NÚT PHỤ 👻 KHÔNG CÒN BỊ LỖI KÉO THẢ)
        local ToggleMenuBtn = Instance.new("TextButton")
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

        -- LOGIC KÉO THẢ & HIỆU ỨNG NHÚN NHẢY ĐÃ FIX LỖI
        local isDraggingToggle = false
        makeDraggable(MainFrame)
        makeDraggable(ToggleMenuBtn, function()
            isDraggingToggle = true
        end, function()
            isDraggingToggle = false
        end)

        task.spawn(function()
            while task.wait() do
                if not isDraggingToggle then
                    local basePos = ToggleMenuBtn.Position
                    local t1 = TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Position = UDim2.new(basePos.X.Scale, basePos.X.Offset, basePos.Y.Scale, basePos.Y.Offset - 8),
                        Rotation = -12
                    })
                    t1:Play()
                    t1.Completed:Wait()

                    if not isDraggingToggle then
                        local t2 = TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                            Position = basePos,
                            Rotation = 0
                        })
                        t2:Play()
                        t2.Completed:Wait()
                    end

                    if not isDraggingToggle then
                        local t3 = TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Position = UDim2.new(basePos.X.Scale, basePos.X.Offset, basePos.Y.Scale, basePos.Y.Offset - 8),
                            Rotation = 12
                        })
                        t3:Play()
                        t3.Completed:Wait()
                    end

                    if not isDraggingToggle then
                        local t4 = TweenService:Create(ToggleMenuBtn, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                            Position = basePos,
                            Rotation = 0
                        })
                        t4:Play()
                        t4.Completed:Wait()
                    end
                end
                task.wait(0.4)
            end
        end)

        -- LED RUNNER
        RunService.RenderStepped:Connect(function()
            local rainbowColor = getRGBColor(3)
            UIStroke.Color = rainbowColor
            ToggleStroke.Color = rainbowColor
            TitleGradient.Rotation = (tick() * 90) % 360
        end)

        local menuVisible = true
        ToggleMenuBtn.MouseButton1Click:Connect(function()
            menuVisible = not menuVisible
            MainFrame.Visible = menuVisible
        end)

        -- LOGIC LIGHT
        local fullLightEnabled = false
        local currentBrightness = 4
        local maxBrightness = 10
        local minBrightness = 0.5

        local function forceFullBright()
            pcall(function()
                Lighting.Brightness = currentBrightness
                Lighting.ClockTime = 14
                Lighting.FogEnd = 1000000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
                Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            end)
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

        local function setFullLightState(state)
            fullLightEnabled = state
            if fullLightEnabled then
                TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 0, 120)}):Play()
                TweenService:Create(SwitchDot, TweenInfo.new(0.2), {Position = UDim2.new(1, -23, 0.5, -10), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                forceFullBright()
                if LocalPlayer.Character then attachSuperLight(LocalPlayer.Character) end
            else
                TweenService:Create(SwitchBg, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 32, 55)}):Play()
                TweenService:Create(SwitchDot, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -10), BackgroundColor3 = Color3.fromRGB(160, 140, 180)}):Play()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart:FindFirstChild("GhostLight") then
                    LocalPlayer.Character.HumanoidRootPart.GhostLight:Destroy()
                end
            end
        end

        SwitchBg.MouseButton1Click:Connect(function()
            setFullLightState(not fullLightEnabled)
        end)

        local isSliding = false
        local function updateSlider(input)
            local posX = input.Position.X - SliderFrame.AbsolutePosition.X
            local percent = math.clamp(posX / SliderFrame.AbsoluteSize.X, 0, 1)
            SliderFill.Size = UDim2.new(percent, 0, 1, 0)
            currentBrightness = math.round((minBrightness + (percent * (maxBrightness - minBrightness))) * 10) / 10
            SliderValLabel.Text = "Cường độ sáng:  " .. string.format("%.1f", currentBrightness) .. "  (" .. math.round(percent * 100) .. "%)"
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

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "★ MRGHOST HUB VIP ★",
            Text = "Xác thực Key thành công! Mời bạn dùng Hub.",
            Duration = 3
        })
    end

    -- =========================================================
    -- GIAO DIỆN NHẬP KEY (KEY SYSTEM UI)
    -- =========================================================
    if isKeySavedValid() then
        loadMainHub()
    else
        local KeyFrame = Instance.new("Frame")
        KeyFrame.Name = "KeyFrame"
        KeyFrame.Size = UDim2.new(0, 320, 0, 245)
        KeyFrame.Position = UDim2.new(0.5, -160, 0.4, -122)
        KeyFrame.BackgroundColor3 = Color3.fromRGB(12, 10, 18)
        KeyFrame.Parent = ScreenGui

        local KeyCorner = Instance.new("UICorner")
        KeyCorner.CornerRadius = UDim.new(0, 16)
        KeyCorner.Parent = KeyFrame

        local KeyStroke = Instance.new("UIStroke")
        KeyStroke.Thickness = 2
        KeyStroke.Parent = KeyFrame

        RunService.RenderStepped:Connect(function()
            KeyStroke.Color = getRGBColor(3)
        end)

        local KeyTitle = Instance.new("TextLabel")
        KeyTitle.Size = UDim2.new(1, 0, 0, 35)
        KeyTitle.BackgroundTransparency = 1
        KeyTitle.Text = "🔑 MRGHOST KEY SYSTEM"
        KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeyTitle.TextSize = 15
        KeyTitle.Font = Enum.Font.FredokaOne
        KeyTitle.Parent = KeyFrame

        local KeyTextBox = Instance.new("TextBox")
        KeyTextBox.Size = UDim2.new(1, -32, 0, 34)
        KeyTextBox.Position = UDim2.new(0, 16, 0, 38)
        KeyTextBox.BackgroundColor3 = Color3.fromRGB(24, 20, 35)
        KeyTextBox.PlaceholderText = "Nhập Key VIP tại đây..."
        KeyTextBox.Text = ""
        KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeyTextBox.TextSize = 13
        KeyTextBox.Font = Enum.Font.SourceSansBold
        KeyTextBox.Parent = KeyFrame

        local BoxCorner = Instance.new("UICorner")
        BoxCorner.CornerRadius = UDim.new(0, 8)
        BoxCorner.Parent = KeyTextBox

        -- DÒNG THÔNG BÁO KEY VĨNH VIỄN
        local KeyNoteText = Instance.new("TextLabel")
        KeyNoteText.Size = UDim2.new(1, -32, 0, 18)
        KeyNoteText.Position = UDim2.new(0, 16, 0, 76)
        KeyNoteText.BackgroundTransparency = 1
        KeyNoteText.Text = "✨ Key vĩnh viễn (Get 1 lần duy nhất) ✨"
        KeyNoteText.TextColor3 = Color3.fromRGB(0, 240, 255)
        KeyNoteText.TextSize = 11
        KeyNoteText.Font = Enum.Font.SourceSansBold
        KeyNoteText.Parent = KeyFrame

        -- Button Check Key
        local CheckBtn = Instance.new("TextButton")
        CheckBtn.Size = UDim2.new(0.45, -4, 0, 34)
        CheckBtn.Position = UDim2.new(0, 16, 0, 98)
        CheckBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 120)
        CheckBtn.Text = "Check Key"
        CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        CheckBtn.TextSize = 13
        CheckBtn.Font = Enum.Font.FredokaOne
        CheckBtn.Parent = KeyFrame

        local BtnCorner1 = Instance.new("UICorner")
        BtnCorner1.CornerRadius = UDim.new(0, 8)
        BtnCorner1.Parent = CheckBtn

        -- Button Get Discord Key
        local GetKeyBtn = Instance.new("TextButton")
        GetKeyBtn.Size = UDim2.new(0.45, -4, 0, 34)
        GetKeyBtn.Position = UDim2.new(0.555, 0, 0, 98)
        GetKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        GetKeyBtn.Text = "Discord Key"
        GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        GetKeyBtn.TextSize = 12
        GetKeyBtn.Font = Enum.Font.FredokaOne
        GetKeyBtn.Parent = KeyFrame

        local BtnCorner2 = Instance.new("UICorner")
        BtnCorner2.CornerRadius = UDim.new(0, 8)
        BtnCorner2.Parent = GetKeyBtn

        -- Button Backup Link (Không có Discord dùng cái này)
        local BackupBtn = Instance.new("TextButton")
        BackupBtn.Size = UDim2.new(1, -32, 0, 32)
        BackupBtn.Position = UDim2.new(0, 16, 0, 140)
        BackupBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
        BackupBtn.Text = "🔗 Nếu ko có Discord dùng cái này"
        BackupBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        BackupBtn.TextSize = 12
        BackupBtn.Font = Enum.Font.FredokaOne
        BackupBtn.Parent = KeyFrame

        local BtnCorner3 = Instance.new("UICorner")
        BtnCorner3.CornerRadius = UDim.new(0, 8)
        BtnCorner3.Parent = BackupBtn

        -- Status Label
        local StatusText = Instance.new("TextLabel")
        StatusText.Size = UDim2.new(1, -32, 0, 22)
        StatusText.Position = UDim2.new(0, 16, 0, 182)
        StatusText.BackgroundTransparency = 1
        StatusText.Text = "Chọn hình thức lấy key để tiếp tục"
        StatusText.TextColor3 = Color3.fromRGB(180, 180, 180)
        StatusText.TextSize = 12
        StatusText.Font = Enum.Font.SourceSans
        StatusText.Parent = KeyFrame

        makeDraggable(KeyFrame)

        -- Action Get Discord Link
        GetKeyBtn.MouseButton1Click:Connect(function()
            if setclipboard then
                setclipboard(KEY_LINK)
                StatusText.Text = "✅ Đã copy link Discord!"
                StatusText.TextColor3 = Color3.fromRGB(0, 255, 120)
            else
                StatusText.Text = "⚠️ Executor không hỗ trợ setclipboard!"
                StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
            end
        end)

        -- Action Backup Link (Fnote)
        BackupBtn.MouseButton1Click:Connect(function()
            if setclipboard then
                setclipboard(BACKUP_LINK)
                StatusText.Text = "✅ Đã copy link Fnote (ko có Discord)!"
                StatusText.TextColor3 = Color3.fromRGB(255, 200, 0)
            else
                StatusText.Text = "⚠️ Executor không hỗ trợ setclipboard!"
                StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
            end
        end)

        -- Action Check Key
        CheckBtn.MouseButton1Click:Connect(function()
            if KeyTextBox.Text == CORRECT_KEY then
                StatusText.Text = "🎉 Key đúng! Đang tải Hub..."
                StatusText.TextColor3 = Color3.fromRGB(0, 255, 120)
                saveKeyCache(KeyTextBox.Text)
                task.wait(1)
                KeyFrame:Destroy()
                loadMainHub()
            else
                StatusText.Text = "❌ Key không chính xác, vui lòng thử lại!"
                StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
            end
        end)
    end
end)

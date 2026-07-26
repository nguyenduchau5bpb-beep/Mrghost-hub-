-- [[ 1. THÔNG BÁO BẮT ĐẦU LOAD ]]
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "★ mrghost hub ★",
        Text = "Đang tải dữ liệu, vui lòng chờ...",
        Duration = 4
    })
end)

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [[ 2. HÀM TẠO NGUỒN SÁNG CHO NHÂN VẬT ]]
local function attachSuperLight(character)
    if not character then return end
    local root = character:WaitForChild("HumanoidRootPart", 5)
    if not root then return end
    
    if root:FindFirstChild("GhostLight") then
        root.GhostLight:Destroy()
    end
    
    local light = Instance.new("PointLight")
    light.Name = "GhostLight"
    light.Brightness = 10
    light.Range = 250
    light.Shadows = false
    light.Parent = root
end

-- Kích hoạt cho nhân vật hiện tại & khi respawn
if LocalPlayer.Character then
    task.spawn(function() attachSuperLight(LocalPlayer.Character) end)
end

LocalPlayer.CharacterAdded:Connect(function(char)
    task.spawn(function() attachSuperLight(char) end)
end)

-- [[ 3. LÀM SÁNG MÔI TRƯỜNG & KHÓA LẠI (TỐI ƯU CẤU HÌNH YẾU) ]]
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

-- Xóa các hiệu ứng làm tối
local function clearDarkEffects()
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Atmosphere") or child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") or child:IsA("DepthOfFieldEffect") then
            pcall(function() child:Destroy() end)
        end
    end
end

clearDarkEffects()
forceFullBright()

-- Khóa thuộc tính chống bị Server/Game đè lại (Nhẹ máy hơn RenderStepped)
Lighting:GetPropertyChangedSignal("Brightness"):Connect(forceFullBright)
Lighting:GetPropertyChangedSignal("ClockTime"):Connect(forceFullBright)
Lighting:GetPropertyChangedSignal("FogEnd"):Connect(forceFullBright)
Lighting.ChildAdded:Connect(function(child)
    if child:IsA("Atmosphere") or child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") or child:IsA("DepthOfFieldEffect") then
        task.wait()
        pcall(function() child:Destroy() end)
    end
end)

-- Vòng lặp phụ bảo vệ (2 giây check 1 lần cho chắc chắn, không lo tốn tài nguyên)
task.spawn(function()
    while task.wait(2) do
        forceFullBright()
        clearDarkEffects()
    end
end)

-- [[ 4. THÔNG BÁO HOÀN TẤT ]]
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "★ mrghost hub ★",
        Text = "Đã kích hoạt Full Light thành công!",
        Duration = 5
    })
end)

print("[★ mrghost hub ★] Loaded successfully on all clients!")
 

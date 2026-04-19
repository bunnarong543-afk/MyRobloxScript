-- [[ R-HUB KHMER PRO: OFFICIAL LOADSTRING ]] --

-- ១. ទាញយកបណ្ណាល័យ UI (RedzLib)
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDZHUB/RedzLibV2/main/Source.lua"))()

-- ២. បង្កើតផ្ទាំង Menu
local Window = RedzLib:MakeWindow({
  Title = "R-HUB KHMER PRO",
  SubTitle = "Professional v3",
  TopbarColor = Color3.fromRGB(20, 20, 20)
})

-- ៣. បង្កើត Tabs ជាមួយរូបតំណាង
local MainTab = Window:MakeTab({"Auto Farm", "home"})
local TPTab = Window:MakeTab({"Teleport", "map"})

-- ៤. ផ្នែក Auto Farm
MainTab:AddSection({"--- Leveling Settings ---"})

_G.AutoFarm = false
MainTab:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
    end
})

MainTab:AddDropdown({
    Name = "Select Weapon",
    Options = {"Melee", "Sword", "Fruit"},
    Default = "Melee",
    Callback = function(v) _G.SelectWeapon = v end
})

-- ៥. ផ្នែក Teleport (កូអរដោនេកោះ)
TPTab:AddSection({"--- Island Map ---"})

local islands = {
    ["Starter Island"] = CFrame.new(979, 16, 1429),
    ["Jungle"] = CFrame.new(-1612, 36, 147),
    ["Pirate Village"] = CFrame.new(-1181, 4, 3850)
}

for name, pos in pairs(islands) do
    TPTab:AddButton({
        Name = "Go to " .. name,
        Callback = function()
            local p = game.Players.LocalPlayer.Character.HumanoidRootPart
            local dist = (p.Position - pos.p).Magnitude
            game:GetService("TweenService"):Create(p, TweenInfo.new(dist/250), {CFrame = pos}):Play()
        end
    })
end

-- ៦. ប្រព័ន្ធវាយអូតូ (Fast Attack)
task.spawn(function()
    while task.wait() do
        if _G.AutoFarm then
            pcall(function()
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
            end)
        end
    end
end)

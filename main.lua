-- [[ R-HUB KHMER PRO: FINAL STABLE VERSION ]] --
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDZHUB/RedzLibV2/main/Source.lua"))()

local Window = RedzLib:MakeWindow({
  Title = "R-HUB KHMER PRO",
  SubTitle = "Fixed & Stable",
  TopbarColor = Color3.fromRGB(20, 20, 20)
})

local MainTab = Window:MakeTab({"Auto Farm", "home"})

MainTab:AddSection({"--- Farm Level ---"})

_G.AutoFarm = false
MainTab:AddToggle({
    Name = "Auto Farm Level (បើកវាយអូតូ)",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
    end
})

-- កូដសម្រាប់ដំណើរការវាយ (Background Loop)
spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                -- កូដនេះនឹងធ្វើឱ្យតួអង្គវាយទៅលើអ្វីដែលនៅជិតខ្លួន
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:Button1Down(Vector2.new(1280, 672))
            end)
        end
    end
end)

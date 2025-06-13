-- ✅ Full GUI Script (Complete + Infinite Jump Only) by TaoBa_SHOP

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local RepStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Main Window
local MainWindow = Rayfield:CreateWindow({
    Name = "👑 Created By : TaoBa_SHOP 👑",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "BY TaoBa_SHOP",
    ConfigurationSaving = { Enabled = true, FileName = "TaoBa_SHOP" },
    Discord = { Enabled = true, Invite = "GNqUYWbzrT", RememberJoins = true },
    KeySystem = false
})

-- Support Tab
local SupportTab = MainWindow:CreateTab("🟢 Support 🟢", 4483362458)
SupportTab:CreateButton({ Name = "👑 Created By : TaoBa_SHOP 👑", Callback = function() end })
SupportTab:CreateParagraph({ Title = "🟢 Status Script 🟢", Content = "    🟢 Work ทำงาน 🟢" })
SupportTab:CreateButton({ Name = "🟢 Join Discord For Support 🟢", Callback = function()
    setclipboard("https://discord.gg/GNqUYWbzrT")
    -- Rayfield:Notify removed
Rayfield:Notify({ Title = "Discord Invite", Content = "Link copied!", Duration = 5 })
end })
SupportTab:CreateButton({ Name = "🟢 Youtube For New Video Update Script 🟢", Callback = function()
    setclipboard("https://www.youtube.com/@TaoBa_SHOP")
    -- Rayfield:Notify removed
Rayfield:Notify({ Title = "Youtube Invite", Content = "Copied Youtube link!", Duration = 5 })
end })

-- Unit Button Helper
local function createUnitButton(tab, buttonName, unitName)
    tab:CreateButton({ Name = buttonName, Callback = function()
        local rf = RepStorage:WaitForChild("Functions"):WaitForChild("SpawnTower")
        if rf and rf:IsA("RemoteFunction") then
            rf:InvokeServer(unitName, LocalPlayer.Character.HumanoidRootPart.CFrame)
        else
            -- Rayfield:Notify removed
Rayfield:Notify({ Title = "Error", Content = "ไม่พบ Unit not found", Duration = 5 })
        end
    end })
end

-- All Units Data
local allTabs = {
    ["🍎 Camera Tower 🍎"] = {
        {"👉 Cameraman 100$ ( Single )","Cameraman"},
        {"👉 Lucky Cameraman 200$ ( Single )","Lucky Cameraman"},
        {"👉 Plunger Cameraman 200$ ( Single )","Plunger Cameraman"},
        {"👉 Chief Cameraman 500$ ( Spawner )","Chief Cameraman"},
        {"👉 Large Cameraman 500$ ( Single )","Large Cameraman"},
        {"👉 Gunner Cameraman 700$ ( Single )","Gunner Cameraman"},
        {"👉 Titan Cameraman 1,000$ ( Single )","Titan Cameraman"},
        {"👉 Large Laser Cameraman 1,000$ ( Single )","Large Laser Cameraman"},
        {"👉 Demon Lucky Cameraman 1,500$ ( Single )","Demon Lucky Cameraman"},
        {"👉 Mace Cameraman 3,000$ ( AOE )","Mace Cameraman"},
        {"👉 Spider Camera 3,500$ ( Single )","Spider Camera"},
        {"👉 Injured Upgrade Titan Cameraman 35,000$ ( AOE )","Injured Upgrade Titan Cameraman"},
        {"👉 Upgrade Titan Cameraman 45,000$ ( AOE + Splash )","Upgrade Titan Cameraman"}
    },
    ["🍎 Tv Tower 🍎"] = {
        {"👉 Tv man 200$ ( AOE )","Tv man"},
        {"👉 Large Tv man 400$ ( AOE )","Large Tv man"},
        {"👉 Knife Tv Man 750$ ( AOE )","Knife Tv Man"},
        {"👉 Demon Tv man 1,000$ ( AOE )","Demon Tv man"},
        {"👉 Titan Tv man 2,000$ ( AOE )","Titan Tv man"},
        {"👉 Large Speaker Tv man 2,500$ ( AOE )","Large Speaker Tv man"},
        {"👉 Tv woman 3,000$ ( AOE )","Tv woman"},
        {"👉 Demon Titan Tv man 20,000$ ( AOE )","Demon Titan Tv man"}
    },
    ["🍎 Printer 🍎"] = {
        {"👉 Printer Man 300$ ( Timer )","Printer Man"},
        {"👉 Printer woman 750$ ( Timer )","Printer woman"},
        {"👉 Large Printer man 1,000$ ( Timer )","Large Printer man"},
        {"👉 Titan Printer man 7,500$ ( Timer + Splash )","Titan Printer man"}
    },
    ["🍎 Speaker Tower 🍎"] = {
        {"👉 Speakerman 100$ ( Single )","Speakerman"},
        {"👉 Dark Speakerman 150$ ( Single )","Dark Speakerman"},
        {"👉 Vip Speakerman 300$ ( Single )","Vip Speakerman"},
        {"👉 Spider Speaker 2,000$ ( Splash )","Spider Speaker"},
        {"👉 Titan Speakerman 7,500$ ( Splash )","Titan Speakerman"},
        {"👉 Vip Titan Speakerman 30,000$ ( Splash )","Vip Titan Speakerman"},
        {"👉 Upgrade Titan Speakerman 35,000$ ( AOE + Splash )","Upgrade Titan Speakerman"}
    },
    ["🍎 Slow Tower 🍎"] = {
        {"👉 Scientist Tv man 500$ ( Slow )","Scientist Tv man"}
    },
    ["🍎 Coin Tower 🍎"] = {
        {"👉 Scientist Cameraman 200$ ( Farm )","Scientist Cameraman"},
        {"👉 Vip Cameraman 500$ ( Farm )","Vip Cameraman"},
        {"👉 Coin Cameraman 500$ ( Single + Farm )","Coin Cameraman"},
        {"👉 Coin Plunger Cameraman 700$ ( Single + Farm )","Coin Plunger Cameraman"},
        {"👉 Coin Titan Speakerman 8,000$ ( Splash + Farm )","Coin Titan Speakerman"},
        {"👉 Coin Titan Cinemaman 30,000$ ( AOE + Farm )","Coin Titan Cinemaman"}
    },
    ["🍎 Clock 🍎"] = {
        {"👉 Glass Clockman 250$ ( Splash )","Glass Clockman"},
        {"👉 Alarm Clockman 2,000$ ( Single )","Alarm Clockman"},
        {"👉 CoCo Clockman 3,000$ ( Single )","CoCo Clockman"},
        {"👉 Large Clockman 5,000$ ( Single )","Large Clockman"},
        {"👉 Scientist Clockman 7,500$ ( Spawner )","Scientist Clockman"}
    },
    ["🍎 Other Tower 🍎"] = {
        {"👉 Chair 1,000$ ( Single )","Chair"},
        {"👉 Larry 1,500$ ( AOE )","Larry"},
        {"👉 Friend Larry 2,000$ ( AOE )","Friend Larry"},
        {"👉 Buff Huggy 10,000$ Splash","Buff Huggy"},
        {"👉 Titan Cinemaman 25,000$ ( AOE )","Titan Cinemaman"},
        {"👉 Titan Reward Man 30,000$ ( Splash )","Titan Reward Man"}
    },
    ["🍎 Best Unit 🍎"] = {
        {"💚 Gltich Cameraman 500$ ( Single )","Gltich Cameraman"},
        {"💚 Spider Tv 5,000$ ( AOE + Slow )","Spider Tv"},
        {"💚 Upgrade Titan Tv man 50,000$ ( AOE )","Upgrade Titan Tv man"},
        {"💚 Upgrade Titan Tv Woman 75,000$ ( AOE + Splash )","Upgrade Titan Tv Woman"},
        {"💚 G-man 5.0 75,000$ ( Splash )","G-man 5.0"},
        {"💚 Chief Clockman 75,000$ ( Splash + Slow )","Chief Clockman"},
        {"💚 Coin Upgrade Titan Speakerman 80,000$ ( AOE + Splash + Farm )","Coin Upgrade Titan Speakerman"},
        {"💚 G-man 5.0 Fight 100,000$ ( Splash )","G-man 5.0 Fight"},
        {"💚 Evil Agent 250,000$ ( AOE + Splash + Slow )","Evil Agent"},
        {"💚 Titan Clock man 400,000$ ( Splash )","Titan Clock man"}
    }
}

-- Create tabs
local tabOrder = {"🟢 Support 🟢","🍎 Camera Tower 🍎","🍎 Tv Tower 🍎","🍎 Printer 🍎",
                   "🍎 Speaker Tower 🍎","🍎 Slow Tower 🍎","🍎 Coin Tower 🍎",
                   "🍎 Clock 🍎","🍎 Other Tower 🍎","🍎 Best Unit 🍎","🍎 Player 🍎"}
for _, name in ipairs(tabOrder) do
    if name ~= "🟢 Support 🟢" then
        local tab = MainWindow:CreateTab(name, 4483362458)
        if name ~= "🍎 Player 🍎" then
            for _, u in ipairs(allTabs[name]) do createUnitButton(tab, u[1], u[2]) end
        else
            -- Player Tab (WalkSpeed + Infinite Jump only)
            local WalkSpeed, WalkSpeedEnabled = 16, false
            -- WalkSpeed toggle
            tab:CreateToggle({ Name = "🏃‍♂️ Enable WalkSpeed 🏃‍♂️", CurrentValue = WalkSpeedEnabled, Callback = function(val)
                WalkSpeedEnabled = val
                local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                if h then h.WalkSpeed = val and WalkSpeed or 16 end
            end })
            -- WalkSpeed slider
            tab:CreateSlider({ Name = "🏃‍♂️ WalkSpeed 🏃‍♂️", Range = {16,200}, Increment = 1, CurrentValue = WalkSpeed, Suffix = "Speed", Callback = function(val)
                WalkSpeed = val
                if WalkSpeedEnabled then
                    local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                    if h then h.WalkSpeed = val end
                end
            end })

            -- Infinite Jump toggle
            local JumpEnabled = false
            tab:CreateToggle({ Name = "🤸‍♂️ Enable Infinite Jump 🤸‍♂️", CurrentValue = JumpEnabled, Callback = function(val)
                JumpEnabled = val
            end })
            -- Infinite Jump functionality
            UserInputService.JumpRequest:Connect(function()
                if JumpEnabled then
                    local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                    if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
                end
            end)

            -- Noclip toggle
            local NoclipEnabled = false
            tab:CreateToggle({ Name = "🚫 Enable Noclip 🚫", CurrentValue = NoclipEnabled, Callback = function(val) NoclipEnabled = val end })
            RunService.Stepped:Connect(function()
                if NoclipEnabled and LocalPlayer.Character then
                    for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end
                end
            end)

            -- Rejoin, Server Hop, Anti-AFK unchanged
            tab:CreateButton({ Name = "🔁 Rejoin 🔁", Callback = function() TeleportService:Teleport(game.PlaceId) end })
            tab:CreateButton({ Name = "🌐 Server Hop 🚀", Callback = function()
                local req = http_request or request or (syn and syn.request)
                if not req then return -- Rayfield:Notify removed
Rayfield:Notify({ Title = "Error", Content = "Executor not support HTTP request", Duration = 7 }) end
                local ok, res = pcall(function() return req({ Url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100" }) end)
                if ok and res and res.Body then
                    local data = HttpService:JSONDecode(res.Body).data
                    for _, s in ipairs(data) do if s.playing < s.maxPlayers and s.id~=game.JobId then return TeleportService:TeleportToPlaceInstance(game.PlaceId,s.id) end end
                    -- Rayfield:Notify removed
Rayfield:Notify({ Title = "Server Hop", Content = "No available servers found", Duration = 7 })
                else
                    -- Rayfield:Notify removed
Rayfield:Notify({ Title = "Server Hop", Content = "Fetch failed", Duration = 7 })
                end
            end })
            Players.LocalPlayer.Idled:Connect(function()
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
end

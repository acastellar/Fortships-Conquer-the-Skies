dofile("scripts/forts.lua")

-- Table of deviceIds and their target heights
data.Controllers = {}
data.Chambers = {}

-- Table of each teamIds (base)'s selected chamber or nil/0 if none currently selected
data.PlayersSelectedChamber = {}

-- Initial setup
function Load()
	ScheduleCall(0, AfterLoad)
end

function AfterLoad()
	DisableHiddenDevices()

	RegisterExistingDevices(1)
	RegisterExistingDevices(2)
end

function DisableHiddenDevices()
	DisableWeapon("controller")
	DisableWeapon("controllerhigh2")
	DisableDevice("dynamic_barrel_base")

	DisableWeapon("air_break_full")
	DisableWeapon("air_break_null")
	DisableWeapon("pre_air_break_full")
	DisableWeapon("pre_air_break_null")
end

function RegisterExistingDevices(sideId)
	local deviceCount = GetDeviceCountSide(sideId)
	for i = 0, deviceCount - 1 do
		local deviceId = GetDeviceIdSide(sideId, i)

		local teamId = GetDeviceTeamIdActual(deviceId)
		local saveName = GetDeviceType(deviceId)
		local nodeA = GetDevicePlatformA(deviceId)
		local nodeB = GetDevicePlatformB(deviceId)
		local t = GetDeviceLinkPosition(deviceId)
		RegisterDevice(teamId, deviceId, saveName, nodeA, nodeB, t)
	end
end

function OnDeviceCreated(teamId, deviceId, saveName, nodeA, nodeB, t, upgradeId)
	RegisterDevice(teamId, deviceId, saveName, nodeA, nodeB, t)
end

-- Register (or recreate) flight devices
function RegisterDevice(teamId, deviceId, saveName, nodeA, nodeB, t)

	if (saveName == "controller") then
		data.Controllers[deviceId] = GetDevicePosition(deviceId).y
	elseif (saveName == "suspendiumbase") then
		data.Chambers[deviceId] = 0
	else
		-- Managing player placed devices (controllerhigh2 and dynamic_barrel_base are legacy for old maps)
		if (saveName == "controllerbase" or saveName == "controllerhigh2") then
			ScheduleCall(0, CreateDisabledDevice, "controller", teamId, nodeA, nodeB, t, GetDeviceTeamId(deviceId))
			ApplyDamageToDevice(deviceId, 1000)
		elseif (saveName == "dynamic_barrel_base") then
			UpgradeDevice(deviceId, "suspendium_0")
		elseif (saveName == "air_brake_base") then
			ScheduleCall(0, CreateDisabledDevice, "air_brake_null", teamId, nodeA, nodeB, t, GetDeviceTeamId(deviceId))
			ApplyDamageToDevice(deviceId, 1000)
		elseif (saveName == "pre_air_brake_null") then
			ScheduleCall(0.1, CreateDisabledLink, teamId, "fast_bracing", nodeA, nodeB, GetDeviceTeamId(deviceId))
			ScheduleCall(0.15, CreateDisabledDevice, "air_brake_null", teamId, nodeA, nodeB, t, GetDeviceTeamId(deviceId))
			ApplyDamageToDevice(deviceId, 1000)
		elseif (saveName == "pre_air_brake_full") then
			ScheduleCall(0.1, CreateDisabledLink, teamId, "fast_bracing_draggy", nodeA, nodeB, GetDeviceTeamId(deviceId))
			ScheduleCall(0.15, CreateDisabledDevice, "air_brake_full", teamId, nodeA, nodeB, t, GetDeviceTeamId(deviceId))
			ApplyDamageToDevice(deviceId, 1000)
		end
	end
end

function CreateDisabledDevice(saveName, teamId, nodeA, nodeB, t, side)
	EnableWeapon(saveName, true, side)
	CreateDevice(teamId, saveName, nodeA, nodeB, t)
	EnableWeapon(saveName, false, side)
end

function CreateDisabledLink(teamId, saveName, nodeA, nodeB, side)
	EnableMaterial(saveName, true, side)
	CreateLink(teamId, saveName, nodeA, nodeB)
	EnableMaterial(saveName, false, side)
end

function DisableWeapon(saveName)
	EnableWeapon(saveName, false, 1)
	EnableWeapon(saveName, false, 2)
end

function DisableDevice(saveName)
	EnableDevice(saveName, false, 1)
	EnableDevice(saveName, false, 2)
end

-- Altitude selection
function OnKey(key, down)
	if (down == true) then
		if (key == "mouse left") then
			local selectedDeviceId = GetLocalSelectedDeviceId()
			if not (selectedDeviceId == -1) then
				local selectedDeviceSavename = GetDeviceType(selectedDeviceId)
				if not (selectedDeviceSavename == "controller") then
					return
				end

				if not (GetDeviceTeamIdActual(selectedDeviceId) == GetLocalTeamId()) then
					return
				end
				Deselect()
				local MousePos = ProcessedMousePos().y
				SendScriptEvent("SetAltitudeUsingId", tostring(selectedDeviceId) .. "," .. tostring(MousePos), "", true)
			end
		end
	end
end

function SetAltitudeUsingId(id, mousePos)
	local mouseY = mousePos
	data.Controllers[id] = mouseY
end

function Update(frame)
	CheckLocalDeviceSelection()
	UpdateControllerChambers()
end

function CheckLocalDeviceSelection()
	local selectedDeviceId = GetLocalSelectedDeviceId();
	if selectedDeviceId == -1 then
		return
	end

	local teamId = GetDeviceTeamIdActual(selectedDeviceId)
	if teamId ~= GetLocalTeamId() then
		return
	end

	local selectedDeviceSavename = GetDeviceType(selectedDeviceId)
	if selectedDeviceSavename == "controller" then
		AddMouseAccessory("altitudeBar", "altitudeBarSprite", -5000, 0, 10000, 1)
		ScheduleCall(0, DeleteMouseAccessory, "altitudeBar")
	elseif StartsWith(selectedDeviceSavename, "suspendium_") == true then
		SendScriptEvent("SetPlayerChamberSelection", tostring(teamId) .. "," .. tostring(selectedDeviceId), "", true)
	else
		SendScriptEvent("SetPlayerChamberSelection", tostring(teamId) .. "," .. tostring(0), "", true)
	end
end

function SetPlayerChamberSelection(teamId, chamberId)
	data.PlayersSelectedChamber[teamId] = chamberId
end

function UpdateControllerChambers()
	local structureTargetHeights = {}
	for controllerId, targetHeight in pairs(data.Controllers) do
		if DeviceExists(controllerId) == true then
			local controllerStructureId = GetDeviceStructureId(controllerId)

			-- Ignore controller conflict, multiple controllers on the same structure
			structureTargetHeights[controllerStructureId] = targetHeight
		else
			data.Controllers[controllerId] = nil
		end
	end

	local newChambers = {}
	for chamberId, staleTargetHeight in pairs(data.Chambers) do
		if DeviceExists(chamberId) == true then
			local chamberStructureId = GetDeviceStructureId(chamberId)
			local targetHeight = structureTargetHeights[chamberStructureId]

			if targetHeight ~= nil then
				local newChamberLevel = GetNewChamberLevel(chamberId, targetHeight)
				local newChamberId = UpdateChamberLevel(chamberId, newChamberLevel)
				
				newChambers[newChamberId] = targetHeight
			else
				newChambers[chamberId] = 0
			end
		end
	end
	data.Chambers = newChambers
end

function UpdateChamberLevel(chamberId, newChamberLevel)
	if GetCurrentChamberLevel(chamberId) ~= newChamberLevel then
		-- if player is selecting the chamber, then we don't want to upgrade it (so they can sell or repair it)
		local teamId = GetDeviceTeamIdActual(chamberId)
		if data.PlayersSelectedChamber[teamId] == chamberId then
			return chamberId
		end
		local upgradedId = UpgradeDevice(chamberId, "suspendium_" .. newChamberLevel)
		if upgradedId > 0 then
			return upgradedId
		end
	end
	return chamberId
end

local CHAMBER_PREFIX_LENGTH = #"suspendium_"
function GetCurrentChamberLevel(chamberId)
    return tonumber(string.sub(GetDeviceType(chamberId), CHAMBER_PREFIX_LENGTH + 1))
end

-- Will return some chamber level from 0 to 100 based on a chamber and a target height
function GetNewChamberLevel(chamberId, targetHeight)
	local CurrentDevicePos = GetDevicePosition(chamberId)
	local DevicePosDiffrenceY = CurrentDevicePos.y - targetHeight
	local nodeId = GetDevicePlatformA(chamberId)
	local currentVelocity = NodeVelocity(nodeId).y
	local ToUpgrade = 0

	local ModifierOne = 0.02
	local ModifierTwo = 25
	local ModifierThree = 0.1

	local DevicePosDiffrenceYReal = DevicePosDiffrenceY

	if (DevicePosDiffrenceY < 0) then
		DevicePosDiffrenceY = 0
	end

	local NeededChange = math.log(DevicePosDiffrenceY * ModifierOne) * ModifierTwo
	NeededChange = NeededChange + (currentVelocity * ModifierThree)

	ToUpgrade = math.floor(NeededChange)

	if (ToUpgrade == nil) then
		ToUpgrade = 0
	end

	-- This is not great code, but it works really well, so whatever
	if (currentVelocity > 100) then
		local LiftExtraModifier = (math.abs(DevicePosDiffrenceYReal) / 15)
		if (LiftExtraModifier > 50) then
			LiftExtraModifier = 50
		end

		if (math.abs(DevicePosDiffrenceYReal) < 1000) then
			LiftExtraModifier = 15
		end

		if (math.abs(DevicePosDiffrenceYReal) < 750) then
			LiftExtraModifier = 10
		end

		if (math.abs(DevicePosDiffrenceYReal) < 250) then
			LiftExtraModifier = 7.5
		end

		if (LiftExtraModifier < 1) then
			LiftExtraModifier = 1
		end

		ToUpgrade = ToUpgrade + currentVelocity / LiftExtraModifier
	end

	if (ToUpgrade < 0) then
		ToUpgrade = 0
	elseif (ToUpgrade > 100) then
		ToUpgrade = 100
	end

	return math.floor(ToUpgrade)
end

-- Helper functions
function Distance(x1, y1, x2, y2)
	return math.sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
end

function StartsWith(A, B)
	return string.sub(A, 0, string.len(B)) == B
end
--HUD sprites:

table.insert(Sprites, ButtonSprite("hud-suspendium-icon", "HUD/HUD-suspendium", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-controller-icon", "HUD/HUD-controller", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-controller2-icon", "HUD/HUD-controller2", nil, ButtonSpriteBottom, nil, nil, path))

table.insert(Sprites, DetailSprite("hud-detail-sbminicore", "HUD-Details-IndustryFactory", path))

--Flying Controller
table.insert(Sprites, ButtonSprite("hud-Newbarrel-icon", "HUD/HUD-barrel", nil, ButtonSpriteBottom, nil, nil, path))
local barrel = FindDevice("barrel")
if barrel then
	barrel.Enabled = true
	barrel.MetalCost = 300
	barrel.EnergyCost = 2000
	barrel.BuildTimeComplete = 30
	barrel.NoReclaim = false
	barrel.Icon = "hud-Newbarrel-icon"
end

--Barrels:

UpgradeArray = {}
for i = 0,100 do
	UpgradeArray["suspendium_" .. i] = {
		Enabled = false,
		SaveName = "suspendium_" .. i,
		MetalCost = 0,
		EnergyCost = 0,
	}
end

table.insert(Devices, IndexOfDevice("sandbags") + 1,
{
	Prerequisite = "sbaviation",
	Enabled = true,
	SaveName = "suspendiumbase",
	FileName = path .. "/devices/suspendium_base.lua",
	Icon = "hud-suspendium-icon",
	Detail = "hud-detail-metalstore",
	BuildTimeIntermediate = 0,
	ScrapPeriod = 1,
	MetalCost = 100,
	EnergyCost = 600,
	MetalRepairCost = 30,
	EnergyRepairCost = 400,
	BuildTimeComplete = 1,
	MetalReclaimMin = 0,
	MetalReclaimMax = 0,
	EnergyReclaimMin = 0,
	EnergyReclaimMax = 0,
	MaxUpAngle = 40,
	BuildOnGroundOnly = false,
	SelectEffect = "ui/hud/devices/ui_devices",
	Upgrades = UpgradeArray,
})

for i=0,100 do
	table.insert(Devices, IndexOfDevice("sandbags") + 1,
	{
		Enabled = false,
		SaveName = "suspendium_" .. i,
		FileName = path .. "/devices/suspendium_levels/suspendium_" .. i .. ".lua",
		Icon = "hud-suspendium-icon",
		Detail = "hud-detail-metalstore",
		BuildTimeIntermediate = 0,
		BuildTimeComplete = 0,
		ScrapPeriod = 1,
		MetalCost = 0,
		EnergyCost = 0,
		MetalRepairCost = 30,
		EnergyRepairCost = 400,
		MetalReclaimMin = 0,
		MetalReclaimMax = 0,
		EnergyReclaimMin = 0,
		EnergyReclaimMax = 0,
		MaxUpAngle = StandardMaxUpAngle,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/devices/ui_devices",
	})
end
local suspendium_base_device = FindDevice("suspendiumbase")
suspendium_base_device.Upgrades = UpgradeArray
for i=0,100 do
	FindDevice("suspendium_" .. i).Upgrades = UpgradeArray
end

-- Legacy for maps to not break
local dynamic_barrel_legacy_device = DeepCopy(suspendium_base_device)
dynamic_barrel_legacy_device.Enabled = false
dynamic_barrel_legacy_device.SaveName = "dynamic_barrel_base"
dynamic_barrel_legacy_device.FileName = path .. "/devices/suspendium_base_legacy.lua"
table.insert(Devices, IndexOfDevice("sandbags") + 1, dynamic_barrel_legacy_device)

--Controller:
table.insert(Devices, IndexOfDevice("sandbags") + 1,
{
	Prerequisite = "sbaviation",
	Enabled = true,
	SaveName = "controllerbase",
	FileName = path .. "/devices/controllerbase.lua",
	Icon = "hud-controller2-icon",
	Detail = "hud-detail-metalstore",
	BuildTimeIntermediate = 0,
	BuildTimeComplete = 0,
	ScrapPeriod = 1,
	MetalCost = 300,
	EnergyCost = 2000,
	MetalRepairCost = 30,
	EnergyRepairCost = 400,
	MetalReclaimMin = 0,
	MetalReclaimMax = 0,
	EnergyReclaimMin = 0,
	EnergyReclaimMax = 0,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = false,
	SelectEffect = "ui/hud/devices/ui_devices",
	HasDummy = false,

})

--Other Devices, from samster, edited by me
table.insert(Sprites, ButtonSprite("hud-sbbomb-icon", "HUD/HUD-bomb", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("sandbags") + 1,
{
		Prerequisite = "sbaviation",
		Enabled = false,
		SaveName = "sbbomb",
		FileName = path .. "/devices/sbbomb.lua",
		Icon = "hud-sbbomb-icon",
		Detail = "hud-detail-metalstore",
		BuildTimeIntermediate = 0.1,
		BuildTimeComplete = 0.5,
		ScrapPeriod = 0.5,
		MetalCost = 300,
		EnergyCost = 4000,
		MetalRepairCost = 0,
		EnergyRepairCost = 0,
		MetalReclaimMin = 0.25,
		MetalReclaimMax = 0.5,
		EnergyReclaimMin = 0.1,
		EnergyReclaimMax = 0.5,
		MaxUpAngle = 30,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/devices/ui_devices",
})
table.insert(Sprites, ButtonSprite("hud-sbminicore-icon", "HUD/HUD-minicore", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("sandbags") + 1,
{
		Enabled = true,
		SaveName = "sbminicore",
		FileName = path .. "/devices/sbminicore.lua",
		Icon = "hud-sbminicore-icon",
		Detail = "hud-detail-sbminicore",
		BuildTimeIntermediate = 5,
		BuildTimeComplete = 25.0,
		ScrapPeriod = 1.5,
		MetalCost = 300,
		EnergyCost = 2500,
		MetalRepairCost = 0,
		EnergyRepairCost = 0,
		MetalReclaimMin = 0.25,
		MetalReclaimMax = 0.5,
		EnergyReclaimMin = 0.1,
		EnergyReclaimMax = 0.5,
		MaxUpAngle = StandardMaxUpAngle,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/devices/ui_devices",
})
table.insert(Sprites, ButtonSprite("hud-sbaviation-icon", "HUD/HUD-sbaviation", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("upgrade"),
{
	SaveName = "sbaviation",
	FileName = path .. "/devices/sbaviationtech.lua",
	Icon = "hud-sbaviation-icon",
	Detail = "hud-detail-armoury",
	BuildTimeComplete = 60,
	ScrapPeriod = 8,
	MetalCost = 400,
	EnergyCost = 2000,
	MetalRepairCost = 300,
	EnergyRepairCost = 1500,
	MetalReclaimMin = 0.25,
	MetalReclaimMax = 0.5,
	EnergyReclaimMin = 0.1,
	EnergyReclaimMax = 0.5,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = false,
	PopulationCap = 1,
	IgnitePlatformOnDestruct = true,
	SelectEffect = "ui/hud/technology/ui_technology",
	Tech = true,
})
table.insert(Sprites, ButtonSprite("hud-air-brake-icon", "HUD/HUD-air-brake", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("sandbags") + 1,
{
	Enabled = true,
	SaveName = "air_brake_base",
	FileName = path .. "/devices/air_brake_base.lua",
	Icon = "hud-air-brake-icon",
	Detail = "hud-detail-metalstore",
	BuildTimeIntermediate = 0,
	BuildTimeComplete = 0,
	ScrapPeriod = 1,
	MetalCost = 30,
	EnergyCost = 400,
	MetalRepairCost = 30,
	EnergyRepairCost = 400,
	MetalReclaimMin = 0,
	MetalReclaimMax = 0,
	EnergyReclaimMin = 0,
	EnergyReclaimMax = 0,
	MaxUpAngle = 30,
	BuildOnGroundOnly = false,
	SelectEffect = "ui/hud/devices/ui_devices",

})

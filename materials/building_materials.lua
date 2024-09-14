for key,value in ipairs(Materials)
do
	if not (value.SaveName == "rope") then
		value.AngleStressPrimaryThreshold = 25
		local extraStrength = 1.05
		value.MaxCompression = value.MaxCompression
		value.MaxExpansion = value.MaxExpansion * extraStrength
	end
end

--This is from Skyforts :)

-- Increase the drag of bracing and armour to make flown forts a bit more stable
local Bracing = FindMaterial("bracing")
if 	Bracing then
	Bracing.AirDrag = Bracing.AirDrag * 2
end
local Armour = FindMaterial("armour")
if 	Armour then
	Armour.AirDrag = Armor.AirDrag * 2
end

-- This is for airbreak
table.insert(Materials,
{
	Enabled = false,
	SaveName = "fast_bracing_draggy",
	Icon = "hud-bracing-icon",
	Detail = "hud-detail-armor",
	Sprite = "bracing",
	DoorTargetSaveName = nil,
	KeySpriteByDamage = true,
	Stiffness = 200000,
	MaxCompression = 0.90,
	MaxExpansion = 1.1,
	MinLength = StandardMinLength,
	MaxLength = StandardMaxLength,
	MaxLinkLength = StandardMaxLinkLength,
	Mass = 0.2,
	AirDrag = 3000,
	HitPoints = 100,
	AbsorptionMomentumThreshold = 30,
	ReflectionMomentumThreshold = 80,
	PenetrationMomentumThreshold = 1000,
	RicochetVariationFactor = 0,
	SpeedLossFactor = 1,
	MetalBuildCost = 0,
	MetalRepairCost = 0,
	MetalReclaim = 0,
	EnergyBuildCost = 0,
	EnergyRepairCost = 0,
	EnergyReclaim = 0,
	EnergyRunCost = 0,
	
	BuildTime = 0,
	ScrapTime = 0,
	
	RepairRateMultiplier = 1.5,
	SupportsDevices = true,
	ReflectsBeams = false,
	FullExtrusion = true,
	RecessionTargetSaveName = "backbracing",
	Node = StandardNode,
	IsBehindDevices = false,
	AttachesCladding = true,
	BuildEffect = nil,
	DestroyEffect = nil,
	IsFogOfWarArmour = true,
	FogOfWarTargetSaveName = "bracing",
})



table.insert(Materials,

{
	Enabled = false,
	SaveName = "fast_bracing",
	Icon = "hud-bracing-icon",
	Detail = "hud-detail-armor",
	Sprite = "bracing",
	DoorTargetSaveName = nil,
	KeySpriteByDamage = true,
	Stiffness = 200000,
	MaxCompression = 0.90,
	MaxExpansion = 1.1,
	MinLength = StandardMinLength,
	MaxLength = StandardMaxLength,
	MaxLinkLength = StandardMaxLinkLength,
	Mass = 0.2,
	AirDrag = 6.4,
	HitPoints = 100,
	AbsorptionMomentumThreshold = 30,
	ReflectionMomentumThreshold = 80,
	PenetrationMomentumThreshold = 1000,
	RicochetVariationFactor = 0,
	SpeedLossFactor = 1,
	MetalBuildCost = 0,
	MetalRepairCost = 0,
	MetalReclaim = 0,
	EnergyBuildCost = 0,
	EnergyRepairCost = 0,
	EnergyReclaim = 0,
	EnergyRunCost = 0,
	
	BuildTime = 0,
	ScrapTime = 0,
	
	RepairRateMultiplier = 1.5,
	SupportsDevices = true,
	ReflectsBeams = false,
	FullExtrusion = true,
	RecessionTargetSaveName = "backbracing",
	Node = StandardNode,
	IsBehindDevices = false,
	AttachesCladding = true,
	BuildEffect = nil,
	DestroyEffect = nil,
	IsFogOfWarArmour = true,
	FogOfWarTargetSaveName = "bracing",
})

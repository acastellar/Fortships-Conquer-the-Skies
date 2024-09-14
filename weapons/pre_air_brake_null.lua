Scale = 1.0
SelectionWidth = 40.0
SelectionHeight = 40.0
SelectionOffset = { 0.0, -40.5 }

WeaponMass = 0
HitPoints = 100.0

EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0

DrawBracket = false
DrawBehindTerrain = false
NoReclaim = false
TeamOwned = true
BlockPenetration = true

ConstructEffect = "effects/device_smoke.lua"
CompleteEffect = "effects/device_smoke.lua"
DestroyEffect = "effects/device_smoke.lua"
HurtEffect = "effects/device_smoke.lua"
dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

ReloadEffect = nil
ReloadEffectOffset = -.5
Projectile = "machinegun"
BarrelLength = 60.0
MinFireClearance = 0
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 0.01
MinFireSpeed = 1000.0
MaxFireSpeed = 1000.1
MinFireRadius = 0.0000001
MaxFireRadius = 0.0000002
MinVisibility = 0.000001
MaxVisibilityHeight = 0.000001
MinFireAngle = -0.00001
MaxFireAngle = 0.00001
KickbackMean = 0.0001
KickbackStdDev = 0.0001
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.02
FireStdDevAuto = 0.01
Recoil = 0
EnergyFireCost = 0.0
MetalFireCost = 0

ShowFireAngle = false
ShowFireSpeed = false

Sprites =
{
	{
  	Name = "pre_air_brake_null",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/air_brake_null/air_brake_null.tga" }, mipmap = true, }, },
		},
	},
}

Root =
{
  Name = "Barrel",
  Angle = 0,
	Pivot = { 0, -0.210},
	PivotOffset = { 0, 0 },
	Sprite = "pre_air_brake_null",
  {
	},
}

Scale = 1.0
SelectionWidth = 40.0
SelectionHeight = 40.0
SelectionOffset = { 0.0, -40.5 }

Mass = 0.0
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

ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/device_construct.lua"


dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
  	Name = "air_brake_base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/devices/air_brake_base/air_brake_base.tga" }, mipmap = true, }, },
		},
	},
}

Root =
{
  Name = "Barrel",
  Angle = 0,
	Pivot = { 0, -0.210},
	PivotOffset = { 0, 0 },
	Sprite = "air_brake_base",
  {
	},
}

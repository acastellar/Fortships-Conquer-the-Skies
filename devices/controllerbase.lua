ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"

Scale = 1.0
SelectionWidth = 40.0
SelectionHeight = 40.0
SelectionOffset = { 0.0, -40.5 }
Mass = 10.0
HitPoints = 100.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
DrawBracket = false
DrawBehindTerrain = true
NoReclaim = false
TeamOwned = true
BlockPenetration = true
DestroyEffect = ""
dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
  	Name = "controller-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/devices/controller/grey2.png" }, mipmap = true, }, },
		},
	},
}

Root =
{
  Name = "Barrel",
  Angle = 0,
	Pivot = { 0, -0.25},
	PivotOffset = { 0, 0 },
	Sprite = "controller-base",
  {
	},
}

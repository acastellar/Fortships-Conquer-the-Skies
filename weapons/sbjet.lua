DamageWhenNeutral = false
Scale = 1
SelectionWidth = 60.0
SelectionHeight = 40.0
SelectionOffset = { -20.0, -40.5 }
RecessionBox =
{
	Size = { 200, 25 },
	Offset = { -230, -40 },
}

WeaponMass = 250.0
HitPoints = 200.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0

FireEffect = path .. "/effects/jet.lua"
ConstructEffect = "effects/device_upgrade.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/minigun_explode.lua"
ReloadEffect = nil
ReloadEffectOffset = -.5
Projectile = "sbjetair"
BarrelLength = 60.0
MinFireClearance = 0
FireDelay = 0.17
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 0.01
MinFireSpeed = 1500.0
MaxFireSpeed = 1500.1
MinFireRadius = 300.0
MaxFireRadius = 600.0
MinVisibility = 0.6
MaxVisibilityHeight = 600
MinFireAngle = -50
MaxFireAngle = 50
KickbackMean = 5
KickbackStdDev = 2
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.02
FireStdDevAuto = 0.01
Recoil = 250000
EnergyFireCost = 100.0
MetalFireCost = 0
RoundsEachBurst = 28
RoundPeriod = 0.05
ShowFireAngle = true

--[[
-- sinusoid sweep
function ProjectileAngle(index)
	local angle = index*(2*3.1415/RoundsEachBurst)
	return 3*math.sin(angle)
end
]]

TargetIcon =
{
	Persistent = true,
	Texture = "ui/textures/mouse_target.tga",
	Width = 32,
	Height = 32,
}


dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
		Name = "sbjet-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/sbpropeller/base.tga" }, mipmap = true, }, },
			Idle = Normal,
		},
	},
	{
		Name = "sbjet-head",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/sbpropeller/jethead.tga" }, mipmap = true, }, },
			Idle = Normal,
		},
	},
	{
		Name = "sbjetblast",
		InitialState = "Null",
		States =
		{
			Null = {},
			Flash =
			{
				Frames =
				{
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet4.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet4.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet4.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet4.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet4.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet5.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet7.png" },
					{ texture = path .. "/effects/media/jet6.png" },
					{ texture = path .. "/effects/media/jet0.png" },
					{ texture = path .. "/effects/media/jet4.png" },
					{ texture = path .. "/effects/media/jet0.png", colour = { 1, 1, 1, 0.0 }, duration = 2 }, -- just makes a blank frame long enough to last the rest of the effect
					
					duration = 0.05,
					blendColour = false,
					blendCoordinates = false,
					mipmap = true,
				},
				--RandomPlayLength = 2,
				LoopExitState = "Null",
			},
		},
	},
}

Root =
{
	Name = "Minigun",
	Angle = 0,
	Pivot = { 0.150, -0.28 },
	PivotOffset = { 0, 0 },
	Sprite = "sbjet-base",
	UserData = 0,
	
	ChildrenBehind =
	{
		{
			Name = "Head",
			Angle = 0,
			Pivot = { -0.06, -0.14},
			PivotOffset = { -0.06, 0.14 },
			Sprite = "sbjet-head",
			UserData = 50,

			ChildrenInFront =
			{
				{
					Name = "Hardpoint0",
					Angle = 90,
					Pivot = { 0.00, -0.2 },
					PivotOffset = { 0, 0 },
				},
				{
					Name = "Chamber",
					Angle = 0,
					Pivot = { 0.0, 0.0 },
					PivotOffset = { 0, 0 },
				},
				{
					Name = "MuzzleFlash",
					Angle = 0,
					Pivot = { 0.75, -0.165 },
					PivotOffset = { 0, 0 },
					Sprite = "sbjetblast",
					Visible = false,
				},
			},
		},
	},
--[[
	ChildrenInFront =
	{
		{
			Name = "Scaffold",
			Sprite = "under_construction",
			Visible = false,
		},
		{
			Name = "ScaffoldProgress",
			Sprite = "under_construction_progress",
			Visible = false,
		},
	},
]]
}

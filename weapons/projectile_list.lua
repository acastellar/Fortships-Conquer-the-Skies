HeavyFlakDetonation = { Effect = "mods/weapon_pack/effects/flak_explode.lua", Offset = -120, Terminate = true, }
table.insert(Projectiles,
{
	SaveName = "heavyFlak",

	PassesEnemyPortals = false,
	ProjectileType = "bullet",
	ProjectileSprite = "weapons/media/bullet",
	ProjectileSpriteMipMap = false,
	DrawBlurredProjectile = true,
	ProjectileMass = 0.2,
	ProjectileDrag = 0,
	DeflectedByShields = false,
	ExplodeOnTouch = true,
	ProjectileThickness = 2.0,
	ProjectileShootDownRadius = 150,
	Impact = 250000,
	ProjectileDamage = 0.5,
	AntiAirDamage = 0,
	WeaponDamageBonus = 6.0,
	SpeedIndicatorFactor = 5.0,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	WeaponDamageBonus = 12.5,

	Effects =
	{
		Impact =
		{
			["default"] = HeavyFlakDetonation ,
		},
		Deflect =
		{
			["bracing"] = "effects/bullet_bracing_hit.lua",
			["backbracing"] = "effects/bullet_bracing_hit.lua",
			["armour"] = "effects/bullet_armor_ricochet.lua",
			["door"] = "effects/bullet_armor_ricochet.lua",
			["shield"] = "effects/energy_shield_ricochet.lua",
			["default"] = "effects/bullet_bracing_hit.lua",
		},
	},

	DamageMultiplier =
		{
			{ SaveName = "portal", Direct = 180 },
		},
})

SpawnDet = { Effect = path.. "", Projectile = { Count = 1, Type = "Mine", Speed = 0.00001, StdDev = 0.00001 }, Terminate = true, KeepLifespan = true, }
table.insert(Projectiles,
{
	
	SaveName = "Mine",
	ProjectileType = "mortar",
	ProjectileSprite = path .. "/weapons/mineLayer/Mine.png",
	ProjectileSpriteMipMap = false,
	ExpiresOnFreeFall = false,
	DrawBlurredProjectile = false,
	ProjectileMass = 0.25,
	ProjectileDrag = 1,
	DeflectedByShields = false,
	DeflectedByTerrain = false,
	ExplodeOnTouch = true,
	ProjectileThickness = 3.0,
	Impact = 50000,
	ProjectileDamage = 5000,
	ProjectileSplashDamage = 500,
	ProjectileSplashDamageMaxRadius = 45,
	ProjectileIncendiary = true,
	IgnitesBackgroundMaterials = true,
	IgnitesBackgroundMaterialsPassing = true,
	IgnitesBackgroundMaterialsPassingSource = false,
	IncendiaryRadius = 5,
	IncendiaryRadiusHeated = 50,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	MaxAge = 175,
	Gravity = 0,
	Effects =
	{
		Impact =
		{
			["default"] = SpawnDet,
		},
		Age =
		{
			t1000 = SpawnDet,
		},
		
	},
	
})




table.insert(Projectiles,
{
	TrailEffect = path.. "/effects/Flame_trail.lua",
	SaveName = "flame1",
	ProjectileType = "mortar",
	ProjectileSpriteMipMap = false,
	ExpiresOnFreeFall = false,
	DrawBlurredProjectile = false,
	ProjectileMass = 0.25,
	ProjectileDrag = 0.021,
	DeflectedByShields = true,
	DeflectedByTerrain = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 2.0,
	ProjectileShootDownRadius = 14,
	Impact = 50000,
	ProjectileDamage = 3,
	ProjectileSplashDamage = 2.5,
	ProjectileSplashDamageMaxRadius = 5.0,
	ProjectileIncendiary = true,
	IgnitesBackgroundMaterials = true,
	IgnitesBackgroundMaterialsPassing = true,
	IgnitesBackgroundMaterialsPassingSource = false,
	IncendiaryRadius = 15,
	IncendiaryRadiusHeated = 25,
	SpeedIndicatorFactor = 0.05,
	SpeedIndicatorFactor = 5.0,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	MaxAge = 0.6,
	Gravity = 0,
	Effects =
	{
		Impact =
		{
			["default"] = path .. "/effects/empty.lua",
		},
		Deflect =
		{
			["default"] = path .. "/effects/empty.lua",
		},
	},
	
})


table.insert(Projectiles,
{
	TrailEffect = path.. "/effects/Flame_trail.lua",
	SaveName = "ram1",
	ProjectileType = "mortar",
	ProjectileSpriteMipMap = false,
	ExpiresOnFreeFall = false,
	DrawBlurredProjectile = false,
	ProjectileMass = 0.25,
	ProjectileDrag = 0.021,
	DeflectedByShields = true,
	DeflectedByTerrain = false,
	ExplodeOnTouch = true,
	ProjectileThickness = 2.0,
	ProjectileShootDownRadius = 14,
	Impact = 5500000,
	ProjectileDamage = 10000,
	SpeedIndicatorFactor = 0.05,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	MaxAge = 0.1,
	Gravity = 0,
	Effects =
	{
		Impact =
		{
			["default"] = path .. "/effects/empty.lua",
		},
		Deflect =
		{
			["default"] = path .. "/effects/empty.lua",
		},
	},
	
})

table.insert(Projectiles,
{
	TrailEffect = path.. "/effects/Flame_trail.lua",
	SaveName = "flameEffect",
	ProjectileType = "mortar",
	path .. "/effects/media/blank.png",
	ProjectileSpriteMipMap = false,
	ExpiresOnFreeFall = false,
	DrawBlurredProjectile = false,
	ProjectileMass = 0.25,
	ProjectileDrag = 0.021,
	DeflectedByShields = true,
	DeflectedByTerrain = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 2.0,
	ProjectileShootDownRadius = 14,
	Impact = 50000,
	ProjectileDamage = 3,
	ProjectileSplashDamage = 2.5,
	ProjectileSplashDamageMaxRadius = 1.0,
	ProjectileIncendiary = true,
	IgnitesBackgroundMaterials = true,
	IgnitesBackgroundMaterialsPassing = true,
	IgnitesBackgroundMaterialsPassingSource = false,
	IncendiaryRadius = 2.5,
	IncendiaryRadiusHeated = 10,
	SpeedIndicatorFactor = 0.05,
	SpeedIndicatorFactor = 5.0,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	MaxAge = 0.3,
	Gravity = 0,
	Effects =
	{
		Impact =
		{
			["default"] = path .. "/effects/empty.lua",
		},
		Deflect =
		{
			["default"] = path .. "/effects/empty.lua",
		},
		
	},
	
})

--Samster's Projectiles
table.insert(Projectiles,
{
	
	SaveName = "sbair",

	ProjectileType = "bullet",
	ProjectileSprite = path .. "/effects/media/blank.png",
	ProjectileSpriteMipMap = false,
	ExpiresOnFreeFall = false,
	DrawBlurredProjectile = true,
	ProjectileMass = 0.25,
	ProjectileDrag = 0.021,
	DeflectedByShields = true,
	DeflectedByTerrain = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 2.0,
	ProjectileShootDownRadius = 14,
	Impact = 50000,
	ProjectileDamage = 0.0,
	WeaponDamageBonus = 0.0,
	SpeedIndicatorFactor = 5.0,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	MaxAge = 1.4,
	Gravity = 0,
	Effects =
	{
		Impact =
		{
			["default"] = path .. "/effects/empty.lua",
		},
		Deflect =
		{
			["default"] = path .. "/effects/empty.lua",
		},
	},
	
})
sbspawnair = {Projectile = { Count = 1, Type = "sbair", Speed = 1000, StdDev = 0.3 }, Terminate = true, }
table.insert(Projectiles,
{
	
	SaveName = "sbjetair",

	ProjectileType = "bullet",
	ProjectileSprite = path .. "/effects/media/blank.png",
	ProjectileSpriteMipMap = false,
	ExpiresOnFreeFall = false,
	DrawBlurredProjectile = true,
	ProjectileMass = 0.25,
	ProjectileDrag = 0.021,
	DeflectedByShields = true,
	DeflectedByTerrain = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 2.0,
	ProjectileShootDownRadius = 14,
	Impact = 230000,
	ProjectileDamage = 0.0,
	WeaponDamageBonus = 0.0,
	SpeedIndicatorFactor = 5.0,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	Gravity = 0,
	Effects =
	{
		Impact =
		{
			["default"] = path .. "/effects/empty.lua",
		},
		Deflect =
		{
			["default"] = path .. "/effects/empty.lua",
		},
		Age =
		{
			t1200 = sbspawnair,
		},
	},
	
})

table.insert(Projectiles,
{
		SaveName = "sbcarpetbomb",

		ProjectileType = "mortar",
		DrawBlurredProjectile = false,
		ProjectileMass = 20.0,
		ProjectileDrag = 0.1,
		ProjectileIncendiary = false,
		DeflectedByShields = false,
		ExplodeOnTouch = true,
		ProjectileThickness = 4.0,
		ProjectileShootDownRadius = 15,
		Impact = 200000,
		DisableShields = true,
		BeamTileRate = 0.02,
		BeamScrollRate = 0.0,
		ProjectileDamage = 40.0,
		ProjectileSplashDamage = 15,
		ProjectileSplashDamageMaxRadius = 50.0,
		SpeedIndicatorFactor = 0.05,
		Gravity = 400,

		TrailEffect = path .. "/effects/carpetbombtrail.lua",

		Projectile =
		{
			Root =
			{
				Name = "Root",
				Angle = -90,
				Sprite = path .. "/weapons/sbbombbay/carpet.png",
			
			},
		},
		Effects =
		{
			Impact =
			{
				["shield"] = "effects/energy_shield_ricochet.lua",
				["default"] = "effects/mortar_air_burst.lua",
			},
			Deflect =
			{
				["armour"] = "effects/armor_ricochet.lua",
				["door"] = "effects/armor_ricochet.lua",
			},
		},
		DamageMultiplier =
		{
			{ SaveName = "sandbags", Direct = 0.8, Splash = 0.8 },
		},
})
table.insert(Projectiles,
{
		SaveName = "sbnukebomb",

		ProjectileType = "mortar",
		DrawBlurredProjectile = false,
		ProjectileMass = 20.0,
		ProjectileDrag = 0.1,
		ProjectileIncendiary = false,
		DeflectedByShields = false,
		ExplodeOnTouch = true,
		ProjectileThickness = 4.0,
		ProjectileShootDownRadius = 15,
		Impact = 400000,
		DisableShields = true,
		BeamTileRate = 0.02,
		BeamScrollRate = 0.0,
		ProjectileDamage = 400.0,
		ProjectileSplashDamage = 100,
		ProjectileSplashDamageMaxRadius = 330.0,
		SpeedIndicatorFactor = 0.05,
		Gravity = 400,

		TrailEffect = path .. "/effects/nukebombtrail.lua",

		Projectile =
		{
			Root =
			{
				Name = "Root",
				Angle = -90,
				Sprite = path .. "/weapons/sbbombbay/nuke.png",
			
			},
		},
		Effects =
		{
			Impact =
			{
				["device"] = "effects/missile_structure_hit.lua",
				["antiair"] = "effects/missile_structure_hit.lua",
				["foundations"] = "effects/missile_ground_hit.lua",
				["rocks01"] = "effects/missile_ground_hit.lua",
				["shield"] = "effects/missile_structure_hit.lua",
				["default"] = "effects/missile_structure_hit.lua",
			},
			Deflect =
			{
				["armour"] = "effects/armor_ricochet.lua",
				["door"] = "effects/armor_ricochet.lua",
			},
		},
		DamageMultiplier =
		{
			{ SaveName = "sandbags", Direct = 0.8, Splash = 0.8 },
		},
})
sbHangFlakDetonation = { Effect = "mods/weapon_pack/effects/flak_explode.lua", Projectile = { Count = 12, Type = "machinegun", Speed = 8000, StdDev = 0.8 }, Offset = -120, Terminate = true, }
table.insert(Projectiles,
{
	SaveName = "sbhangflak",

	ProjectileType = "bullet",
	ProjectileSprite = "weapons/media/bullet",
	ProjectileSpriteMipMap = false,
	DrawBlurredProjectile = true,
	ProjectileMass = 0.2,
	ProjectileDrag = 0,
	DeflectedByShields = false,
	ExplodeOnTouch = true,
	ProjectileThickness = 2.0,
	ProjectileShootDownRadius = 150,
	CollisionLookaheadDist = 120,
	Impact = 10000,
	ProjectileDamage = 6.0,
	AntiAirDamage = 0,
	WeaponDamageBonus = 6.0,
	SpeedIndicatorFactor = 5.0,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,

	Effects =
	{
		Impact =
		{
			["default"] = sbHangFlakDetonation,
		},
		Deflect =
		{
			["bracing"] = "effects/bullet_bracing_hit.lua",
			["backbracing"] = "effects/bullet_bracing_hit.lua",
			["armour"] = "effects/bullet_armor_ricochet.lua",
			["door"] = "effects/bullet_armor_ricochet.lua",
			["shield"] = "effects/energy_shield_ricochet.lua",
			["default"] = "effects/bullet_bracing_hit.lua",
		},
		Age =
		{
			t200 = sbHangFlakDetonation,
		},
	},
})
table.insert(Projectiles,
{
	SaveName = "sbhangcannon",

	ProjectileType = "mortar",
	ProjectileSprite = "weapons/media/bullet",
	ProjectileSpriteMipMap = false,
	DrawBlurredProjectile = true,
	ProjectileMass = 16,
	ProjectileDrag = 0,
	Impact = 20000,
	DisableShields = false,
	DeflectedByShields = true,
	PassesThroughMaterials = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 7.5,
	ProjectileShootDownRadius = 60,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	ProjectileDamage = 120.0,
	ProjectileSplashDamage = 20.0, -- low splash damage
	ProjectileSplashDamageMaxRadius = 50,
	ProjectileSplashMaxForce = 10000, -- moderate shockwave
	AntiAirHitpoints = 40,
	SpeedIndicatorFactor = 0.25,
	

	TrailEffect = "mods/weapon_pack/effects/20mmcannon_trail.lua",

	Effects =
	{
		Impact =
		{
--			["device"] = "effects/impact_medium.lua",
--			["foundations"] = "effects/impact_medium.lua",
--			["rocks01"] = "effects/impact_heavy_ground.lua",
--			["bracing"] = "effects/impact_medium.lua",
--			["armour"] = "effects/impact_medium.lua",
--			["door"] = "effects/impact_medium.lua",
			["shield"] = "effects/impact_shield.lua",
			["default"] = "effects/impact_heavy.lua",
		},	
		Deflect =
		{
			["armour"] = { Effect = "effects/armor_ricochet.lua", Splash = false },
			["door"] = { Effect = "effects/armor_ricochet.lua", Splash = false },
			["shield"] = { Effect = "effects/energy_shield_ricochet.lua", Splash = false },
		},
	},
})

-- Airbreak
table.insert(Projectiles, 
{
  SaveName = "plank_killer",

  ProjectileType = "mortar",
  ProjectileSprite = nil,
  ProjectileSpriteMipMap = false,
  DrawBlurredProjectile = true,
  ProjectileMass = 0.1,
  ProjectileDrag = 0.5,
  Impact = 0,
  DestroyShields = true,
  DeflectedByShields = false,
  PassesThroughMaterials = false,
  ExplodeOnTouch = true,
  ProjectileThickness = 1,
  ProjectileShootDownRadius = 1,
  SurvivesProjectileCollision = true,
  BeamTileRate = 0.02,
  BeamScrollRate = 0.0,
  ProjectileDamage = 150.0,
  ProjectileSplashDamage = 0,
  ProjectileSplashDamageMaxRadius = 0,
  ProjectileSplashMaxForce = 0,
  SpeedIndicatorFactor = 0.5,
  
  Gravity = 1000^2,


  Effects = 
  {  
    Impact = 
	{
		default = nil
	},
			
    Deflect = 
	{
		default = nil
	}			
  },
  
  DamageMultiplier =
	{
		{ SaveName = "reactor", Direct = 0, Splash = 0 }, 
		{ SaveName = "device", Direct = 0, Splash = 0 },
		{ SaveName = "weapon", Direct = 0, Splash = 0},
	},
  
  
  
})


-- Laser intigration
function sbffMakeFlamingVersion(saveName, damageBoost, maxAge, trailEffect, incendiaryRadius, flareEffect, expireEffect)
	local projectile = FindProjectile(saveName)
	if not projectile then Log("Error: MakeFlamingVersion unable to find " .. saveName) return end

	projectile.CollidesWithBeams = true
	projectile.Effects.Impact["firebeam"] = { Effect = flareEffect, Projectile = { Count = 1, Type = "flaming" .. saveName, StdDev = 0 }, Splash = false, Terminate = true, KeepLifespan = true, PosT = 1, Offset = 0 }

	local flamingProjectile = DeepCopy(projectile)
	flamingProjectile.SaveName = "flaming" .. saveName
	if projectile.ProjectileType == "bullet" then
		flamingProjectile.ProjectileType = "mortar"
	end

	incendiaryRadius = incendiaryRadius or 0

	flamingProjectile.TrailEffect = path .. "/effects/" .. trailEffect .. ".lua"
	flamingProjectile.ProjectileIncendiary = true
	flamingProjectile.AlwaysIncendiary = true
	flamingProjectile.IncendiaryRadius = incendiaryRadius
	flamingProjectile.IncendiaryRadiusHeated = incendiaryRadius
	flamingProjectile.IncendiaryOffset = 0.5*incendiaryRadius
	flamingProjectile.MaxAge = maxAge
	flamingProjectile.Effects.Impact["firebeam"] = { Splash = false, Terminate = false, }

	if flamingProjectile.ProjectileSplashDamage then
		flamingProjectile.ProjectileSplashDamage = damageBoost*flamingProjectile.ProjectileSplashDamage
	else
		flamingProjectile.ProjectileDamage = damageBoost*flamingProjectile.ProjectileDamage
		flamingProjectile.WeaponDamageBonus = damageBoost*(flamingProjectile.WeaponDamageBonus or 0)
	end

	if expireEffect then
		flamingProjectile.Effects.Age = {}
		flamingProjectile.Effects.Age["t1000000"] = { Effect = expireEffect, Terminate = true, }
	end
	table.insert(Projectiles, flamingProjectile)
end

sbffMakeFlamingVersion("sbhangflak", 1.0, 0.05, "flaming_sniper_trail", nil, smallArmsFlare, nil)
sbffMakeFlamingVersion("sbhangcannon", 1.25, 0.4, "flaming_trail", 80, nil, nil)
sbffMakeFlamingVersion("sbcarpetbomb", 1.33, 1.5, "flaming_swarm_trail", 85, nil, genericFlamingExpire)
sbffMakeFlamingVersion("sbnukebomb", 1.25, 2, "flaming_trail", 150, nil, missileStructureHit)

--tanya geminibeam support
local tanyageminicheck = FindProjectile("geminibeam")
if tanyageminicheck then
	MakeGeminiVersion("sbcarpetbomb", 1.0)
	MakeGeminiVersion("sbnukebomb", 1.0)
	MakeGeminiVersion("sbhangcannon", 1.0)
	MakeGeminiVersion("sbhangflak", 1.0)
	end
--endos empbeam support
local endosempbeamcheck = FindProjectile("empbeam")
if endosempbeamcheck then
	MakeEMPVersion("sbcarpetbomb", 1.25, "blue_trail", 150, 5, EAModPath)
	MakeEMPVersion("sbnukebomb", 1.25, "blue_trail", 400, 8, EAModPath)
	MakeEMPVersion("sbhangcannon", 1.25, "blue_trail", 100, 4, EAModPath)
	end


--KineticBeam support will be handled within Birdies GUNS

--[[
	Feel free to use this file or it's contents in your mods (regardless of what the Readme file says), but leave this comment in when you do.
	Use this file with dofile(path .. "/path/to/this/file.lua") in any script you need it for.
	Note: These functions are not fully bugtested.
	~ Endo
--]]

-- ty endo ~Birdies

--[[
	The code below is used to fix the metallic sounds custom materials give off when they get hit by projectiles.
	I updated it so you can also specify the material to fix, aswell as from which material group to inherit the effects from.
	
	Example: InheritMaterialEffect("bracingdoor", "bracing")
--]]
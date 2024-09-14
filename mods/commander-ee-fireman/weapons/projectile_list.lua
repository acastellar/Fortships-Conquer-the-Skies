DeregisterApplyMod(CommanderApplyModBase)

CommanderApplyModBaseEdited = function()
	local activeRadius = 70
	local activeRadiusHeated = 80
	local activeOffset = 20

	local incendiaryMortar = FindProjectile("mortar")
	if incendiaryMortar then
		incendiaryMortar.IncendiaryRadius = activeRadius
		incendiaryMortar.IncendiaryRadiusHeated = activeRadiusHeated
		incendiaryMortar.IncendiaryOffset = activeOffset
		incendiaryMortar.AlwaysIncendiary = true
	end

	local cannon = FindProjectile("cannon")
	if cannon then
		cannon.ProjectileIncendiary = true
		cannon.IncendiaryRadius = 50
		cannon.IncendiaryRadiusHeated = 60
		cannon.IncendiaryOffset = -10
		cannon.AlwaysIncendiary = true
	end

	local cannon20mm = FindProjectile("cannon20mm")
	if cannon20mm then
		cannon20mm.ProjectileIncendiary = true
	end

	if active then
		local sniper = FindProjectile("sniper")
		local sniper2 = FindProjectile("sniper2")

		if sniper then
			sniper.TrailEffect = "mods/commander-ee-fireman/effects/sniper_trail_incendiary.lua"
		end
		if sniper2 then
			sniper2.TrailEffect = "mods/commander-ee-fireman/effects/sniper_trail_incendiary.lua"
		end
		local mortar = FindProjectile("mortar2")
		if mortar then
			mortar.TrailEffect = "mods/commander-ee-fireman/effects/mortar_trail_smoke_small.lua"
		end

		for k, v in ipairs(Projectiles) do
			if (not v.Savename == "sbjet" or v.Savename == "sbjet2") then
				v.ProjectileIncendiary = true
				if v ~= sniper2 and v ~= incendiaryMortar and v ~= cannon then
					if not v.IncendiaryRadius or v.IncendiaryRadius < activeRadius then
						if v.ProjectileType ~= "bullet" then
							v.IncendiaryRadius = activeRadius
							v.IncendiaryRadiusHeated = activeRadiusHeated
							v.IncendiaryOffset = activeOffset
							v.AlwaysIncendiary = true
						end
						if v.ProjectileType == "missile" then
							-- HACK: need to hard code here otherwise the effect isn't preloaded and goes missing
							v.TrailEffect = "mods/commander-ee-fireman/effects/mortar_trail.lua"
						end
					end
				end
			end
		end
		
		local missile = FindProjectile("missile2")
		if missile then
			missile.IncendiaryRadius = 3.5*activeRadius
			missile.IncendiaryRadiusHeated = 4.0*activeRadiusHeated
			missile.AlwaysIncendiary = true
		end

		local missileDamaged = FindProjectile("damagedmissile2")
		if missileDamaged then
			missileDamaged.IncendiaryRadius = 3.5*activeRadius
			missileDamaged.IncendiaryRadiusHeated = 4.0*activeRadiusHeated
			missileDamaged.AlwaysIncendiary = true
			missileDamaged.TrailEffect = "mods/commander-ee-fireman/effects/mortar_trail_smoke.lua"
		end
	end
end
RegisterApplyMod(CommanderApplyModBaseEdited)
dr_maps = {}

dr_maps["dr_minecraft"] = {
	survi = Vector(-83.629440, 146.014725, 96.031250),
	psico = Vector(1082.980835, -35.714977, 128.031250),
	modelP = "models/player/lingry/minecraft/enderman.mdl",
	modelS = false,
}

dr_maps["deathrun_bananaland_sn"] = {
	survi = Vector(-9031.942383, 441.964447, 128.031250),
	psico = Vector(-9153.458008, -114.104500, 128.031250),
	tp = true,
	install = true,
	modelP = "models/konnie/asapgaming/fortnite/peely.mdl",
	modelS = false,
}

dr_maps["deathrun_cb_egypt_v1"] = {
	survi = Vector(-49.854630, -17.861708, -184.004761),
	psico = Vector(1097.204834, -271.323364, -111.968750),
	install = true,
	modelP = "models/crash_bandicoot_warped/cortex.mdl",
	modelS = "models/crash_bandicoot_warped/crash.mdl",
}

dr_maps["deathrun_family_guy"] = {
	survi = Vector(-418.205017, -317.110504, 64.031250),
	psico = Vector(171.575531, -704.936218, 128.031250),
	install = true,
	modelP = "models/players/joeswanson.mdl",
	modelS = false,
}

dr_maps["deathrun_goldfever"] = {
	survi = Vector(-115.173828, -3.440537, -103.862259),
	psico = Vector(1797.792603, -106.241135, -127.968750),
	modelP = false,
	modelS = false,
}

dr_maps["deathrun_helix_b8"] = {
	survi = Vector(-127.200676, -1354.142334, 80.031250),
	psico = Vector(-65.834976, -1834.561890, 96.031250),
	tp = true,
	modelP = false,
	modelS = false,
}

dr_maps["deathrun_iceworld_v2fix"] = {
	survi = Vector(10.528008, -386.057587, 64.031250),
	psico = Vector(166.052383, 155.545914, 64.031250),
	modelP = false,
	modelS = false,
}

dr_maps["deathrun_industrial"] = {
	survi = Vector(-78.289627, 573.500061, 64.031250),
	psico = Vector(210.402863, 171.315994, 130),
	modelP = false,
	modelS = false,
}

dr_maps["deathrun_simpsons_finalfix"] = {
	survi = Vector(-685.299561, -427.940094, 64.031250),
	psico = Vector(-247.686859, -1130.223267, 64.031250),
	tp = true,
	modelP = "models/player/norrland/mrburns.mdl",
	modelS = false,
}

dr_maps["deathrun_marvelicious_alpha"] = {
	survi = Vector(-513.179688, -18.335657, 64.031250),
	psico = Vector(255.545898, -252.887115, 30),
	tp = true,
	install = true,
	modelP = "models/player/reverse/thanosmff/thanosmff.mdl",
	modelS = false,
}

dr_maps["deathrun_mountains_rc"] = {
	survi = Vector(-660.017639, -4586.543457, -363.968750),
	psico = Vector(-168.936905, -4204.136230, -387.968750),
	modelP = false,
	modelS = false,
}

dr_maps["deathrun_rocketending_v4"] = {
	survi = Vector(256.000000, 256.000000, 108.875000),
	psico = Vector(-48.644726, 231.932343, 308.031250),
	modelP = false,
	modelS = false,
}

dr_maps["deathrun_tp_percolate_oreo"] = {
	survi = Vector(-954.878418, -176.671387, -3.968750),
	psico = Vector(-338.480011, -531.605286, 0.031250),
	modelP = false,
	modelS = false,
}

dr_maps["deathrun_tribute_final"] = {
	survi = Vector(522.613708, -1.764060, -254.968750),
	psico = Vector(-72.603737, -2.293749, -254.968750),
	modelP = false,
	modelS = false,
}

if SERVER then

	local sweps = {}

sweps["deathrun_cb_egypt_v1"] = {

	[1] = {
	pos = Vector(7735.542480, -4160.100586, 192.031250),
	strip = false,
	swep = "tfa_csgo_awp",
	enemy = Vector(7772.064941, -1967.755981, 192.031250)
	},

	[2] = {
	pos = Vector(5681.951660, -3845.219727, 192.031250),
	strip = true,
	swep = "csgo_bowie_slaughter",
	enemy = Vector(5700.439941, -2163.512695, 192.031250)
	},

	[3] = {
	pos = Vector(7686.536133, -5395.020020, 128.031250),
	strip = true,
	swep = "csgo_bowie_slaughter",
	enemy = Vector(7684.793945, -5886.834961, 128.031250)
	},

	[4] = {
	pos = Vector(6028.678223, -5568.027832, 256.031250),
	strip = false,
	swep = "csgo_cssource",
	enemy = Vector(5539.334961, -5586.271973, 208.031250)
	},

}

sweps["deathrun_family_guy"] = {

	[1] = {
	pos = Vector(1645.761841, 796.535828, 96.031250),
	strip = true,
	swep = "csgo_bowie_slaughter",
	enemy = Vector(1642.528809, 2340.756592, 96.031250)
	},

	[2] = {
	pos = Vector(3232.224121, 1359.795776, 96.031250),
	strip = true,
	swep = "csgo_bowie_slaughter",
	enemy = Vector(3221.875000, 1870.529175, 96.031250)
	},

}

sweps["deathrun_marvelicious_alpha"] = {

	[1] = {
	pos = Vector(1015.758789, 2554.501465, 64.031250),
	strip = true,
	swep = "csgo_bowie_slaughter",
	enemy = Vector(-989.865417, 2552.645752, 64.031250)
	},

}

sweps["deathrun_bananaland_sn"] = {

	[1] = {
	pos = Vector(10084.142578, 1879.827393, -1271.968750),
	strip = true,
	swep = "csgo_bowie_slaughter",
	enemy = Vector(12186.888672, 1847.075073, -1271.968750)
	},

	[2] = {
	pos = Vector(13221.682617, 793.594788, -639.968750),
	strip = false,
	swep = "tfa_csgo_awp",
	enemy = Vector(15604.509766, 759.968750, -639.968750)
	},

}

local tp = {}

tp["deathrun_marvelicious_alpha"] = {

	[1] = {
	pos = Vector(522.140747, 585.062256, 64.031250),
	to = Vector(1015.758789, 2554.501465, 64.031250),
	},

	[2] = {
	pos = Vector(319.906158, 575.035400, 64.031250),
	to = Vector(1015.758789, 2554.501465, 64.031250),
	},

	[3] = {
	pos = Vector(1104.444458, 1011.785645, 64.031250),
	to = Vector(1015.758789, 2554.501465, 64.031250),
	},

}

tp["deathrun_helix_b8"] = {

	[1] = {
	pos = Vector(1222.614258, -2446.449951, 80.031250),
	to = Vector(598.718384, -2811.926758, 80.031250),
	},

}

tp["deathrun_bananaland_sn"] = {

	[1] = {
	pos = Vector(4068.869629, 415.759827, -1215.968750),
	to = Vector(6476.459961, 436.673584, -1215.968750),
	},

	[2] = {
	pos = Vector(10586.527344, 243.135300, -1215.968750),
	to = Vector(10090.460938, 1864.422974, -1271.968750),
	},

}

tp["deathrun_simpsons_finalfix"] = {

	[1] = {
	pos = Vector(1877.083496, -1023.559021, 64.031250),
	to = Vector(16.273409, -179.006851, 256.031250),
	},

}

	local enemy

	local c = 0

	hook.Add("Think","removeDRBugs",function()
		for k,pl in pairs(player.GetAll()) do

			if dr_maps[game.GetMap()].tp then
				for _,t in pairs(tp[game.GetMap()]) do
					if pl:GetPos():Distance(t.pos) < 150 then
						pl:SetPos(t.to)
					end
				end
			end

			if pl:isEnemy() then
				enemy = pl
			end

			if dr_maps[game.GetMap()].install then
			for _,sw in pairs(sweps[game.GetMap()]) do
					if sw.pos:Distance(pl:GetPos()) < 250 then

						c = c + 1

						if c > 1 then return end

						if sw.strip then
							pl:StripWeapons()
						end

						pl:Give(sw.swep)
						pl:SelectWeapon(sw.swep)

							if sw.strip then
								if IsValid(enemy) then
								enemy:StripWeapons()
								end
							end
							if not IsValid(enemy) then return end
							enemy:SetPos(sw.enemy)
							enemy:Give(sw.swep)
							enemy:SelectWeapon(sw.swep)

							function removeCheck()
								if c == 0 then return end
								c = 0
							end

							timer.Simple(60,function()
								removeCheck()
							end)

					end
			end
			end

			if game.GetMap() == "deathrun_cb_egypt_v1" then
				for _,ent in pairs(ents.FindByClass("func_tanktrain")) do
					if ent:GetName() == "trap06_boulder02" then
						ent:Remove()
					end
				end
			end

		end

	end)
end
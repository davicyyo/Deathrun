local ply = FindMetaTable("Player")

local teams = {}

teams[0] = {
	name = "Psicópata",
	color = Color(255,0,0),
	weapons = {"csgo_cssource"},
	health = 100,
	armor = 100,
	speed = 350,
	model = {"models/players/mj_dbd_guam.mdl"},
	max = 1,
}

teams[1] = {
	name = "Supervivientes",
	color = Color(0,174,255),
	weapons = {"csgo_cssource"},
	health = 100,
	armor = 100,
	speed = 250,
	model = {"models/stitch_player.mdl","models/player/kermit.mdl","models/player_octodad.mdl","models/code_gs/buzz/buzzplayer.mdl","models/player/christmas/santa.mdl","models/player/emperor_palpatine.mdl","models/player/donald_trump.mdl"},
	max = 0,
}

teams[2] = {
	name = "Espectador",
	color = Color(100,0,100),
	weapons = {},
	health = 0,
	armor = 0,
	speed = 1,
	model = {"models/editor/playerstart.mdl"},
	max = 0,
}

	for k,v in pairs(teams) do
		team.SetUp( k, v.name, v.color )
	end

function ply:SetupTeam( n )
	if not (teams[n]) then return end

	if teams[n].max != 0 then
		for _,pl in pairs(player.GetAll()) do
			if pl:Team() == n then
				if teams[n].max == 1 then
					n = 1
				end
			end
		end
	end

	self:SetTeam(n)
	self:GodDisable()
	self:SetHealth(teams[n].health)
	self:SetMaxHealth(200)
	self:SetGravity(0)
	if not dr_maps[game.GetMap()].modelS then
	self:SetModel(table.Random(teams[n].model))
	else
	self:SetModel(dr_maps[game.GetMap()].modelS)
	end
	self:SetPos(dr_maps[game.GetMap()].survi)
	self:SetWalkSpeed(teams[n].speed)
	self:SetRunSpeed(teams[n].speed)
	for _,sw in pairs(teams[n].weapons) do
	self:Give(sw)
	end

	self:SetupHands()

	self:AllowFlashlight( true )

	self:Freeze(true)

	timer.Simple(1,function()
		self:Freeze(false)
	end)

	if n == 0 then

		if dr_maps[game.GetMap()].modelP != false then
				timer.Simple(1,function()
					self:SetModel(dr_maps[game.GetMap()].modelP)
					self:SetupHands()
				end)
		end

		timer.Simple(1,function()
			self:SetPos(dr_maps[game.GetMap()].psico)
			for _,p in pairs(player.GetAll()) do
				if p:Team() != 0 and p:GetPos() == dr_maps[game.GetMap()].psico then
					p:SetPos(dr_maps[game.GetMap()].survi)
				end
			end

		end)
	end

	if teams[n] == teams[2] then
		self:GodEnable()
		self:SetRenderMode( RENDERMODE_TRANSALPHA )
		self:SetColor(Color(255,255,255,0))
	else
		self:GodDisable()
		self:SetRenderMode( RENDERMODE_NORMAL )
		self:SetColor(Color(255,255,255,255))
	end

end
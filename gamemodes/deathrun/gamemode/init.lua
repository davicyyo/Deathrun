AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

local downloadFiles = {"sound/wohoo.wav"}

local workshopFiles = {
"https://steamcommunity.com/sharedfiles/filedetails/?id=1637782935",	-- hitler
"https://steamcommunity.com/sharedfiles/filedetails/?id=1118827309",	-- clown
"https://steamcommunity.com/sharedfiles/filedetails/?id=572267883", 	-- santa claus
"https://steamcommunity.com/sharedfiles/filedetails/?id=1436772470",	-- the Clown dead by daylight
"https://steamcommunity.com/sharedfiles/filedetails/?id=1503005475",	-- left 4 dead 2 clown playermodel
"https://steamcommunity.com/sharedfiles/filedetails/?id=579933767",  	-- one punch man player model
"https://steamcommunity.com/sharedfiles/filedetails/?id=216192524",  	-- deathrun marvelicious
"https://steamcommunity.com/sharedfiles/filedetails/?id=216208042",  	-- deathrun familyGuy
"https://steamcommunity.com/sharedfiles/filedetails/?id=724710638",  	-- stitch
"https://steamcommunity.com/sharedfiles/filedetails/?id=747819216",	  -- black player model
"https://steamcommunity.com/sharedfiles/filedetails/?id=216201014",	  -- clown
"https://steamcommunity.com/sharedfiles/filedetails/?id=216201014", 	-- crash bandicoot egypt
"https://steamcommunity.com/sharedfiles/filedetails/?id=216871360",	  -- mountains rc
"https://steamcommunity.com/sharedfiles/filedetails/?id=216572303",	  -- deathrun industrial
"https://steamcommunity.com/sharedfiles/filedetails/?id=216876377",	  -- deathrun rocketending
"https://steamcommunity.com/sharedfiles/filedetails/?id=722374307", 	-- donald trump
"https://steamcommunity.com/sharedfiles/filedetails/?id=216190508", 	-- tp percolate oreo
"https://steamcommunity.com/sharedfiles/filedetails/?id=216585568",	  -- deathrun goldfever
"https://steamcommunity.com/sharedfiles/filedetails/?id=215951766",	  -- Deathrun Simpsons
"https://steamcommunity.com/sharedfiles/filedetails/?id=216189004",	  -- Deathrun Tribute
"https://steamcommunity.com/sharedfiles/filedetails/?id=1512211167",	-- Hobbes the Tiger
"https://steamcommunity.com/sharedfiles/filedetails/?id=1384226325",	-- PUTIN PLAYERMODEL
"https://steamcommunity.com/sharedfiles/filedetails/?id=506283460",	  -- CS:GO Knives SWEPs
"https://steamcommunity.com/sharedfiles/filedetails/?id=1133743135",	-- DR Meme Factory
"https://steamcommunity.com/sharedfiles/filedetails/?id=891607653",	  -- Buzz Lightyear PlayerModel
"https://steamcommunity.com/sharedfiles/filedetails/?id=852648377", 	-- Appearence Miku
"https://steamcommunity.com/sharedfiles/filedetails/?id=810792923",	  -- Big Smoke
"https://steamcommunity.com/sharedfiles/filedetails/?id=216408135",	  -- GTA 5 Playermodels
"https://steamcommunity.com/sharedfiles/filedetails/?id=248725380",	  -- Superhero Playermodels
"https://steamcommunity.com/sharedfiles/filedetails/?id=271967400", 	-- Mirrors Edge
"https://steamcommunity.com/sharedfiles/filedetails/?id=295788137",	  -- WATCH DOGS
"https://steamcommunity.com/sharedfiles/filedetails/?id=303282938",	  -- minecraft exploit fix
"https://steamcommunity.com/sharedfiles/filedetails/?id=310911025",	  -- Spyro the Dragon
"https://steamcommunity.com/sharedfiles/filedetails/?id=316775058",	  -- Mario Playermodel
"https://steamcommunity.com/sharedfiles/filedetails/?id=317291024", 	-- SSBB Luigi
"https://steamcommunity.com/sharedfiles/filedetails/?id=710105645",   -- Spider-Man 2 - Spider-Man
"https://steamcommunity.com/sharedfiles/filedetails/?id=321553067",	  -- SSBB Toon Link
"https://steamcommunity.com/sharedfiles/filedetails/?id=699784388",	  -- Fnaf 2 | Withered Animatronics
"https://steamcommunity.com/sharedfiles/filedetails/?id=656834283",	  -- Doge Playermodel
"https://steamcommunity.com/sharedfiles/filedetails/?id=612053603",	  -- T. Rex Playermodel
"https://steamcommunity.com/sharedfiles/filedetails/?id=356485444",	  -- Teletubbies
"https://steamcommunity.com/sharedfiles/filedetails/?id=674702181",	  -- Picolas Cage
"https://steamcommunity.com/sharedfiles/filedetails/?id=348376962",	  -- Snoop Dogg
"https://steamcommunity.com/sharedfiles/filedetails/?id=400385757",	  -- Arkham City Harley Quinn
"https://steamcommunity.com/sharedfiles/filedetails/?id=400762901",	  -- Arkham Origins Joker
"https://steamcommunity.com/sharedfiles/filedetails/?id=574852065",  	-- Sans
"https://steamcommunity.com/sharedfiles/filedetails/?id=104682188",	  -- dr minecraft
"https://steamcommunity.com/sharedfiles/filedetails/?id=534045470",	  -- SSB4 - Yoshi Playermodel
"https://steamcommunity.com/sharedfiles/filedetails/?id=437842305",	  -- Dead or Alive 5
"https://steamcommunity.com/sharedfiles/filedetails/?id=1500376135",	-- Michael Rosen
"https://steamcommunity.com/sharedfiles/filedetails/?id=452065494",	  -- STAR WARS Darth Vader
"https://steamcommunity.com/sharedfiles/filedetails/?id=457212613",	  -- STAR WARS Emperor Palpatine
"https://steamcommunity.com/sharedfiles/filedetails/?id=1318242000",	-- Pikachu
"https://steamcommunity.com/sharedfiles/filedetails/?id=112806637", 	-- Gmod Legs 3
"https://steamcommunity.com/sharedfiles/filedetails/?id=481588219",	  -- Octodad Playermodel
"https://steamcommunity.com/sharedfiles/filedetails/?id=1159929550",	-- deathrun bananaland
"https://steamcommunity.com/sharedfiles/filedetails/?id=215905830",	  -- Deathrun Helix
"https://steamcommunity.com/sharedfiles/filedetails/?id=215954623",	  -- Deathrun Iceworld
"https://steamcommunity.com/sharedfiles/filedetails/?id=415143062",	  -- TFA Base
"https://steamcommunity.com/sharedfiles/filedetails/?id=485879458",	  -- Kermit The Frog Player Model & NPC
"https://steamcommunity.com/sharedfiles/filedetails/?id=533111726",	  -- TFA CS:GO
"https://steamcommunity.com/sharedfiles/filedetails/?id=533104097",	  -- TFA CS:GO - Main
"https://steamcommunity.com/sharedfiles/filedetails/?id=533112691",	  -- TFA CS:GO - Materials
"https://steamcommunity.com/sharedfiles/filedetails/?id=1587243422",	-- CSGO Official Skin Pack
"https://steamcommunity.com/sharedfiles/filedetails/?id=220336312", 	-- PermaProps
"https://steamcommunity.com/sharedfiles/filedetails/?id=1595369273",	-- Crash Bandicoot - Classic Playermodels
"https://steamcommunity.com/sharedfiles/filedetails/?id=1089799118",	-- Thanos Playermodel
"https://steamcommunity.com/sharedfiles/filedetails/?id=1272987341",	-- Minecraft: Enderman Player Model
"https://steamcommunity.com/sharedfiles/filedetails/?id=1673582026",	-- Peely
"https://steamcommunity.com/sharedfiles/filedetails/?id=383981228",	  -- The Simpsons
"https://steamcommunity.com/sharedfiles/filedetails/?id=1163295415",	-- Family Guy
"https://steamcommunity.com/sharedfiles/filedetails/?id=320524348",  	-- Minecraft Chatbox
}

for _,w in pairs(workshopFiles) do
	resource.AddWorkshop(string.Replace(w,"https://steamcommunity.com/sharedfiles/filedetails/?id=",""))
end

for _,f in pairs(downloadFiles) do
	resource.AddFile(f)
end

hook.Add("Think","checkerLangPlayers",function()
	for _,pl in pairs(player.GetAll()) do
		if pl:GetPData("lang") == nil then
			pl:SetPData("lang","en")
			pl:SetNWInt("lang",pl:GetPData("lang"))
		else
			if pl:GetNWInt("lang") != pl:GetPData("lang") then
			pl:SetNWInt("lang",pl:GetPData("lang"))
			end
		end
	end
end)

timer.Create("AFK/AntiBlock2",40,0,function()
	for _,v in pairs(player.GetAll()) do
		if !IsValid(v) then return end
		if !v:Alive() then return end
		if v:Team() == 0 or v:Team() == 2 or v:IsAdmin() then return end
		v.pos = v:GetPos()
		timer.Simple(10,function()
			if v.pos == v:GetPos() then
				v:sendNotify(lang.afkMSG)
				timer.Create("damageType",5,5,function()
				if !IsValid(v) then return end
				if v.pos != v:GetPos() then return end
				v:TakeDamage(20,v,v)
				v:EmitSound("vo/npc/Alyx/hurt04.wav")
				end)
			end
		end)
	end
end)

local nets = {
	"spectate",
	"remove_spectate",
	"sendnotify",
	"sendMSG",
	"sendMusic",
	"startRoundHUD",
	"removeRoundHUD",
	"sendHalo",
	"sendChat",
}

for _,n in pairs(nets) do
	util.AddNetworkString(n)
end

------[Reading Modules]------
		local files = file.Find( "gamemodes/deathrun/gamemode/modules/*", "GAME" )
		for _,v in pairs(files) do
			print("Loaded: "..v)
			AddCSLuaFile("modules/"..v)
			include("modules/"..v)
		end
------[Reading Modules]------

local allowed = {
	["76561197997048047"] = true, -- DaViCyYo
	["76561198132457102"] = true, -- Stremo
}

hook.Add( "CheckPassword", "access_whitelist", function( steamID64 )
	if not allowed[steamID64] then
		return false, "This game mode is being created!, please visit www.nodes.headarrow.com!"
	end
end )

function GM:PlayerSpawn(ply)

	ply:UnSpectate()

	ply:SetNWBool("removekey",false)

	ply:SetNWInt("dr_packs",ply:getDRPacks())

	if ply:GetNWBool("isKilled") then return false end

	if ply:GetPData("removemusic") == nil then
		ply:SetPData("removemusic","0")
		ply:SetNWInt("removemusic","0")
	else
		ply:SetNWInt("removemusic",ply:GetPData("removemusic"))
	end

end

function GM:CanPlayerSuicide(ply)
	return false
end

function GM:PlayerSwitchFlashlight( pl, b )
	return true
end

function GM:PlayerDeathSound()
	return false
end

local gJ = 0
local c = 0
local count = 0
function GM:PlayerDeathThink(ply)

	getPlayers = {}

	if ply:Team() != 2 && ply:Alive() then
			table.insert(getPlayers,ply)
		end

	if ply:KeyPressed(IN_JUMP) then

		if gJ == 0 then
			ply:Spectate( OBS_MODE_CHASE )
			gJ = 1
		elseif gJ == 1 then
			ply:Spectate( OBS_MODE_IN_EYE )
			gJ = 0
		end

	end

	if ply:KeyPressed(IN_ATTACK) then

		count = count + 1

		if getPlayers[count] == nil then
			count = count - 1
			return
		end

		ply:SpectateEntity( getPlayers[count] )
		ply:sendSpectate(getPlayers[count])

		print(getPlayers[count])

	end

	if ply:KeyPressed(IN_ATTACK2) then

		count = count - 1

		if getPlayers[count] == nil then
			count = count + 1
			return
		end

		ply:SpectateEntity( getPlayers[count] )
		ply:sendSpectate( getPlayers[count] )

		print(getPlayers[count])

	end
end

function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end

function GM:PlayerShouldTakeDamage(ply,att)

	if not ply:IsPlayer() then return end

	if att:IsPlayer() then
		if ply != att then
			if ply:Team() == att:Team() then
				return false
			end
		end
	end

	return true
end

concommand.Add("ent",function(ply)
	local trace = ply:GetEyeTrace()
	local ent = trace.Entity

	print(ent:GetClass())

	--ply:SetupTeam(0)
end)

concommand.Add("givedrpacks",function(ply,cmd,args)
	if !ply:IsSuperAdmin() then return end
	ply:giveDRPacks(args[1])
end)

local pos
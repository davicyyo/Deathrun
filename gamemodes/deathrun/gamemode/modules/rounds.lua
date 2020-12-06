local round = {}

function round.Checker()

	timer.Create("FinishFromTimer",60*5,1,function()
		if round.isStarted() && !round.isFinished() then

			local team0 = 0
			local team1 = 0

			for _,pl in pairs(team.GetPlayers(0)) do
				if IsValid(pl) && pl:Alive() then
					team0 = team0 + 1
				end
			end

			for _,pl in pairs(team.GetPlayers(1)) do
				if IsValid(pl) && pl:Alive() then
					team1 = team1 + 1
				end
			end

			if team0 > team1 then
				round.Winner(0)
			else
				if team0 == team1 then
					round.Winner(math.random(0,1))
				else
					round.Winner(1)
				end
			end

			round.isFinished(true)
			timer.Remove("checkerRounds")
			timer.Remove("FinishFromTimer")

		end
	end)

	timer.Create("checkerRounds",1,0,function()
		if !round.isStarted() then return end

		if #player.GetAll() <= 1 then round.isStarted(false) print("can't start round") round.Winner(player.GetAll()[1]:Team()) return end

		local team0 = 0
		local team1 = 0

		for _,pl in pairs(team.GetPlayers(0)) do
			if IsValid(pl) && pl:Alive() then
				team0 = team0 + 1
			end
		end

		for _,pl in pairs(team.GetPlayers(1)) do
			if IsValid(pl) && pl:Alive() then
				team1 = team1 + 1
			end
		end

		if team0 == 0 and team1 != 0 or team0 != 0 and team1 == 0 then
			if team0 > team1 then
				round.Winner(0)
			else
				round.Winner(1)
			end

			round.isFinished(true)
			timer.Remove("checkerRounds")
		end

	end)

end

local rnS = false
function round.isStarted(bool)
	if bool != false && not bool then
		return rnS
	end

	rnS = bool
end

local rnd = false
function round.isFinished(bool)
	if bool != false && not bool then
		return rnd
	end

	rnd = bool
end


function round.canStart()

	if #player.GetAll() <= 1 then return false end

	if round.isStarted() then return false end

	return true


end

function round.Start()

	if round.isStarted() then return end

	if not round.canStart() then
		local lang = NodesLang[player.GetAll()[1]:GetPData("lang")]
		game.CleanUpMap()
		round.spawn(player.GetAll()[1])
		player.GetAll()[1]:SetupTeam(1)
		round.MSG(lang.waitingplayers)
	return
	end

	for k,v in pairs(player.GetAll()) do
		round.MSG(v,NodesLang[v:GetPData("lang")].startingRound)
	end

	local enemy = table.Random(player.GetAll())

	--round.MSG(enemy:Nick().." is the psycho!")

	game.CleanUpMap()

	for k,v in pairs(player.GetAll()) do
		v:SetupTeam(1)
		round.spawn(v)
	end

	enemy:SetupTeam(0)
	round.spawn(enemy)

	net.Start("startRoundHUD")
	net.Broadcast()

	round.isStarted(true)
	round.isFinished(false)

	round.Checker()

	for k,v in pairs(player.GetAll()) do
		print(v:Nick().." "..v:Team())
	end

end

function round.MSG(sender,text)
		if !sender or !text then return end
		sender:sendChat(Color(0,255,0),text)
	PrintMessage( HUD_PRINTTALK, "[Nodes DR] "..text )
end

local teamName
local text
function round.Winner(winner)
	if !winner then return end
	if winner == 0 then
		color = Color(255,0,0)
	else
		color = Color(0,174,255)
	end

	for k,v in pairs(player.GetAll()) do
		if winner == 0 then
			teamName = NodesLang[v:GetPData("lang")].psycho
			text = NodesLang[v:GetPData("lang")].psychoKill
		else
			teamName = NodesLang[v:GetPData("lang")].survivor
			text = NodesLang[v:GetPData("lang")].surviEscaped
		end

		local txt = NodesLang[v:GetPData("lang")].teamWinner
		txt = string.Replace(txt,"%n",teamName)
		round.MSG(v,txt)
	end

		net.Start("removeRoundHUD")
		net.Broadcast()

		net.Start("sendMSG")
		net.WriteString(string.upper(text))
		net.WriteColor(team.GetColor(winner))
		net.Broadcast()

		net.Start("sendMusic")
		net.Broadcast()

	for _,pl in pairs(player.GetAll()) do
		if pl:Team() == winner then
			if pl:Team() == 0 then
				pl:giveDRPacks(200)
				pl:sendNotify(NodesLang[pl:GetPData("lang")].windrpacks3)
			else
				pl:giveDRPacks(10)
				pl:sendNotify(NodesLang[pl:GetPData("lang")].windrpacks)
			end
		end
	end

	timer.Create("roundEnd",15,1,function()
		game.CleanUpMap(true)
		game.ConsoleCommand("sv_gravity 800\n")

		for k,pl in pairs(player.GetAll()) do
			pl:SetGravity(0)
			pl:KillSilent()
			pl:StripWeapons()
			round.isStarted(false)

		timer.Simple(1,function()
			pl:unSpectate()
			round.Start()
		end)
		end
	end)

end

function round.spawn(player)
	if !player then return end

	player:SetNoCollideWithTeammates( true )
	player:unSpectate()
	player:Spawn()

end


timer.Create("checkerStartRound",1,0,function()
	if round.canStart() then round.Start() timer.Remove("checkerStartRound") return end

	if #player.GetAll() == 1 then
		if !player.GetAll()[1]:Alive() then
			game.CleanUpMap()
			round.spawn(player.GetAll()[1])
			timer.Simple(1,function()
			player.GetAll()[1]:SetupTeam(1)
			end)
		end
	end

end)

function GM:PlayerInitialSpawn(ply)

	if round.isStarted() && !round.isFinished() then timer.Simple(1,function() ply:KillSilent() end) return end

	game.CleanUpMap()
	round.spawn(ply)
	timer.Simple(1,function()
	ply:SetupTeam(1)
	end)

	round.MSG(ply,NodesLang[ply:GetPData("lang")].waitingplayers)
end

function GM:PlayerDeath(pl,wep,killer)

	pl:SetNWBool("isKilled",true)

	if not pl:Team() == 2 then pl:setupTeam(2) end

	if killer != pl && killer:IsPlayer() then
		pl:Spectate( OBS_MODE_CHASE )
		pl:SpectateEntity( killer )
		pl:sendSpectate(killer)

		killer:giveDRPacks(100)
		killer:sendNotify(NodesLang[killer:GetPData("lang")].windrpacks2)

	else

		if #player.GetAll() == 1 then
			pl:Spectate( OBS_MODE_ROAMING )
			pl:sendSpectate()
		else
			pl:Spectate( OBS_MODE_CHASE )
		for _,p in pairs(player.GetAll()) do
			if p:Alive() && p:Team() != 2 then
				pl:SpectateEntity( p )
				pl:sendSpectate(p)
			end
		end
		end
	end

	timer.Simple(2,function()
		if #player.GetAll() <= 1 then
			for k,v in pairs(player.GetAll()) do
				v:SetNWBool("isKilled",false)
			end
		end
	end)
end

hook.Add("round.isStarted()","roundStarted",function()
	return round.isStarted()
end)

hook.Add("round.spawn()","roundSpawn",function(player)
	if !player then return end
	round.spawn(player)
end)

hook.Add("round.MSG()","roundMSG",function(string)
	if !string then return end
	round.MSG(string)
end)
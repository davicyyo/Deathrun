util.AddNetworkString("rtv_client")
util.AddNetworkString("rtv_sv")
util.AddNetworkString("rtv_sound")

local time = 30

local startingRTV = false

for _,pl in pairs(player.GetAll()) do
	pl:SetNWInt("vote",0)
end

local maps = {
"dr_minecraft","deathrun_cb_egypt_v1","deathrun_goldfever",
"deathrun_industrial","deathrun_mountains_rc","deathrun_rocketending_v4",
"deathrun_simpsons_finalfix","deathrun_tp_percolate_oreo","deathrun_tribute_final",
}

function showAgainTimer()
	timer.Create("rtvShow",60*time,1,function()
		if #player.GetAll() <= 1 then showAgainTimer() return end
		StartRTV()
	end)
end

timer.Create("rtvShow",60*time,1,function()
	if #player.GetAll() <= 1 then showAgainTimer() return end
	StartRTV()
end)

function StartRTV()

	if startingRTV then return end

	startingRTV = true

	local map1
	local map2
	local map3
	local map4

	function RandomMaps()
	map1 = table.Random(maps)
	map2 = table.Random(maps)
	map3 = table.Random(maps)
	map4 = table.Random(maps)
		sendChecker()
	end

	local val = {}
	
	function sendChecker()
		val = {map1,map2,map3,map4}

		if table.HasValue(val,game.GetMap()) then
			RandomMaps()
		else
			for k,pl in pairs(player.GetAll()) do
				net.Start("rtv_client")
				net.WriteString(map1)
				net.WriteString(map2)
				net.WriteString(map3)
				net.WriteString(map4)
				net.Send(pl)
			end
		end
	end

	RandomMaps()

end

net.Receive("rtv_sv",function()
	print("hola")
	local map = net.ReadString()

	if map == game.GetMap() then
		startingRTV = false
		timer.Simple(60*15,StartRTV)
	else
		hook.Add("Think","CheckRoundMap",function()
			print("--")
			print(tobool(hook.Call("round.isStarted()")))
			if tobool(hook.Call("round.isStarted()")) == false then
				game.ConsoleCommand("changelevel "..map.."\n")
			end
		end)
	end
end)
local rtvEnable = false
net.Receive("rtv_client",function()
	local m1 = net.ReadString()
	local m2 = net.ReadString()
	local m3 = net.ReadString()
	local m4 = net.ReadString()
	local m5 = game.GetMap()
	rtvEnable = true

	local map1 = 0
	local map2 = 0
	local map3 = 0
	local map4 = 0
	local map5 = 0

	

	local t = 0
	timer.Create("change",1,11,function()
		t = t + 1

		if t == 1 then
			surface.PlaySound("HL1/fvox/ten.wav")
		elseif t == 2 then
			surface.PlaySound("npc/metropolice/vo/nine.wav")
		elseif t == 3 then
			surface.PlaySound("npc/combine_soldier/vo/eight.wav")
		elseif t == 4 then
			surface.PlaySound("npc/overwatch/radiovoice/seven.wav")
		elseif t == 5 then
			surface.PlaySound("npc/metropolice/vo/six.wav")
		elseif t == 6 then
			surface.PlaySound("HL1/fvox/five.wav")
		elseif t == 7 then
			surface.PlaySound("npc/combine_soldier/vo/four.wav")
		elseif t == 8 then
			surface.PlaySound("npc/metropolice/vo/three.wav")
		elseif t == 9 then
			surface.PlaySound("npc/combine_soldier/vo/two.wav")
		elseif t == 10 then
			surface.PlaySound("npc/combine_soldier/vo/one.wav")
		else

			RTV_()

		end
	end)

	function RTV_()


		sound.PlayURL ( "http://nodes.headarrow.com/media/time.mp3", "mono", function( station )
		if ( IsValid( station ) ) then

			station:SetPos( LocalPlayer():GetPos() )

			station:Play()

		else

			LocalPlayer():ChatPrint( "Invalid URL!" )

		end
		end)

		local tb = {m1,m2,m3,m4,m5}

		local time = 30

	NodesMenu['rtv'] = {
		name = "Rock the vote ("..time.." seconds left)",
		access = true,
		items = {
			[1] = {title=m1,action="clientside",result=function() map1 = map1 + 1 end},
			[2] = {title=m2,action="clientside",result=function() map2 = map2 + 1 end},
			[3] = {title=m3,action="clientside",result=function() map3 = map3 + 1 end},
			[4] = {title=m4,action="clientside",result=function() map4 = map4 + 1 end},
			[5] = {title="Extend this map 15 minutes",action="clientside",result=function() map5 = map5 + 1 end},
		},
	}

	hook.Run("NodesMenu.Open","rtv")

	timer.Create("countimescds",1,30,function()
			time = time - 1
			NodesMenu['rtv'].name = "Rock the vote ("..time.." seconds left)"
		end)

		timer.Simple(30,function()
			local winnerTable = {map1,map2,map3,map4,map5}

			local winner = table.GetWinningKey( winnerTable )

			if winner == 1 then
				winner = m1
			elseif winner == 2 then
				winner = m2
			elseif winner == 3 then
				winner = m3
			elseif winner == 4 then
				winner = m4
			elseif winner == 5 then
				winner = game.GetMap()
			else
				winner = table.Random(tb)
			end

			if winner == game.GetMap() then
			chat.AddText( Color( 100, 0, 0 ), "[RTV] ", NodesLang[LocalPlayer():GetNWInt("lang")].RTV_Extend, Color( 255, 255, 255 ))
			else
				local mp = string.Replace(NodesLang[LocalPlayer():GetNWInt("lang")].RTV_NextMap,"%w",winner)
				chat.AddText( Color( 100, 0, 0 ), "[RTV] ", mp, Color( 255, 255, 255 ))
			end

			surface.PlaySound("buttons/button7.wav")

			net.Start("rtv_sv")
			net.WriteString(winner)
			net.SendToServer()

			hook.Call("NodesMenu.Close")

		end)


		local key = 0
		local cg = 0
		hook.Add("PreRender","f3key",function()

		if input.IsKeyDown(KEY_F3) then
			cg = cg + 1

			if cg > 1 then return end

			key = key + 1

			if key == 1 then
				gui.EnableScreenClicker(true)
				timer.Simple(1,function()
					cg = 0
				end)
			else
				gui.EnableScreenClicker(false)
				timer.Simple(1,function()
				key = 0
				cg = 0
				end)
			end
		end

		end)
	end
end)

net.Receive("rtv_sound",function()
	local s = net.ReadString()

	surface.PlaySound(s)
end)
if CLIENT then

	local c = 0
	local removePanel = false
	function SpectateDerma()

		c = c + 1

		if c > 1 then RemoveSpectate() SpectateDerma() return end

		local p = net.ReadEntity()

		local scrSpect = vgui.Create("DFrame")
		scrSpect:SetSize(ScrW(),ScrH())
		scrSpect:SetPos(0,0)
		scrSpect:SetTitle("")
		scrSpect:ShowCloseButton(false)
		scrSpect:SetDraggable(false)
		scrSpect.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
		end

		local ch = 0
		hook.Add("Think","removepanel",function()
				if removePanel == false then return end
				ch = ch + 1

				if ch > 1 then return end
	
				scrSpect:Remove()
				timer.Simple(1,function()
				c = 0
				ch = 0
				end)
			end)

		function RemoveSpectate()

			if not IsValid(scrSpect) then return end
				scrSpect:Remove()
				c = 0
		end

		local t = vgui.Create("DButton",scrSpect)
		t:SetSize(scrSpect:GetWide(),scrSpect:GetTall() * 0.1)
		t:SetPos(scrSpect:GetWide() * 0,scrSpect:GetTall() * 0.9)
		t:SetText(p:Nick())
		t:SetMouseInputEnabled(false)
		t:SetFont("DeathRun_Spect_Font")
		t:SetColor(Color(255,255,255))
		t.Paint = function(self,w,h)
		if !IsValid(p) then return end
		draw.RoundedBox(0,0,0,w,h,team.GetColor(p:Team()))
		end

		local Avatar = vgui.Create( "AvatarImage", scrSpect )
		Avatar:SetSize( scrSpect:GetWide() * 0.075, scrSpect:GetTall() * 0.15 )
		Avatar:SetPos( scrSpect:GetWide() * 0.05,scrSpect:GetTall() * 0.8 )
		Avatar:SetPlayer( p, 128 )
	end

	net.Receive("spectate",SpectateDerma)

	net.Receive("remove_spectate",function()
			removePanel = true

			timer.Simple(1,function()
				removePanel = false
			end)
		end)

end
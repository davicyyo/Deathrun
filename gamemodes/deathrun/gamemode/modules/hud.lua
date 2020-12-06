if !CLIENT then return end

local removePanelRound = false
local ck = 0
function startRoundHUD()

	local t = 60*5

	ck = ck + 1

	if ck > 1 then removeHUD() return end

		local scr = vgui.Create("DFrame")
		scr:SetSize(ScrW(),ScrH())
		scr:SetPos(0,0)
		scr:SetTitle("")
		scr:SetAlpha(0)
		scr:AlphaTo(255,1)
		scr:ShowCloseButton(false)
		scr:SetDraggable(false)
		scr.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(0,0,0,0))
		end

		local tm = vgui.Create("DButton",scr)
		tm:SetSize(scr:GetWide() * 0.05,scr:GetTall() * 0.05)
		tm:SetPos(scr:GetWide() * 0.05,scr:GetTall() * 0.05)
		tm:SetText(t)
		tm:SetColor(Color(255,255,255))
		tm:SetFont("DeathRun_RoundTime")
		tm.Paint = function(self,w,h)
			draw.RoundedBox(40,0,0,w,h,Color(0,174,255))
		end

		timer.Create("getTimer",1,60*5,function()
			t = t - 1
			if not IsValid(tm) then return end
			tm:SetText(t)
		end)

		timer.Simple(60*5,function()
				if IsValid(scr) then
					removePanelRound = true
				end
			end)

		local chD = 0
		hook.Add("Think","removeHUDRound",function()
				if removePanelRound == false then return end
				chD = chD + 1

				if chD > 1 then return end

				timer.Remove("getTimer")

				if not IsValid(tm) then return end
				tm.Paint = function(self,w,h)
					draw.RoundedBox(0,0,0,w,h,Color(0,0,0))
				end

				timer.Simple(2,function()
					scr:AlphaTo(0,1)
					end)
	
				timer.Simple(3,function()
					scr:Remove()
				end)
				timer.Simple(4,function()
				ck = 0
				chD = 0
				end)
			end)

		function removeHUD()

			scr:Remove()
			timer.Remove("getTimer")
			ck = 0

		end

end
net.Receive("startRoundHUD",startRoundHUD)
net.Receive("removeRoundHUD",function()
	removePanelRound = true

	timer.Simple(1,function()
		removePanelRound = false
		end)
end)
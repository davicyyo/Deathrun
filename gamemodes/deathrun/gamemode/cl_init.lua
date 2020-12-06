include( "shared.lua" )

files = {"spectate","f2menu","hud","translate"}

for k,v in pairs(files) do
include("modules/"..v..".lua")
end

surface.CreateFont( "DeathRun_Spect_Font", {
	font = "Coolvetica",
	extended = false,
	size = ScreenScale(25),
} )

surface.CreateFont( "DeathRun_RoundTime", {
	font = "Coolvetica",
	extended = false,
	size = ScreenScale(13),
} )

surface.CreateFont( "DeathRun_HUD", {
	font = "Coolvetica",
	extended = false,
	size = ScreenScale(10),
} )

surface.CreateFont( "DeathRun_HUD2", {
	font = "Coolvetica",
	extended = false,
	size = ScreenScale(16),
} )

surface.CreateFont( "DeathRun_HUD3", {
	font = "Coolvetica",
	extended = false,
	size = ScreenScale(7),
} )

surface.CreateFont( "DeathRun_HUD4", {
	font = "Coolvetica",
	extended = false,
	size = ScreenScale(5),
} )

surface.CreateFont( "DeathRun_HUD5", {
	font = "Coolvetica",
	extended = false,
	size = ScreenScale(13),
} )

function GM:HUDDrawTargetID()
	return true
end

function GM:DrawDeathNotice( x, y )
	return true
end

function GM:ContextMenuOpen()

	return false

end

function GM:SpawnMenuOpen()

	if LocalPlayer():IsAdmin() then return true end

	return false

end

local fVisualHealth = 0

function GM:HUDPaint()

	local w,h = ScrW(),ScrH()
	local lang = NodesLang["en"]
	if LocalPlayer():GetNWInt("lang") != 0 then
		lang = NodesLang[LocalPlayer():GetNWInt("lang")]
	end

	surface.SetDrawColor( 38,46,67 )
	surface.DrawRect( w*0.825, h*0.05, w*0.15, h*0.07 )
	draw.DrawText("www.nodes.headarrow.com", "DeathRun_HUD4", w*0.9,h*0.06, Color( 200,200,200 ), TEXT_ALIGN_CENTER )
	draw.DrawText("Nodes Deathrun ("..GAMEMODE.V2.." "..GAMEMODE.Version..")", "DeathRun_HUD3", w*0.9,h*0.075, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
	draw.DrawText(lang.bugs, "DeathRun_HUD4", w*0.9,h*0.095, Color( 200,200,200 ), TEXT_ALIGN_CENTER )

	if not LocalPlayer():Alive() then return end

	
	fVisualHealth = Lerp(10 * FrameTime(), fVisualHealth, LocalPlayer():Health())

	if fVisualHealth > 100 then fVisualHealth = 100 end

	surface.SetDrawColor( 255,255,255 )
	surface.DrawRect( w*0.75, h*0.75, w*0.2, h*0.18 )
	surface.SetDrawColor( 38,46,67 )
	surface.DrawRect( w*0.75, h*0.88, w*0.2, h*0.05 )
	surface.SetDrawColor( 0,168,236 )
	surface.DrawRect( w*0.75, h*0.88, w*0.2 * (fVisualHealth / 100), h*0.05 )
	draw.DrawText(LocalPlayer():Health().." HP", "DeathRun_HUD", w*0.85,h*0.89, Color( 200,200,200 ), TEXT_ALIGN_CENTER )
	draw.DrawText(LocalPlayer():Nick(), "DeathRun_HUD5", w*0.825,h*0.825, Color( 0,168,236 ), TEXT_ALIGN_LEFT )
	draw.DrawText(LocalPlayer():GetNWInt("dr_packs").." DR PACKS", "DeathRun_HUD", w*0.825,h*0.755, Color( 100,0,0 ), TEXT_ALIGN_LEFT )

		local PL = LocalPlayer()
		PL.ICON = PL.ICON or vgui.Create( "AvatarImage" )
    
        PL.ICON:SetSize( w*0.07,h*0.13 )
        PL.ICON:SetPos( w*0.75,h*0.75 )
        PL.ICON:SetPlayer( LocalPlayer(), 128 )
        PL.ICON:SetPaintedManually(false)
		PL.ICON:PaintManual()
		PL.ICON:SetPaintedManually(true)

end

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudDeathNotice"] = false,
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end
end )

function GM:Think()
	for _,pl in pairs(player.GetAll()) do
			if pl != LocalPlayer() then

				if LocalPlayer():GetPos():Distance(pl:GetPos()) < 150 then
					if LocalPlayer():Team() == pl:Team() then
						pl:SetRenderMode( RENDERMODE_TRANSALPHA )
						pl:SetColor(Color(255,255,255,30))
					end
				else
					pl:SetColor(Color(255,255,255,255))
					pl:SetRenderMode( RENDERMODE_NORMAL )
				end
			end
	end
end

function GM:PlayerBindPress( ply, bind, pressed )
	if (bind == IN_DUCK) then return end
end

function GM:CreateMove(cmd)
	if cmd:KeyDown( IN_JUMP ) then
		if LocalPlayer():WaterLevel() <= 1 && LocalPlayer():GetMoveType() != MOVETYPE_LADDER && !LocalPlayer():IsOnGround() then
			cmd:RemoveKey( IN_JUMP )
		end
	end
end

function GM:PreRender()
end

net.Receive("sendnotify",function()
	local m = net.ReadString()

	notification.AddLegacy( m, NOTIFY_UNDO, 4 )
	surface.PlaySound("buttons/button14.wav")

end)

net.Receive("sendMSG",function()

		local msg = net.ReadString()
		local color = net.ReadColor()

		local scr = vgui.Create("DFrame")
		scr:SetSize(ScrW(),ScrH())
		scr:SetPos(0,0)
		scr:SetTitle("")
		scr:SetAlpha(0)
		scr:AlphaTo(255,1)
		scr:ShowCloseButton(false)
		scr:SetDraggable(false)
		scr.Paint = function(self,w,h)
			draw.RoundedBox(0,0,800,w,h,Color(0,0,0,0))
		end

		local db = vgui.Create("DButton",scr)
		db:SetSize(scr:GetWide(),scr:GetTall() * 0.15)
		db:Center()
		db:SetMouseInputEnabled(false)
		db:SetText(msg)
		db:SetColor(Color(255,255,255))
		db:SetFont("DeathRun_Spect_Font")
		db.Paint = function(self,w,h)
			draw.RoundedBox(0,0,0,w,h,color)
		end


		timer.Simple(14,function()
			scr:AlphaTo(0,1)
			timer.Simple(1,function()
			scr:Remove()
			end)
			end)
end)

net.Receive("sendMusic",function()

	if tostring(LocalPlayer():GetNWInt("removemusic")) == "1" then return end

	RunConsoleCommand("stopsound")

	sound.PlayURL ( "http://nodes.headarrow.com/media/"..math.random(1,20)..".mp3", "mono", function( station )
	if ( IsValid( station ) ) then

		station:SetPos( LocalPlayer():GetPos() )

		station:Play()

		timer.Simple(15,function()
			station:Stop()
			end)

	else

		LocalPlayer():ChatPrint( "Song not upload" )

	end
end )

end)

		local lang = NodesLang[LocalPlayer():GetNWInt("lang")]
		local CreateScoreboard = function()
		Scoreboard = vgui.Create("DFrame")
		Scoreboard:SetSize(ScrW()*.5, ScrH()*.85)
		Scoreboard:Center()
		Scoreboard:SetTitle("")
		Scoreboard:SetAlpha(0)
		Scoreboard:AlphaTo(255,0.2,0)
		Scoreboard:SetDraggable(false)
		Scoreboard:ShowCloseButton(false)
		Scoreboard.Open = function(self)
			Scoreboard:SetVisible(true)
		end
		Scoreboard.Close = function(self)
			Scoreboard:SetVisible(false)
		end
		Scoreboard.Paint = function(self,w,h)
		Derma_DrawBackgroundBlur(self,self.Start)
		draw.RoundedBox(0,0,0,w,h,Color(49,67,150))
		surface.SetDrawColor(164,46,46)
		surface.DrawRect(w*0.1,h*0.25,w*0.015,h*0.02)
		surface.SetDrawColor(0,138,255)
		surface.DrawRect(w*0.25,h*0.25,w*0.015,h*0.02)
		surface.SetDrawColor(255,78,0)
		surface.DrawRect(w*0.425,h*0.25,w*0.015,h*0.02)
		surface.SetDrawColor(255,0,36)
		surface.DrawRect(w*0.625,h*0.25,w*0.015,h*0.02)
		draw.SimpleText(lang.psycho,"DeathRun_HUD3",w*0.12,h*0.247,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText(lang.survivor,"DeathRun_HUD3",w*0.27,h*0.247,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText(lang.survivor.." VIP","DeathRun_HUD3",w*0.445,h*0.247,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.SimpleText(lang.survivor.." ADMIN","DeathRun_HUD3",w*0.645,h*0.247,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		surface.SetDrawColor(164,46,46)
		surface.DrawRect(w*0,h*0.3,w,h*0.2)
		if #team.GetPlayers(0) != 1 then 
		draw.SimpleText(lang.nopsycho,"DeathRun_Spect_Font",w*0.05,h*0.355,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		return end

		for k,v in pairs(team.GetPlayers(0)) do

		local ping = v:Ping()

		draw.SimpleText(v:Nick(),"DeathRun_Spect_Font",w*0.05,h*0.355,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		surface.SetDrawColor(59,67,150)
		surface.DrawRect(w*0.85,h*0.37,w*0.1,h*0.05)
		if ping < 10 && ping >= 0 then
			draw.SimpleText(ping.."/ms","DeathRun_HUD3",w*0.88,h*0.38,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		elseif ping < 100 && ping >= 10 then
			draw.SimpleText(ping.."/ms","DeathRun_HUD3",w*0.8775,h*0.38,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		elseif ping < 1000 && ping >= 100 then
			draw.SimpleText(ping.."/ms","DeathRun_HUD3",w*0.875,h*0.38,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		end
		end

		end


		local dimg = vgui.Create("DHTML",Scoreboard)
		dimg:SetSize(Scoreboard:GetWide(),Scoreboard:GetTall())
		dimg:SetPos(Scoreboard:GetWide()*0.05,Scoreboard:GetTall()*0.08)
		dimg:SetMouseInputEnabled(false)
		dimg:SetHTML([[
			<img src="https://www.nodes.headarrow.com/wp-content/uploads/2019/04/nodes-web.png" height="50" width="200"/>
		]])

		local b = vgui.Create("DButton",Scoreboard)
		b:SetSize(Scoreboard:GetWide()*0.25,Scoreboard:GetTall()*0.08)
		b:SetPos(Scoreboard:GetWide()*0.04,Scoreboard:GetTall()*0.16)
		b:SetText(lang.onlineplayers..": "..#player.GetAll().."/"..game.MaxPlayers())
		b:SetFont("DeathRun_HUD3")
		b:SetColor(Color(255,255,255))
		b:SetMouseInputEnabled(false)
		b.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(247,173,41,0))
		end

		local Scroll = vgui.Create( "DScrollPanel", Scoreboard )
		Scroll:SetSize(Scoreboard:GetWide(),Scoreboard:GetTall()*0.5)
		Scroll:SetPos(Scoreboard:GetWide()*0,Scoreboard:GetTall()*0.5)

		local sbar = Scroll:GetVBar()
		function sbar:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 57,57,57, 0 ) )
		end
		function sbar.btnUp:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0,0 ) )
		end
		function sbar.btnDown:Paint( w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0,0 ) )
		end
		function sbar.btnGrip:Paint( w, h )
			draw.RoundedBox( 5, w * 0.25, 0, w * 0.4, h, Color( 247,173,41 ) )
		end

		local l = vgui.Create( "DIconLayout", Scroll )
		l:SetSize(Scroll:GetWide(),Scroll:GetTall())
		l:SetPos(Scroll:GetWide()*0,Scroll:GetTall()*0)
		l:SetSpaceY( 5 )
		l:SetSpaceX( 5 )

		for k,v in pairs(player.GetAll()) do
			if v:Team() != 0 then
			local alpha = 100
			local ping = v:Ping()
			if v:Alive() then
				alpha = 255
			end
			local bu = l:Add("DButton")
			bu:SetSize(l:GetWide(),Scoreboard:GetTall()*0.08)
			bu:SetPos(l:GetWide()*0,Scoreboard:GetTall()*0)
			bu:SetText("  "..v:Nick())
			bu:SetContentAlignment(4)
			bu:SetFont("DeathRun_HUD")
			bu:SetColor(Color(255,255,255))
			bu.Paint = function(self,w,h)
			if v:GetUserGroup() == "superadmin" then
				draw.RoundedBox(0,0,0,w,h,Color(255,0,36,alpha))
			elseif v:GetUserGroup() == "vip" then
				draw.RoundedBox(0,0,0,w,h,Color(255,78,0,alpha))
			else
				draw.RoundedBox(0,0,0,w,h,Color(0,138,255,alpha))
			end

			surface.SetDrawColor(59,67,150)
			surface.DrawRect(w*0.85,h*0.25,w*0.1,h*0.6)
			if ping < 10 && ping >= 0 then
				draw.SimpleText(ping.."/ms","DeathRun_HUD3",w*0.88,h*0.38,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			elseif ping < 100 && ping >= 10 then
				draw.SimpleText(ping.."/ms","DeathRun_HUD3",w*0.8775,h*0.38,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			elseif ping < 1000 && ping >= 100 then
				draw.SimpleText(ping.."/ms","DeathRun_HUD3",w*0.875,h*0.38,Color(255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			end

			end
			bu.DoClick = function()
				v:ShowProfile()
			end
		end
	end
end

function ScoreboardOpened()

		if !ValidPanel(Scoreboard) then
			CreateScoreboard()
		end

		gui.EnableScreenClicker(true)
		
		return true
end

hook.Add("ScoreboardShow", "Open scoreboard.", ScoreboardOpened)

	function ScoreboardClosed()
		if !ValidPanel(Scoreboard) then
			CreateScoreboard()
		end

		Scoreboard:AlphaTo(0,0.2,0,function()
			Scoreboard:Remove()
		end)
		gui.EnableScreenClicker(false)
		return true
	end

hook.Add("ScoreboardHide", "Close scoreboard.", ScoreboardClosed)


local hal = {}
function HaloFunc(entity,color)
	if table.HasValue(hal,entity) then return end
	hook.Add( "PreDrawHalos", "AddPropHalos", function()

		timer.Create("thinktimer",1,0,function()
			if entity:GetNWBool("HasHalo") == false then
				table.RemoveByValue(hal,entity)
				return
			end
		end)

		table.insert(hal,entity)

		halo.Add( hal, color, 10, 10, 1 )
	end )
end


net.Receive("sendChat",function()
	local color = net.ReadColor()
	local text = net.ReadString()

	chat.AddText(Color(255,255,255),"[",Color(115,202,48),"Nodes DR",Color(255,255,255),"] ",color,text)
end)
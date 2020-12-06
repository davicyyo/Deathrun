CR = {}

CR.ChatCommands = {}

CR.ChatCommands["!help"] = {
color=Color(0,100,0),
msg=[[
!server: Show server list
!restart: Restart play (one player only)
!music: Enable/Disable Music
]]
}

CR.Responder = {}

CR.Responder.Items = {"addons","vip","creador","mierda de sv","ip","rp"}

CR.Responder["addons"] = {
	color=Color(0,100,0),
	msg="Los únicos addons que utilizamos públicos, son de la workshop, el resto son creados por nosotros :P"
}

CR.Responder["vip"] = {
	color=Color(0,100,100),
	msg="VIP en 1 Servidor: 5€/mes, en Todos los servidores: 10€/mes, escribe /vip para más información"
}

CR.Responder["creador"] = {
	color=Color(100,100,0),
	msg="¡Los creadores de Nodes GM son los propios Miembros y jugadores de Nodes!"
}

CR.Responder["mierda de sv"] = {
	color=Color(0,50,50),
	msg="Sentimos que el servidor no sea de tu agrado, siempre puedes salir y no volver jamás."
}

CR.Responder["ip"] = {
	color=Color(50,0,50),
	msg="La IP de este servidor es: deathrun.nodes.es:27015"
}

CR.Responder["rp"] = {
	color=Color(50,0,50),
	msg="Respetar las comunidades y no hagáis Spam, Nodes no tiene pensado crear Roleplay por el momento en gmod"
}
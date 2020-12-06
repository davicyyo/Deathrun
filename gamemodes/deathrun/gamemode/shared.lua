GM.Name = "DeathRun"
GM.Author = "HeadArrow Studios"
GM.Email = "info@headarrow.com"
GM.Website = "nodes.headarrow.com"
GM.Version = "0.1"
GM.V2 = "ALPHA"

DeriveGamemode( "sandbox" )

function GM:Initialize()
	self.BaseClass.Initialize(self)
end

team.SetUp( 0, "Psicópata", Color( 100, 0, 0 ) )
team.SetUp( 1, "Supervivientes", Color( 0, 0, 100 ) )
team.SetUp( 2, "Espectador", Color( 100, 0, 100 ) )

function GM:PlayerNoClip()
	return false
end
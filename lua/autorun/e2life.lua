E2Life = E2Life or {}

if SERVER then	
	E2Life.Admins = {
		"STEAM_0:0:0",
		"STEAM_0:0:41748307"
	}
end

if SERVER then
	AddCSLuaFile("e2life/menu.lua")
else
	include("e2life/menu.lua")
end

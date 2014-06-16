/*
	
	
*/
MsgC(Color(200, 55, 55), "[E2+] ") MsgC(Color(200, 200, 200), "e2life.lua\n")

e2life = e2life or {}


if SERVER then
	
	e2life.Admins = {
		"STEAM_0:0:0",
		"STEAM_0:0:41748307"
	}

else
	
	
	
end




/*=======================
	Load other files
=======================*/
if SERVER then
	AddCSLuaFile"menu.lua"
	
else
	
	include"menu.lua"
end

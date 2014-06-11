/*==================
	Control menu
===================*/
local SetDrawColor = surface.SetDrawColor
local DrawRect = surface.DrawRect
local DrawTexturedRect = surface.DrawTexturedRect

e2life.menu = e2life.menu or {}

local Colors = {
	main = Color(70, 70, 70),
	text = Color(255, 170, 10),
}

local Fonts = {
	
}

local function BuildMenu(panel)
	if not e2life.menu.RootPanel then e2life.menu.RootPanel = panel end
	panel:ClearControls()
	
	/*=== 
		Paint def panel
	===*/
	panel.PaintOver = function(p, w, h) 
		SetDrawColor(Colors.main)
		DrawRect(0, 0, w, 17)
	end
	
	local texid = surface.GetTextureID('vgui/gradient_down')
	panel.Paint = function(p, w, h) 
		SetDrawColor(Colors.main)
		surface.SetTexture(texid)
		DrawTexturedRect(0, 17, w, math.min(h - 16, 7))
	end
	
	/*===
		Controls
	===*/
	local function AddCrossLine(color, h)
		local CrosLine=vgui.Create('DPanel')
			CrosLine:SetTall(h or 2)
			CrosLine.Paint = function(p, w, h) 
				SetDrawColor(color or Colors.main)
				DrawRect(0, 0, w, h)
			end
		panel:AddItem(CrosLine)
	end
	
	AddCrossLine()
	
end

local function RebuildMenu()
	if e2life.menu.RootPanel then
		BuildMenu(e2life.menu.RootPanel)
	end
end

function e2life.UpdateMenu()
	
end

/*===
	Hooks
===*/
hook.Add("SpawnMenuOpen", "E2L_SMO", RebuildMenu)--e2life.UpdateMenu)

hook.Add("PopulateToolMenu", "E2L_PTM", function()
	spawnmenu.AddToolMenuOption("Utilities", "E2Life", "E2Life control menu", "Settings", "", "", BuildMenu)
end)

/*===
	For ULX
===*/
for name, _ in pairs(hook.GetTable()) do
	if name == "UCLChanged" then
		hook.Add("UCLChanged", "E2L_UCLC", e2life.UpdateMenu)
		e2life.ULX = true
		break
	end
end

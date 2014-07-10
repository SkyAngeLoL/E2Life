local SetDrawColor = surface.SetDrawColor
local DrawRect = surface.DrawRect
local DrawTexturedRect = surface.DrawTexturedRect

E2Life.menu = E2Life.menu or {}

local Colors = {
	main = Color(70, 70, 70),
	text = Color(255, 170, 10),
}

local Fonts = {
	
}

local function BuildMenu(panel)
	if not E2Life.menu.RootPanel then E2Life.menu.RootPanel = panel end
	panel:ClearControls()
	
	// Paint functions
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
	
	// Controls
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
	if E2Life.menu.RootPanel then
		BuildMenu(E2Life.menu.RootPanel)
	end
end

hook.Add("SpawnMenuOpen", "E2L.SpawnMenuOpen", RebuildMenu)

hook.Add("PopulateToolMenu", "E2L.PopulateToolMenu", function()
	spawnmenu.AddToolMenuOption("Utilities", "E2Life", "E2Life control menu", "Admin", "", "", BuildMenu)
end)

// Usergroup change events

for name, _ in pairs(hook.GetTable()) do
	if name == "UCLChanged" then
		hook.Add("UCLChanged", "E2L_UCLC", E2Life.UpdateMenu)
		E2Life.ULX = true
		break
	end
end

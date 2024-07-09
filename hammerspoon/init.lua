--- start move cursor bewteen screens
function move_cursor(direction)
	return function()
		local screen = hs.mouse.getCurrentScreen()
		local nextScreen
		if direction == "right" then
			nextScreen = screen:next()
		else
			nextScreen = screen:previous()
		end

		local rect = nextScreen:fullFrame()
		-- get the center of the rect
		local center = hs.geometry.rect(rect).center
		hs.mouse.setAbsolutePosition(center)
	end
end

hs.hotkey.bind({ "ctrl", "shift" }, "Right", move_cursor("right"))
hs.hotkey.bind({ "ctrl", "shift" }, "Left", move_cursor("left"))
-- end move cursor between screens
--
-- hs.hotkey.bind("alt", "1", function()
-- 	local sf = hs.screen.primaryScreen():frame()
-- 	hs.window.focusedWindow():setFrame(hs.geometry.new(sf.x, sf.y, sf.w * 2 / 3, sf.h))
-- end)
--
-- hs.hotkey.bind("alt", "2", function()
-- 	hs.window.focusedWindow():setFrame(hs.screen.allScreens()[2]:frame())
-- end)
--
-- hs.hotkey.bind("alt", "3", function()
-- 	local sf = hs.screen.primaryScreen():frame()
-- 	hs.window.focusedWindow():setFrame(hs.geometry.new(sf.x + sf.w * 2 / 3, sf.y, sf.w / 3, sf.h / 2))
-- end)
--
-- hs.hotkey.bind("alt", "4", function()
-- 	local sf = hs.screen.primaryScreen():frame()
-- 	hs.window.focusedWindow():setFrame(hs.geometry.new(sf.x + sf.w * 2 / 3, sf.y + sf.h / 2, sf.w / 3, sf.h / 2))
-- end)


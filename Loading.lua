
display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()






function scene:createScene(event)


_W = display.viewableContentWidth
_H = display.viewableContentHeight




end


function scene:enterScene(event)
	
	storyboard.purgeScene("ThreeGems")
	local function MsgLis (event)
		storyboard.gotoScene("ThreeGems", {effect = "crossFade", time = 100})

	end

	timer.performWithDelay( 150, MsgLis)
	
end

function scene:exitScene(event)
	
end

function scene:destroyScene(event)
	

end

scene:addEventListener("createScene",scene)
scene:addEventListener("willEnterScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene 
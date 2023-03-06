display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()


function scene:createScene(event)
groupy = self.view
local font1 = "Wensleydale Gothic NBP" 
_W = display.viewableContentWidth
_H = display.viewableContentHeight

whiteScreen = display.newRect(0,0,_W,_H)
whiteScreen.anchorX = 0
whiteScreen.anchorY = 0
whiteScreen.x = 0
whiteScreen.y = 0
whiteScreen:setFillColor(1, 1, 1)
groupy:insert(whiteScreen)

msgTextopt = {
	text = "Updating database and refreshing table....",
	width = _W*0.8,
	height = _H * 0.2,
	font = font1,
	fontSize = 40,
	align = "center"
}

msgText = display.newText(msgTextopt)
msgText.anchorX = 0.5
msgText.anchorY = 0.5
msgText.x = _W * 0.5
msgText.y = _H * 0.5
msgText:setFillColor(1, 0, 0)

groupy:insert(msgText)

local function MsgLis (event)
		storyboard.gotoScene("FloatersTrackerPastRecordViewing",{effect="crossFade",time = 500})
		
end
	
timer.performWithDelay( 250, MsgLis)

end


function scene:enterScene(event)
	
	storyboard.purgeScene("FloatersTrackerPastRecordViewing")
	
	
end

function scene:exitScene(event)
	
end

function scene:destroyScene(event)
	

end

scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)
scene:addEventListener("destroyScene",scene)

return scene 
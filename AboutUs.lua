
display.setStatusBar(display.HiddenStatusBar)

local storyboard = require ("storyboard")

local scene = storyboard.newScene()






function scene:createScene(event)
groupAbout = self.view

_W = display.viewableContentWidth
_H = display.viewableContentHeight
font1 = "Boyz R Gross Shadow NF"
font2 = "Capitals"

-- load background
AboutUsBK = display.newImageRect("Purple_Space_Background.jpg",_W,_H)
AboutUsBK.anchorX = 0; AboutUsBK.anchorY = 0
AboutUsBK.x = 0; AboutUsBK.y = 0
groupAbout:insert(AboutUsBK)

-- load panel
DisplayResultsPanelAbout = display.newImage("Result_Display.png")
DisplayResultsPanelAbout.width = _W * 0.9
DisplayResultsPanelAbout.height = _H*0.9
DisplayResultsPanelAbout.anchorX = 0.5
DisplayResultsPanelAbout.anchorY = 0.5
DisplayResultsPanelAbout.x = _W*0.5
DisplayResultsPanelAbout.y = _H*0.5
groupAbout:insert(DisplayResultsPanelAbout)

iKitlogo = display.newImage("iKit Logo.png")
iKitlogo.width = 100
iKitlogo.height = 100
iKitlogo.anchorX = 0
iKitlogo.anchorY = 0
iKitlogo.x = _W*0.2
iKitlogo.y = _H*0.22
groupAbout:insert(iKitlogo)

displayTextAbout1 = "iKit"
displayAboutOpt1 = {

		text = displayTextAbout1,
		x = iKitlogo.x + iKitlogo.width + 20,
		y = _H*0.25,
		width = 700,
		height = 500,
		font = font1,
		fontSize = 60
	}
	
displayTextAboutUs1 = display.newText (displayAboutOpt1)
displayTextAboutUs1.anchorX = 0
displayTextAboutUs1.anchorY = 0
displayTextAboutUs1:setFillColor(80/255,240/255,60/255)
displayTextAboutUs1:toFront()
groupAbout:insert(displayTextAboutUs1)

displayTextAbout = "by Code Stormers (Dunman High School) \nCopyright (c) 2014. All Rights Reserved. \nNigel Poh - Chief Coder, Design & Graphics \nRyan Yeo - Coder"
displayAboutOpt = {

		text = displayTextAbout,
		x = _W/4.9,
		y = _H*0.38,
		width = 700,
		height = 500,
		font = font1,
		fontSize = 45
	}
	
	displayTextAboutUs = display.newText (displayAboutOpt)
	displayTextAboutUs .anchorX = 0
	displayTextAboutUs .anchorY = 0
	displayTextAboutUs :setFillColor(80/255,80/255,240/255)
	displayTextAboutUs :toFront()
	groupAbout:insert(displayTextAboutUs)

	local displayResultsNextAbout = display.newText("Click to return to Main Menu",_W*0.5,_H*0.79,system.nativeFont,30)
	displayResultsNextAbout:setFillColor(0,200/255,1)
	groupAbout:insert(displayResultsNextAbout)

	local function BacktoEyeTestsMenuAbout (event)
	if (event.phase == "ended") then
		storyboard.gotoScene("menu", {effect = "crossFade", time = 300})
	end

end

	DisplayResultsPanelAbout:addEventListener("touch",BacktoEyeTestsMenuAbout)
	


end


function scene:enterScene(event)
	
	storyboard.purgeScene("menu")
	
	
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
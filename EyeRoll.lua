
local physics = require("physics")


display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
 
 function scene:createScene(event)
  physics.start()

  physics.setGravity(0, 0)
  groupEyeRoll = self.view
  local font1 = "Wensleydale Gothic NBP"
  local font2 = "Capitals"
  count = 0
rotateDir = 1 
local background = display.newImageRect( "space.png", _W, _H )
background.anchorX = 0
background.anchorY = 0
background.x = 0
background.y = 0
groupEyeRoll:insert(background)
local instructionsEyeRoll = display.newImage("Instructions_LazyEye.png")
instructionsEyeRoll.anchorX = 0
instructionsEyeRoll.anchorY = 0
instructionsEyeRoll.alpha = 0
instructionsEyeRoll.isHitTestable = true
groupEyeRoll:insert(instructionsEyeRoll)
local optionsinstructionsTER = {
  text = "Place your device about 40 cm away. Cover your normal eye & focus your lazy eye on the moon. Follow the moon's orbital movement for 10 rounds of clockwise and anti-clockwise eye roll exercise each. \n\n Touch screen to start the exercise.",
  x = (_W-(_W * 0.9))*0.5,
  y = _H/3,
  width = _W*0.9,
  height = _H*0.9,
  font = font1,
  fontSize = 60,
  align = "center"
}
local optionsinstructionsTERT = {
  text = "Instructions on using the Eye Roll Trainer",
  x = (_W-(_W * 0.9))*0.5,
  y = _H/10,
  width = _W*0.9,
  height = _H*0.9,
  font = font2,
  fontSize = 50,
  align = "center"
}
local instructionsTextEyeRollTitle = display.newText(optionsinstructionsTERT)
instructionsTextEyeRollTitle.anchorX = 0
instructionsTextEyeRollTitle.anchorY = 0
instructionsTextEyeRollTitle:setFillColor(0,1,0)
groupEyeRoll:insert(instructionsTextEyeRollTitle)
local instructionsTextEyeRoll = display.newText(optionsinstructionsTER)
instructionsTextEyeRoll.anchorX = 0
instructionsTextEyeRoll.anchorY = 0
instructionsTextEyeRoll:setFillColor(1,1,1)
groupEyeRoll:insert(instructionsTextEyeRoll)
function MainERollPrep(event)
if(event.phase == "ended") then
transition.fadeOut(instructionsEyeRoll,{time = 500})
transition.fadeOut(instructionsTextEyeRoll,{time = 500})
transition.fadeOut(instructionsTextEyeRollTitle,{time = 500})
MainERoll()
end
end
function MainERoll()
instructionsEyeRoll:removeEventListener("touch",MainERollPrep)
local planet1 = display.newImage( "earth.png" )
planet1.x = _W/2; planet1.y = _H/2
planet1.xScale = 0.1
planet1.yScale = 0.1
physics.addBody( planet1, {radius=40 } )
planet1.bodyType = "static"
groupEyeRoll:insert(planet1)
local moon = display.newImage( "moon.png", 40, 40)
moon.x = planet1.x + _H/2 - 16
moon.y = planet1.y
moon.xScale = 0.1
moon.yScale = 0.1
moon.rotation = 0
physics.addBody( moon, {radius=16} )
moon.bodyType = "dynamic"
groupEyeRoll:insert(moon)
 BackButtonER = widget.newButton({
  defaultFile = "back-button.png",
  onRelease = GoBackERLazyEyeTrainerMenu2
  })
  BackButtonER.x = _W*0.9
  BackButtonER.y = _H*0.88
  BackButtonER:scale(0.3,0.3)
  groupEyeRoll:insert(BackButtonER)
myJoint = physics.newJoint( "pivot", moon, planet1, planet1.x, planet1.y )
 
function rotateIt( event )  
        if rotateDir == 1 then 
        	rotateInc = 20
      	elseif rotateDir == 0 then
      		rotateInc = -20
  		end
        moon.rotation = moon.rotation + rotateInc -- -ve anti-clockwise
        count = count + 1
        
        if (moon.rotation > 360 * 10 + 20) then 
        	rotateDir = 0
    	end
        if (moon.rotation <  -20) then -- 1 round = 360 for rotateInc = 20
          quit()
    	end


end

Runtime:addEventListener( "enterFrame", rotateIt )

function quit()
  Runtime:removeEventListener( "enterFrame", rotateIt )
  local optionsEnd = {
  text = "We have come to the end of the training. Thank you!",
  x = (_W-(_W * 0.9))*0.5,
  y = _H/10,
  width = _W*0.9,
  height = _H*0.9,
  font = font2,
  fontSize = 50,
  align = "center"
}
local instructionsEnd = display.newText(optionsEnd)
instructionsEnd.anchorX = 0
instructionsEnd.anchorY = 0
instructionsEnd:setFillColor(0,1,0)
groupEyeRoll:insert(instructionsEnd)

--showBackButtonER()
end
end
function showBackButtonER()
  BackButtonER.isVisible = false
  local ButtonER = widget.newButton({
    defaultFile = "GoBackBefore.png",
    overFile = "GoBackAfter.png",
    onRelease = GoBackERLazyEyeTrainerMenu
    })
  ButtonER.x = _W/1.1
  ButtonER.y = _H/1.2
  ButtonER:scale(0.3,0.3)
  groupEyeRoll:insert(ButtonER)
end
instructionsEyeRoll:addEventListener("touch",MainERollPrep)
function GoBackERLazyEyeTrainerMenu()
Runtime:removeEventListener("enterFrame", rotateIt)
 physics.stop() 
 storyboard.gotoScene("LazyEyeTrainerMenu",{effect = "zoomOutIn"})
end
function GoBackERLazyEyeTrainerMenu2()
   Runtime:removeEventListener("enterFrame", rotateIt)
   physics.stop()
   storyboard.gotoScene("LazyEyeTrainerMenu",{effect = "zoomOutIn"})
end
end
function scene:enterScene( event )

 storyboard.purgeScene("LazyEyeTrainerMenu")
 physics.start()

 physics.setGravity(0, 0)
end
function scene:exitScene( event )
	
end
function scene:destroyScene( event )

end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene
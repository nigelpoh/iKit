local physics = require("physics") ; 
display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight

function scene:createScene(event)
groupEyeMove = self.view
physics.start() ; physics.setGravity( 0.0,6.8 ) ; physics.setDrawMode( "normal" )
local font1 = "Wensleydale Gothic NBP"
local font2 = "Capitals"
local backgroundEyeMove = display.newImageRect( "space.png", _W, _H )
backgroundEyeMove.anchorX = 0
backgroundEyeMove.anchorY = 0
backgroundEyeMove.x = 0
backgroundEyeMove.y = 0
groupEyeMove:insert(backgroundEyeMove)
local instructionsEyeMove = display.newImage("Instructions_LazyEye.png")
instructionsEyeMove.anchorX = 0
instructionsEyeMove.anchorY = 0
instructionsEyeMove.alpha = 0
instructionsEyeMove.isHitTestable = true
groupEyeMove:insert(instructionsEyeMove)
local optionsinstructionsTEM = {
  text = "Place your device at about 40cm away. Cover your normal eye & focus on the movement of the clove leaf with your lazy eye. The exercise is 3 minutes long. \n\nTouch screen to start the exercise.",
  x = (_W - _W * 0.9) * 0.5,
  y = _H/3,
  width = _W*0.9,
  height = _H*0.9,
  font = font1,
  fontSize = 60,
  align = "center"
}
local optionsinstructionsTEMT = {
  text = "Instructions on using the Eye Tracking Excercise",
  x = (_W - _W * 0.9) * 0.5,
  y = _H/10,
  width = _W*0.9,
  height = _H*0.9,
  font = font2,
  fontSize = 50,
  align = "center"
}
local instructionsTextEyeMoveTitle = display.newText(optionsinstructionsTEMT)
instructionsTextEyeMoveTitle.anchorX = 0
instructionsTextEyeMoveTitle.anchorY = 0
instructionsTextEyeMoveTitle:setFillColor(0,1,0)
groupEyeMove:insert(instructionsTextEyeMoveTitle)
local instructionsTextEyeMove = display.newText(optionsinstructionsTEM)
instructionsTextEyeMove.anchorX = 0
instructionsTextEyeMove.anchorY = 0
instructionsTextEyeMove:setFillColor(1,1,1)
groupEyeMove:insert(instructionsTextEyeMove)
function MainEMovePrep(event)
if(event.phase == "ended") then
transition.fadeOut(instructionsEyeMove,{time = 1000})
transition.fadeOut(instructionsTextEyeMove,{time = 1000})
MainEyeMove()
end
end
function MainEyeMove()
--set up some references and other variables
local ox, oy = math.abs(display.screenOriginX), math.abs(display.screenOriginY)
local cw, ch = display.viewableContentWidth, display.viewableContentHeight
local stage = display.getCurrentStage()

--set up collision filters
local intFilter = {categoryBits=1,maskBits=2}
local leafFilter = {categoryBits=2,maskBits=1}

--set up terrain and background
local back = display.newImageRect( "sky.png", _W, _H ) 
back.anchorX = 0
back.anchorY = 0
back.x = 0
back.y = 0
groupEyeMove:insert(back)
local wallL = display.newRect( 0, 0, 40, ch)
wallL.anchorX = 0
wallL.anchorY = 0
groupEyeMove:insert(wallL)
physics.addBody(wallL, "static", { bounce=1, friction=1.0, filter=intFilter } )
local wallR = display.newRect( cw-40, 0, 40, ch)
wallR.anchorX = 0
wallR.anchorY = 0
groupEyeMove:insert(wallR)
physics.addBody(wallR, "static", { bounce=1, friction=1.0, filter=intFilter } )
local wallB = display.newRect( 0, ch-40, cw, 40 )
wallB.anchorX = 0
wallB.anchorY = 0
groupEyeMove:insert(wallB)
physics.addBody(wallB, "static", { bounce=1.0, friction=1.0, filter=intFilter } )
local wallT = display.newRect( 0, 0, cw, 40 )
wallT.anchorX = 0
wallT.anchorY = 0
groupEyeMove:insert(wallT)
physics.addBody(wallT, "static", { bounce=0.5, friction=1.0, filter=intFilter } )

--set up leaves
leaf1 = display.newImageRect( "leaf.png", 60, 60 ) ; leaf1.x = 200 ; leaf1.y = 300
physics.addBody( leaf1, "dynamic", { density=1.0, friction=0.3, bounce=0.5, radius=24, filter=leafFilter } )
leaf1.gravityScale = 0.5 ; leaf1:applyTorque( 200 ) ; leaf1.angularDamping = 0.1 ; leaf1.linearDamping = 0.3
leaf1.xF = 0 ; leaf1.yF = 0
groupEyeMove:insert(leaf1)
--local leaf2 = display.newImageRect( "leaf.png", 48, 48 ) ; leaf2.x = 500 ; leaf2.y = 200
--physics.addBody( leaf2, "dynamic", { density=1.0, friction=0.3, bounce=0.5, radius=24, filter=leafFilter } )
--leaf2.gravityScale = 0.5 ; leaf2:applyTorque( -100 ) ; leaf2.angularDamping = 0.1 ; leaf2.linearDamping = 0.3
--leaf2.xF = 0 ; leaf2.yF = 0

--set up sprites
local options = { width=80, height=300, numFrames=6, sheetContentWidth=480, sheetContentHeight=300 }
local ventSheet = graphics.newImageSheet( "ventsheet.png", options )
local seqs = { { name="main1", start=1, count=6, time=200 },
					{ name="main2", frames={4,5,6,1,2,3}, time=160 } }



--function to return force values for vent, depending on angle and power
local function getVentVals( angle, power )
	local xF = math.cos( (angle-90)*(math.pi/180) ) * power
	local yF = math.sin( (angle-90)*(math.pi/180) ) * power
	return xF,yF
end



--set up vents
math.randomseed(os.time())
local vent1 = display.newSprite( ventSheet, seqs )
vent1.anchorX = 0
vent1.anchorY = 1
groupEyeMove:insert(vent1)
physics.addBody(vent1, "kinematic", { isSensor=true, filter=intFilter } )
vent1.isVent = true ; vent1.rotation = 70 ; vent1.x = 40 ; vent1.y = ch*0.65 ; vent1:setSequence("main2") ; vent1:play()
--for each vent, get angular force values depending on its angle and the "power" you pass to it
vent1.xF, vent1.yF = getVentVals( vent1.rotation, math.random(140,180))

local vent2 = display.newSprite( ventSheet, seqs )
vent2.anchorX = 1
vent2.anchorY = 1
groupEyeMove:insert(vent2)
physics.addBody(vent2, "kinematic", { isSensor=true, filter=intFilter } )
vent2.isVent = true ; vent2.rotation = 40 ; vent2.x = cw * 0.2 ; vent2.y = ch*0.9 ; vent2:setSequence("main2") ; vent2:play()
vent2.xF, vent2.yF = getVentVals( vent2.rotation, math.random(150,200) )

local vent3 = display.newSprite( ventSheet, seqs )
vent3.anchorX = 1
vent3.anchorY = 1
groupEyeMove:insert(vent3)
physics.addBody(vent3, "kinematic", { isSensor=true, filter=intFilter } )
vent3.isVent = true ; vent3.rotation = 10 ; vent3.x = cw * 0.4 ; vent3.y = ch*0.95 ; vent3:setSequence("main1") ; vent3:play()
vent3.xF, vent3.yF = getVentVals( vent3.rotation, math.random(120,150) )

local vent4 = display.newSprite( ventSheet, seqs )
vent4.anchorX = 1
vent4.anchorY = 1
groupEyeMove:insert(vent4)
physics.addBody(vent4, "kinematic", { isSensor=true, filter=intFilter } )
vent4.isVent = true ; vent4.rotation = -20 ; vent4.x = cw * 0.6 ; vent4.y = ch*0.95 ; vent4:setSequence("main1") ; vent4:play()
vent4.xF, vent4.yF = getVentVals( vent4.rotation, math.random(120,150) )

local vent5 = display.newSprite( ventSheet, seqs )
vent5.anchorX = 1
vent5.anchorY = 1
groupEyeMove:insert(vent5)
physics.addBody(vent5, "kinematic", { isSensor=true, filter=intFilter } )
vent5.isVent = true ; vent5.rotation = -40 ; vent5.x = cw * 0.8 ; vent5.y = ch * 0.9 ; vent5:setSequence("main2") ; vent5:play()
vent5.xF, vent5.yF = getVentVals( vent5.rotation, math.random(150,200) )

local vent6 = display.newSprite( ventSheet, seqs )
vent6.anchorX = 1
vent6.anchorY = 1
groupEyeMove:insert(vent6)
physics.addBody(vent6, "kinematic", { isSensor=true, filter=intFilter } )
vent6.isVent = true ; vent6.rotation = -75 ; vent6.x = cw-40 ; vent6.y = ch*0.65 ; vent6:setSequence("main2") ; vent6:play()
vent6.xF, vent6.yF = getVentVals( vent6.rotation, math.random(140,180) )



--Runtime listener to apply force to leaves within vent(s)
local function constantForce()

	if not ( leaf1.xF == 0 and leaf1.yF == 0 ) then leaf1:applyForce( leaf1.xF, leaf1.yF, leaf1.x, leaf1.y ) end
	--if not ( leaf2.xF == 0 and leaf2.yF == 0 ) then leaf2:applyForce( leaf2.xF, leaf2.yF, leaf2.x, leaf2.y ) end
end



--collision handler
function ventCollide( self,event )

	local vent = event.other
	--add vent's force parameters to leaf's self parameters
	if ( event.phase == "began" and vent.isVent == true ) then
		self.xF = self.xF+vent.xF ; self.yF = self.yF+vent.yF
	--substract vent's force parameters from leaf's self parameters
	elseif ( event.phase == "ended" and vent.isVent == true ) then
		self.xF = self.xF-vent.xF ; self.yF = self.yF-vent.yF
	end			
end
leaf1.collision = ventCollide ; leaf1:addEventListener( "collision", leaf1 )
--leaf2.collision = ventCollide ; leaf2:addEventListener( "collision", leaf2 )

function GoBackEMLazyEyeTrainerMenu()
  timer.cancel(freezeFrame)
  physics.removeBody( leaf1 )
  groupEyeMove:removeSelf()
  Runtime:removeEventListener( "enterFrame", constantForce )
  physics.stop()
 storyboard.gotoScene("LazyEyeTrainerMenu",{effect = "crossFade", time = 250})
end

backEM = widget.newButton({
	defaultFile = "back-button.png",
  	onRelease = GoBackEMLazyEyeTrainerMenu
	})
backEM.x = _W*0.9
backEM.y = _H*0.88
backEM:scale(0.3,0.3)
groupEyeMove:insert(backEM)


Runtime:addEventListener( "enterFrame", constantForce )
freezeFrame = timer.performWithDelay(180000,freezeFrameFunction,1)

end

instructionsEyeMove:addEventListener("touch",MainEMovePrep)

function GoBackEMLazyEyeTrainerMenu2()
  timer.cancel(freezeFrame)
  physics.removeBody( leaf1 )
  groupEyeMove:removeSelf()
  Runtime:removeEventListener( "enterFrame", constantForce )
  physics.stop()
  storyboard.gotoScene("LazyEyeTrainerMenu",{effect = "crossFade", time = 250})
  end

  --[[backButtonEM = widget.newButton({
  defaultFile = "GoBackBefore.png",
    overFile = "GoBackAfter.png",
    onRelease = GoBackEMLazyEyeTrainerMenu2
  })
  backButtonEM.x = _W*0.9
  backButtonEM.y = _H*0.85
  backButtonEM:scale(0.25,0.25)
  groupEyeMove:insert(backButtonEM)
  backButtonEM.isVisible = false]]--

function freezeFrameFunction()

  optionsEndExercise = {
  text = "We have come to the end of the training. Thank you!",
  x = (_W - _W * 0.9) * 0.5,
  y = _H*0.4,
  width = _W*0.9,
  height = _H*0.9,
  font = font2,
  fontSize = 50,
  align = "center"
}
TextEyeMoveEndExercise = display.newText(optionsEndExercise)
TextEyeMoveEndExercise.anchorX = 0
TextEyeMoveEndExercise.anchorY = 0
TextEyeMoveEndExercise:setFillColor(0,0,0)
groupEyeMove:insert(TextEyeMoveEndExercise)

  --backEM.isVisible = false
  --backButtonEM.isVisible = true
  --backButtonEM:toFront()

  

end



end
function scene:enterScene( event )
  physics.start() ; physics.setGravity( 0.0,6.8 ) ; physics.setDrawMode( "normal" )
	storyboard.purgeScene("LazyEyeTrainerMenu")
end
function scene:exitScene( event )
  --physics.removeBody( leaf1 )
  --Runtime:removeEventListener( "enterFrame", constantForce )
  --leaf1:removeEventListener( "collision", leaf1 )
  timer.cancel(freezeFrame)
  physics.stop()
end
function scene:destroyScene( event )

end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene
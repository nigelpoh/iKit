display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
Count = 1
local font1 = "Wensleydale Gothic NBP"
local font2 = "Capitals"
function scene:createScene(event)



	isTouchEnabled = true
	groupLazyEye = self.view
	local backgroundEyeMove = display.newImageRect("SpaceBackground.png",_W,_H)
	backgroundEyeMove.anchorX = 0
	backgroundEyeMove.anchorY = 0
	groupLazyEye:insert(backgroundEyeMove)

	function removeEventListenersFunctionEyeLazyEyeTrainer()
		EyeRoll:removeEventListener("touch", EyeRollTouch)
		SpaceShooter:removeEventListener("touch", SpaceShooterTouch)
		EyeMove:removeEventListener("touch", EyeMoveTouch)
		AnimalJems:removeEventListener("touch", AnimalJemsTouch)
		Runtime:removeEventListener("touch", lazymenuTouchScreen)
	end

	local optionsTextLazy = {
  		text = "Please use an eye patch to cover your normal eye for all the training modules.",
  		x = (_W - _W * 0.5) * 0.5,
  		y = _H*0.05,
  		width = _W*0.5,
  		height = _H*0.9,
  		font = font1,
  		fontSize = 40,
  		align = "center"
	}
	local LazyEyeInfo = display.newText(optionsTextLazy)
	LazyEyeInfo.anchorX = 0
	LazyEyeInfo.anchorY = 0
	LazyEyeInfo:setFillColor(1,1,0)
	groupLazyEye:insert(LazyEyeInfo)

	function GoBackMainMenu2()
   		removeEventListenersFunctionEyeLazyEyeTrainer()
   		storyboard.gotoScene("menu",{effect = "zoomOutIn"})
	end
	BackButtonLET = widget.newButton({
  		defaultFile = "back-button.png",
  		onRelease = GoBackMainMenu2
  	})
  	BackButtonLET.x = _W*0.93
  	BackButtonLET.y = _H*0.1
  	BackButtonLET:scale(0.3,0.3)
  	groupLazyEye:insert(BackButtonLET)

	EyeRoll = display.newImage("Eye_Roll.png")
	EyeRoll.x = _W/2.5
	EyeRoll.y = _H/4
	EyeRoll.anchorX = 0
	EyeRoll.anchorY = 0
	EyeRoll.width = 200
	EyeRoll.height = 200
	EyeRoll:scale(2,2)
	groupLazyEye:insert(EyeRoll)
	EyeRollSwipe = {}


	SpaceShooter = display.newImage("Galaxy_Shooter.png")
	SpaceShooter.x = _W/9
	SpaceShooter.y = _H/4
	SpaceShooter.anchorX = 0
	SpaceShooter.anchorY = 0
	SpaceShooter.width = 200 
	SpaceShooter.height = 200
	groupLazyEye:insert(SpaceShooter)
	SpaceShooterSwipe = {}

	EyeMove = display.newImage("Eye_Tracking_Exercise.png")
	EyeMove.x = _W/1.3
	EyeMove.y = _H/4
	EyeMove.anchorX = 0
	EyeMove.anchorY = 0
	EyeMove.width = 200 
	EyeMove.height = 200
	groupLazyEye:insert(EyeMove)
	EyeMoveSwipe = {}

	AnimalJems = display.newImage("Animal_Jems.png")
	AnimalJems.x = 0
	AnimalJems.y = _H/4
	AnimalJems.alpha = 0
	AnimalJems.anchorX = 0
	AnimalJems.anchorY = 0
	AnimalJems.width = 200 
	AnimalJems.height = 200
	groupLazyEye:insert(AnimalJems)
	AnimalJemsSwipe = {}

	xEnd = 0
	xBegin = 0


	function lazymenuTouchScreen( event )
	
	if (event.phase == "began") then
		xBegin = event.x 
	end

	if (event.phase == "ended") then
		xEnd = event.x 
	--end

	--if (event.phase == "moved") then

		--if (event.xStart < event.x + 10 and AboutUs.x ~= math.ceil(_W/2.5))  then--swipe right

		if (xBegin < xEnd  and AnimalJems.x ~= math.ceil(_W/2.5))  then--swipe right
			if math.ceil(EyeRoll.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeRoll.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeRoll.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeRoll.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W + EyeRoll.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			end

			if math.ceil(SpaceShooter.x) ==	math.ceil(_W/9) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(SpaceShooter.x) == 0 --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(SpaceShooter.x) == math.ceil(_W/2.5) --[[and math.ceil(AboutUs.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(SpaceShooter.x) == math.ceil(-1*SpaceShooter.width) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = 0 , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			
			end

			if math.ceil(EyeMove.x) == math.ceil(_W/2.5) --[[and math.ceil(EyeTests.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(EyeMove,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeMove.x) == math.ceil(_W/1.3) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeMove,{time = 500, x = _W , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeMove.x) == math.ceil(_W) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeMove,{time = 500, x = _W+EyeMove.width , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			--elseif math.ceil(LazyEyeTrainer.x) == math.ceil(_W+LazyEyeTrainer.width) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			--isTouchEnabled = false
			--transition.to(LazyEyeTrainer,{time = 500, x = _W+LazyEyeTrainer.width*2 , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})



			end	

			if math.ceil(AnimalJems.x) == math.ceil(_W/9) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AnimalJems,{time = 500, x = _W/2.5, xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AnimalJems.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(AnimalJems,{time = 500, x = _W/9, xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AnimalJems.x) == math.ceil(-1*AnimalJems.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(AnimalJems,{time = 500, x = 0, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			--elseif math.ceil(AnimalJems.x) == math.ceil(-2*AnimalJems.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			--isTouchEnabled = false
			--transition.to(AboutUs,{time = 500, x = math.ceil(-1*AboutUs.width), xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			


			end	



		--elseif (event.xStart > event.x - 10 and LazyEyeTrainer.x ~= _W/2.5) then	 -- swipe left
		elseif (xBegin > xEnd  and EyeMove.x ~= _W/2.5) then	 -- swipe left
			if math.ceil(EyeRoll.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1,onComplete=function() isTouchEnabled=true end})	
			elseif math.ceil(EyeRoll.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})	
			elseif math.ceil(EyeRoll.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W/1.3, xScale = 1, yScale = 1,alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeRoll.x) == math.ceil(_W+EyeRoll.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(EyeRoll,{time = 500, x = _W, xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			
			end	 
			
			if math.ceil(SpaceShooter.x) ==	math.ceil(_W/9) then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = 0 , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(SpaceShooter.x) == math.ceil(_W/2.5) then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(SpaceShooter.x) == math.ceil(_W/1.3) then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = _W/2.5, xScale = 2,yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(SpaceShooter.x) == math.ceil(0) then
			isTouchEnabled = false
			transition.to(SpaceShooter,{time = 500, x = -1*SpaceShooter.width, xScale = 2,yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			


			end

			if math.ceil(EyeMove.x) == math.ceil(_W/1.3) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeMove,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif EyeMove.x == math.ceil(_W) --[[and math.ceil(EyeTests.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(EyeMove,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif EyeMove.x == math.ceil(_W+EyeMove.width) --[[and math.ceil(EyeTests.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(EyeMove,{time = 500, x = _W , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			--elseif EyeMove.x == math.ceil(_W+EyeMove.width*2) --[[and math.ceil(EyeTests.x) == math.ceil(_W/1.3)]] then
			--isTouchEnabled = false
			--transition.to(LazyEyeTrainer,{time = 500, x = _W+LazyEyeTrainer , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			
			end

			if math.ceil(AnimalJems.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(AnimalJems,{time = 500, x = _W/9, xScale = 1,yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AnimalJems.x) == math.ceil(_W/9) then
			isTouchEnabled = false
			transition.to(AnimalJems,{time = 500, x = 0, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AnimalJems.x) == math.ceil(0) then
			isTouchEnabled = false
			transition.to(AnimalJems,{time = 500, x = -1*AnimalJems.width, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
		
			--elseif math.ceil(AboutUs.x) == math.ceil(-1*AboutUs.width) then
			--isTouchEnabled = false
			--transition.to(AboutUs,{time = 500, x = -2*AboutUs.width, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
		
			end


		xBegin = 0;xEnd = 0
		end
	end	
	

	end
	function EyeRollTouch (event)
		
		if event.phase == "ended" then
			if math.ceil(EyeRoll.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeLazyEyeTrainer()
				storyboard.gotoScene("EyeRoll",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function SpaceShooterTouch (event)

		if event.phase == "ended" then
			if math.ceil(SpaceShooter.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeLazyEyeTrainer()
				storyboard.gotoScene("SpaceShooter",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function EyeMoveTouch (event)

		if event.phase == "ended" then
			if math.ceil(EyeMove.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeLazyEyeTrainer()
				storyboard.gotoScene("EyeMove",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function AnimalJemsTouch (event)

		if event.phase == "ended" then
			if math.ceil(AnimalJems.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeLazyEyeTrainer()
				storyboard.gotoScene("Loading",{effect = "zoomOutIn"})
				return true

			end
		end

	end


EyeRoll:addEventListener("touch", EyeRollTouch)
SpaceShooter:addEventListener("touch", SpaceShooterTouch)
EyeMove:addEventListener("touch", EyeMoveTouch)
AnimalJems:addEventListener("touch", AnimalJemsTouch)
Runtime:addEventListener("touch", lazymenuTouchScreen)



end
function scene:enterScene( event )
	storyboard.purgeScene("menu")
	storyboard.purgeScene("EyeRoll")
	storyboard.purgeScene("ThreeGems")
	storyboard.purgeScene("SpaceShooter")
	storyboard.purgeScene("EyeMove")
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
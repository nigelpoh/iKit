display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
local font1 = "Wensleydale Gothic NBP"
local font2 = "Capitals"

function scene:createScene(event)
	isTouchEnabled = true
	groupMenu = self.view
	local backgroundMenu = display.newImageRect("SpaceBackground.png",_W,_H)
	backgroundMenu.anchorX = 0
	backgroundMenu.anchorY = 0
	groupMenu:insert(backgroundMenu)
	function removeEventListenersFunctionMenu()

		EyeTests:removeEventListener("touch", EyeTestsTouch)
		FloatersTracker:removeEventListener("touch", FloatersTrackerTouch)
		LazyEyeTrainer:removeEventListener("touch", LazyEyeTrainerTouch)
		AboutUs:removeEventListener("touch", AboutUsTouch)
		Runtime:removeEventListener("touch", menuTouchScreen)
		Disclaim:removeEventListener("touch",RemoveDisclaimer)
		
	end
	EyeTests = display.newImage("Eye_Tests.png")
	EyeTests.x = _W/2.5
	EyeTests.y = _H/4
	EyeTests.anchorX = 0
	EyeTests.anchorY = 0
	EyeTests.width = 200 
	EyeTests.height = 200
	EyeTests:scale(2,2)
	groupMenu:insert(EyeTests)
	eyeTestsSwipe = {}

	FloatersTracker = display.newImage("Floaters_Tracker.png")
	FloatersTracker.x = _W/9
	FloatersTracker.y = _H/4
	FloatersTracker.anchorX = 0
	FloatersTracker.anchorY = 0
	FloatersTracker.width = 200 
	FloatersTracker.height = 200
	groupMenu:insert(FloatersTracker)
	FloatersTrackerSwipe = {}

	LazyEyeTrainer = display.newImage("Lazy_Eye_Trainer.png")
	LazyEyeTrainer.x = _W/1.3
	LazyEyeTrainer.y = _H/4
	LazyEyeTrainer.anchorX = 0
	LazyEyeTrainer.anchorY = 0
	LazyEyeTrainer.width = 200 
	LazyEyeTrainer.height = 200
	groupMenu:insert(LazyEyeTrainer)
	LazyEyeTrainerSwipe = {}

	AboutUs = display.newImage("About_Us.png")
	AboutUs.x = 0
	AboutUs.y = _H/4
	AboutUs.alpha = 0
	AboutUs.anchorX = 0
	AboutUs.anchorY = 0
	AboutUs.width = 200 
	AboutUs.height = 200
	groupMenu:insert(AboutUs)
	AboutUsSwipe = {}
	xEnd = 0
	xBegin = 0


	function menuTouchScreen( event )
	
	if (event.phase == "began") then
		xBegin = event.x 
	end

	if (event.phase == "ended") then
		xEnd = event.x 
	--end

	--if (event.phase == "moved") then

		--if (event.xStart < event.x + 10 and AboutUs.x ~= math.ceil(_W/2.5))  then--swipe right

		if (xBegin < xEnd  and AboutUs.x ~= math.ceil(_W/2.5))  then--swipe right
			if math.ceil(EyeTests.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeTests.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeTests.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeTests.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W + EyeTests.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			end

			if math.ceil(FloatersTracker.x) ==	math.ceil(_W/9) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(FloatersTracker.x) == 0 --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(FloatersTracker.x) == math.ceil(_W/2.5) --[[and math.ceil(AboutUs.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(FloatersTracker.x) == math.ceil(-1*FloatersTracker.width) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = 0 , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			
			end

			if math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5) --[[and math.ceil(EyeTests.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(LazyEyeTrainer,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(LazyEyeTrainer.x) == math.ceil(_W/1.3) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(LazyEyeTrainer,{time = 500, x = _W , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(LazyEyeTrainer.x) == math.ceil(_W) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(LazyEyeTrainer,{time = 500, x = _W+LazyEyeTrainer.width , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			--elseif math.ceil(LazyEyeTrainer.x) == math.ceil(_W+LazyEyeTrainer.width) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			--isTouchEnabled = false
			--transition.to(LazyEyeTrainer,{time = 500, x = _W+LazyEyeTrainer.width*2 , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})



			end	

			if math.ceil(AboutUs.x) == math.ceil(_W/9) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AboutUs,{time = 500, x = _W/2.5, xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AboutUs.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(AboutUs,{time = 500, x = _W/9, xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AboutUs.x) == math.ceil(-1*AboutUs.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(AboutUs,{time = 500, x = 0, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			--elseif math.ceil(AboutUs.x) == math.ceil(-2*AboutUs.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			--isTouchEnabled = false
			--transition.to(AboutUs,{time = 500, x = math.ceil(-1*AboutUs.width), xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			


			end	



		--elseif (event.xStart > event.x - 10 and LazyEyeTrainer.x ~= _W/2.5) then	 -- swipe left
		elseif (xBegin > xEnd  and LazyEyeTrainer.x ~= _W/2.5) then	 -- swipe left
			if math.ceil(EyeTests.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1,onComplete=function() isTouchEnabled=true end})	
			elseif math.ceil(EyeTests.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})	
			elseif math.ceil(EyeTests.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W/1.3, xScale = 1, yScale = 1,alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(EyeTests.x) == math.ceil(_W+EyeTests.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(EyeTests,{time = 500, x = _W, xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			
			end	 
			
			if math.ceil(FloatersTracker.x) ==	math.ceil(_W/9) then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = 0 , xScale = 1, yScale = 1,alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(FloatersTracker.x) == math.ceil(_W/2.5) then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(FloatersTracker.x) == math.ceil(_W/1.3) then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = _W/2.5, xScale = 2,yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(FloatersTracker.x) == math.ceil(0) then
			isTouchEnabled = false
			transition.to(FloatersTracker,{time = 500, x = -1*FloatersTracker.width, xScale = 2,yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			


			end

			if math.ceil(LazyEyeTrainer.x) == math.ceil(_W/1.3) --[[and math.ceil(EyeTests.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(LazyEyeTrainer,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif LazyEyeTrainer.x == math.ceil(_W) --[[and math.ceil(EyeTests.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(LazyEyeTrainer,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif LazyEyeTrainer.x == math.ceil(_W+LazyEyeTrainer.width) --[[and math.ceil(EyeTests.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(LazyEyeTrainer,{time = 500, x = _W , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			--elseif LazyEyeTrainer.x == math.ceil(_W+LazyEyeTrainer.width*2) --[[and math.ceil(EyeTests.x) == math.ceil(_W/1.3)]] then
			--isTouchEnabled = false
			--transition.to(LazyEyeTrainer,{time = 500, x = _W+LazyEyeTrainer , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			
			end

			if math.ceil(AboutUs.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/1.3)]] then
			isTouchEnabled = false
			transition.to(AboutUs,{time = 500, x = _W/9, xScale = 1,yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AboutUs.x) == math.ceil(_W/9) then
			isTouchEnabled = false
			transition.to(AboutUs,{time = 500, x = 0, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AboutUs.x) == math.ceil(0) then
			isTouchEnabled = false
			transition.to(AboutUs,{time = 500, x = -1*AboutUs.width, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
		
			--elseif math.ceil(AboutUs.x) == math.ceil(-1*AboutUs.width) then
			--isTouchEnabled = false
			--transition.to(AboutUs,{time = 500, x = -2*AboutUs.width, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
		
			end


		xBegin = 0;xEnd = 0
		end
	end	
	

	end
	function EyeTestsTouch (event)
		
		if event.phase == "ended" then
			if math.ceil(EyeTests.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionMenu()
				storyboard.gotoScene("EyeTests",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function FloatersTrackerTouch (event)

		if event.phase == "ended" then
			if math.ceil(FloatersTracker.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionMenu()
				storyboard.gotoScene("FloatersTracker",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function LazyEyeTrainerTouch (event)

		if event.phase == "ended" then
			if math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionMenu()
				storyboard.gotoScene("LazyEyeTrainerMenu",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function AboutUsTouch (event)

		if event.phase == "ended" then
			if math.ceil(AboutUs.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionMenu()
				storyboard.gotoScene("AboutUs",{effect = "zoomOutIn"})
				return true

			end
		end

	end


EyeTests:addEventListener("touch", EyeTestsTouch)
FloatersTracker:addEventListener("touch", FloatersTrackerTouch)
LazyEyeTrainer:addEventListener("touch", LazyEyeTrainerTouch)
AboutUs:addEventListener("touch", AboutUsTouch)
Runtime:addEventListener("touch", menuTouchScreen)


	Disclaim = display.newImage("DisclaimerBoard.png")
	Disclaim.anchorX = 0.5
	Disclaim.anchorY = 0.5
	Disclaim.x = _W * 0.5
	Disclaim.y = _H * 0.5
	Disclaim.width = _W*0.9
	Disclaim.height = _H *0.9
	Disclaim.alpha = 0
	groupMenu:insert(Disclaim)
	DisclaimTextopt = {
	text = "Attention: \nIt is not the intention of iKit to replace an optician's or doctor's regular full examination. The intention of iKit is to offer a convenient tool for a quick eye check, exercise and tracking of eye conditions. \n\nOK",
	width = Disclaim.width - 300,
	height = Disclaim.height - 150,
	font = font1,
	fontSize = 50,
	align = "center"
	}
	DisclaimText = display.newText (DisclaimTextopt)
	
	DisclaimText.anchorX = 0
	DisclaimText.anchorY = 0
	
	DisclaimText.alpha = 0
	DisclaimText:setFillColor (1,1,1)
	groupMenu:insert(DisclaimText)


function Disclaimer()
		transition.to(Disclaim,{x = _W*0.5, y = _H*0.5, transition=easing.inExpo,alpha = 1})
		transition.to(DisclaimText,{x = (_W-Disclaim.width)*0.5 + 150, y = (_H-Disclaim.height)*0.5 + 100, transition=easing.inExpo,alpha = 1})

		DisclaimerButton.alpha = 0
		
		Disclaim:addEventListener("touch",RemoveDisclaimer)
end
function RemoveDisclaimer()
	transition.to(DisclaimText,{x = (_W-Disclaim.width)*0.5 + 150, y = (_H-Disclaim.height)*0.5 + 100, transition=easing.outExpo,alpha = 0})
	transition.to(Disclaim,{x = _W * 0.5, y = _H * 0.5, transition=easing.outExpo,alpha = 0})
	
	DisclaimerButton.alpha = 1
	
	return true
end
 DisclaimerButton = widget.newButton({
	defaultFile = "Disclaimer.png",
	overFile = "Disclaimer.png",
	onRelease = Disclaimer
	})
DisclaimerButton.anchorX = 0
DisclaimerButton.anchorY = 0
DisclaimerButton.x = _W - DisclaimerButton.width - 20
DisclaimerButton.y = 20
groupMenu:insert(DisclaimerButton)
end




function scene:enterScene( event )
	storyboard.purgeScene("EyeTests")
	storyboard.purgeScene("LazyEyeTrainerMenu")
	storyboard.purgeScene("FloatersTracker")
	storyboard.purgeScene("AboutUs")


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
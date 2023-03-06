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
	EyeTestsgroup = self.view
	local backgroundET = display.newImageRect("SpaceBackground.png",_W,_H)
	backgroundET.anchorX = 0
	backgroundET.anchorY = 0
	EyeTestsgroup:insert(backgroundET)
	function removeEventListenersFunctionEyeTests()
		VisualAcuity:removeEventListener("touch",VisualAcuityTouch)
		RedDesaturation:removeEventListener("touch",RedDesaturationTouch)
		ColourBlindness:removeEventListener("touch",ColourBlindnessTouch)
		ContrastSensitivity:removeEventListener("touch",ContrastSensitivityTouch)
		Astigmatism:removeEventListener("touch",AstigmatismTouch)
		AmslerGrid:removeEventListener("touch",AmslerGridTouch)
		MyopiaHyperopia:removeEventListener("touch",MyopiaHyperopiaTouch)
		Runtime:removeEventListener("touch", testsmenuTouchScreen)
	end
	function GoBackMainMenu()
   		removeEventListenersFunctionEyeTests()
   		storyboard.gotoScene("menu",{effect = "zoomOutIn"})
	end
	BackButtonET = widget.newButton({
  		defaultFile = "back-button.png",
  		onRelease = GoBackMainMenu
  	})
  	BackButtonET.x = _W*0.93
  	BackButtonET.y = _H*0.1
  	BackButtonET:scale(0.3,0.3)
  	EyeTestsgroup:insert(BackButtonET)

	VisualAcuity = display.newImage("Visual_Acuity.png")
	VisualAcuity.x = _W/2.5
	VisualAcuity.y = _H/4
	VisualAcuity.anchorX = 0
	VisualAcuity.anchorY = 0
	VisualAcuity.width = 200
	VisualAcuity.height = 200
	VisualAcuity:scale(2,2)
	EyeTestsgroup:insert(VisualAcuity)
	VisualAcuitySwipe = {}

	Astigmatism = display.newImage("Astigmatism.png")
	Astigmatism.x = _W/9
	Astigmatism.y = _H/4
	Astigmatism.anchorX = 0
	Astigmatism.anchorY = 0
	Astigmatism.width = 200 
	Astigmatism.height = 200
	EyeTestsgroup:insert(Astigmatism)
	AstigmatismSwipe = {}

	ColourBlindness = display.newImage("Colour_Blindness.png")
	ColourBlindness.x = _W/1.3
	ColourBlindness.y = _H/4
	ColourBlindness.anchorX = 0
	ColourBlindness.anchorY = 0
	ColourBlindness.width = 200 
	ColourBlindness.height = 200
	EyeTestsgroup:insert(ColourBlindness)
	ColourBlindnessSwipe = {}

	ContrastSensitivity = display.newImage("Contrast_Sensitivity.png")
	ContrastSensitivity.x = 0
	ContrastSensitivity.y = _H/4
	ContrastSensitivity.alpha = 0
	ContrastSensitivity.anchorX = 0
	ContrastSensitivity.anchorY = 0
	ContrastSensitivity.width = 200 
	ContrastSensitivity.height = 200
	EyeTestsgroup:insert(ContrastSensitivity)
	ContrastSensitivitySwipe = {}

	AmslerGrid = display.newImage("Amsler_Grid.png")
	AmslerGrid.x = _W
	AmslerGrid.y = _H/4
	AmslerGrid.anchorX = 0
	AmslerGrid.anchorY = 0
	AmslerGrid.width = 200 
	AmslerGrid.height = 200
	AmslerGrid.alpha = 0
	EyeTestsgroup:insert(AmslerGrid)
	AmslerGridSwipe = {}

	MyopiaHyperopia = display.newImage("Myopia_Hyperopia.png")
	MyopiaHyperopia.width = 200 
	MyopiaHyperopia.height = 200
	MyopiaHyperopia.x = _W + MyopiaHyperopia.width
	MyopiaHyperopia.y = _H/4
	MyopiaHyperopia.anchorX = 0
	MyopiaHyperopia.anchorY = 0
	MyopiaHyperopia.alpha = 0
	EyeTestsgroup:insert(MyopiaHyperopia)
	MyopiaHyperopiaSwipe = {}

	RedDesaturation = display.newImage("Red_Desaturation.png")
	RedDesaturation.width = 200 
	RedDesaturation.height = 200
	RedDesaturation.x = _W + 2*RedDesaturation.width
	RedDesaturation.y = _H/4
	RedDesaturation.alpha = 0
	RedDesaturation.anchorX = 0
	RedDesaturation.anchorY = 0
	EyeTestsgroup:insert(RedDesaturation)
	RedDesaturationSwipe = {}

	xEnd = 0
	xBegin = 0


	function testsmenuTouchScreen( event )
	
	if (event.phase == "began") then
		xBegin = event.x 
	end

	if (event.phase == "ended") then
		xEnd = event.x 
	--end

	--if (event.phase == "moved") then

		--if (event.xStart < event.x + 10 and AboutUs.x ~= math.ceil(_W/2.5))  then--swipe right

		if (xBegin < xEnd  and ContrastSensitivity.x ~= math.ceil(_W/2.5))  then--swipe right
			if math.ceil(VisualAcuity.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W + VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W+VisualAcuity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W + 2*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W+2*VisualAcuity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W + 3*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W+3*VisualAcuity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W + 4*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == -1*VisualAcuity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = 0 , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == -2*VisualAcuity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = -1*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == -3*VisualAcuity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = -2*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == -4*VisualAcuity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = -3*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end


			-- Astigmatism
			if math.ceil(Astigmatism.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W + Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W+Astigmatism.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W + 2*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W+2*Astigmatism.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W + 3*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W+3*Astigmatism.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W + 4*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			elseif math.ceil(Astigmatism.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == -1*Astigmatism.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = 0 , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == -2*Astigmatism.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = -1*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == -3*Astigmatism.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = -2*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == -4*Astigmatism.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = -3*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end

			-- Colour Blindness
			if math.ceil(ColourBlindness.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W + ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W+ColourBlindness.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W + 2*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W+2*ColourBlindness.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W + 3*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W+3*ColourBlindness.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W + 4*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			elseif math.ceil(ColourBlindness.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == -1*ColourBlindness.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = 0 , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == -2*ColourBlindness.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = -1*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == -3*ColourBlindness.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = -2*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == -4*ColourBlindness.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = -3*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end

			-- Contrast Sensitivity
			if math.ceil(ContrastSensitivity.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W + ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W+ContrastSensitivity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W + 2*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W+2*ContrastSensitivity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W + 3*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W+3*ContrastSensitivity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W + 4*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			elseif math.ceil(ContrastSensitivity.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == -1*ContrastSensitivity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity, {time = 500, x = 0 , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == -2*ContrastSensitivity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = -1*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == -3*ContrastSensitivity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = -2*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == -4*ContrastSensitivity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = -3*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end


			-- Amsler Grid
			if math.ceil(AmslerGrid.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W + AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W+AmslerGrid.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W + 2*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W+2*AmslerGrid.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W + 3*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W+3*AmslerGrid.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid, {time = 500, x = _W + 4*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			elseif math.ceil(AmslerGrid.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == -1*AmslerGrid.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid, {time = 500, x = 0 , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == -2*AmslerGrid.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = -1*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == -3*AmslerGrid.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = -2*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == -4*AmslerGrid.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = -3*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end

			-- Myopia Hyperopia
			if math.ceil(MyopiaHyperopia.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W + MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W+MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W + 2*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W+2*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W + 3*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W+3*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia, {time = 500, x = _W + 4*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			elseif math.ceil(MyopiaHyperopia.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == -1*MyopiaHyperopia.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia, {time = 500, x = 0 , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == -2*MyopiaHyperopia.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = -1*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == -3*MyopiaHyperopia.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = -2*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == -4*MyopiaHyperopia.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = -3*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end
			

			-- Red Desaturation
			if math.ceil(RedDesaturation.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W + RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W+RedDesaturation.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W + 2*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W+2*RedDesaturation.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W + 3*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W+3*RedDesaturation.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation, {time = 500, x = _W + 4*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			elseif math.ceil(RedDesaturation.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W/9 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == -1*RedDesaturation.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation, {time = 500, x = 0 , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == -2*RedDesaturation.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = -1*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == -3*RedDesaturation.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = -2*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == -4*RedDesaturation.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = -3*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end


		--elseif (event.xStart > event.x - 10 and LazyEyeTrainer.x ~= _W/2.5) then	 -- swipe left
		elseif (xBegin > xEnd  and RedDesaturation.x ~= _W/2.5) then	 -- swipe left
			
			if math.ceil(VisualAcuity.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = 0 , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W+VisualAcuity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W+2*VisualAcuity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W + VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W+3*VisualAcuity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W + 2*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == math.ceil(_W+4*VisualAcuity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = _W + 3*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			
			elseif math.ceil(VisualAcuity.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = -1*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == -1*VisualAcuity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = -2*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == -2*VisualAcuity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = -3*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(VisualAcuity.x) == -3*VisualAcuity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(VisualAcuity,{time = 500, x = -4*VisualAcuity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end


			-- Astigmatism
			if math.ceil(Astigmatism.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = 0 , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W/1.3  , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W+Astigmatism.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W+2*Astigmatism.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W + Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W+3*Astigmatism.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W + 2*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == math.ceil(_W+4*Astigmatism.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = _W + 3*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			

			elseif math.ceil(Astigmatism.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = -1*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == -1*Astigmatism.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = -2*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == -2*Astigmatism.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = -3*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(Astigmatism.x) == -3*Astigmatism.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(Astigmatism,{time = 500, x = -4*Astigmatism.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end

			-- Colour Blindness
			if math.ceil(ColourBlindness.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = 0 , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W+ColourBlindness.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W+2*ColourBlindness.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W + ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W+3*ColourBlindness.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W + 2*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == math.ceil(_W+4*ColourBlindness.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = _W + 3*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			

			elseif math.ceil(ColourBlindness.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = -1*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == -1*ColourBlindness.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = -2*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == -2*ColourBlindness.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = -3*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ColourBlindness.x) == -3*ColourBlindness.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ColourBlindness,{time = 500, x = -4*ColourBlindness.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end

			-- Contrast Sensitivity
			if math.ceil(ContrastSensitivity.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = 0 , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W+ContrastSensitivity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W+2*ContrastSensitivity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W + ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W+3*ContrastSensitivity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W + 2*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == math.ceil(_W+4*ContrastSensitivity.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = _W + 3*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			

			elseif math.ceil(ContrastSensitivity.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = -1*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == -1*ContrastSensitivity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = -2*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == -2*ContrastSensitivity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = -3*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(ContrastSensitivity.x) == -3*ContrastSensitivity.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(ContrastSensitivity,{time = 500, x = -4*ContrastSensitivity.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end


			-- Amsler Grid
			if math.ceil(AmslerGrid.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = 0 , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == _W --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W+AmslerGrid.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W+2*AmslerGrid.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W + AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W+3*AmslerGrid.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W + 2*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == math.ceil(_W+4*AmslerGrid.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = _W + 3*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			

			elseif math.ceil(AmslerGrid.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = -1*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == -1*AmslerGrid.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = -2*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == -2*AmslerGrid.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = -3*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(AmslerGrid.x) == -3*AmslerGrid.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(AmslerGrid,{time = 500, x = -4*AmslerGrid.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end


			-- Myopia Hyperopia			
			if math.ceil(MyopiaHyperopia.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = 0 , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W/2.5 , xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W+MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W+2*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W + MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W+3*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W + 2*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(_W+4*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = _W + 3*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			

			elseif math.ceil(MyopiaHyperopia.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = -1*MyopiaHyperopia.width, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(-1*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = -2*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(-2*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = -3*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(MyopiaHyperopia.x) == math.ceil(-3*MyopiaHyperopia.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(MyopiaHyperopia,{time = 500, x = -4*MyopiaHyperopia.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end

			

			-- Red Desaturation
			if math.ceil(RedDesaturation.x) == math.ceil(_W/2.5) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/9)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W/9 , xScale = 1, yScale = 1, alpha = 1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W/9) --[[and math.ceil(LazyEyeTrainer.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = 0 , xScale = 1, yScale = 1, alpha = 0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W/1.3) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W/2.5, xScale = 2, yScale = 2,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W/1.3 , xScale = 1, yScale = 1,alpha=1, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W+RedDesaturation.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W+2*RedDesaturation.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W+RedDesaturation.width, xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W+3*RedDesaturation.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W + 2*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == math.ceil(_W+4*RedDesaturation.width) --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = _W + 3*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			

			elseif math.ceil(RedDesaturation.x) == 0 --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = -1*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == -1*RedDesaturation.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = -2*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == -2*RedDesaturation.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = -3*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			elseif math.ceil(RedDesaturation.x) == -3*RedDesaturation.width --[[and math.ceil(FloatersTracker.x) == math.ceil(_W/2.5)]] then
			isTouchEnabled = false
			transition.to(RedDesaturation,{time = 500, x = -4*RedDesaturation.width , xScale = 1, yScale = 1,alpha=0, onComplete=function() isTouchEnabled=true end})
			end

		
		xBegin = 0;xEnd = 0
		end
	end	
	

	end

	function VisualAcuityTouch (event)
		
		if event.phase == "ended" then
			if math.ceil(VisualAcuity.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeTests()
				storyboard.gotoScene("VisualAcuity",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function AstigmatismTouch (event)

		if event.phase == "ended" then
			if math.ceil(Astigmatism.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeTests()
				storyboard.gotoScene("Astigmatism",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function ColourBlindnessTouch (event)

		if event.phase == "ended" then
			if math.ceil(ColourBlindness.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeTests()
				storyboard.gotoScene("ColourBlindness",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	function ContrastSensitivityTouch (event)

		if event.phase == "ended" then
			if math.ceil(ContrastSensitivity.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeTests()
				storyboard.gotoScene("ContrastSensitivity",{effect = "zoomOutIn"})
				return true

			end
		end

	end

	function AmslerGridTouch (event)

		if event.phase == "ended" then
			if math.ceil(AmslerGrid.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeTests()
				storyboard.gotoScene("AmslerGrid",{effect = "zoomOutIn"})
				return true

			end
		end

	end

	function MyopiaHyperopiaTouch (event)

		if event.phase == "ended" then
			if math.ceil(MyopiaHyperopia.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeTests()
				storyboard.gotoScene("MyopiaHyperopia",{effect = "zoomOutIn"})
				return true

			end
		end

	end

	function RedDesaturationTouch (event)

		if event.phase == "ended" then
			if math.ceil(RedDesaturation.x) == math.ceil(_W/2.5) then
				removeEventListenersFunctionEyeTests()
				storyboard.gotoScene("RedDesaturation",{effect = "zoomOutIn"})
				return true

			end
		end

	end


	
VisualAcuity:addEventListener("touch",VisualAcuityTouch)
RedDesaturation:addEventListener("touch",RedDesaturationTouch)
ColourBlindness:addEventListener("touch",ColourBlindnessTouch)
ContrastSensitivity:addEventListener("touch",ContrastSensitivityTouch)
Astigmatism:addEventListener("touch",AstigmatismTouch)
AmslerGrid:addEventListener("touch",AmslerGridTouch)
MyopiaHyperopia:addEventListener("touch",MyopiaHyperopiaTouch)
Runtime:addEventListener("touch", testsmenuTouchScreen)


end
function scene:enterScene( event )
	storyboard.purgeScene("menu")
	storyboard.purgeScene("MyopiaHyperopia")
	storyboard.purgeScene("AmslerGrid")
	storyboard.purgeScene("Astigmatism")
	storyboard.purgeScene("ColourBlindness")
	storyboard.purgeScene("ContrastSensitivity")
	storyboard.purgeScene("RedDesaturation")
	storyboard.purgeScene("VisualAcuity")
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
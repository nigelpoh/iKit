display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
CountAmsler = 0
function scene:createScene(event)
	Gothic = "Wensleydale Gothic NBP"
	TimerArrayAmslerGrid = {}
	groupAmslerGrid = self.view
	math.randomseed(os.time())
	B = math.random(1,2)
	ResultAG = {}
	function PreventClickThroughAmsler()
		return true
	end
function CheckAmsler() 
if CountAmsler == 1 then
	if(b == "ID1") then
		function transitBack1Amsler()
		transition.to(AmslerGridAnswer1,{x = _W/1.9,y = _H/1.2})
		coverLeftEyeAmsler()
		end
		TimerArrayAmslerGrid[1] = timer.performWithDelay(1000,transitBack1Amsler,1)
	elseif(b == "ID2")then
		function transitBack1Amsler()
		transition.to(AmslerGridAnswer2,{x = _W/1.8,y = _H/1.5})
		coverLeftEyeAmsler()
		end
		TimerArrayAmslerGrid[2] = timer.performWithDelay(1000,transitBack1Amsler,1)
		end
elseif CountAmsler == 2 then
	function showResultAGs2()
	local backgroundResultAGs2 = display.newRect(0,0,_W,_H)
	backgroundResultAGs2.alpha = 0.5
	backgroundResultAGs2:setFillColor(0,0,0)
	backgroundResultAGs2.anchorX = 0
	backgroundResultAGs2.anchorY = 0
	backgroundResultAGs2:addEventListener("touch",PreventClickThroughAmsler)
	groupAmslerGrid:insert(backgroundResultAGs2)
end
function BacktoEyeTestsMenuAmslerGrid()
	storyboard.gotoScene("EyeTests")
	end
	function showResultAGs()
	local backgroundResultAGs = display.newImage("Result_Display.png")
    backgroundResultAGs.width = _W * 0.9
    backgroundResultAGs.height = _H*0.9
	backgroundResultAGs.anchorX = 0.5
	backgroundResultAGs.anchorY = 0.5
	backgroundResultAGs.x = _W*0.5
	backgroundResultAGs.y = _H*0.5
	backgroundResultAGs:addEventListener("touch",BacktoEyeTestsMenuAmslerGrid)
	groupAmslerGrid:insert(backgroundResultAGs)
	if(ResultAG[1] == "'s macula or optic nerve has been damaged. This is may be caused by macular degeneration or other eye diseases. It is advisable for you visit your eye doctor asap." and ResultAG[2] == "'s macula or optic nerve has been damaged. This is may be caused by macular degeneration or other eye diseases. It is advisable for you visit your eye doctor asap.") then
	local backgroundResultAGs2Text = display.newText("Both of your eyes are suffering from macula or optic nerve damage. This is may be caused by macular degeneration or other eye diseases. It is advisable for you visit your eye doctor asap.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResultAGs2Text.anchorX = 0
	backgroundResultAGs2Text.anchorY = 0
	backgroundResultAGs2Text:setFillColor(0,0,0)
	groupAmslerGrid:insert(backgroundResultAGs2Text)
	elseif(ResultAG[1] == " is functioning well." and ResultAG[2] == " is functioning well.") then
	local backgroundResultAGs2Text = display.newText("Both of your eyes are functioning well.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResultAGs2Text.anchorX = 0
	backgroundResultAGs2Text.anchorY = 0
	backgroundResultAGs2Text:setFillColor(0,0,0)
	groupAmslerGrid:insert(backgroundResultAGs2Text)
	else
	local backgroundResultAGs2Text = display.newText("Your Right Eye"..ResultAG[1].."\nYour Left Eye"..ResultAG[2],_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResultAGs2Text.anchorX = 0
	backgroundResultAGs2Text.anchorY = 0
	backgroundResultAGs2Text:setFillColor(0,0,0)
	groupAmslerGrid:insert(backgroundResultAGs2Text)
end
	local backgroundResultAGsNext = display.newText("Click to return to Eye Tests Menu",_W*0.5,_H*0.79,system.nativeFont,30)
	backgroundResultAGsNext:setFillColor(0,200/255,1)
	groupAmslerGrid:insert(backgroundResultAGsNext)
end
TimerArrayAmslerGrid[4] = timer.performWithDelay(400,showResultAGs2,1)
TimerArrayAmslerGrid[5] = timer.performWithDelay(500,showResultAGs,1)

	end
end
function coverLeftEyeAmsler() 
coverbackgroundAms = display.newRect(0,0,_W,_H)
coverbackgroundAms.anchorX = 0
coverbackgroundAms.anchorY = 0
coverbackgroundAms:setFillColor(0, 0, 0)
groupAmslerGrid:insert(coverbackgroundAms)

coverYourLeftEyeAmslerGrid = display.newImage("CoverYourLeftEye.png")
coverYourLeftEyeAmslerGrid.width = 256
coverYourLeftEyeAmslerGrid.height = 256
coverYourLeftEyeAmslerGrid.anchorX = 0.5
coverYourLeftEyeAmslerGrid.anchorY = 0.5
coverYourLeftEyeAmslerGrid.x = _W*0.5
coverYourLeftEyeAmslerGrid.y = _H*0.5
coverYourLeftEyeAmslerGridText = display.newText("Cover Your Left Eye",0,0,Gothic,50)
coverYourLeftEyeAmslerGridText.anchorX = 0.5
coverYourLeftEyeAmslerGridText.anchorY = 0.5
coverYourLeftEyeAmslerGridText.x = _W*0.5
coverYourLeftEyeAmslerGridText.y = _H*0.2
coverYourLeftEyeAmslerGridText:setFillColor(1,0,0)
groupAmslerGrid:insert(coverYourLeftEyeAmslerGrid)
groupAmslerGrid:insert(coverYourLeftEyeAmslerGridText)
TimerArrayAmslerGrid[6] = timer.performWithDelay(2000,MainAmsler,1)
end
function MainAmsler() 
if(CountAmsler < 2) then
local backgroundAG = display.newRect(0,0,_W,_H)
backgroundAG.anchorX = 0 
backgroundAG.anchorY = 0
backgroundAG:setFillColor(1,1,1)
groupAmslerGrid:insert(backgroundAG)
local AmslerGridBackground = display.newImageRect("Myopia_Hyperopia_Background.png",_W*0.5,_H)
AmslerGridBackground.anchorX = 0
AmslerGridBackground.anchorY = 0
AmslerGridBackground.x = _W/2
AmslerGridBackground.y = 0
--AmslerGridBackground:scale(1,1.03)
groupAmslerGrid:insert(AmslerGridBackground)
local AmslerGridBackground2 = display.newImageRect("Myopia_Hyperopia_Background_2.png",_W*0.5,_H)
AmslerGridBackground2.anchorX = 0
AmslerGridBackground2.anchorY = 0
AmslerGridBackground2.x = 0
AmslerGridBackground2.y = 0
--AmslerGridBackground2:scale(1,1.03)
groupAmslerGrid:insert(AmslerGridBackground2)
local QuestionTitleAG = display.newImage("What_Do_You_See?.png")
QuestionTitleAG:scale(1.5,1.5)
QuestionTitleAG.anchorX = 0
QuestionTitleAG.anchorY = 0
QuestionTitleAG.x = _W/11
QuestionTitleAG.y = _H/20
QuestionTitleAG.alpha = 0.7
groupAmslerGrid:insert(QuestionTitleAG)
local testQuestionAG = display.newImage("Amsler_Grid_Test_Question.png")
testQuestionAG.x = _W*0.1
testQuestionAG.y = _H/3
testQuestionAG.width = 200
testQuestionAG.height = 150
testQuestionAG.anchorX = 0
testQuestionAG.anchorY = 0
testQuestionAG:scale(2,2)
groupAmslerGrid:insert(testQuestionAG)
local function DetectTouch( event )
	b = event.target.id
	if(event.target.id == "ID1") then
		ResultAG[CountAmsler] = "'s macula or optic nerve has been damaged. This is may be caused by macular degeneration or other eye diseases. It is advisable for you visit your eye doctor asap."
		transition.to(AmslerGridAnswer1,{x = _W/1.9,y = _H/8})
		CheckAmsler()
	elseif(event.target.id == "ID2") then
		ResultAG[CountAmsler] = " is functioning well."
		transition.to(AmslerGridAnswer2,{x = _W/1.8,y = _H/8})
		CheckAmsler()
	end
end
CountAmsler = CountAmsler + 1
AmslerGridAnswer1 = display.newImage("AmslerGridTestAnswer1.png")
AmslerGridAnswer1.id = "ID1"
AmslerGridAnswer1.anchorX = 0
AmslerGridAnswer1.anchorY = 0
AmslerGridAnswer1.x = _W/1.9
AmslerGridAnswer1.y = _H/1.2
AmslerGridAnswer1:scale(1.5,1.5)
groupAmslerGrid:insert(AmslerGridAnswer1)
AmslerGridAnswer1:addEventListener("touch",DetectTouch)
AmslerGridAnswer2 = display.newImage("AmslerGridTestAnswer2.png")
AmslerGridAnswer2.id = "ID2"
AmslerGridAnswer2.anchorX = 0
AmslerGridAnswer2.anchorY = 0
AmslerGridAnswer2.x = _W/1.8
AmslerGridAnswer2.y = _H/1.5
AmslerGridAnswer2:scale(1.5,1.5)
groupAmslerGrid:insert(AmslerGridAnswer2)
AmslerGridAnswer2:addEventListener("touch",DetectTouch)
local StartOfAnswerAmsler = display.newText("I can see: ",_W/1.9,_H/15,native.nativeFontBold,30)
StartOfAnswerAmsler.anchorX = 0
StartOfAnswerAmsler.anchorY = 0
groupAmslerGrid:insert(StartOfAnswerAmsler)
else

	end
end
function RemoveCoverAmsler()
	coverRightEyeAmsler.isVisible = false
end
function CoverRightEyeAmsler()
coverRightEyeAmsler = display.newImage("CoverYourRightEye.png")
coverRightEyeAmsler.width = 256
coverRightEyeAmsler.height = 256
coverRightEyeAmsler.anchorX = 0.5
coverRightEyeAmsler.anchorY = 0.5
coverRightEyeAmsler.x = _W * 0.5
coverRightEyeAmsler.y = _H * 0.5
coverYourRightEyeAmslerGridText = display.newText("Cover Your Right Eye",0,0,Gothic,50)
coverYourRightEyeAmslerGridText.anchorX = 0.5
coverYourRightEyeAmslerGridText.anchorY = 0.5
coverYourRightEyeAmslerGridText.x = _W*0.5
coverYourRightEyeAmslerGridText.y = _H*0.2
coverYourRightEyeAmslerGridText:setFillColor(1,0,0)
groupAmslerGrid:insert(coverRightEyeAmsler)
groupAmslerGrid:insert(coverYourRightEyeAmslerGridText)
CountAmsler = 0
TimerArrayAmslerGrid[7] = timer.performWithDelay(3000,RemoveCoverAmsler,1)
TimerArrayAmslerGrid[8] = timer.performWithDelay(3000,MainAmsler,1)
end
CoverRightEyeAmsler()
end
function scene:enterScene( event )
	storyboard.purgeScene("EyeTests")
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
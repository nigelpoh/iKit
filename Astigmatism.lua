display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
CountAstigma = 0
function scene:createScene(event)
	Gothic = "Wensleydale Gothic NBP"
	TimerArrayAstigmatism = {}
	groupAstigmatism = self.view
	math.randomseed(os.time())
	ResultAstigma = {}
	function PreventClickThroughAstigma()
		return true
	end
function CheckAstigma() 
if CountAstigma == 1 then
	if(c == "ID1") then
		function transitBack1Astigmatism()
		transition.to(AstigmatismAnswer1,{x = _W/1.9,y = _H/1.2})
		coverLeftEyeAstigmatism()
		end
		TimerArrayAstigmatism[1] = timer.performWithDelay(1000,transitBack1Astigmatism,1)
	elseif(c == "ID2")then
		function transitBack1Astigmatism()
		transition.to(AstigmatismAnswer2,{x = _W/1.8,y = _H/1.5})
		coverLeftEyeAstigmatism()
		end
		TimerArrayAstigmatism[2] = timer.performWithDelay(1000,transitBack1Astigmatism,1)
		end
elseif CountAstigma == 2 then
	function showResultAstigmas2()
	local backgroundResultAstigmas2 = display.newRect(0,0,_W,_H)
	backgroundResultAstigmas2.alpha = 0.5
	backgroundResultAstigmas2:setFillColor(0,0,0)
	backgroundResultAstigmas2.anchorX = 0
	backgroundResultAstigmas2.anchorY = 0
	backgroundResultAstigmas2:addEventListener("touch",PreventClickThroughAstigma)
	groupAstigmatism:insert(backgroundResultAstigmas2)
end
function BacktoEyeTestsMenuAstigmatism()
	storyboard.gotoScene("EyeTests", {effect = "crossFade", time = 300})
	end
	function showResultAstigmas()
	local backgroundResultAstigmas = display.newImage("Result_Display.png")
    backgroundResultAstigmas.width = _W * 0.9
    backgroundResultAstigmas.height = _H*0.9
	backgroundResultAstigmas.anchorX = 0.5
	backgroundResultAstigmas.anchorY = 0.5
	backgroundResultAstigmas.x = _W*0.5
	backgroundResultAstigmas.y = _H*0.5
	backgroundResultAstigmas:addEventListener("touch",BacktoEyeTestsMenuAstigmatism)
	groupAstigmatism:insert(backgroundResultAstigmas)
	if(ResultAstigma[1] == "might have an Astigmatism. This eyesight problem is mainly caused by incorrect curvature of the cornea. It is advisable for you to consult your eyecare specialist." and ResultAstigma[2] == "might have an Astigmatism. This eyesight problem is mainly caused by incorrect curvature of the cornea. It is advisable for you to consult your eyecare specialist.") then
	local backgroundResultAstigmas2Text = display.newText("Both of your eyes might have an Astigmatism. This eyesight problem is mainly caused by incorrect curvature of the cornea. It is advisable for you to consult your eyecare specialist.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResultAstigmas2Text.anchorX = 0
	backgroundResultAstigmas2Text.anchorY = 0
	backgroundResultAstigmas2Text:setFillColor(0,0,0)
	groupAstigmatism:insert(backgroundResultAstigmas2Text)
	elseif(ResultAstigma[1] == " is functioning well." and ResultAstigma[2] == " is functioning well.") then
	local backgroundResultAstigmas2Text = display.newText("Both of your eyes are functioning well. ",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResultAstigmas2Text.anchorX = 0
	backgroundResultAstigmas2Text.anchorY = 0
	backgroundResultAstigmas2Text:setFillColor(0,0,0)
	groupAstigmatism:insert(backgroundResultAstigmas2Text)
	else
	local backgroundResultAstigmas2Text = display.newText("Your Right Eye "..ResultAstigma[1].."\nYour Left Eye "..ResultAstigma[2],_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResultAstigmas2Text.anchorX = 0
	backgroundResultAstigmas2Text.anchorY = 0
	backgroundResultAstigmas2Text:setFillColor(0,0,0)
	groupAstigmatism:insert(backgroundResultAstigmas2Text)
end
	local backgroundResultAstigmasNext = display.newText("Click here to return to Eye Tests Menu",_W*0.5,_H*0.79,system.nativeFont,30)
	backgroundResultAstigmasNext:setFillColor(0,200/255,1)
	groupAstigmatism:insert(backgroundResultAstigmasNext)
end
TimerArrayAstigmatism[4] = timer.performWithDelay(400,showResultAstigmas2,1)
TimerArrayAstigmatism[5] = timer.performWithDelay(500,showResultAstigmas,1)

	end
end
function coverLeftEyeAstigmatism() 
coverbackgroundAst = display.newRect(0,0,_W,_H)
coverbackgroundAst.anchorX = 0
coverbackgroundAst.anchorY = 0
coverbackgroundAst:setFillColor(0, 0, 0)
groupAstigmatism:insert(coverbackgroundAst)

coverYourLeftEyeAstigmatism = display.newImage("CoverYourLeftEye.png")
coverYourLeftEyeAstigmatism.width = 256
coverYourLeftEyeAstigmatism.height = 256
coverYourLeftEyeAstigmatism.anchorX = 0.5
coverYourLeftEyeAstigmatism.anchorY = 0.5
coverYourLeftEyeAstigmatism.x = _W*0.5
coverYourLeftEyeAstigmatism.y = _H*0.5
coverYourLeftEyeAstigmatismText = display.newText("Cover Your Left Eye",0,0,Gothic,50)
coverYourLeftEyeAstigmatismText.anchorX = 0.5
coverYourLeftEyeAstigmatismText.anchorY = 0.5
coverYourLeftEyeAstigmatismText.x = _W*0.5
coverYourLeftEyeAstigmatismText.y = _H*0.2
coverYourLeftEyeAstigmatismText:setFillColor(1,0,0)
groupAstigmatism:insert(coverYourLeftEyeAstigmatism)
groupAstigmatism:insert(coverYourLeftEyeAstigmatismText)
TimerArrayAstigmatism[6] = timer.performWithDelay(2000,MainAstigma,1)
end
function MainAstigma() 
if(CountAstigma < 2) then
local backgroundAstigma = display.newRect(0,0,_W,_H)
backgroundAstigma.anchorX = 0 
backgroundAstigma.anchorY = 0
backgroundAstigma:setFillColor(1,1,1)
groupAstigmatism:insert(backgroundAstigma)
local AstigmatismBackground = display.newImageRect("Myopia_Hyperopia_Background.png",_W*0.5,_H)
AstigmatismBackground.anchorX = 0
AstigmatismBackground.anchorY = 0
AstigmatismBackground.x = _W/2
AstigmatismBackground.y = 0
--AstigmatismBackground:scale(1,1.03)
groupAstigmatism:insert(AstigmatismBackground)
local AstigmatismBackground2 = display.newImageRect("Myopia_Hyperopia_Background_2.png",_W*0.5,_H)
AstigmatismBackground2.anchorX = 0
AstigmatismBackground2.anchorY = 0
AstigmatismBackground2.x = 0
AstigmatismBackground2.y = 0
--AstigmatismBackground2:scale(1,1.03)
groupAstigmatism:insert(AstigmatismBackground2)
local QuestionTitleAstigma = display.newImage("What_Do_You_See?.png")
QuestionTitleAstigma:scale(1.5,1.5)
QuestionTitleAstigma.anchorX = 0
QuestionTitleAstigma.anchorY = 0
QuestionTitleAstigma.x = _W/11
QuestionTitleAstigma.y = _H/20
QuestionTitleAstigma.alpha = 0.7
groupAstigmatism:insert(QuestionTitleAstigma)
local testQuestionAstigma = display.newImage("Test_Question_Astigmatism.png")
testQuestionAstigma.x = (_W*0.5 - testQuestionAstigma.width*1.5)*0.5
testQuestionAstigma.y = _H/3
testQuestionAstigma.width = 392
testQuestionAstigma.height = 218
testQuestionAstigma.anchorX = 0
testQuestionAstigma.anchorY = 0
testQuestionAstigma:scale(1.5,1.5)
groupAstigmatism:insert(testQuestionAstigma)
local function DetectTouchAstigma( event )
	c = event.target.id
	if(event.target.id == "ID1") then
		ResultAstigma[CountAstigma] = "might have an Astigmatism. This eyesight problem is mainly caused by incorrect curvature of the cornea. It is advisable for you to consult your eyecare specialist."
		transition.to(AstigmatismAnswer1,{x = _W/1.9,y = _H/8})
		CheckAstigma()
	elseif(event.target.id == "ID2") then
		ResultAstigma[CountAstigma] = " is functioning well."
		transition.to(AstigmatismAnswer2,{x = _W/1.8,y = _H/8})
		CheckAstigma()
	end
end
CountAstigma = CountAstigma + 1
AstigmatismAnswer1 = display.newImage("AstigmatismTestAnswer1.png")
AstigmatismAnswer1.id = "ID1"
AstigmatismAnswer1.anchorX = 0
AstigmatismAnswer1.anchorY = 0
AstigmatismAnswer1.x = _W/1.9
AstigmatismAnswer1.y = _H/1.2
AstigmatismAnswer1:scale(1.7,1.7)
groupAstigmatism:insert(AstigmatismAnswer1)
AstigmatismAnswer1:addEventListener("touch",DetectTouchAstigma)
AstigmatismAnswer2 = display.newImage("AstigmatismTestAnswer2.png")
AstigmatismAnswer2.id = "ID2"
AstigmatismAnswer2.anchorX = 0
AstigmatismAnswer2.anchorY = 0
AstigmatismAnswer2.x = _W/1.8
AstigmatismAnswer2.y = _H/1.5
AstigmatismAnswer2:scale(1.7,1.7)
groupAstigmatism:insert(AstigmatismAnswer2)
AstigmatismAnswer2:addEventListener("touch",DetectTouchAstigma)
local StartOfAnswerAstigma = display.newText("I can see: ",_W/1.9,_H/15,native.nativeFontBold,30)
StartOfAnswerAstigma.anchorX = 0
StartOfAnswerAstigma.anchorY = 0
groupAstigmatism:insert(StartOfAnswerAstigma)
else

	end
end
function RemoveCoverAstigma()
	coverRightEyeAstigmatism.isVisible = false
end
function CoverRightEyeAstigmatism()
coverRightEyeAstigmatism = display.newImage("CoverYourRightEye.png")
coverRightEyeAstigmatism.width = 256
coverRightEyeAstigmatism.height = 256
coverRightEyeAstigmatism.anchorX = 0.5
coverRightEyeAstigmatism.anchorY = 0.5
coverRightEyeAstigmatism.x = _W*0.5
coverRightEyeAstigmatism.y = _H*0.5
coverYourRightEyeAstigmatismText = display.newText("Cover Your Right Eye",0,0,Gothic,50)
coverYourRightEyeAstigmatismText.anchorX = 0.5
coverYourRightEyeAstigmatismText.anchorY = 0.5
coverYourRightEyeAstigmatismText.x = _W*0.5
coverYourRightEyeAstigmatismText.y = _H*0.2
coverYourRightEyeAstigmatismText:setFillColor(1,0,0)
groupAstigmatism:insert(coverRightEyeAstigmatism)
groupAstigmatism:insert(coverYourRightEyeAstigmatismText)
CountAstigma = 0
TimerArrayAstigmatism[7] = timer.performWithDelay(3000,RemoveCoverAstigma,1)
TimerArrayAstigmatism[8] = timer.performWithDelay(3000,MainAstigma,1)
end
CoverRightEyeAstigmatism()
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
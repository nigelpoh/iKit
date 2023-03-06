display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
Count = 0
Gothic = "Wensleydale Gothic NBP"
function scene:createScene(event)
	TimerArrayMyopiaHyperopia = {}
	groupMyopiaHyperopia = self.view
	math.randomseed(os.time())
	A = math.random(1,2)
	Result = {}
	function PreventClickThrough()
		return true
	end
function Check() 
if Count == 1 then
	if(a == "ID1") then
		function transitBack1()
		transition.to(MyopiaHyperopiaAnswer1,{x = _W/1.5,y = _H/1.25})
		coverLeftEye()
		end
		TimerArrayMyopiaHyperopia[1] = timer.performWithDelay(1000,transitBack1,1)
	elseif(a == "ID2")then
		function transitBack1()
		transition.to(MyopiaHyperopiaAnswer2,{x = _W/1.8,y = _H/1.54})
		coverLeftEye()
		end
		TimerArrayMyopiaHyperopia[2] = timer.performWithDelay(1000,transitBack1,1)
	elseif(a == "ID3")then
		function transitBack1()
		transition.to(MyopiaHyperopiaAnswer3,{x = _W/1.5, y = _H/2})
		coverLeftEye()
		end
		TimerArrayMyopiaHyperopia[3] = timer.performWithDelay(1000,transitBack1,1)
		end
elseif Count == 2 then
	function showResults2()
	local backgroundResults2 = display.newRect(0,0,_W,_H)
	backgroundResults2.alpha = 0.5
	backgroundResults2:setFillColor(0,0,0)
	backgroundResults2.anchorX = 0
	backgroundResults2.anchorY = 0
	backgroundResults2:addEventListener("touch",PreventClickThrough)
	groupMyopiaHyperopia:insert(backgroundResults2)
end
function BacktoEyeTestsMenuMyopiaHyperopia()
	
	groupMyopiaHyperopia:removeSelf()
	storyboard.gotoScene("EyeTests", {effect = "crossFade", time = 300})
	end
	function showResults()
		
	local backgroundResults = display.newImage("Result_Display.png")
    backgroundResults.width = _W * 0.9
    backgroundResults.height = _H*0.9
	backgroundResults.anchorX = 0.5
	backgroundResults.anchorY = 0.5
	backgroundResults.x = _W*0.5
	backgroundResults.y = _H*0.5
	backgroundResults:addEventListener("touch",BacktoEyeTestsMenuMyopiaHyperopia)
	groupMyopiaHyperopia:insert(backgroundResults)

	

	if(Result[1] == "is suffering from Myopia. It is advisable for you to visit an optician to have your eyes checked." and Result[2] == "is suffering from Myopia. It is advisable for you to visit an optician to have your eyes checked.") then
	local backgroundResults2Text = display.newText("Both of your eyes are suffering from Myopia. It is advisable for you to visit an optician to have your eyes checked.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResults2Text.anchorX = 0
	backgroundResults2Text.anchorY = 0
	backgroundResults2Text:setFillColor(0,0,0)
	groupMyopiaHyperopia:insert(backgroundResults2Text)	
	elseif(Result[1] == "is suffering from Hyperopia. It is advisable for you to visit an optician to have your eyes checked." and Result[2] == "is suffering from Hyperopia. It is advisable for you to visit an optician to have your eyes checked.") then
	local backgroundResults2Text = display.newText("Both your eyes are suffering from Hyperopia. It is advisable for you to visit an optician to have your eyes checked.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResults2Text.anchorX = 0
	backgroundResults2Text.anchorY = 0
	backgroundResults2Text:setFillColor(0,0,0)
	groupMyopiaHyperopia:insert(backgroundResults2Text)
	elseif(Result[1] == "has no problem." and Result[2] == "has no problem.") then
	local backgroundResults2Text = display.newText("Both of your eyes have no problem.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResults2Text.anchorX = 0
	backgroundResults2Text.anchorY = 0
	backgroundResults2Text:setFillColor(0,0,0)
	groupMyopiaHyperopia:insert(backgroundResults2Text)
	else
	local backgroundResults2Text = display.newText("Your Right Eye "..Result[1].."\nYour Left Eye "..Result[2],_W/4.9,_H*0.3,700,500,system.nativeFont,35)
	backgroundResults2Text.anchorX = 0
	backgroundResults2Text.anchorY = 0
	backgroundResults2Text:setFillColor(0,0,0)
	groupMyopiaHyperopia:insert(backgroundResults2Text)
end
	local backgroundResultsNext = display.newText("Click to return to Eye Tests Menu",_W*0.5,_H*0.79,system.nativeFont,30)
	backgroundResultsNext:setFillColor(0,200/255,1)
	groupMyopiaHyperopia:insert(backgroundResultsNext)
end
TimerArrayMyopiaHyperopia[4] = timer.performWithDelay(400,showResults2,1)
TimerArrayMyopiaHyperopia[5] = timer.performWithDelay(500,showResults,1)

	end
end
function coverLeftEye() 
coverbackground = display.newRect(0,0,_W,_H)
coverbackground.anchorX = 0
coverbackground.anchorY = 0
coverbackground:setFillColor(0, 0, 0)
groupMyopiaHyperopia:insert(coverbackground)
coverYourLeftEye = display.newImage("CoverYourLeftEye.png")
coverYourLeftEye.width = 256
coverYourLeftEye.height = 256
coverYourLeftEye.anchorX = 0.5
coverYourLeftEye.anchorY = 0.5
coverYourLeftEye.x = _W * 0.5
coverYourLeftEye.y = _H * 0.5
coverLeftEyeText = display.newText("Cover Your Left Eye",0,0,Gothic,50)
coverLeftEyeText.anchorX = 0.5
coverLeftEyeText.anchorY = 0.5
coverLeftEyeText.x = _W*0.5
coverLeftEyeText.y = _H*0.2
coverLeftEyeText:setFillColor(1,0,0)
groupMyopiaHyperopia:insert(coverYourLeftEye)
groupMyopiaHyperopia:insert(coverLeftEyeText)

TimerArrayMyopiaHyperopia[6] = timer.performWithDelay(2000, Main, 1)

end
function Main() 
if(Count < 2) then
local background = display.newRect(0,0,_W,_H)
background.anchorX = 0 
background.anchorY = 0
background:setFillColor(1,1,1)
groupMyopiaHyperopia:insert(background)
local MyopiaHyperopiaBackground = display.newImageRect("Myopia_Hyperopia_Background.png",_W*0.5,_H)
MyopiaHyperopiaBackground.anchorX = 0
MyopiaHyperopiaBackground.anchorY = 0
MyopiaHyperopiaBackground.x = _W/2
MyopiaHyperopiaBackground.y = 0
--MyopiaHyperopiaBackground:scale(1,1.03)
groupMyopiaHyperopia:insert(MyopiaHyperopiaBackground)
local MyopiaHyperopiaBackground2 = display.newImageRect("Myopia_Hyperopia_Background_2.png",_W*0.5,_H)
MyopiaHyperopiaBackground2.anchorX = 0
MyopiaHyperopiaBackground2.anchorY = 0
MyopiaHyperopiaBackground2.x = 0
MyopiaHyperopiaBackground2.y = 0
--MyopiaHyperopiaBackground2:scale(1,1.03)
groupMyopiaHyperopia:insert(MyopiaHyperopiaBackground2)
local QuestionTitle = display.newImage("What_Do_You_See?.png")
QuestionTitle:scale(1.5,1.5)
QuestionTitle.anchorX = 0
QuestionTitle.anchorY = 0
QuestionTitle.x = _W/11
QuestionTitle.y = _H/20
QuestionTitle.alpha = 0.7
groupMyopiaHyperopia:insert(QuestionTitle)
local testQuestion = display.newImage("MyopiaHyperopiaTest"..A..".png")
testQuestion.x = _W/15
testQuestion.y = _H/3
testQuestion.width = 232
testQuestion.height = 189
testQuestion.anchorX = 0
testQuestion.anchorY = 0
testQuestion:scale(2,2)
groupMyopiaHyperopia:insert(testQuestion)

local function DetectTouch( event )
	a = event.target.id
	if(event.target.id == "ID1") then
		Result[Count] = "is suffering from Myopia. It is advisable for you to visit an optician to have your eyes checked."
		transition.to(MyopiaHyperopiaAnswer1,{x = _W/1.8,y = _H/8})
		Check()
	elseif(event.target.id == "ID2") then
		Result[Count] = "is suffering from Hyperopia. It is advisable for you to visit an optician to have your eyes checked."
		transition.to(MyopiaHyperopiaAnswer2,{x = _W/1.8,y = _H/8})
		Check()
	elseif(event.target.id == "ID3") then
		Result[Count] = "has no problem."
		transition.to(MyopiaHyperopiaAnswer3,{x = _W/1.8, y = _H/8})
		Check()
	end
end
Count = Count + 1
MyopiaHyperopiaAnswer1 = display.newImage("MyopiaHyperopiaAnswer1"..A..".png")
MyopiaHyperopiaAnswer1.id = "ID1"
MyopiaHyperopiaAnswer1.anchorX = 0
MyopiaHyperopiaAnswer1.anchorY = 0
MyopiaHyperopiaAnswer1.x = _W/1.5
MyopiaHyperopiaAnswer1.y = _H/1.25
MyopiaHyperopiaAnswer1:scale(1.5,1.5)
groupMyopiaHyperopia:insert(MyopiaHyperopiaAnswer1)
MyopiaHyperopiaAnswer1:addEventListener("touch",DetectTouch)
MyopiaHyperopiaAnswer2 = display.newImage("MyopiaHyperopiaAnswer2"..A..".png")
MyopiaHyperopiaAnswer2.id = "ID2"
MyopiaHyperopiaAnswer2.anchorX = 0
MyopiaHyperopiaAnswer2.anchorY = 0
MyopiaHyperopiaAnswer2.x = _W/1.8
MyopiaHyperopiaAnswer2.y = _H/1.54
MyopiaHyperopiaAnswer2:scale(1.5,1.5)
groupMyopiaHyperopia:insert(MyopiaHyperopiaAnswer2)
MyopiaHyperopiaAnswer2:addEventListener("touch",DetectTouch)
MyopiaHyperopiaAnswer3 = display.newImage("MyopiaHyperopiaAnswer3.png") 
MyopiaHyperopiaAnswer3.id = "ID3"
MyopiaHyperopiaAnswer3.anchorX = 0
MyopiaHyperopiaAnswer3.anchorY = 0
MyopiaHyperopiaAnswer3.x = _W/1.5
MyopiaHyperopiaAnswer3.y = _H/2
MyopiaHyperopiaAnswer3:scale(1.5,1.5)
groupMyopiaHyperopia:insert(MyopiaHyperopiaAnswer3)
MyopiaHyperopiaAnswer3:addEventListener("touch",DetectTouch)
local StartOfAnswer = display.newText("I can see: ",_W/1.9,_H/15,system.nativeFontBold,30)
StartOfAnswer.anchorX = 0
StartOfAnswer.anchorY = 0
groupMyopiaHyperopia:insert(StartOfAnswer)
else

	end
end
function RemoveCover()
	coverRightEye.isVisible = false
end
function CoverRightEye()
coverRightEye = display.newImage("CoverYourRightEye.png")
coverRightEye.width = 256
coverRightEye.height = 256
coverRightEye.anchorX = 0.5
coverRightEye.anchorY = 0.5
coverRightEye.x = _W*0.5
coverRightEye.y = _H*0.5 
coverRightEyeText = display.newText("Cover Your Right Eye",0,0,Gothic,50)
coverRightEyeText.anchorX = 0.5
coverRightEyeText.anchorY = 0.5
coverRightEyeText.x = _W*0.5
coverRightEyeText.y = _H*0.2
coverRightEyeText:setFillColor(1,0,0)
groupMyopiaHyperopia:insert(coverRightEye)
groupMyopiaHyperopia:insert(coverRightEyeText)
Count = 0
TimerArrayMyopiaHyperopia[7] = timer.performWithDelay(3000,RemoveCover,1)
TimerArrayMyopiaHyperopia[8] = timer.performWithDelay(3000,Main,1)
end
CoverRightEye()
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
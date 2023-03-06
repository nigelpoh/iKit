display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight

function scene:createScene(event)
	
	VAnearCount = 0
	Result1 = 0
	Result2 = 0
	groupVAnear = self.view
	font1 = "Wensleydale Gothic NBP"
	font2 = "Capitals"

	VAnearImageArray = {
		{"C","E","L","N"},
		{"P","T","K","R"},
		{"N","D","O","Z"},
		{"U","F","T","P"},
		{"O","E","N","T"},
	}

	VAnearTextArray = {
		{"C","E","L","N"},
		{"P","T","K","R"},
		{"N","D","O","Z"},
		{"U","F","T","P"},
		{"O","E","N","T"},
	}


math.randomseed(os.time())



local function BacktoEyeTestsMenuVAnear (event)
	if (event.phase == "ended") then
		storyboard.gotoScene("EyeTests", {effect = "crossFade", time = 300})
	end

end


local function DisplayResultsVAnear ()

	DisplayResultsPanelVAnear = display.newImage("Result_Display.png")
    DisplayResultsPanelVAnear.width = _W * 0.9
    DisplayResultsPanelVAnear.height = _H*0.9
	DisplayResultsPanelVAnear.anchorX = 0.5
	DisplayResultsPanelVAnear.anchorY = 0.5
	DisplayResultsPanelVAnear.x = _W*0.5
	DisplayResultsPanelVAnear.y = _H*0.5
	groupVAnear:insert(DisplayResultsPanelVAnear)
	
	if (Result1 == 5) then
		displayResultsTextVAnear1 = "You have perfect left eye sight."
	elseif (Result1 == 4) then
		displayResultsTextVAnear1 = "Your left eye vision is mild Hyperopia or Presbyopia. Consult an optician to correct your left vision for reading."
	elseif (Result1 == 3) then
		displayResultsTextVAnear1 = "Your left eye vision is mild Hyperopia or Presbyopia. Consult an optician to correct your left vision for reading.."
	elseif (Result1 == 2) then
		displayResultsTextVAnear1 = "Your left eye Hyperopia or Presbyopia is quite bad. Consult an optician to correct your left vision."
	elseif (Result1 == 1) then
		displayResultsTextVAnear1 = "Your left eye Hyperopia or Presbyopia is really bad. Consult an optician to correct your left vision immediately."
	elseif (Result1 == 0) then
		displayResultsTextVAnear1 = "Your left eye Hyperopia or Presbyopia is seriously bad. Consult an optician to correct your left vision immediately."
	end


	if (Result2 == 5) then
		displayResultsTextVAnear2 = "You have perfect right eye sight."
	elseif (Result2 == 4) then
		displayResultsTextVAnear2 = "Your right eye vision is mild Hyperopia or Presbyopia. Consult an optician to correct your right vision for reading."
	elseif (Result2 == 3) then
		displayResultsTextVAnear2 = "Your right eye vision is mild Hyperopia or Presbyopia. Consult an optician to correct your right vision for reading."
	elseif (Result2 == 2) then
		displayResultsTextVAnear2 = "Your right eye Hyperopia or Presbyopia is quite bad. Consult an optician to correct your right vision."
	elseif (Result2 == 1) then
		displayResultsTextVAnear2 = "Your right eye Hyperopia or Presbyopia is really bad. Consult an optician to correct your right vision immediately."
	elseif (Result2 == 0) then
		displayResultsTextVAnear2 = "Your right eye Hyperopia or Presbyopia is seriously bad. Consult an optician to correct your right vision immediately."
	end

	displayResultsTextVAnear = displayResultsTextVAnear1.." "..displayResultsTextVAnear2

	displayResultsVAnearOpt = {

		text = displayResultsTextVAnear,
		x = _W/4.9,
		y = _H*0.3,
		width = 700,
		height = 500,
		font = system.nativeFont,
		fontSize = 35
	}
	
	displayResultsVAnear = display.newText (displayResultsVAnearOpt)
	displayResultsVAnear.anchorX = 0
	displayResultsVAnear.anchorY = 0
	displayResultsVAnear:setFillColor(0,0,0)
	displayResultsVAnear:toFront()
	groupVAnear:insert(displayResultsVAnear)

	local displayResultsNextVAnear = display.newText("Click to return to Eye Tests Menu",_W*0.5,_H*0.79,system.nativeFont,30)
	displayResultsNextVAnear:setFillColor(0,200/255,1)
	groupVAnear:insert(displayResultsNextVAnear)

	DisplayResultsPanelVAnear:addEventListener("touch",BacktoEyeTestsMenuVAnear)
	


end

function CoverLeftEye()

-- Black background
backgroundVAnearB = display.newRect(0,0,_W,_H)
backgroundVAnearB.anchorX = 0 
backgroundVAnearB.anchorY = 0
backgroundVAnearB:setFillColor(0,0,0)
groupVAnear:insert(backgroundVAnearB)

coverYourLeftEyeVAnear = display.newImage("CoverYourLeftEye.png")
coverYourLeftEyeVAnear.width = 256
coverYourLeftEyeVAnear.height = 256
coverYourLeftEyeVAnear.anchorX = 0.5
coverYourLeftEyeVAnear.anchorY = 0.5
coverYourLeftEyeVAnear.x = _W*0.5
coverYourLeftEyeVAnear.y = _H*0.5
coverYourLeftEyeVAnearText = display.newText("Cover Your Left Eye",0,0,Gothic,50)
coverYourLeftEyeVAnearText.anchorX = 0.5
coverYourLeftEyeVAnearText.anchorY = 0.5
coverYourLeftEyeVAnearText.x = _W*0.5
coverYourLeftEyeVAnearText.y = _H*0.2
coverYourLeftEyeVAnearText:setFillColor(1,0,0)
groupVAnear:insert(coverYourLeftEyeVAnear)
groupVAnear:insert(coverYourLeftEyeVAnearText)
LeftVAnearTimer = timer.performWithDelay(2000,VAQuestionsnear,1)

end


function VAQuestionsnear()
VAnearquestionCount = 0
VAnearcorrectAnswerCount = 0
VAnearCount = VAnearCount + 1
-- White background
backgroundVAnear = display.newRect(0,0,_W,_H)
backgroundVAnear.anchorX = 0 
backgroundVAnear.anchorY = 0
backgroundVAnear:setFillColor(1,1,1)
groupVAnear:insert(backgroundVAnear)

-- right answer Box
VAnearBackground = display.newImageRect("Myopia_Hyperopia_Background.png",_W*0.5,_H)
VAnearBackground.anchorX = 0
VAnearBackground.anchorY = 0
VAnearBackground.x = _W/2
VAnearBackground.y = 0
--ColourBlindBackground:scale(1,1.03)
groupVAnear:insert(VAnearBackground)

-- left question box
VAnearBackground2 = display.newImageRect("Myopia_Hyperopia_Background_2.png",_W*0.5,_H)
VAnearBackground2.anchorX = 0
VAnearBackground2.anchorY = 0
VAnearBackground2.x = 0
VAnearBackground2.y = 0
--ColourBlindBackground2:scale(1,1.03)
groupVAnear:insert(VAnearBackground2)

-- question
QuestionTitleVAnear = display.newImage("What_Do_You_See?.png")
QuestionTitleVAnear:scale(1.5,1.5)
QuestionTitleVAnear.anchorX = 0
QuestionTitleVAnear.anchorY = 0
QuestionTitleVAnear.x = _W/11
QuestionTitleVAnear.y = _H/16
QuestionTitleVAnear.alpha = 0.7
groupVAnear:insert(QuestionTitleVAnear)

StartOfAnswerVAnear2 = display.newText("Near Vision Eye Test",_W*0.25,_H*0.05,native.nativeFontBold,35)
StartOfAnswerVAnear2:setFillColor(1, 0, 0)
StartOfAnswerVAnear2.anchorX = 0.5
StartOfAnswerVAnear2.anchorY = 0
StartOfAnswerVAnear2.x = _W*0.25
groupVAnear:insert(StartOfAnswerVAnear2)

StartOfAnswerVAnear = display.newText("Kindly place device at 0.5m (arm length) away for this test. \nI can see: ",_W*0.53,_H/15,_W*0.43,100,native.nativeFontBold,25)
StartOfAnswerVAnear.anchorX = 0
StartOfAnswerVAnear.anchorY = 0
groupVAnear:insert(StartOfAnswerVAnear)

local function Question5 ()
-- Display Question 5

local randomQuestion5 = math.random(1,4)
-- remove previous test question
testQuestion4.alpha = 0
-- set up next test question
local filenameQuestion5 = VAnearImageArray[5][randomQuestion5]
testQuestion5opt = {
	text = filenameQuestion5,
	font = font2,
	fontSize = 8

}
testQuestion5 = display.newText(testQuestion5opt)
testQuestion5.anchorX = 0; testQuestion5.anchorY = 0
testQuestion5.x = (_W*0.5 - testQuestion5.width)*0.5
testQuestion5.y = (_H-testQuestion5.height)*0.6
testQuestion5:setFillColor(0, 0, 0)
local answerPosition5 = math.random(1,3)
groupVAnear:insert(testQuestion5)

local function buttonWrong5Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1

		if (VAnearCount == 1) then 
			Result1 = VAnearcorrectAnswerCount
			CoverLeftEye()
			
		elseif (VAnearCount == 2) then
			Result2 = VAnearcorrectAnswerCount
			DisplayResultsVAnear()
			
		end
	end
end

local buttonWrong5 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.4,
	width = 256,
	height = 100,
	label = "Q",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonWrong5Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition5 == 1) then 
	buttonWrong5.x = _W*0.667
	buttonWrong5.y = _H*0.4
elseif (answerPosition5 == 2) then
	buttonWrong5.x = _W*0.667
	buttonWrong5.y = _H*0.8
elseif (buttonWrong5 == 3) then
	buttonWrong5.x = _W*0.85
	buttonWrong5.y = _H*0.6
end
groupVAnear:insert(buttonWrong5)


local function buttonNothing5Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		if (VAnearCount == 1) then 
			Result1 = VAnearcorrectAnswerCount
			CoverLeftEye()
		elseif (VAnearCount == 2) then
			Result2 = VAnearcorrectAnswerCount
			DisplayResultsVAnear()
		end
	end
end

local buttonNothing5 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.6,
	width = 256,
	height = 100,
	label = "UNSURE",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 50,
	font = font2,
	onEvent = buttonNothing5Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition5 == 1) then 
	buttonNothing5.x = _W*0.85
	buttonNothing5.y = _H*0.6
elseif (answerPosition5 == 2) then
	buttonNothing5.x = _W*0.667
	buttonNothing5.y = _H*0.4
elseif (buttonPosition5 == 3) then
	buttonNothing5.x = _W*0.667
	buttonNothing5.y = _H*0.8
end

groupVAnear:insert(buttonNothing5)

local function buttonAnswer5Press (event)
	if (event.phase == "ended") then
		VAnearcorrectAnswerCount = VAnearcorrectAnswerCount + 1
		VAnearquestionCount = VAnearquestionCount + 1
		
		if (VAnearCount == 1) then 
			Result1 = VAnearcorrectAnswerCount
			CoverLeftEye()
		elseif (VAnearCount == 2) then
			Result2 = VAnearcorrectAnswerCount
			DisplayResultsVAnear()
		end
	end
end


buttonAnswer5 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VAnearTextArray[5][randomQuestion5],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonAnswer5Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition5 == 1) then 
	buttonAnswer5.x = _W*0.667
	buttonAnswer5.y = _H*0.8
elseif (answerPosition5 == 2) then
	buttonAnswer5.x = _W*0.85
	buttonAnswer5.y = _H*0.6
elseif (buttonPosition5 == 3) then
	buttonAnswer5.x = _W*0.667
	buttonAnswer5.y = _H*0.4
end

groupVAnear:insert(buttonAnswer5)

end


local function Question4 ()
-- Display Question 4

local randomQuestion4 = math.random(1,4)
-- remove previous test question
testQuestion3.alpha = 0
-- set up next test question
local filenameQuestion4 = VAnearImageArray[4][randomQuestion4]
testQuestion4opt = {
	text = filenameQuestion4,
	font = font2,
	fontSize = 16

}
testQuestion4 = display.newText(testQuestion4opt)
testQuestion4.anchorX = 0; testQuestion4.anchorY = 0
testQuestion4.x = (_W*0.5 - testQuestion4.width)*0.5
testQuestion4.y = (_H-testQuestion4.height)*0.6
testQuestion4:setFillColor(0, 0, 0)
local answerPosition4 = math.random(1,3)
groupVAnear:insert(testQuestion4)

local function buttonWrong4Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question5()
	end
end

local buttonWrong4 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.4,
	width = 256,
	height = 100,
	label = "R",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonWrong4Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition4 == 1) then 
	buttonWrong4.x = _W*0.667
	buttonWrong4.y = _H*0.4
elseif (answerPosition4 == 2) then
	buttonWrong4.x = _W*0.667
	buttonWrong4.y = _H*0.8
elseif (buttonWrong4 == 3) then
	buttonWrong4.x = _W*0.85
	buttonWrong4.y = _H*0.6
end
groupVAnear:insert(buttonWrong4)


local function buttonNothing4Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question5()
	end
end

local buttonNothing4 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.6,
	width = 256,
	height = 100,
	label = "UNSURE",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 50,
	font = font2,
	onEvent = buttonNothing4Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition4 == 1) then 
	buttonNothing4.x = _W*0.85
	buttonNothing4.y = _H*0.6
elseif (answerPosition4 == 2) then
	buttonNothing4.x = _W*0.667
	buttonNothing4.y = _H*0.4
elseif (buttonPosition4 == 3) then
	buttonNothing4.x = _W*0.667
	buttonNothing4.y = _H*0.8
end

groupVAnear:insert(buttonNothing4)

local function buttonAnswer4Press (event)
	if (event.phase == "ended") then
		VAnearcorrectAnswerCount = VAnearcorrectAnswerCount + 1
		VAnearquestionCount = VAnearquestionCount + 1
		Question5()
	end
end


buttonAnswer4 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VAnearTextArray[4][randomQuestion4],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonAnswer4Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition4 == 1) then 
	buttonAnswer4.x = _W*0.667
	buttonAnswer4.y = _H*0.8
elseif (answerPosition4 == 2) then
	buttonAnswer4.x = _W*0.85
	buttonAnswer4.y = _H*0.6
elseif (buttonPosition4 == 3) then
	buttonAnswer4.x = _W*0.667
	buttonAnswer4.y = _H*0.4
end

groupVAnear:insert(buttonAnswer4)

end


local function Question3 ()
-- Display Question 3
local randomQuestion3 = math.random(1,4)
-- remove previous test question
testQuestion2.alpha = 0
-- set up next test question
local filenameQuestion3 = VAnearImageArray[3][randomQuestion3]

testQuestion3opt = {
	text = filenameQuestion3,
	font = font2,
	fontSize = 24

}
testQuestion3 = display.newText(testQuestion3opt)
testQuestion3.anchorX = 0; testQuestion3.anchorY = 0
testQuestion3.x = (_W*0.5 - testQuestion3.width)*0.5
testQuestion3.y = (_H-testQuestion3.height)*0.6
testQuestion3:setFillColor(0, 0, 0)

local answerPosition3 = math.random(1,3)
groupVAnear:insert(testQuestion3)

local function buttonWrong3Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question4()
	end
end

local buttonWrong3 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.4,
	width = 256,
	height = 100,
	label = "B",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonWrong3Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition3 == 1) then 
	buttonWrong3.x = _W*0.667
	buttonWrong3.y = _H*0.4
elseif (answerPosition3 == 2) then
	buttonWrong3.x = _W*0.667
	buttonWrong3.y = _H*0.8
elseif (buttonWrong3 == 3) then
	buttonWrong3.x = _W*0.85
	buttonWrong3.y = _H*0.6
end
groupVAnear:insert(buttonWrong3)


local function buttonNothing3Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question4()
	end
end

local buttonNothing3 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.6,
	width = 256,
	height = 100,
	label = "UNSURE",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 50,
	font = font2,
	onEvent = buttonNothing3Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition3 == 1) then 
	buttonNothing3.x = _W*0.85
	buttonNothing3.y = _H*0.6
elseif (answerPosition3 == 2) then
	buttonNothing3.x = _W*0.667
	buttonNothing3.y = _H*0.4
elseif (buttonPosition3 == 3) then
	buttonNothing3.x = _W*0.667
	buttonNothing3.y = _H*0.8
end

groupVAnear:insert(buttonNothing3)

local function buttonAnswer3Press (event)
	if (event.phase == "ended") then
		VAnearcorrectAnswerCount = VAnearcorrectAnswerCount + 1
		VAnearquestionCount = VAnearquestionCount + 1
		Question4()
	end
end


local buttonAnswer3 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VAnearTextArray[3][randomQuestion3],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonAnswer3Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition3 == 1) then 
	buttonAnswer3.x = _W*0.667
	buttonAnswer3.y = _H*0.8
elseif (answerPosition3 == 2) then
	buttonAnswer3.x = _W*0.85
	buttonAnswer3.y = _H*0.6
elseif (buttonPosition3 == 3) then
	buttonAnswer3.x = _W*0.667
	buttonAnswer3.y = _H*0.4
end

groupVAnear:insert(buttonAnswer3)

end

local function Question2 ()

-- Display Question 2

local randomQuestion2 = math.random(1,4)

-- remove previous test question
testQuestion1.isVisible = false
-- set up next test question
local filenameQuestion2 = VAnearImageArray[2][randomQuestion2]
testQuestion2opt = {
	text = filenameQuestion2,
	font = font2,
	fontSize = 32

}
testQuestion2 = display.newText(testQuestion2opt)
testQuestion2.anchorX = 0; testQuestion2.anchorY = 0
testQuestion2.x = (_W*0.5 - testQuestion2.width)*0.5
testQuestion2.y = (_H-testQuestion2.height)*0.6
testQuestion2:setFillColor(0, 0, 0)
local answerPosition2 = math.random(1,3)
groupVAnear:insert(testQuestion2)

local function buttonWrong2Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question3()
	end
end

local buttonWrong2 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.4,
	width = 256,
	height = 100,
	label = "Z",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonWrong2Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition2 == 1) then 
	buttonWrong2.x = _W*0.667
	buttonWrong2.y = _H*0.4
elseif (answerPosition2 == 2) then
	buttonWrong2.x = _W*0.667
	buttonWrong2.y = _H*0.8
elseif (buttonWrong2 == 3) then
	buttonWrong2.x = _W*0.85
	buttonWrong2.y = _H*0.6
end
groupVAnear:insert(buttonWrong2)


local function buttonNothing2Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question3()
	end
end

local buttonNothing2 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.6,
	width = 256,
	height = 100,
	label = "UNSURE",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 50,
	font = font2,
	onEvent = buttonNothing2Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition2 == 1) then 
	buttonNothing2.x = _W*0.85
	buttonNothing2.y = _H*0.6
elseif (answerPosition2 == 2) then
	buttonNothing2.x = _W*0.667
	buttonNothing2.y = _H*0.4
elseif (buttonPosition2 == 3) then
	buttonNothing2.x = _W*0.667
	buttonNothing2.y = _H*0.8
end

groupVAnear:insert(buttonNothing2)

local function buttonAnswer2Press (event)
	if (event.phase == "ended") then
		VAnearcorrectAnswerCount = VAnearcorrectAnswerCount + 1
		VAnearquestionCount = VAnearquestionCount + 1
		Question3()
	end
end


local buttonAnswer2 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VAnearTextArray[2][randomQuestion2],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 40,
	font = font2,
	onEvent = buttonAnswer2Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition2 == 1) then 
	buttonAnswer2.x = _W*0.667
	buttonAnswer2.y = _H*0.8
elseif (answerPosition2 == 2) then
	buttonAnswer2.x = _W*0.85
	buttonAnswer2.y = _H*0.6
elseif (buttonPosition2 == 3) then
	buttonAnswer2.x = _W*0.667
	buttonAnswer2.y = _H*0.4
end

groupVAnear:insert(buttonAnswer2)



end

-- Display Question 1

local randomQuestion1 = math.random(1,4)

local filenameQuestion1 = VAnearImageArray[1][randomQuestion1]
testQuestion1opt = {
	text = filenameQuestion1,
	font = font2,
	fontSize = 40

}
testQuestion1 = display.newText(testQuestion1opt)
testQuestion1.anchorX = 0; testQuestion1.anchorY = 0
testQuestion1.x = (_W*0.5 - testQuestion1.width)*0.5
testQuestion1.y = (_H-testQuestion1.height)*0.6
testQuestion1:setFillColor(0, 0, 0)
local answerPosition1 = math.random(1,3)
groupVAnear:insert(testQuestion1)

local function buttonWrong1Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question2()
	end
end

local buttonWrong1 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.4,
	width = 256,
	height = 100,
	label = "T",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 48,
	font = font2,
	onEvent = buttonWrong1Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition1 == 1) then 
	buttonWrong1.x = _W*0.667
	buttonWrong1.y = _H*0.4
elseif (answerPosition1 == 2) then
	buttonWrong1.x = _W*0.667
	buttonWrong1.y = _H*0.8
elseif (buttonWrong1 == 3) then
	buttonWrong1.x = _W*0.85
	buttonWrong1.y = _H*0.6
end
groupVAnear:insert(buttonWrong1)


local function buttonNothing1Press (event)
	if (event.phase == "ended") then
		
		VAnearquestionCount = VAnearquestionCount + 1
		Question2()
	end
end

local buttonNothing1 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.6,
	width = 256,
	height = 100,
	label = "UNSURE",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 50,
	font = font2,
	onEvent = buttonNothing1Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition1 == 1) then 
	buttonNothing1.x = _W*0.85
	buttonNothing1.y = _H*0.6
elseif (answerPosition1 == 2) then
	buttonNothing1.x = _W*0.667
	buttonNothing1.y = _H*0.4
elseif (buttonPosition1 == 3) then
	buttonNothing1.x = _W*0.667
	buttonNothing1.y = _H*0.8
end

groupVAnear:insert(buttonNothing1)

local function buttonAnswer1Press (event)
	if (event.phase == "ended") then
		VAnearcorrectAnswerCount = VAnearcorrectAnswerCount + 1
		VAnearquestionCount = VAnearquestionCount + 1
		Question2()
	end
end


local buttonAnswer1 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VAnearTextArray[1][randomQuestion1],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 60,
	font = font2,
	onEvent = buttonAnswer1Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition1 == 1) then 
	buttonAnswer1.x = _W*0.667
	buttonAnswer1.y = _H*0.8
elseif (answerPosition1 == 2) then
	buttonAnswer1.x = _W*0.85
	buttonAnswer1.y = _H*0.6
elseif (buttonPosition1 == 3) then
	buttonAnswer1.x = _W*0.667
	buttonAnswer1.y = _H*0.4
end

groupVAnear:insert(buttonAnswer1)

end

coverYourRightEyeVAnear = display.newImage("CoverYourRightEye.png")
coverYourRightEyeVAnear.width = 256
coverYourRightEyeVAnear.height = 256
coverYourRightEyeVAnear.anchorX = 0.5
coverYourRightEyeVAnear.anchorY = 0.5
coverYourRightEyeVAnear.x = _W*0.5
coverYourRightEyeVAnear.y = _H*0.5
coverYourRightEyeVAnearText = display.newText("Cover Your Right Eye",0,0,Gothic,50)
coverYourRightEyeVAnearText.anchorX = 0.5
coverYourRightEyeVAnearText.anchorY = 0.5
coverYourRightEyeVAnearText.x = _W*0.5
coverYourRightEyeVAnearText.y = _H*0.2
coverYourRightEyeVAnearText:setFillColor(1,0,0)
groupVAnear:insert(coverYourRightEyeVAnear)
groupVAnear:insert(coverYourRightEyeVAnearText)
RightVAnearTimer = timer.performWithDelay(3000,VAQuestionsnear,1)

end

function scene:enterScene(event)
	storyboard.purgeScene("EyeTests")
	storyboard.purgeScene("VisualAcuity")

end

function scene:exitScene(event)
	
end



scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene 
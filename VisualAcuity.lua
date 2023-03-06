display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight

function scene:createScene(event)
	
	VACount = 0
	groupVA = self.view
	font1 = "Wensleydale Gothic NBP"
	font2 = "Capitals"

	VAImageArray = {
		{"C","E","L","N"},
		{"P","T","K","R"},
		{"N","D","O","Z"},
		{"U","F","T","P"},
		{"O","E","N","T"},
	}

	VATextArray = {
		{"C","E","L","N"},
		{"P","T","K","R"},
		{"N","D","O","Z"},
		{"U","F","T","P"},
		{"O","E","N","T"},
	}


math.randomseed(os.time())



local function BacktoEyeTestsMenuVA (event)
	if (event.phase == "ended") then
		storyboard.gotoScene("NearVisionTest", {effect = "crossFade", time = 300})
	end

end


local function DisplayResultsVA ()

	DisplayResultsPanelVA = display.newImage("Result_Display.png")
    DisplayResultsPanelVA.width = _W * 0.9
    DisplayResultsPanelVA.height = _H*0.9
	DisplayResultsPanelVA.anchorX = 0.5
	DisplayResultsPanelVA.anchorY = 0.5
	DisplayResultsPanelVA.x = _W*0.5
	DisplayResultsPanelVA.y = _H*0.5
	groupVA:insert(DisplayResultsPanelVA)
	
	if (Result1 == 5) then
		displayResultsTextVA1 = "Your left eye vision is 20/20. You have perfect left eye sight."
	elseif (Result1 == 4) then
		displayResultsTextVA1 = "Your left eye vision is 20/40. Consult an optician to correct your left vision."
	elseif (Result1 == 3) then
		displayResultsTextVA1 = "Your left eye vision is 20/60. Consult an optician to correct your left vision"
	elseif (Result1 == 2) then
		displayResultsTextVA1 = "Your left eye vision is 20/80. Consult an optician to correct your left vision."
	elseif (Result1 == 1) then
		displayResultsTextVA1 = "Your left eye vision is 20/100. You must consult an optician to correct your left vision immediately."
	elseif (Result1 == 0) then
		displayResultsTextVA1 = "Your left eye vision is 20/200. You must consult an optician to correct your left vision immediately."
	end


	if (Result2 == 5) then
		displayResultsTextVA2 = "Your right eye vision is 20/20. You have perfect right eye sight."
	elseif (Result2 == 4) then
		displayResultsTextVA2 = "Your right eye vision is 20/40. Consult an optician to correct your right vision."
	elseif (Result2 == 3) then
		displayResultsTextVA2 = "Your right eye vision is 20/60. Consult an optician to correct your right vision."
	elseif (Result2 == 2) then
		displayResultsTextVA2 = "Your right eye vision is 20/80. Consult an optician to correct your right vision."
	elseif (Result2 == 1) then
		displayResultsTextVA2 = "Your right eye vision is 20/100. You must consult an optician to correct your right vision immediately."
	elseif (Result2 == 0) then
		displayResultsTextVA2 = "Your right eye vision is 20/200. You must consult an optician to correct your right vision immediately."
	end

	displayResultsTextVA = displayResultsTextVA1.." "..displayResultsTextVA2

	displayResultsVAOpt = {

		text = displayResultsTextVA,
		x = _W/4.9,
		y = _H*0.3,
		width = 700,
		height = 500,
		font = system.nativeFont,
		fontSize = 35
	}
	
	displayResultsVA = display.newText (displayResultsVAOpt)
	displayResultsVA.anchorX = 0
	displayResultsVA.anchorY = 0
	displayResultsVA:setFillColor(0,0,0)
	displayResultsVA:toFront()
	groupVA:insert(displayResultsVA)

	local displayResultsNextVA = display.newText("Click to proceed to Near Vision Test",_W*0.5,_H*0.79,system.nativeFont,30)
	displayResultsNextVA:setFillColor(0,200/255,1)
	groupVA:insert(displayResultsNextVA)

	DisplayResultsPanelVA:addEventListener("touch",BacktoEyeTestsMenuVA)
	


end

function CoverLeftEye()

-- Black background
backgroundVAB = display.newRect(0,0,_W,_H)
backgroundVAB.anchorX = 0 
backgroundVAB.anchorY = 0
backgroundVAB:setFillColor(0,0,0)
groupVA:insert(backgroundVAB)

coverYourLeftEyeVAFar = display.newImage("CoverYourLeftEye.png")
coverYourLeftEyeVAFar.width = 256
coverYourLeftEyeVAFar.height = 256
coverYourLeftEyeVAFar.anchorX = 0.5
coverYourLeftEyeVAFar.anchorY = 0.5
coverYourLeftEyeVAFar.x = _W*0.5
coverYourLeftEyeVAFar.y = _H*0.5
coverYourLeftEyeVAFarText = display.newText("Cover Your Left Eye",0,0,Gothic,50)
coverYourLeftEyeVAFarText.anchorX = 0.5
coverYourLeftEyeVAFarText.anchorY = 0.5
coverYourLeftEyeVAFarText.x = _W*0.5
coverYourLeftEyeVAFarText.y = _H*0.2
coverYourLeftEyeVAFarText:setFillColor(1,0,0)
groupVA:insert(coverYourLeftEyeVAFar)
groupVA:insert(coverYourLeftEyeVAFarText)
LeftVATimer = timer.performWithDelay(2000,VAQuestionsFar,1)

end


function VAQuestionsFar()
VAquestionCount = 0
VAcorrectAnswerCount = 0
VACount = VACount + 1
-- White background
backgroundVA = display.newRect(0,0,_W,_H)
backgroundVA.anchorX = 0 
backgroundVA.anchorY = 0
backgroundVA:setFillColor(1,1,1)
groupVA:insert(backgroundVA)

-- right answer Box
VABackground = display.newImageRect("Myopia_Hyperopia_Background.png",_W*0.5,_H)
VABackground.anchorX = 0
VABackground.anchorY = 0
VABackground.x = _W/2
VABackground.y = 0
--ColourBlindBackground:scale(1,1.03)
groupVA:insert(VABackground)

-- left question box
VABackground2 = display.newImageRect("Myopia_Hyperopia_Background_2.png",_W*0.5,_H)
VABackground2.anchorX = 0
VABackground2.anchorY = 0
VABackground2.x = 0
VABackground2.y = 0
--ColourBlindBackground2:scale(1,1.03)
groupVA:insert(VABackground2)

-- question
QuestionTitleVA = display.newImage("What_Do_You_See?.png")
QuestionTitleVA:scale(1.5,1.5)
QuestionTitleVA.anchorX = 0
QuestionTitleVA.anchorY = 0
QuestionTitleVA.x = _W/11
QuestionTitleVA.y = _H/16
QuestionTitleVA.alpha = 0.7
groupVA:insert(QuestionTitleVA)

StartOfAnswerVA2 = display.newText("Far Vision Eye Test",_W*0.25,_H*0.05,native.nativeFontBold,35)
StartOfAnswerVA2:setFillColor(1, 0, 0)
StartOfAnswerVA2.anchorX = 0.5
StartOfAnswerVA2.anchorY = 0
StartOfAnswerVA2.x = _W*0.25
groupVA:insert(StartOfAnswerVA2)

StartOfAnswerVA = display.newText("Kindly place device 1.5m away & get an assistance for the test. \nI can see: ",_W*0.53,_H/15,_W*0.43,100,native.nativeFontBold,25)
StartOfAnswerVA.anchorX = 0
StartOfAnswerVA.anchorY = 0
groupVA:insert(StartOfAnswerVA)

local function Question5 ()
-- Display Question 5

local randomQuestion5 = math.random(1,4)
-- remove previous test question
testQuestion4.alpha = 0
-- set up next test question
local filenameQuestion5 = VAImageArray[5][randomQuestion5]
testQuestion5opt = {
	text = filenameQuestion5,
	font = font2,
	fontSize = 12

}
testQuestion5 = display.newText(testQuestion5opt)
testQuestion5.anchorX = 0; testQuestion5.anchorY = 0
testQuestion5.x = (_W*0.5 - testQuestion5.width)*0.5
testQuestion5.y = (_H-testQuestion5.height)*0.6
testQuestion5:setFillColor(0, 0, 0)
local answerPosition5 = math.random(1,3)
groupVA:insert(testQuestion5)

local function buttonWrong5Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1

		if (VACount == 1) then 
			Result1 = VAcorrectAnswerCount
			CoverLeftEye()
			
		elseif (VACount == 2) then
			Result2 = VAcorrectAnswerCount
			DisplayResultsVA()
			
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
groupVA:insert(buttonWrong5)


local function buttonNothing5Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
		if (VACount == 1) then 
			Result1 = VAcorrectAnswerCount
			CoverLeftEye()
		elseif (VACount == 2) then
			Result2 = VAcorrectAnswerCount
			DisplayResultsVA()
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

groupVA:insert(buttonNothing5)

local function buttonAnswer5Press (event)
	if (event.phase == "ended") then
		VAcorrectAnswerCount = VAcorrectAnswerCount + 1
		VAquestionCount = VAquestionCount + 1
		
		if (VACount == 1) then 
			Result1 = VAcorrectAnswerCount
			CoverLeftEye()
		elseif (VACount == 2) then
			Result2 = VAcorrectAnswerCount
			DisplayResultsVA()
		end
	end
end


buttonAnswer5 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VATextArray[5][randomQuestion5],
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

groupVA:insert(buttonAnswer5)

end


local function Question4 ()
-- Display Question 4

local randomQuestion4 = math.random(1,4)
-- remove previous test question
testQuestion3.alpha = 0
-- set up next test question
local filenameQuestion4 = VAImageArray[4][randomQuestion4]
testQuestion4opt = {
	text = filenameQuestion4,
	font = font2,
	fontSize = 24

}
testQuestion4 = display.newText(testQuestion4opt)
testQuestion4.anchorX = 0; testQuestion4.anchorY = 0
testQuestion4.x = (_W*0.5 - testQuestion4.width)*0.5
testQuestion4.y = (_H-testQuestion4.height)*0.6
testQuestion4:setFillColor(0, 0, 0)
local answerPosition4 = math.random(1,3)
groupVA:insert(testQuestion4)

local function buttonWrong4Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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
groupVA:insert(buttonWrong4)


local function buttonNothing4Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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

groupVA:insert(buttonNothing4)

local function buttonAnswer4Press (event)
	if (event.phase == "ended") then
		VAcorrectAnswerCount = VAcorrectAnswerCount + 1
		VAquestionCount = VAquestionCount + 1
		Question5()
	end
end


buttonAnswer4 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VATextArray[4][randomQuestion4],
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

groupVA:insert(buttonAnswer4)

end


local function Question3 ()
-- Display Question 3
local randomQuestion3 = math.random(1,4)
-- remove previous test question
testQuestion2.alpha = 0
-- set up next test question
local filenameQuestion3 = VAImageArray[3][randomQuestion3]

testQuestion3opt = {
	text = filenameQuestion3,
	font = font2,
	fontSize = 36

}
testQuestion3 = display.newText(testQuestion3opt)
testQuestion3.anchorX = 0; testQuestion3.anchorY = 0
testQuestion3.x = (_W*0.5 - testQuestion3.width)*0.5
testQuestion3.y = (_H-testQuestion3.height)*0.6
testQuestion3:setFillColor(0, 0, 0)

local answerPosition3 = math.random(1,3)
groupVA:insert(testQuestion3)

local function buttonWrong3Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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
groupVA:insert(buttonWrong3)


local function buttonNothing3Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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

groupVA:insert(buttonNothing3)

local function buttonAnswer3Press (event)
	if (event.phase == "ended") then
		VAcorrectAnswerCount = VAcorrectAnswerCount + 1
		VAquestionCount = VAquestionCount + 1
		Question4()
	end
end


local buttonAnswer3 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VATextArray[3][randomQuestion3],
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

groupVA:insert(buttonAnswer3)

end

local function Question2 ()

-- Display Question 2

local randomQuestion2 = math.random(1,4)

-- remove previous test question
testQuestion1.isVisible = false
-- set up next test question
local filenameQuestion2 = VAImageArray[2][randomQuestion2]
testQuestion2opt = {
	text = filenameQuestion2,
	font = font2,
	fontSize = 36

}
testQuestion2 = display.newText(testQuestion2opt)
testQuestion2.anchorX = 0; testQuestion2.anchorY = 0
testQuestion2.x = (_W*0.5 - testQuestion2.width)*0.5
testQuestion2.y = (_H-testQuestion2.height)*0.6
testQuestion2:setFillColor(0, 0, 0)
local answerPosition2 = math.random(1,3)
groupVA:insert(testQuestion2)

local function buttonWrong2Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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
groupVA:insert(buttonWrong2)


local function buttonNothing2Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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

groupVA:insert(buttonNothing2)

local function buttonAnswer2Press (event)
	if (event.phase == "ended") then
		VAcorrectAnswerCount = VAcorrectAnswerCount + 1
		VAquestionCount = VAquestionCount + 1
		Question3()
	end
end


local buttonAnswer2 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VATextArray[2][randomQuestion2],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 48,
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

groupVA:insert(buttonAnswer2)



end

-- Display Question 1

local randomQuestion1 = math.random(1,4)

local filenameQuestion1 = VAImageArray[1][randomQuestion1]
testQuestion1opt = {
	text = filenameQuestion1,
	font = font2,
	fontSize = 60

}
testQuestion1 = display.newText(testQuestion1opt)
testQuestion1.anchorX = 0; testQuestion1.anchorY = 0
--testQuestion1.width = 100
--testQuestion1.height = 100
testQuestion1.x = (_W*0.5 - testQuestion1.width)*0.5
testQuestion1.y = (_H-testQuestion1.height)*0.6
testQuestion1:setFillColor(0, 0, 0)
local answerPosition1 = math.random(1,3)
groupVA:insert(testQuestion1)

local function buttonWrong1Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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
	fontSize = 60,
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
groupVA:insert(buttonWrong1)


local function buttonNothing1Press (event)
	if (event.phase == "ended") then
		
		VAquestionCount = VAquestionCount + 1
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

groupVA:insert(buttonNothing1)

local function buttonAnswer1Press (event)
	if (event.phase == "ended") then
		VAcorrectAnswerCount = VAcorrectAnswerCount + 1
		VAquestionCount = VAquestionCount + 1
		Question2()
	end
end


local buttonAnswer1 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 100,
	label = VATextArray[1][randomQuestion1],
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

groupVA:insert(buttonAnswer1)

end

coverYourRightEyeVAFar = display.newImage("CoverYourRightEye.png")
coverYourRightEyeVAFar.width = 256
coverYourRightEyeVAFar.height = 256
coverYourRightEyeVAFar.anchorX = 0.5
coverYourRightEyeVAFar.anchorY = 0.5
coverYourRightEyeVAFar.x = _W*0.5
coverYourRightEyeVAFar.y = _H*0.5
coverYourRightEyeVAFarText = display.newText("Cover Your Right Eye",0,0,Gothic,50)
coverYourRightEyeVAFarText.anchorX = 0.5
coverYourRightEyeVAFarText.anchorY = 0.5
coverYourRightEyeVAFarText.x = _W*0.5
coverYourRightEyeVAFarText.y = _H*0.2
coverYourRightEyeVAFarText:setFillColor(1,0,0)
groupVA:insert(coverYourRightEyeVAFar)
groupVA:insert(coverYourRightEyeVAFarText)
RightVATimer = timer.performWithDelay(3000,VAQuestionsFar,1)

end

function scene:enterScene(event)
	storyboard.purgeScene("EyeTests")
	storyboard.purgeScene("NearVisionTest")

end

function scene:exitScene(event)
	
end



scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene 

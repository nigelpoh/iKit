display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight

function scene:createScene(event)
	questionCount = 0
	correctAnswerCount = 0
	groupContrast = self.view
	font1 = "Wensleydale Gothic NBP"
	font2 = "Capitals"

	local ImageArray = {
		{"Rocket100.png","Star100.png","Duck100.png","House100.png"},
		{"Rocket20.png","Star20.png","Duck20.png","House20.png"},
		{"Rocket10.png","Star10.png","Duck10.png","House10.png"},
		{"Rocket5.png","Star5.png","Duck5.png","House5.png"},
		{"Rocket2.png","Star2.png","Duck2.png","House2.png"},
	}

	local TextArray = {
		{"Rocket","Star","Duck","House"},
		{"Rocket","Star","Duck","House"},
		{"Rocket","Star","Duck","House"},
		{"Rocket","Star","Duck","House"},
		{"Rocket","Star","Duck","House"}
	}


math.randomseed(os.time())

-- White background
local backgroundContrast = display.newRect(0,0,_W,_H)
backgroundContrast.anchorX = 0 
backgroundContrast.anchorY = 0
backgroundContrast:setFillColor(1,1,1)
groupContrast:insert(backgroundContrast)

-- right answer Box
local ContrastBackground = display.newImageRect("Myopia_Hyperopia_Background.png",_W*0.5,_H)
ContrastBackground.anchorX = 0
ContrastBackground.anchorY = 0
ContrastBackground.x = _W/2
ContrastBackground.y = 0
--ColourBlindBackground:scale(1,1.03)
groupContrast:insert(ContrastBackground)

-- left question box
local ContrastBackground2 = display.newImageRect("Myopia_Hyperopia_Background_2.png",_W*0.5,_H)
ContrastBackground2.anchorX = 0
ContrastBackground2.anchorY = 0
ContrastBackground2.x = 0
ContrastBackground2.y = 0
--ColourBlindBackground2:scale(1,1.03)
groupContrast:insert(ContrastBackground2)

-- question
local QuestionTitleContrast = display.newImage("What_Do_You_See?.png")
QuestionTitleContrast:scale(1.5,1.5)
QuestionTitleContrast.anchorX = 0
QuestionTitleContrast.anchorY = 0
QuestionTitleContrast.x = _W/11
QuestionTitleContrast.y = _H/20
QuestionTitleContrast.alpha = 0.7
groupContrast:insert(QuestionTitleContrast)

local StartOfAnswerContrast = display.newText("I can see: ",_W*0.55,_H/15,native.nativeFontBold,30)
StartOfAnswerContrast.anchorX = 0
StartOfAnswerContrast.anchorY = 0
groupContrast:insert(StartOfAnswerContrast)

local function BacktoEyeTestsMenuCS (event)
	if (event.phase == "ended") then
		storyboard.gotoScene("EyeTests", {effect = "crossFade", time = 300})
	end

end


local function DisplayResultsCS ()

	local DisplayResultsPanelCS = display.newImage("Result_Display.png")
    DisplayResultsPanelCS.width = _W * 0.9
    DisplayResultsPanelCS.height = _H*0.9
	DisplayResultsPanelCS.anchorX = 0.5
	DisplayResultsPanelCS.anchorY = 0.5
	DisplayResultsPanelCS.x = _W*0.5
	DisplayResultsPanelCS.y = _H*0.5
	groupContrast:insert(DisplayResultsPanelCS)
	
	if (correctAnswerCount == 5) then
		displayResultsTextCS = "You have good contrast sensitivity."
	elseif (correctAnswerCount == 4) then
		displayResultsTextCS = "You have slightly low contrast sensitivity. This can be a symptom of certain eye conditions or diseases such as cataracts, glaucoma or diabetic retinopathy. It is advisable for you to consult your eyecare specialist."
	elseif (correctAnswerCount < 4) then
		displayResultsTextCS = "You have low contrast sensitivity. This can be a symptom of certain eye conditions or diseases such as cataracts, glaucoma or diabetic retinopathy. It is advisable for you to consult your eyecare specialist."
	end

	displayResultsCSOpt = {

		text = displayResultsTextCS,
		x = _W/4.9,
		y = _H*0.3,
		width = 700,
		height = 500,
		font = system.nativeFont,
		fontSize = 35
	}
	
	displayResultsCS = display.newText (displayResultsCSOpt)
	displayResultsCS.anchorX = 0
	displayResultsCS.anchorY = 0
	displayResultsCS:setFillColor(0,0,0)
	displayResultsCS:toFront()
	groupContrast:insert(displayResultsCS)

	local displayResultsNextCS = display.newText("Click to return to Eye Tests Menu",_W*0.5,_H*0.79,system.nativeFont,30)
	displayResultsNextCS:setFillColor(0,200/255,1)
	groupContrast:insert(displayResultsNextCS)

	DisplayResultsPanelCS:addEventListener("touch",BacktoEyeTestsMenuCS)
	


end

local function Question5 ()
-- Display Question 5

local randomQuestion5 = math.random(1,4)
-- remove previous test question
testQuestion4.alpha = 0
-- set up next test question
local filenameQuestion5 = ImageArray[5][randomQuestion5]
testQuestion5 = display.newImage(filenameQuestion5)
testQuestion5.anchorX = 0; testQuestion5.anchorY = 0
testQuestion5.width = 100
testQuestion5.height = 100
testQuestion5.x = (_W*0.5 - testQuestion5.width)*0.5
testQuestion5.y = (_H-testQuestion5.height)*0.6
local answerPosition5 = math.random(1,3)
groupContrast:insert(testQuestion5)

local function buttonWrong5Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		DisplayResultsCS()
	end
end

local buttonWrong5 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "Cat",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonWrong5Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition5 == 1) then 
	buttonWrong5.x = _W*0.667
	buttonWrong5.y = _H*0.3
elseif (answerPosition5 == 2) then
	buttonWrong5.x = _W*0.667
	buttonWrong5.y = _H*0.8
elseif (buttonWrong5 == 3) then
	buttonWrong5.x = _W*0.85
	buttonWrong5.y = _H*0.55
end
groupContrast:insert(buttonWrong5)


local function buttonNothing5Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		DisplayResultsCS()
	end
end

local buttonNothing5 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.55,
	width = 256,
	height = 138,
	label = "Nothing",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonNothing5Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition5 == 1) then 
	buttonNothing5.x = _W*0.85
	buttonNothing5.y = _H*0.55
elseif (answerPosition5 == 2) then
	buttonNothing5.x = _W*0.667
	buttonNothing5.y = _H*0.3
elseif (buttonPosition5 == 3) then
	buttonNothing5.x = _W*0.667
	buttonNothing5.y = _H*0.8
end

groupContrast:insert(buttonNothing5)

local function buttonAnswer5Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		DisplayResultsCS()
	end
end


buttonAnswer5 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 138,
	label = TextArray[5][randomQuestion5],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonAnswer5Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition5 == 1) then 
	buttonAnswer5.x = _W*0.667
	buttonAnswer5.y = _H*0.8
elseif (answerPosition5 == 2) then
	buttonAnswer5.x = _W*0.85
	buttonAnswer5.y = _H*0.55
elseif (buttonPosition5 == 3) then
	buttonAnswer5.x = _W*0.667
	buttonAnswer5.y = _H*0.3
end

groupContrast:insert(buttonAnswer5)

end


local function Question4 ()
-- Display Question 4

local randomQuestion4 = math.random(1,4)
-- remove previous test question
testQuestion3.alpha = 0
-- set up next test question
local filenameQuestion4 = ImageArray[4][randomQuestion4]
testQuestion4 = display.newImage(filenameQuestion4)
testQuestion4.anchorX = 0; testQuestion4.anchorY = 0
testQuestion4.width = 100
testQuestion4.height = 100
testQuestion4.x = (_W*0.5 - testQuestion4.width)*0.5
testQuestion4.y = (_H-testQuestion4.height)*0.6
local answerPosition4 = math.random(1,3)
groupContrast:insert(testQuestion4)

local function buttonWrong4Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question5()
	end
end

local buttonWrong4 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "Cat",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonWrong4Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition4 == 1) then 
	buttonWrong4.x = _W*0.667
	buttonWrong4.y = _H*0.3
elseif (answerPosition4 == 2) then
	buttonWrong4.x = _W*0.667
	buttonWrong4.y = _H*0.8
elseif (buttonWrong4 == 3) then
	buttonWrong4.x = _W*0.85
	buttonWrong4.y = _H*0.55
end
groupContrast:insert(buttonWrong4)


local function buttonNothing4Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question5()
	end
end

local buttonNothing4 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.55,
	width = 256,
	height = 138,
	label = "Nothing",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonNothing4Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition4 == 1) then 
	buttonNothing4.x = _W*0.85
	buttonNothing4.y = _H*0.55
elseif (answerPosition4 == 2) then
	buttonNothing4.x = _W*0.667
	buttonNothing4.y = _H*0.3
elseif (buttonPosition4 == 3) then
	buttonNothing4.x = _W*0.667
	buttonNothing4.y = _H*0.8
end

groupContrast:insert(buttonNothing4)

local function buttonAnswer4Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		Question5()
	end
end


buttonAnswer4 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 138,
	label = TextArray[4][randomQuestion4],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonAnswer4Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition4 == 1) then 
	buttonAnswer4.x = _W*0.667
	buttonAnswer4.y = _H*0.8
elseif (answerPosition4 == 2) then
	buttonAnswer4.x = _W*0.85
	buttonAnswer4.y = _H*0.55
elseif (buttonPosition4 == 3) then
	buttonAnswer4.x = _W*0.667
	buttonAnswer4.y = _H*0.3
end

groupContrast:insert(buttonAnswer4)

end


local function Question3 ()
-- Display Question 3
local randomQuestion3 = math.random(1,4)
-- remove previous test question
testQuestion2.alpha = 0
-- set up next test question
local filenameQuestion3 = ImageArray[3][randomQuestion3]
testQuestion3 = display.newImage(filenameQuestion3)
testQuestion3.anchorX = 0; testQuestion3.anchorY = 0
testQuestion3.width = 100
testQuestion3.height = 100
testQuestion3.x = (_W*0.5 - testQuestion3.width)*0.5
testQuestion3.y = (_H-testQuestion3.height)*0.6
local answerPosition3 = math.random(1,3)
groupContrast:insert(testQuestion3)

local function buttonWrong3Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question4()
	end
end

local buttonWrong3 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "Bicycle",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonWrong3Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition3 == 1) then 
	buttonWrong3.x = _W*0.667
	buttonWrong3.y = _H*0.3
elseif (answerPosition3 == 2) then
	buttonWrong3.x = _W*0.667
	buttonWrong3.y = _H*0.8
elseif (buttonWrong3 == 3) then
	buttonWrong3.x = _W*0.85
	buttonWrong3.y = _H*0.55
end
groupContrast:insert(buttonWrong3)


local function buttonNothing3Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question4()
	end
end

local buttonNothing3 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.55,
	width = 256,
	height = 138,
	label = "Nothing",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonNothing3Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition3 == 1) then 
	buttonNothing3.x = _W*0.85
	buttonNothing3.y = _H*0.55
elseif (answerPosition3 == 2) then
	buttonNothing3.x = _W*0.667
	buttonNothing3.y = _H*0.3
elseif (buttonPosition3 == 3) then
	buttonNothing3.x = _W*0.667
	buttonNothing3.y = _H*0.8
end

groupContrast:insert(buttonNothing3)

local function buttonAnswer3Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		Question4()
	end
end


local buttonAnswer3 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 138,
	label = TextArray[3][randomQuestion3],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonAnswer3Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition3 == 1) then 
	buttonAnswer3.x = _W*0.667
	buttonAnswer3.y = _H*0.8
elseif (answerPosition3 == 2) then
	buttonAnswer3.x = _W*0.85
	buttonAnswer3.y = _H*0.55
elseif (buttonPosition3 == 3) then
	buttonAnswer3.x = _W*0.667
	buttonAnswer3.y = _H*0.3
end

groupContrast:insert(buttonAnswer3)

end

local function Question2 ()

-- Display Question 2

local randomQuestion2 = math.random(1,4)

-- remove previous test question
testQuestion1.isVisible = false
-- set up next test question
local filenameQuestion2 = ImageArray[2][randomQuestion2]
testQuestion2 = display.newImage(filenameQuestion2)
testQuestion2.anchorX = 0; testQuestion2.anchorY = 0
testQuestion2.width = 100
testQuestion2.height = 100
testQuestion2.x = (_W*0.5 - testQuestion2.width)*0.5
testQuestion2.y = (_H-testQuestion2.height)*0.6
local answerPosition2 = math.random(1,3)
groupContrast:insert(testQuestion2)

local function buttonWrong2Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question3()
	end
end

local buttonWrong2 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "Car",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonWrong2Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition2 == 1) then 
	buttonWrong2.x = _W*0.667
	buttonWrong2.y = _H*0.3
elseif (answerPosition2 == 2) then
	buttonWrong2.x = _W*0.667
	buttonWrong2.y = _H*0.8
elseif (buttonWrong2 == 3) then
	buttonWrong2.x = _W*0.85
	buttonWrong2.y = _H*0.55
end
groupContrast:insert(buttonWrong2)


local function buttonNothing2Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question3()
	end
end

local buttonNothing2 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.55,
	width = 256,
	height = 138,
	label = "Nothing",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonNothing2Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition2 == 1) then 
	buttonNothing2.x = _W*0.85
	buttonNothing2.y = _H*0.55
elseif (answerPosition2 == 2) then
	buttonNothing2.x = _W*0.667
	buttonNothing2.y = _H*0.3
elseif (buttonPosition2 == 3) then
	buttonNothing2.x = _W*0.667
	buttonNothing2.y = _H*0.8
end

groupContrast:insert(buttonNothing2)

local function buttonAnswer2Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		Question3()
	end
end


local buttonAnswer2 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 138,
	label = TextArray[2][randomQuestion2],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonAnswer2Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition2 == 1) then 
	buttonAnswer2.x = _W*0.667
	buttonAnswer2.y = _H*0.8
elseif (answerPosition2 == 2) then
	buttonAnswer2.x = _W*0.85
	buttonAnswer2.y = _H*0.55
elseif (buttonPosition2 == 3) then
	buttonAnswer2.x = _W*0.667
	buttonAnswer2.y = _H*0.3
end

groupContrast:insert(buttonAnswer2)



end

-- Display Question 1

local randomQuestion1 = math.random(1,4)

local filenameQuestion1 = ImageArray[1][randomQuestion1]
testQuestion1 = display.newImage(filenameQuestion1)
testQuestion1.anchorX = 0; testQuestion1.anchorY = 0
testQuestion1.width = 100
testQuestion1.height = 100
testQuestion1.x = (_W*0.5 - testQuestion1.width)*0.5
testQuestion1.y = (_H-testQuestion1.height)*0.6
local answerPosition1 = math.random(1,3)
groupContrast:insert(testQuestion1)

local function buttonWrong1Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question2()
	end
end

local buttonWrong1 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "Ball",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonWrong1Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition1 == 1) then 
	buttonWrong1.x = _W*0.667
	buttonWrong1.y = _H*0.3
elseif (answerPosition1 == 2) then
	buttonWrong1.x = _W*0.667
	buttonWrong1.y = _H*0.8
elseif (buttonWrong1 == 3) then
	buttonWrong1.x = _W*0.85
	buttonWrong1.y = _H*0.55
end
groupContrast:insert(buttonWrong1)


local function buttonNothing1Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question2()
	end
end

local buttonNothing1 = widget.newButton{
	
	x = _W*0.85,
	y = _H*0.55,
	width = 256,
	height = 138,
	label = "Nothing",
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonNothing1Press,
	defaultFile = "Green_Button.png",
	
	
}
if (answerPosition1 == 1) then 
	buttonNothing1.x = _W*0.85
	buttonNothing1.y = _H*0.55
elseif (answerPosition1 == 2) then
	buttonNothing1.x = _W*0.667
	buttonNothing1.y = _H*0.3
elseif (buttonPosition1 == 3) then
	buttonNothing1.x = _W*0.667
	buttonNothing1.y = _H*0.8
end

groupContrast:insert(buttonNothing1)

local function buttonAnswer1Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		Question2()
	end
end


local buttonAnswer1 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.8,
	width = 256,
	height = 138,
	label = TextArray[1][randomQuestion1],
	labelColor = { default={ 0, 0, 0 }, over={ 0, 0, 0 } },
	fontSize = 70,
	font = font1,
	onEvent = buttonAnswer1Press,
	defaultFile = "Green_Button.png",
	
	
}

if (answerPosition1 == 1) then 
	buttonAnswer1.x = _W*0.667
	buttonAnswer1.y = _H*0.8
elseif (answerPosition1 == 2) then
	buttonAnswer1.x = _W*0.85
	buttonAnswer1.y = _H*0.55
elseif (buttonPosition1 == 3) then
	buttonAnswer1.x = _W*0.667
	buttonAnswer1.y = _H*0.3
end

groupContrast:insert(buttonAnswer1)



end

function scene:enterScene(event)
	storyboard.purgeScene("EyeTests")

end

function scene:exitScene(event)
	
end



scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene",scene)
scene:addEventListener("exitScene",scene)

return scene 

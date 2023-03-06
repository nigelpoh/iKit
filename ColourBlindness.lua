display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight

function scene:createScene(event)
	questionCount = 0
	correctAnswerCount = 0
	groupColourBlind = self.view
	font1 = "Wensleydale Gothic NBP"
	font2 = "Capitals"

	ImageArray = {
		{"Ishihara-Plate-2.png","Ishihara-Plate-4.png"},
		{"Ishihara-Plate-6.png","Ishihara-Plate-7.png"},
		{"Ishihara-Plate-9.png","Ishihara-Plate-17.png"},
		{"Ishihara-Plate-11.png","Ishihara-Plate-12.png"}
	}

	TextArray = {
		{"8","29"},
		{"5","3"},
		{"74","73"},
		{"6","97"}
	}


math.randomseed(os.time())

-- White background
local backgroundColourB = display.newRect(0,0,_W,_H)
backgroundColourB.anchorX = 0 
backgroundColourB.anchorY = 0
backgroundColourB:setFillColor(1,1,1)
groupColourBlind:insert(backgroundColourB)

-- right answer Box
local ColourBlindBackground = display.newImageRect("Myopia_Hyperopia_Background.png",_W*0.5,_H)
ColourBlindBackground.anchorX = 0
ColourBlindBackground.anchorY = 0
ColourBlindBackground.x = _W/2
ColourBlindBackground.y = 0
--ColourBlindBackground:scale(1,1.03)
groupColourBlind:insert(ColourBlindBackground)

-- left question box
local ColourBlindBackground2 = display.newImageRect("Myopia_Hyperopia_Background_2.png",_W*0.5,_H)
ColourBlindBackground2.anchorX = 0
ColourBlindBackground2.anchorY = 0
ColourBlindBackground2.x = 0
ColourBlindBackground2.y = 0
--ColourBlindBackground2:scale(1,1.03)
groupColourBlind:insert(ColourBlindBackground2)

-- question
local QuestionTitleColourB = display.newImage("What_Do_You_See?.png")
QuestionTitleColourB:scale(1.5,1.5)
QuestionTitleColourB.anchorX = 0
QuestionTitleColourB.anchorY = 0
QuestionTitleColourB.x = _W/11
QuestionTitleColourB.y = _H/20
QuestionTitleColourB.alpha = 0.7
groupColourBlind:insert(QuestionTitleColourB)

local StartOfAnswerColourB = display.newText("I can see: ",_W*0.55,_H/15,native.nativeFontBold,30)
StartOfAnswerColourB.anchorX = 0
StartOfAnswerColourB.anchorY = 0
groupColourBlind:insert(StartOfAnswerColourB)

function BacktoEyeTestsMenuCB (event)
	if (event.phase == "ended") then
		storyboard.gotoScene("EyeTests", {effect = "crossFade", time = 300})
	end

end


function DisplayResults ()

	local DisplayResultsPanel = display.newImage("Result_Display.png")
    DisplayResultsPanel.width = _W * 0.9
    DisplayResultsPanel.height = _H*0.9
	DisplayResultsPanel.anchorX = 0.5
	DisplayResultsPanel.anchorY = 0.5
	DisplayResultsPanel.x = _W*0.5
	DisplayResultsPanel.y = _H*0.5
	groupColourBlind:insert(DisplayResultsPanel)
	
	if (correctAnswerCount == 4) then
		displayResultsText = "You are NOT red green colour blind."
	elseif (correctAnswerCount == 3 or correctAnswerCount == 2) then
		displayResultsText = "You are mild red green colour blind. This is mainly caused by incorrect curvature of the cornea. It is advisable for you to consult your eyecare specialist."
	elseif (correctAnswerCount < 2) then
		displayResultsText = "You are red green colour blind. This is mainly caused by incorrect curvature of the cornea. It is advisable for you to consult your eyecare specialist."
	end

	displayResultsOpt = {

		text = displayResultsText,
		x = _W/4.9,
		y = _H*0.3,
		width = 700,
		height = 500,
		font = system.nativeFont,
		fontSize = 35
	}
	
	displayResultsCB = display.newText (displayResultsOpt)
	displayResultsCB.anchorX = 0
	displayResultsCB.anchorY = 0
	displayResultsCB:setFillColor(0,0,0)
	displayResultsCB:toFront()
	groupColourBlind:insert(displayResultsCB)

	local displayResultsNext = display.newText("Click to return to Eye Tests Menu",_W*0.5,_H*0.79,system.nativeFont,30)
	displayResultsNext:setFillColor(0,200/255,1)
	groupColourBlind:insert(displayResultsNext)

	DisplayResultsPanel:addEventListener("touch",BacktoEyeTestsMenuCB)
	


end


function Question4 ()
-- Display Question 4

randomQuestion4 = math.random(1,2)

filenameQuestion4 = ImageArray[4][randomQuestion4]
testQuestion4 = display.newImage(filenameQuestion4)
testQuestion4.anchorX = 0; testQuestion4.anchorY = 0
testQuestion4.width = 350
testQuestion4.height = 350
testQuestion4.x = (_W*0.5 - testQuestion4.width)*0.5
testQuestion4.y = (_H-testQuestion4.height)*0.6
answerPosition4 = math.random(1,3)
groupColourBlind:insert(testQuestion4)

function buttonWrong4Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		DisplayResults()
	end
end

buttonWrong4 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "46",
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
groupColourBlind:insert(buttonWrong4)


function buttonNothing4Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		DisplayResults()
	end
end

buttonNothing4 = widget.newButton{
	
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

groupColourBlind:insert(buttonNothing4)

function buttonAnswer4Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		DisplayResults()
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

groupColourBlind:insert(buttonAnswer4)

end


function Question3 ()
-- Display Question 3
randomQuestion3 = math.random(1,2)

filenameQuestion3 = ImageArray[3][randomQuestion3]
testQuestion3 = display.newImage(filenameQuestion3)
testQuestion3.anchorX = 0; testQuestion3.anchorY = 0
testQuestion3.width = 350
testQuestion3.height = 350
testQuestion3.x = (_W*0.5 - testQuestion3.width)*0.5
testQuestion3.y = (_H-testQuestion3.height)*0.6
answerPosition3 = math.random(1,3)
groupColourBlind:insert(testQuestion3)

function buttonWrong3Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question4()
	end
end

buttonWrong3 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "70",
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
groupColourBlind:insert(buttonWrong3)


function buttonNothing3Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question4()
	end
end

buttonNothing3 = widget.newButton{
	
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

groupColourBlind:insert(buttonNothing3)

function buttonAnswer3Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		Question4()
	end
end


buttonAnswer3 = widget.newButton{
	
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

groupColourBlind:insert(buttonAnswer3)

end

function Question2 ()

-- Display Question 2

randomQuestion2 = math.random(1,2)

filenameQuestion2 = ImageArray[2][randomQuestion2]
testQuestion2 = display.newImage(filenameQuestion2)
testQuestion2.anchorX = 0; testQuestion2.anchorY = 0
testQuestion2.width = 350
testQuestion2.height = 350
testQuestion2.x = (_W*0.5 - testQuestion2.width)*0.5
testQuestion2.y = (_H-testQuestion2.height)*0.6
answerPosition2 = math.random(1,3)
groupColourBlind:insert(testQuestion2)

function buttonWrong2Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question3()
	end
end

buttonWrong2 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "9",
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
groupColourBlind:insert(buttonWrong2)


function buttonNothing2Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question3()
	end
end

buttonNothing2 = widget.newButton{
	
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

groupColourBlind:insert(buttonNothing2)

function buttonAnswer2Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		Question3()
	end
end


buttonAnswer2 = widget.newButton{
	
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

groupColourBlind:insert(buttonAnswer2)



end

-- Display Question 1

randomQuestion1 = math.random(1,2)

filenameQuestion1 = ImageArray[1][randomQuestion1]
testQuestion1 = display.newImage(filenameQuestion1)
testQuestion1.anchorX = 0; testQuestion1.anchorY = 0
testQuestion1.width = 350
testQuestion1.height = 350
testQuestion1.x = (_W*0.5 - testQuestion1.width)*0.5
testQuestion1.y = (_H-testQuestion1.height)*0.6
answerPosition1 = math.random(1,3)
groupColourBlind:insert(testQuestion1)

function buttonWrong1Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question2()
	end
end

buttonWrong1 = widget.newButton{
	
	x = _W*0.667,
	y = _H*0.3,
	width = 256,
	height = 138,
	label = "65",
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
groupColourBlind:insert(buttonWrong1)


function buttonNothing1Press (event)
	if (event.phase == "ended") then
		
		questionCount = questionCount + 1
		Question2()
	end
end

buttonNothing1 = widget.newButton{
	
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

groupColourBlind:insert(buttonNothing1)

function buttonAnswer1Press (event)
	if (event.phase == "ended") then
		correctAnswerCount = correctAnswerCount + 1
		questionCount = questionCount + 1
		Question2()
	end
end


buttonAnswer1 = widget.newButton{
	
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

groupColourBlind:insert(buttonAnswer1)



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

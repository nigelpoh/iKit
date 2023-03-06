display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
function scene:createScene(event)
    Gothic = "Wensleydale Gothic NBP"
    TimerArrayRedDesaturation = {}
    CountRD = 0
    groupRedDesaturation = self.view
    math.randomseed(os.time())
    Result = {}
    function PreventClickThroughRedDesaturation()
        return true
    end
    function CountCountCount()
         CountRD = CountRD + 1
         if(CountRD == 3) then
            CountRD = CountRD - 1
        end
    end
function CheckRedDesaturation() 
if CountRD == 1 then
    coverLeftEyeRedDesaturation()
elseif CountRD == 2 then
    function showResults2RD()
    local backgroundResults2RD = display.newRect(0,0,_W,_H)
    backgroundResults2RD.alpha = 0.5
    backgroundResults2RD:setFillColor(0,0,0)
    backgroundResults2RD.anchorX = 0
    backgroundResults2RD.anchorY = 0
    backgroundResults2RD:addEventListener("touch",PreventClickThroughRedDesaturation)
    groupRedDesaturation:insert(backgroundResults2RD)
end
function BacktoEyeTestsMenuRedDesaturation()
    storyboard.gotoScene("EyeTests", {effect = "crossFade", time = 300})
end
    function RD()
    local backgroundResultsRD = display.newImage("Result_Display.png")
    backgroundResultsRD.width = _W * 0.9
    backgroundResultsRD.height = _H * 0.9
    backgroundResultsRD.anchorX = 0.5
    backgroundResultsRD.anchorY = 0.5
    backgroundResultsRD.x = _W*0.5
    backgroundResultsRD.y = _H*0.5
    backgroundResultsRD:addEventListener("touch",BacktoEyeTestsMenuRedDesaturation)
    groupRedDesaturation:insert(backgroundResultsRD)
    if(Result[1] == "has normal vision." and Result[2] == "has normal vision.") then
    local backgroundResults2TextRD = display.newText("Both of your eyes have normal vision.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
    backgroundResults2TextRD.anchorX = 0
    backgroundResults2TextRD.anchorY = 0
    backgroundResults2TextRD:setFillColor(0,0,0)
    groupRedDesaturation:insert(backgroundResults2TextRD) 
    elseif(Result[1] == "might have optic nerve disease. It is advisable for you to visit your eye doctor for further checkups." and Result[2] == "might have optic nerve disease. It is advisable for you to visit your eye doctor for further checkups.") then
    local backgroundResults2TextRD = display.newText("Both your eyes might have optic nerve disease. It is advisable for you to visit your eye doctor for further checkups.",_W/4.9,_H*0.3,700,500,system.nativeFont,35)
    backgroundResults2TextRD.anchorX = 0
    backgroundResults2TextRD.anchorY = 0
    backgroundResults2TextRD:setFillColor(0,0,0)
    groupRedDesaturation:insert(backgroundResults2TextRD)
    else
    local backgroundResults2TextRD = display.newText("Your Right Eye "..Result[1].."\nYour Left Eye "..Result[2],_W/4.9,_H*0.3,700,500,system.nativeFont,35)
    backgroundResults2TextRD.anchorX = 0
    backgroundResults2TextRD.anchorY = 0
    backgroundResults2TextRD:setFillColor(0,0,0)
    groupRedDesaturation:insert(backgroundResults2TextRD)
end
    local backgroundResultsNext = display.newText("Click to return to Eye Tests Menu",_W*0.5,_H*0.79,system.nativeFont,30)
    backgroundResultsNext:setFillColor(0,200/255,1)
    groupRedDesaturation:insert(backgroundResultsNext)
end
TimerArrayRedDesaturation[4] = timer.performWithDelay(400,showResults2RD,1)
TimerArrayRedDesaturation[5] = timer.performWithDelay(500,RD,1)

    end
end
function coverLeftEyeRedDesaturation() 
coverbackgroundRD = display.newRect(0,0,_W,_H)
coverbackgroundRD.anchorX = 0
coverbackgroundRD.anchorY = 0
coverbackgroundRD:setFillColor(0, 0, 0)
groupRedDesaturation:insert(coverbackgroundRD)


coverYourLeftEyeRedDesaturation = display.newImage("CoverYourLeftEye.png")
coverYourLeftEyeRedDesaturation.width = 256
coverYourLeftEyeRedDesaturation.height = 256
coverYourLeftEyeRedDesaturation.anchorX = 0.5
coverYourLeftEyeRedDesaturation.anchorY = 0.5
coverYourLeftEyeRedDesaturation.x = _W*0.5
coverYourLeftEyeRedDesaturation.y = _H*0.5
coverYourLeftEyeRedDesaturationText = display.newText("Cover Your Left Eye",0,0,Gothic,50)
coverYourLeftEyeRedDesaturationText.anchorX = 0.5
coverYourLeftEyeRedDesaturationText.anchorY = 0.5
coverYourLeftEyeRedDesaturationText.x = _W*0.5
coverYourLeftEyeRedDesaturationText.y = _H*0.2
coverYourLeftEyeRedDesaturationText:setFillColor(1,0,0)
groupRedDesaturation:insert(coverYourLeftEyeRedDesaturation)
groupRedDesaturation:insert(coverYourLeftEyeRedDesaturationText)

TimerArrayRedDesaturation[6] = timer.performWithDelay(2000,MainRedDesaturation,1)
end
function InstructionsRDSHOW()
function DisappearInstructionsRD()
    InstructionsRD.alpha = 0
end
InstructionsRD = display.newImage("MatchTheColour.png")
InstructionsRD.x = 0
InstructionsRD.y = 0
InstructionsRD.anchorX = 0
InstructionsRD.anchorY = 0
InstructionsRD:addEventListener("touch",DisappearInstructionsRD)
TimerArrayRedDesaturation[7] = timer.performWithDelay(3000,DisappearInstructionsRD,1)
end
function MainRedDesaturation() 
CountCountCount()
BackgroundRedDesaturation = display.newRect(0,0,_W,_H)
BackgroundRedDesaturation.anchorX = 0
BackgroundRedDesaturation.anchorY = 0
BackgroundRedDesaturation:setFillColor(204/255,204/255,204/255)
groupRedDesaturation:insert(BackgroundRedDesaturation)
fixedRect = display.newRoundedRect(_W/100,_H/40,_W/2.3,680,20)
fixedRect.anchorX = 0
fixedRect.anchorY = 0
fixedRect:setFillColor(1,0,0)
groupRedDesaturation:insert(fixedRect)
 redRect = display.newRoundedRect(_W/2.15,_H/40,_W/2.3,680,20)
redRect.anchorX = 0
redRect.anchorY = 0
redRect:setFillColor(1,1,1)
groupRedDesaturation:insert(redRect)
GB = 1
 function sliderListener( event )
    if(event.value <= 50) then
    GB = ((event.value*2)/100)*1
    redRect:setFillColor(1,GB,GB)
    elseif(event.value > 50) then
    Green = ((100-event.value)/100)+179/255
    Blue = math.abs(event.value-100)/100
    redRect:setFillColor(1,Green,Blue)
end
end


-- Create the widget
 slider = widget.newSlider
{
    top = _H/10,
    left = _W/1.1,
    orientation = "vertical",
    height = 600,
    value = 50,  -- Start slider at 10% (optional)
    listener = sliderListener
}
groupRedDesaturation:insert(slider)
function RestartEvent()
    if(GB < 0.189 and GB >= 0) then
        Result[CountRD] = "has normal vision."
    else
        Result[CountRD] = "might have optic nerve disease. It is advisable for you to visit your eye doctor for further checkups."
    end
    CheckRedDesaturation()
end
 NextButton = widget.newButton({
    width = 100,
    height = 89,
    defaultFile = "TickDefault.png",
    overFile = "TickOver.png",
    onEvent = RestartEvent
    })
NextButton.x = _W/1.03
NextButton.y = _H/1.05
groupRedDesaturation:insert(NextButton)
end
function RemoveCoverRedDesaturation()
    coverRightEyeRedDesaturation.isVisible = false
end
function CoverRightEyeRedDesaturation()
coverRightEyeRedDesaturation = display.newImage("CoverYourRightEye.png")
coverRightEyeRedDesaturation.width = 256
coverRightEyeRedDesaturation.height = 256
coverRightEyeRedDesaturation.anchorX = 0.5
coverRightEyeRedDesaturation.anchorY = 0.5
coverRightEyeRedDesaturation.x = _W*0.5
coverRightEyeRedDesaturation.y = _H * 0.5
coverYourRightEyeRedDesaturationText = display.newText("Cover Your Right Eye",0,0,Gothic,50)
coverYourRightEyeRedDesaturationText.anchorX = 0.5
coverYourRightEyeRedDesaturationText.anchorY = 0.5
coverYourRightEyeRedDesaturationText.x = _W*0.5
coverYourRightEyeRedDesaturationText.y = _H*0.2
coverYourRightEyeRedDesaturationText:setFillColor(1,0,0)
groupRedDesaturation:insert(coverRightEyeRedDesaturation)
groupRedDesaturation:insert(coverYourRightEyeRedDesaturationText)
TimerArrayRedDesaturation[8] = timer.performWithDelay(3000,RemoveCoverRedDesaturation,1)
TimerArrayRedDesaturation[9] = timer.performWithDelay(3000,InstructionsRDSHOW,1)
TimerArrayRedDesaturation[10] = timer.performWithDelay(3000,MainRedDesaturation,1)
end
CoverRightEyeRedDesaturation()
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

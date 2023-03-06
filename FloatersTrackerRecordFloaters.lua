display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
local sqlite = require("sqlite3")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
widget.setTheme("widget_theme_ios7")

function scene:createScene(event)
 groupFTRecord = self.view
 exitGroup = display.newGroup()
 font1 = "Wensleydale Gothic NBP"
 font2 = "Capitals"
 ButtonArrayFT = {}
 pminx = _W/7.62
 pmaxx = _W/1.16
 pminy = _H/5.54
 pmaxy = _H/1.245

 local path = system.pathForFile("iKit.sqlite",system.DocumentsDirectory)
 local db = sqlite.open(path)
 db:exec("CREATE TABLE IF NOT EXISTS FloatersTracker(id INTEGER PRIMARY KEY,Serial,Date,LeftEyeRecord,RightEyeRecord,NumberOfPixelsRightEye,NumberOfPixelsLeftEye,NumberOfAssortedFloatersLeftEye,NumberOfAssortedFloatersRightEye,darkDotRightEye,darkDotLeftEye,haloDotRightEye,haloDotLeftEye,DarkPatchLeftEye,DarkPatchRightEye,WeissRingLeftEye,WeissRingRightEye);")
 dateNow = os.date("%d").."/"..os.date("%m").."/"..os.date("%Y") 
function InstructionFTRecording()
	InstructionsFTRgroup = display.newGroup()
	local backgroundInstructionsFloatersTracker = display.newRect(0,0,_W,_H)
	backgroundInstructionsFloatersTracker.anchorX = 0
	backgroundInstructionsFloatersTracker.anchorY = 0
	backgroundInstructionsFloatersTracker:setFillColor(1,1,1)
	InstructionsFTRgroup:insert(backgroundInstructionsFloatersTracker)
	optionsFTR = {
	text = "The Instructions: \n1. Follow the instructions as you proceed. \n2. Cover one eye and look at the blue sky or a non-glaring bright white object. \n3. Construct your left and right eye floaters diagram with the pre-defined icons. Once you have selected the icon, you must place on the drawing board. \n4. Select the 'tick' or 'cross' icon after you have placed & adjusted the size of the floater placed on the screen. \n5. A 'tick' means confirm & a 'cross' means re-do. \n6. Once you have finished with one eye, click 'Done' to proceed to the next step. \n7. You will need to record the floaters for both your right & left eye. \n8. This tool is to allow you to make approximate records of the floaters in your eyes. \n9. It is advisable to record your eye floaters regularly (weekly or monthly) to monitor the floaters development.",
	x = _W*0.05,
	y = _H*0.03,
	width = _W*0.9,
	height = _H*0.95,
	font = font1,
	fontSize =38,
	align = "left"
}
	local InstructionsFT = display.newText(optionsFTR)
	InstructionsFT.anchorX = 0
	InstructionsFT.anchorY = 0
	InstructionsFT:setFillColor(0,0,0)
	InstructionsFTRgroup:insert(InstructionsFT)
	function releasetoNextFunctionFT()
		groupFTRecord:insert(InstructionsFTRgroup)
		transition.fadeOut(InstructionsFTRgroup,{time = 2000})
		coverYourRightEyeTrackerRecording()
	end
	local nextOkButtonFT = widget.newButton({
		defaultFile = "GotIt.png",
		onRelease = releasetoNextFunctionFT
		})
	nextOkButtonFT:scale(0.2,0.2)
	nextOkButtonFT.x = _W/2
	nextOkButtonFT.y = _H/1.1
	InstructionsFTRgroup:insert(nextOkButtonFT)
	groupFTRecord:insert(InstructionsFTRgroup)
end
function coverYourLeftEyeTrackerRecording()
groupFTRecord:remove(captureFT)
coverYourLeftEyeTrackerRecordingGroup = display.newGroup()
coverYourLeftEyeFloatersTrackerRFBg = display.newRect(0,0,_W,_H)
coverYourLeftEyeFloatersTrackerRFBg.anchorX = 0
coverYourLeftEyeFloatersTrackerRFBg.anchorY = 0
coverYourLeftEyeFloatersTrackerRFBg:setFillColor(0,0,0)
coverYourLeftEyeFloatersTrackerRF = display.newImage("CoverYourRightEye.png")
coverYourLeftEyeFloatersTrackerRF.width = 256
coverYourLeftEyeFloatersTrackerRF.height = 256
coverYourLeftEyeFloatersTrackerRF.anchorX = 0.5
coverYourLeftEyeFloatersTrackerRF.anchorY = 0.5
coverYourLeftEyeFloatersTrackerRF.x = _W*0.5
coverYourLeftEyeFloatersTrackerRF.y = _H*0.5
coverYourLeftEyeFloatersTrackerRFText = display.newText("Cover your right eye & look at the sky.",0,0,Gothic,40)
coverYourLeftEyeFloatersTrackerRFText.anchorX = 0.5
coverYourLeftEyeFloatersTrackerRFText.anchorY = 0.5
coverYourLeftEyeFloatersTrackerRFText.x = _W*0.5
coverYourLeftEyeFloatersTrackerRFText.y = _H*0.2
coverYourLeftEyeFloatersTrackerRFText:setFillColor(1,0,0)
coverYourLeftEyeTrackerRecordingGroup:insert(coverYourLeftEyeFloatersTrackerRFBg)
coverYourLeftEyeTrackerRecordingGroup:insert(coverYourLeftEyeFloatersTrackerRF)
coverYourLeftEyeTrackerRecordingGroup:insert(coverYourLeftEyeFloatersTrackerRFText)
groupFTRecord:insert(coverYourLeftEyeTrackerRecordingGroup)
function MainLeftFT()
	transition.fadeOut(coverYourLeftEyeTrackerRecordingGroup,{time=2000})
	MainFloatersTrackerRecording("Left Eye")
end
LeftFloatersTrackerRFTimer = timer.performWithDelay(2000,MainLeftFT,1)

end
function coverYourRightEyeTrackerRecording()
coverYourRightEyeTrackerRecordingGroup = display.newGroup()
coverYourRightEyeFloatersTrackerRF = display.newImage("CoverYourLeftEye.png")
coverYourRightEyeFloatersTrackerRF.width = 256
coverYourRightEyeFloatersTrackerRF.height = 256
coverYourRightEyeFloatersTrackerRF.anchorX = 0.5
coverYourRightEyeFloatersTrackerRF.anchorY = 0.5
coverYourRightEyeFloatersTrackerRF.x = _W*0.5
coverYourRightEyeFloatersTrackerRF.y = _H*0.5
coverYourRightEyeFloatersTrackerRFText = display.newText("Cover your left eye & look at the sky.",0,0,Gothic,40)
coverYourRightEyeFloatersTrackerRFText.anchorX = 0.5
coverYourRightEyeFloatersTrackerRFText.anchorY = 0.5
coverYourRightEyeFloatersTrackerRFText.x = _W*0.5
coverYourRightEyeFloatersTrackerRFText.y = _H*0.2
coverYourRightEyeFloatersTrackerRFText:setFillColor(1,0,0)
coverYourRightEyeTrackerRecordingGroup:insert(coverYourRightEyeFloatersTrackerRF)
coverYourRightEyeTrackerRecordingGroup:insert(coverYourRightEyeFloatersTrackerRFText)
groupFTRecord:insert(coverYourRightEyeTrackerRecordingGroup)

-- Emergency Exit

function GoodBye()
	exitGroup:removeSelf()
	storyboard.gotoScene("FloatersTracker",{effect="zoomOutIn"})

end

function emergencyExit ()

exitBK = display.newRect(0,0,_W,_H)
exitBK.anchorX = 0
exitBK.anchorY = 0
exitBK.x = 0
exitBK.y = 0
exitBK:setFillColor(0.8, 0.8, 0.8)
exitGroup:insert(exitBK)

exitMsgopt = {
	text = "Emergency Alert: \n\nYou are having retinal detachment! Please get assistance to see your eye doctor immediately! \n\n\n Touch here to exit.",
	width = _W * 0.75,
	height = _W * 0.75,
	font = font2,
	fontSize = 40,
	align = "center"
}

exitMsg = display.newText (exitMsgopt)
exitMsg.anchorX = 0
exitMsg.anchorY = 0
exitMsg.x = _W * 0.12
exitMsg.y = _H * 0.17
exitMsg:setFillColor(0.9, 0, 0)
exitGroup:insert(exitMsg)
exitMsg:addEventListener("touch", GoodBye)


end


function MainRightFT()
	transition.fadeOut(coverYourRightEyeTrackerRecordingGroup,{time=2000})
	MainFloatersTrackerRecording("Right Eye")
end
RightFloatersTrackerRFTimer = timer.performWithDelay(2000,MainRightFT,1)

end
function MainFloatersTrackerRecording(CheckEye)
CountFloaters = 0
DarkPatchCounter = 0
DarkDotCounter = 0
HaloDotCounter = 0
NumberOfPixels = 0
WeissRingCounter = 0
pixelCountAdding = {} 
	function RemoveButtonListeners()
		for i = 1,27 do 
		
		
			ButtonArrayFT[i]:setEnabled(false)
		
	end
end
	local canvasFloatersTracker = display.newRect(0,0,_W,_H)
	canvasFloatersTracker.anchorX = 0
	canvasFloatersTracker.anchorY = 0
	canvasFloatersTracker:setFillColor(1,1,1)
	groupFTRecord:insert(canvasFloatersTracker)
	displayRectLimits = display.newContainer( _W/1.35, _H/1.55)
	displayRectLimits:translate(_W/7.9,_H/6)
	local FloatersTypeText = display.newText("Floater Type: ",_W*0.714,_H*0.815,font1,38)
	FloatersTypeText.anchorX = 0
	FloatersTypeText.anchorY = 0
	FloatersTypeText:setFillColor(1,0,0)
	FloatersTrackerRectangle = display.newRect(_W/7.9,_H/6,_W/1.35,_H/1.55)
	FloatersTrackerRectangle.anchorX = 0
	FloatersTrackerRectangle.anchorY = 0
	FloatersTrackerRectangle.strokeWidth = 10
	FloatersTrackerRectangle:setFillColor(0,0,0,0)
	FloatersTrackerRectangle:setStrokeColor(1,0,0)
	groupFTRecord:insert(FloatersTrackerRectangle)
	optionsFloatersTypeTextDynamic = {
	text = "No selection currently.",
	x = _W*0.714,
	y = _H*0.87,
	font = font1,
	fontSize = 27,
	width = _W*0.18,
	height = _H*0.089,
}
	FloatersTypeTextDynamic = display.newText(optionsFloatersTypeTextDynamic)
	FloatersTypeTextDynamic.anchorX = 0
	FloatersTypeTextDynamic.anchorY = 0
	FloatersTypeTextDynamic:setFillColor(0,0,1)

groupFTRecord:insert(FloatersTypeText)
groupFTRecord:insert(FloatersTypeTextDynamic)
	function confirmationtickcross(eventargetTC,VarValue)
	DisplayedImageFT = eventargetTC
	WidthImageFT = eventargetTC.width
	HeightImageFT = eventargetTC.height
	PercentageChangeFT = 1
	function crossFunction()
		display.remove(DisplayedImageFT)
		eventargetTC = nil
		Cross.isVisible = false
		Tick.isVisible = false
		sliderFTRF.isVisible = false
		for i = 1,27 do 
		ButtonArrayFT[i]:setEnabled(true)
	end
	FloatersTypeTextDynamic.text = "No selection currently."
	end
	function tickFunction()
		if (DisplayedImageFT.x - DisplayedImageFT.width * 0.5 < pminx) then
			DisplayedImageFT.x = pminx + DisplayedImageFT.width*0.5
		end
		if (DisplayedImageFT.x + DisplayedImageFT.width * 0.5 > pmaxx) then
			DisplayedImageFT.x = pmaxx - DisplayedImageFT.width*0.5
		end
		if (DisplayedImageFT.y - DisplayedImageFT.height * 0.5 < pminy) then
			DisplayedImageFT.y = pminy + DisplayedImageFT.height*0.5
		end
		if (DisplayedImageFT.y + DisplayedImageFT.height * 0.5 > pmaxy) then
			DisplayedImageFT.y = pmaxy - DisplayedImageFT.height*0.5
		end
		if(DisplayedImageFT.id == "Right Top Triangle" or DisplayedImageFT.id == "Left Bottom Triangle" or DisplayedImageFT.id == "Left Top Triangle" or DisplayedImageFT.id == "Curtain Down" or DisplayedImageFT.id == "Right Bottom Triangle") then
			if(CheckEyeRecordMain == "Left Eye") then
				emergencyExit()
				
				for row in db:nrows([[SELECT COUNT(*)  AS Count FROM FloatersTracker]]) do
				
				local sql = [[DELETE FROM FloatersTracker WHERE id = "]]..row.Count..[["]]
				db:exec(sql)
				end
			else
				
				emergencyExit()
			end
			for i = 1,27 do
				groupFTRecord:insert(ButtonArrayFT[i])
			end
			
		end
		if(DisplayedImageFT.id == "Dark Dot") then
			DarkDotCounter = DarkDotCounter + 1
		elseif(DisplayedImageFT.id == "Halo Dot") then
			HaloDotCounter = HaloDotCounter + 1
		elseif(DisplayedImageFT.id == "Dark Patch") then
			DarkPatchCounter = DarkPatchCounter + 1
		elseif(DisplayedImageFT.id == "WeissRing") then
			WeissRingCounter = WeissRingCounter + 1
		else
		CountFloaters = CountFloaters + 1
	end
		Cross.isVisible = false
		sliderFTRF.isVisible = false
		Tick.isVisible = false
		for i = 1,27 do 
		ButtonArrayFT[i]:setEnabled(true)
	end
	local tValue = VarValue*PercentageChangeFT
	table.insert( pixelCountAdding, tValue )  
	
	FloatersTypeTextDynamic.text = "No selection currently."
	end
	 Cross = widget.newButton({
		defaultFile = "CrossFT.png",
		onRelease = crossFunction
		})
	 Cross:scale(0.2,0.2)
	 Cross.anchorX = 0
	 Cross.anchorY = 0
	 Cross.x = _W/1.06
	 Cross.y = _H/1.55
	 Tick = widget.newButton({
	 	defaultFile = "TickFT.png",
	 	onRelease = tickFunction
	 	})
	 Tick:scale(0.2,0.2)
	 Tick.x = _W/1.06
	 Tick.y = _H/5
	 Tick.anchorX = 0
	 Tick.anchorY = 0
local function sliderListener( event )
	PercentageChangeFT = event.value/50
    DisplayedImageFT.width = WidthImageFT*PercentageChangeFT
    DisplayedImageFT.height = HeightImageFT*PercentageChangeFT
end
 sliderFTRF = widget.newSlider
{
    top = _H*0.222,
    left = _W*0.89,
    orientation = "vertical",
    height = _H/2,
    value = 50,
    listener = sliderListener
}

	end
	function confirmationDarkDot()
		Runtime:removeEventListener("touch",darkDotButtonFunction)
		confirmationtickcross(darkDot,2290)
	end 
	function darkDotFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Dark Dot"
	function darkDotButtonFunction(event)
		if event.phase == "ended" then
			touchX = event.x 
			touchY = event.y 

		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	

		else
		darkDot = display.newImage("Dark Dot.png",touchX,touchY)
		darkDot.anchorX = 0.5
		darkDot.anchorY = 0.5
		darkDot.id = "Dark Dot"
		displayRectLimits:insert(darkDot)
		groupFTRecord:insert(darkDot)
		confirmationDarkDot()
		end
	end
	end
       Runtime:addEventListener("touch",darkDotButtonFunction)
	end
	    ButtonArrayFT[1] = widget.newButton({
		defaultFile = "DotIcon.png",
		onRelease = darkDotFunction
		})
ButtonArrayFT[1].anchorX = 0
ButtonArrayFT[1].anchorY = 0
ButtonArrayFT[1]:scale(0.1,0.1)
ButtonArrayFT[1].x = _W/100
ButtonArrayFT[1].y = _H/1.2
function confirmationDarkDotHalo()
		FloatersTypeTextDynamic.text = "Halo Dot"
		Runtime:removeEventListener("touch",darkDotHaloButtonFunction)
		confirmationtickcross(darkDotHalo,14315)
	end 
	function darkDotHaloFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Halo Dot"
	function darkDotHaloButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		darkDotHalo = display.newImage("Halo Dot.png",event.x,event.y)
		darkDotHalo.anchorX = 0.5
		darkDotHalo.anchorY = 0.5
		darkDotHalo.id = "Halo Dot"
		displayRectLimits:insert(darkDotHalo)
		groupFTRecord:insert(darkDotHalo)
		confirmationDarkDotHalo()
	end
	end
end
       Runtime:addEventListener("touch",darkDotHaloButtonFunction)
	end
	    ButtonArrayFT[2]= widget.newButton({
		defaultFile = "HaloDotIcon.png",
		onRelease = darkDotHaloFunction
		})
ButtonArrayFT[2].anchorX = 0
ButtonArrayFT[2].anchorY = 0
ButtonArrayFT[2]:scale(0.1,0.1)
ButtonArrayFT[2].x = _W/11.5
ButtonArrayFT[2].y = _H/1.2
function confirmationWeissRing()
		FloatersTypeTextDynamic.text = "Weiss Ring"
		Runtime:removeEventListener("touch",WeissRingButtonFunction)
		confirmationtickcross(WeissRing,66156)
	end 
	function WeissRingFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Weiss Ring"
	function WeissRingButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		WeissRing = display.newImage("Weiss Ring.png",event.x,event.y)
		WeissRing.anchorX = 0.5
		WeissRing.anchorY = 0.5
		WeissRing.id = "WeissRing"
		displayRectLimits:insert(WeissRing)
		groupFTRecord:insert(WeissRing)
		confirmationWeissRing()
	end
	end
end
       Runtime:addEventListener("touch",WeissRingButtonFunction)
	end
	    ButtonArrayFT[3]= widget.newButton({
		defaultFile = "WeissIcon.png",
		onRelease = WeissRingFunction
		})
ButtonArrayFT[3].anchorX = 0
ButtonArrayFT[3].anchorY = 0
ButtonArrayFT[3]:scale(0.1,0.1)
ButtonArrayFT[3].x = _W/6.1
ButtonArrayFT[3].y = _H/1.2
function confirmationCloud()
		FloatersTypeTextDynamic.text = "Cloud"
		Runtime:removeEventListener("touch",CloudButtonFunction)
		confirmationtickcross(Cloud,21509)
	end 
	function CloudFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Cloud"
	function CloudButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		Cloud = display.newImage("Cloud.png",event.x,event.y)
		Cloud.anchorX = 0.5
		Cloud.anchorY = 0.5
		displayRectLimits:insert(Cloud)
		groupFTRecord:insert(Cloud)
		confirmationCloud()
	end
	end
end
       Runtime:addEventListener("touch",CloudButtonFunction)
	end
	    ButtonArrayFT[4]= widget.newButton({
		defaultFile = "CloudIcon.png",
		onRelease = CloudFunction
		})
ButtonArrayFT[4].anchorX = 0
ButtonArrayFT[4].anchorY = 0
ButtonArrayFT[4]:scale(0.1,0.1)
ButtonArrayFT[4].x = _W/4.15
ButtonArrayFT[4].y = _H/1.2
function confirmationVerticalString1()
		FloatersTypeTextDynamic.text = "Vertical String 1"
		Runtime:removeEventListener("touch",VerticalString1ButtonFunction)
		confirmationtickcross(VerticalString1,3318)
	end 
	function VerticalString1Function()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Vertical String Type 1"
	function VerticalString1ButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		VerticalString1 = display.newImage("Vertical String 1.png",event.x,event.y)
		VerticalString1.anchorX = 0.5
		VerticalString1.anchorY = 0.5
		displayRectLimits:insert(VerticalString1)
		groupFTRecord:insert(VerticalString1)
		confirmationVerticalString1()
	end
	end
end
       Runtime:addEventListener("touch",VerticalString1ButtonFunction)
	end
	    ButtonArrayFT[5]= widget.newButton({
		defaultFile = "VerticalString1Icon.png",
		onRelease = VerticalString1Function
		})
ButtonArrayFT[5].anchorX = 0
ButtonArrayFT[5].anchorY = 0
ButtonArrayFT[5]:scale(0.1,0.1)
ButtonArrayFT[5].x = _W/3.15
ButtonArrayFT[5].y = _H/1.2
function confirmationVerticalString2()
		FloatersTypeTextDynamic.text = "Vertical String 2"
		Runtime:removeEventListener("touch",VerticalString2ButtonFunction)
		confirmationtickcross(VerticalString2,3318)
	end 
	function VerticalString2Function()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Vertical String Type 2"
	function VerticalString2ButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		VerticalString2 = display.newImage("Vertical String 2.png",event.x,event.y)
		VerticalString2.anchorX = 0.5
		VerticalString2.anchorY = 0.5
		displayRectLimits:insert(VerticalString2)
		groupFTRecord:insert(VerticalString2)
		confirmationVerticalString2()
	end
	end
end
       Runtime:addEventListener("touch",VerticalString2ButtonFunction)
	end
	    ButtonArrayFT[6]= widget.newButton({
		defaultFile = "VerticalString2Icon.png",
		onRelease = VerticalString2Function
		})
ButtonArrayFT[6].anchorX = 0
ButtonArrayFT[6].anchorY = 0
ButtonArrayFT[6]:scale(0.1,0.1)
ButtonArrayFT[6].x = _W/2.54
ButtonArrayFT[6].y = _H/1.2
function confirmationHorizontalString1()
		FloatersTypeTextDynamic.text = "Horizontal String 1"
		Runtime:removeEventListener("touch",HorizontalString1ButtonFunction)
		confirmationtickcross(HorizontalString1,3318)
	end 
	function HorizontalString1Function()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Horizontal String Type 1"
	function HorizontalString1ButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HorizontalString1 = display.newImage("Horizontal String 1.png",event.x,event.y)
		HorizontalString1.anchorX = 0.5
		HorizontalString1.anchorY = 0.5
		displayRectLimits:insert(HorizontalString1)
		groupFTRecord:insert(HorizontalString1)
		confirmationHorizontalString1()
	end
	end
end
       Runtime:addEventListener("touch",HorizontalString1ButtonFunction)
	end
	    ButtonArrayFT[7]= widget.newButton({
		defaultFile = "HorizontalString1Icon.png",
		onRelease = HorizontalString1Function
		})
ButtonArrayFT[7].anchorX = 0
ButtonArrayFT[7].anchorY = 0
ButtonArrayFT[7]:scale(0.1,0.1)
ButtonArrayFT[7].x = _W/2.125
ButtonArrayFT[7].y = _H/1.2
function confirmationHorizontalString2()
		FloatersTypeTextDynamic.text = "Horizontal String 2"
		Runtime:removeEventListener("touch",HorizontalString2ButtonFunction)
		confirmationtickcross(HorizontalString2,3318)
	end 
	function HorizontalString2Function()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Horizontal String Type 2"
	function HorizontalString2ButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HorizontalString2 = display.newImage("Horizontal String 2.png",event.x,event.y)
		HorizontalString2.anchorX = 0.5
		HorizontalString2.anchorY = 0.5
		displayRectLimits:insert(HorizontalString2)
		groupFTRecord:insert(HorizontalString2)
		confirmationHorizontalString2()
	end
	end
end
       Runtime:addEventListener("touch",HorizontalString2ButtonFunction)
	end
	    ButtonArrayFT[8]= widget.newButton({
		defaultFile = "HorizontalString2Icon.png",
		onRelease = HorizontalString2Function
		})
ButtonArrayFT[8].anchorX = 0
ButtonArrayFT[8].anchorY = 0
ButtonArrayFT[8]:scale(0.1,0.1)
ButtonArrayFT[8].x = _W/1.83
ButtonArrayFT[8].y = _H/1.2

function confirmationWormHorizontalShort()
		FloatersTypeTextDynamic.text = "Short Horizontal Worm"
		Runtime:removeEventListener("touch",WormHorizontalShortButtonFunction)
		confirmationtickcross(WormHorizontalShort,7290)
	end 
	function WormHorizontalShortFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Short Horizontal Worm"
	function WormHorizontalShortButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		WormHorizontalShort = display.newImage("Worm Horizontal Short.png",event.x,event.y)
		WormHorizontalShort.anchorX = 0.5
		WormHorizontalShort.anchorY = 0.5
		displayRectLimits:insert(WormHorizontalShort)
		groupFTRecord:insert(WormHorizontalShort)
		confirmationWormHorizontalShort()
	end
	end
end
       Runtime:addEventListener("touch",WormHorizontalShortButtonFunction)
	end
	    ButtonArrayFT[9]= widget.newButton({
		defaultFile = "WormHorizontalShortIcon.png",
		onRelease = WormHorizontalShortFunction
		})
ButtonArrayFT[9].anchorX = 0
ButtonArrayFT[9].anchorY = 0
ButtonArrayFT[9]:scale(0.1,0.1)
ButtonArrayFT[9].x = _W/100
ButtonArrayFT[9].y = _H/1.78

function confirmationWormHorizontalLong()
		FloatersTypeTextDynamic.text = "Long Horizontal Worm"
		Runtime:removeEventListener("touch",WormHorizontalLongButtonFunction)
		confirmationtickcross(WormHorizontalLong,14364)
	end 
	function WormHorizontalLongFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Long Horizontal Worm"
	function WormHorizontalLongButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		WormHorizontalLong = display.newImage("Worm Horizontal Long.png",event.x,event.y)
		WormHorizontalLong.anchorX = 0.5
		WormHorizontalLong.anchorY = 0.5
		displayRectLimits:insert(WormHorizontalLong)
		groupFTRecord:insert(WormHorizontalLong)
		confirmationWormHorizontalLong()
	end
	end
end
       Runtime:addEventListener("touch",WormHorizontalLongButtonFunction)
	end
	    ButtonArrayFT[10]= widget.newButton({
		defaultFile = "WormHorizontalLongIcon.png",
		onRelease = WormHorizontalLongFunction
		})
ButtonArrayFT[10].anchorX = 0
ButtonArrayFT[10].anchorY = 0
ButtonArrayFT[10]:scale(0.1,0.1)
ButtonArrayFT[10].x = _W/100
ButtonArrayFT[10].y = _H/2.35

function confirmationWormVerticalShort()
		FloatersTypeTextDynamic.text = "Short Vertical Worm"
		Runtime:removeEventListener("touch",WormVerticalShortButtonFunction)
		confirmationtickcross(WormVerticalShort,7290)
	end 
	function WormVerticalShortFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Short Vertical Worm"
	function WormVerticalShortButtonFunction(event)
		if event.phase == "ended" then
		if event.x < 168 or event.x > 1104 or event.y < 130 or event.y > 582 then
		else
		WormVerticalShort = display.newImage("Worm Vertical Short.png",event.x,event.y)
		WormVerticalShort.anchorX = 0.5
		WormVerticalShort.anchorY = 0.5
		displayRectLimits:insert(WormVerticalShort)
		groupFTRecord:insert(WormVerticalShort)
		confirmationWormVerticalShort()
	end
	end
end
       Runtime:addEventListener("touch",WormVerticalShortButtonFunction)
	end
	    ButtonArrayFT[11]= widget.newButton({
		defaultFile = "WormVerticalShortIcon.png",
		onRelease = WormVerticalShortFunction
		})
ButtonArrayFT[11].anchorX = 0
ButtonArrayFT[11].anchorY = 0
ButtonArrayFT[11]:scale(0.1,0.1)
ButtonArrayFT[11].x = _W/100
ButtonArrayFT[11].y = _H/3.44

function confirmationDarkPatch()
		FloatersTypeTextDynamic.text = "Dark Patch"
		Runtime:removeEventListener("touch",DarkPatchButtonFunction)
		confirmationtickcross(DarkPatch, 75730)
	end 
	function DarkPatchFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Dark Patch"
	function DarkPatchButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		DarkPatch = display.newImage("Dark Patch.png",event.x,event.y)
		DarkPatch.anchorX = 0.5
		DarkPatch.anchorY = 0.5
		displayRectLimits:insert(DarkPatch)
		groupFTRecord:insert(DarkPatch)
		DarkPatch.id = "Dark Patch"
		confirmationDarkPatch()
	end
	end
end
       Runtime:addEventListener("touch",DarkPatchButtonFunction)
	end
	    ButtonArrayFT[12]= widget.newButton({
		defaultFile = "DarkPatchIcon.png",
		onRelease = DarkPatchFunction
		})
ButtonArrayFT[12].anchorX = 0
ButtonArrayFT[12].anchorY = 0
ButtonArrayFT[12]:scale(0.1,0.1)
ButtonArrayFT[12].x = _W/100
ButtonArrayFT[12].y = _H/1.435

function confirmationWormVerticalLong()
		FloatersTypeTextDynamic.text = "Long Vertical Worm"
		Runtime:removeEventListener("touch",WormVerticalLongButtonFunction)
		confirmationtickcross(WormVerticalLong,14364)
	end 
	function WormVerticalLongFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Long Vertical Worm"
	function WormVerticalLongButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		WormVerticalLong = display.newImage("Worm Vertical Long.png",event.x,event.y)
		WormVerticalLong.anchorX = 0.5
		WormVerticalLong.anchorY = 0.5
		displayRectLimits:insert(WormVerticalLong)
		groupFTRecord:insert(WormVerticalLong)
		confirmationWormVerticalLong()
	end
	end
end
       Runtime:addEventListener("touch",WormVerticalLongButtonFunction)
	end
	    ButtonArrayFT[13]= widget.newButton({
		defaultFile = "WormVerticalLongIcon.png",
		onRelease = WormVerticalLongFunction
		})
ButtonArrayFT[13].anchorX = 0
ButtonArrayFT[13].anchorY = 0
ButtonArrayFT[13]:scale(0.1,0.1)
ButtonArrayFT[13].x = _W/100
ButtonArrayFT[13].y = _H/6.4
function confirmationVerticalBarShort()
		FloatersTypeTextDynamic.text = "Short Vertical Bar"
		Runtime:removeEventListener("touch",VerticalBarShortButtonFunction)
		confirmationtickcross(VerticalBarShort,6642)
	end 
	function VerticalBarShortFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Short Vertical Bar"
	function VerticalBarShortButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		VerticalBarShort = display.newImage("Vertical Bar Short.png",event.x,event.y)
		VerticalBarShort.anchorX = 0.5
		VerticalBarShort.anchorY = 0.5
		displayRectLimits:insert(VerticalBarShort)
		groupFTRecord:insert(VerticalBarShort)
		confirmationVerticalBarShort()
	end
	end
end
       Runtime:addEventListener("touch",VerticalBarShortButtonFunction)
	end
	    ButtonArrayFT[14]= widget.newButton({
		defaultFile = "VerticalBarShortIcon.png",
		onRelease = VerticalBarShortFunction
		})
ButtonArrayFT[14].anchorX = 0
ButtonArrayFT[14].anchorY = 0
ButtonArrayFT[14]:scale(0.1,0.1)
ButtonArrayFT[14].x = _W/5.25
ButtonArrayFT[14].y = _H/100
function confirmationVerticalBarLong()
		FloatersTypeTextDynamic.text = "Long Vertical Bar"
		Runtime:removeEventListener("touch",VerticalBarLongButtonFunction)
		confirmationtickcross(VerticalBarLong,13014)
	end 
	function VerticalBarLongFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Long Vertical Bar"
	function VerticalBarLongButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		VerticalBarLong = display.newImage("Vertical Bar Long.png",event.x,event.y)
		VerticalBarLong.anchorX = 0.5
		VerticalBarLong.anchorY = 0.5
		displayRectLimits:insert(VerticalBarLong)
		groupFTRecord:insert(VerticalBarLong)
		confirmationVerticalBarLong()
	end
	end
end
       Runtime:addEventListener("touch",VerticalBarLongButtonFunction)
	end
	    ButtonArrayFT[15]= widget.newButton({
		defaultFile = "VerticalBarLongIcon.png",
		onRelease = VerticalBarLongFunction
		})
ButtonArrayFT[15].anchorX = 0
ButtonArrayFT[15].anchorY = 0
ButtonArrayFT[15]:scale(0.1,0.1)
ButtonArrayFT[15].x = _W/3.76
ButtonArrayFT[15].y = _H/100
function confirmationRightTopTriangle()
		FloatersTypeTextDynamic.text = "Top Right Triangle"
		Runtime:removeEventListener("touch",RightTopTriangleButtonFunction)
		confirmationtickcross(RightTopTriangle,31876)
	end 
	function RightTopTriangleFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Top Right Triangle"
	function RightTopTriangleButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		RightTopTriangle = display.newImage("Right Top Triangle.png",event.x,event.y)
		RightTopTriangle.height = _H*0.33
		RightTopTriangle.width = _W*0.33
		RightTopTriangle.anchorX = 0.5
		RightTopTriangle.anchorY = 0.5
		RightTopTriangle.x = pmaxx - RightTopTriangle.width * 0.5
		RightTopTriangle.y = pminy + RightTopTriangle.height * 0.5

		
		displayRectLimits:insert(RightTopTriangle)
		groupFTRecord:insert(RightTopTriangle)
		RightTopTriangle.id = "Right Top Triangle"
		confirmationRightTopTriangle()
	end
	end
end
       Runtime:addEventListener("touch",RightTopTriangleButtonFunction)
	end
	    ButtonArrayFT[16]= widget.newButton({
		defaultFile = "RightTopTriangleIcon.png",
		onRelease = RightTopTriangleFunction
		})
ButtonArrayFT[16].anchorX = 0
ButtonArrayFT[16].anchorY = 0
ButtonArrayFT[16]:scale(0.1,0.1)
ButtonArrayFT[16].x = _W/2.93
ButtonArrayFT[16].y = _H/100
function confirmationRightBottomTriangle()
		FloatersTypeTextDynamic.text = "Bottom Right Triangle"
		Runtime:removeEventListener("touch",RightBottomTriangleButtonFunction)
		confirmationtickcross(RightBottomTriangle,31876)
	end 
	function RightBottomTriangleFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Bottom Right Triangle"
	function RightBottomTriangleButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		RightBottomTriangle = display.newImage("Right Bottom Triangle.png",event.x,event.y)
		RightBottomTriangle.height = _H*0.33
		RightBottomTriangle.width = _W*0.33
		RightBottomTriangle.anchorX = 0.5
		RightBottomTriangle.anchorY = 0.5
		RightBottomTriangle.x = pmaxx - RightBottomTriangle.width * 0.5
		RightBottomTriangle.y = pmaxy - RightBottomTriangle.height * 0.5
		displayRectLimits:insert(RightBottomTriangle)
		groupFTRecord:insert(RightBottomTriangle)
		RightBottomTriangle.id = "Right Bottom Triangle"
		confirmationRightBottomTriangle()
	end
	end
end
       Runtime:addEventListener("touch",RightBottomTriangleButtonFunction)
	end
	    ButtonArrayFT[17]= widget.newButton({
		defaultFile = "RightBottomTriangleIcon.png",
		onRelease = RightBottomTriangleFunction
		})
ButtonArrayFT[17].anchorX = 0
ButtonArrayFT[17].anchorY = 0
ButtonArrayFT[17]:scale(0.1,0.1)
ButtonArrayFT[17].x = _W/2.4
ButtonArrayFT[17].y = _H/100
function confirmationLeftTopTriangle()
		FloatersTypeTextDynamic.text = "Top Left Triangle"
		Runtime:removeEventListener("touch",LeftTopTriangleButtonFunction)
		confirmationtickcross(LeftTopTriangle,31876)
	end 
	function LeftTopTriangleFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Top Left Triangle"
	function LeftTopTriangleButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		LeftTopTriangle = display.newImage("Left Top Triangle.png",event.x,event.y)
		LeftTopTriangle.width = _W*0.33
		LeftTopTriangle.height = _H*0.33
		LeftTopTriangle.anchorX = 0.5
		LeftTopTriangle.anchorY = 0.5
		LeftTopTriangle.x = pminx + LeftTopTriangle.width * 0.5
		LeftTopTriangle.y = pminy + LeftTopTriangle.height * 0.5
		displayRectLimits:insert(LeftTopTriangle)
		groupFTRecord:insert(LeftTopTriangle)
		LeftTopTriangle.id = "Left Top Triangle"
		confirmationLeftTopTriangle()
	end
	end
end
       Runtime:addEventListener("touch",LeftTopTriangleButtonFunction)
	end
	    ButtonArrayFT[18]= widget.newButton({
		defaultFile = "LeftTopTriangleIcon.png",
		onRelease = LeftTopTriangleFunction
		})
ButtonArrayFT[18].anchorX = 0
ButtonArrayFT[18].anchorY = 0
ButtonArrayFT[18]:scale(0.1,0.1)
ButtonArrayFT[18].x = _W/2.03
ButtonArrayFT[18].y = _H/100
function confirmationLeftBottomTriangle()
		FloatersTypeTextDynamic.text = "Bottom Left Triangle"
		Runtime:removeEventListener("touch",LeftBottomTriangleButtonFunction)
		confirmationtickcross(LeftBottomTriangle,31876)
	end 
	function LeftBottomTriangleFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Bottom Left Triangle"
	function LeftBottomTriangleButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		LeftBottomTriangle = display.newImage("Left Bottom Triangle.png",event.x,event.y)
		LeftBottomTriangle.anchorX = 0.5
		LeftBottomTriangle.anchorY = 0.5
		LeftBottomTriangle.width = _W * 0.33
		LeftBottomTriangle.height = _H * 0.33
		LeftBottomTriangle.x = pminx + LeftBottomTriangle.width * 0.5
		LeftBottomTriangle.y = pmaxy - LeftBottomTriangle.height * 0.5
		displayRectLimits:insert(LeftBottomTriangle)
		groupFTRecord:insert(LeftBottomTriangle)
		LeftBottomTriangle.id = "Left Bottom Triangle"
		confirmationLeftBottomTriangle()
	end
	end
end
       Runtime:addEventListener("touch",LeftBottomTriangleButtonFunction)
	end
	    ButtonArrayFT[19]= widget.newButton({
		defaultFile = "LeftBottomTriangleIcon.png",
		onRelease = LeftBottomTriangleFunction
		})
ButtonArrayFT[19].anchorX = 0
ButtonArrayFT[19].anchorY = 0
ButtonArrayFT[19]:scale(0.1,0.1)
ButtonArrayFT[19].x = _W/1.76
ButtonArrayFT[19].y = _H/100
function confirmationHorizontalBarShort()
		FloatersTypeTextDynamic.text = "Short Horizontal Bar"
		Runtime:removeEventListener("touch",HorizontalBarShortButtonFunction)
		confirmationtickcross(HorizontalBarShort,6588)
	end 
	function HorizontalBarShortFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Short Horizontal Bar"
	function HorizontalBarShortButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HorizontalBarShort = display.newImage("Horizontal Bar Short.png",event.x,event.y)
		HorizontalBarShort.anchorX = 0.5
		HorizontalBarShort.anchorY = 0.5
		displayRectLimits:insert(HorizontalBarShort)
		groupFTRecord:insert(HorizontalBarShort)
		confirmationHorizontalBarShort()
	end
	end
end
       Runtime:addEventListener("touch",HorizontalBarShortButtonFunction)
	end
	    ButtonArrayFT[20]= widget.newButton({
		defaultFile = "HorizontalBarShortIcon.png",
		onRelease = HorizontalBarShortFunction
		})
ButtonArrayFT[20].anchorX = 0
ButtonArrayFT[20].anchorY = 0
ButtonArrayFT[20]:scale(0.1,0.1)
ButtonArrayFT[20].x = _W/30
ButtonArrayFT[20].y = _H/100
function confirmationHorizontalBarLong()
		FloatersTypeTextDynamic.text = "Long Horizontal Bar"
		Runtime:removeEventListener("touch",HorizontalBarLongButtonFunction)
		confirmationtickcross(HorizontalBarLong,13068)
	end 
	function HorizontalBarLongFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Long Horizontal Bar"
	function HorizontalBarLongButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HorizontalBarLong = display.newImage("Horizontal Bar Long.png",event.x,event.y)
		HorizontalBarLong.anchorX = 0.5
		HorizontalBarLong.anchorY = 0.5
		displayRectLimits:insert(HorizontalBarLong)
		groupFTRecord:insert(HorizontalBarLong)
		confirmationHorizontalBarLong()
	end
	end
end
       Runtime:addEventListener("touch",HorizontalBarLongButtonFunction)
	end
	    ButtonArrayFT[21]= widget.newButton({
		defaultFile = "HorizontalBarLongIcon.png",
		onRelease = HorizontalBarLongFunction
		})
ButtonArrayFT[21].anchorX = 0
ButtonArrayFT[21].anchorY = 0
ButtonArrayFT[21]:scale(0.1,0.1)
ButtonArrayFT[21].x = _W/8.6
ButtonArrayFT[21].y = _H/100
function confirmationHaloVerticalShort()
		FloatersTypeTextDynamic.text = "Halo Vertical Short"
		Runtime:removeEventListener("touch",HaloVerticalShortButtonFunction)
		confirmationtickcross(HaloVerticalShort,13272)
	end 
	function HaloVerticalShortFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Halo Vertical Short"
	function HaloVerticalShortButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HaloVerticalShort = display.newImage("Halo Vertical Short.png",event.x,event.y)
		HaloVerticalShort.anchorX = 0.5
		HaloVerticalShort.anchorY = 0.5
		displayRectLimits:insert(HaloVerticalShort)
		groupFTRecord:insert(HaloVerticalShort)
		confirmationHaloVerticalShort()
	end
	end
end
       Runtime:addEventListener("touch",HaloVerticalShortButtonFunction)
	end
	    ButtonArrayFT[22]= widget.newButton({
		defaultFile = "HaloVerticalShortIcon.png",
		onRelease = HaloVerticalShortFunction
		})
ButtonArrayFT[22].anchorX = 0
ButtonArrayFT[22].anchorY = 0
ButtonArrayFT[22]:scale(0.1,0.1)
ButtonArrayFT[22].x = _W/1.15
ButtonArrayFT[22].y = _H/100
function confirmationHaloHorizontalBarShort()
		FloatersTypeTextDynamic.text = "Halo Horizontal Short Bar"
		Runtime:removeEventListener("touch",HaloHorizontalBarShortButtonFunction)
		confirmationtickcross(HaloHorizontalBarShort,13272)
	end 
	function HaloHorizontalBarShortFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Halo Horizontal Short Bar"
	function HaloHorizontalBarShortButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HaloHorizontalBarShort = display.newImage("Halo Horizontal Bar Short.png",event.x,event.y)
		HaloHorizontalBarShort.anchorX = 0.5
		HaloHorizontalBarShort.anchorY = 0.5
		displayRectLimits:insert(HaloHorizontalBarShort)
		groupFTRecord:insert(HaloHorizontalBarShort)
		confirmationHaloHorizontalBarShort()
	end
	end
end
       Runtime:addEventListener("touch",HaloHorizontalBarShortButtonFunction)
	end
	    ButtonArrayFT[23]= widget.newButton({
		defaultFile = "HaloHorizontalBarShortIcon.png",
		onRelease = HaloHorizontalBarShortFunction
		})
ButtonArrayFT[23].anchorX = 0
ButtonArrayFT[23].anchorY = 0
ButtonArrayFT[23]:scale(0.1,0.1)
ButtonArrayFT[23].x = _W/1.26
ButtonArrayFT[23].y = _H/100
function confirmationHaloHorizontalBarLong()
		FloatersTypeTextDynamic.text = "Halo Horizontal Long Bar"
		Runtime:removeEventListener("touch",HaloHorizontalBarLongButtonFunction)
		confirmationtickcross(HaloHorizontalBarLong,26572)
	end 
	function HaloHorizontalBarLongFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Halo Horizontal Long Bar"
	function HaloHorizontalBarLongButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HaloHorizontalBarLong = display.newImage("Halo Horizontal Bar Short.png",event.x,event.y)
		HaloHorizontalBarLong.anchorX = 0.5
		HaloHorizontalBarLong.anchorY = 0.5
		displayRectLimits:insert(HaloHorizontalBarLong)
		groupFTRecord:insert(HaloHorizontalBarLong)
		confirmationHaloHorizontalBarLong()
	end
	end
end
       Runtime:addEventListener("touch",HaloHorizontalBarLongButtonFunction)
	end
	    ButtonArrayFT[24]= widget.newButton({
		defaultFile = "HaloHorizontalBarLongIcon.png",
		onRelease = HaloHorizontalBarLongFunction
		})
ButtonArrayFT[24].anchorX = 0
ButtonArrayFT[24].anchorY = 0
ButtonArrayFT[24]:scale(0.1,0.1)
ButtonArrayFT[24].x = _W/1.39
ButtonArrayFT[24].y = _H/100
function confirmationCurtainDown()
		FloatersTypeTextDynamic.text = "Curtain Down"
		Runtime:removeEventListener("touch",CurtainDownButtonFunction)
		confirmationtickcross(CurtainDown,234657)
	end 
	function CurtainDownFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Curtain Down"
	function CurtainDownButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		CurtainDown = display.newImage("Curtain Down.png",event.x,event.y)
		
		CurtainDown.anchorX = 0
		CurtainDown.anchorY = 0
		CurtainDown.width = pmaxx - pminx
		CurtainDown.height = (pmaxy - pminy) * 0.33 
		CurtainDown.x = pminx
		CurtainDown.y = pminy
		
		displayRectLimits:insert(CurtainDown)
		groupFTRecord:insert(CurtainDown)
		CurtainDown.id = "Curtain Down"
		confirmationCurtainDown()
	end
	end
end
       Runtime:addEventListener("touch",CurtainDownButtonFunction)
   end
	ButtonArrayFT[25]= widget.newButton({
		defaultFile = "CurtainDownIcon.png",
		onRelease = CurtainDownFunction
		})
ButtonArrayFT[25].anchorX = 0
ButtonArrayFT[25].anchorY = 0
ButtonArrayFT[25]:scale(0.1,0.1)
ButtonArrayFT[25].x = _W/1.61
ButtonArrayFT[25].y = _H/1.2
function confirmationHaloVerticalLong()
		FloatersTypeTextDynamic.text = "Halo Vertical Long"
		Runtime:removeEventListener("touch",HaloVerticalLongButtonFunction)
		confirmationtickcross(HaloVerticalLong,28481)
	end 
	function HaloVerticalLongFunction()
		RemoveButtonListeners()
		FloatersTypeTextDynamic.text = "Halo Vertical Long"
	function HaloVerticalLongButtonFunction(event)
		if event.phase == "ended" then
		if event.x < pminx or event.x > pmaxx or event.y < pminy or event.y > pmaxy then
			
			--Out of boundary, don't care first 	
		else
		HaloVerticalLong = display.newImage("Halo Vertical Long.png",event.x,event.y)
		HaloVerticalLong.anchorX = 0.5
		HaloVerticalLong.anchorY = 0.5
		displayRectLimits:insert(HaloVerticalLong)
		groupFTRecord:insert(HaloVerticalLong)
		confirmationHaloVerticalLong()
	end
	end
end
       Runtime:addEventListener("touch",HaloVerticalLongButtonFunction)
   end
	ButtonArrayFT[26]= widget.newButton({
		defaultFile = "HaloVerticalLongIcon.png",
		onRelease = HaloVerticalLongFunction
		})
ButtonArrayFT[26].anchorX = 0
ButtonArrayFT[26].anchorY = 0
ButtonArrayFT[26]:scale(0.1,0.1)
ButtonArrayFT[26].x = _W/1.555
ButtonArrayFT[26].y = _H/100

function DoneFunction()
for i = 1,27 do
	groupFTRecord:insert(ButtonArrayFT[i])
end

	function GoBackFTRF()
		messageDisplay.alpha = 0
	if(CheckEye == "Right Eye") then
		transition.fadeOut(captureFT,{time = 2000})
		coverYourLeftEyeTrackerRecording()
	elseif(CheckEye == "Left Eye") then
	storyboard.gotoScene("FloatersTracker",{effect="zoomOutIn"})
end
	end
 function NextFTRF()

 	captureFT:addEventListener("touch",GoBackFTRF)
 end

 local screenBounds =
    {
        xMin = _W/7.62,
        xMax = _W/1.16,
        yMin = _H/5.54,
        yMax = _H/1.245,
    }
    captureFT = display.captureBounds( screenBounds,true )
    captureFT.anchorX = 0
    captureFT.anchorY = 0
    

    captureFT.x = _W/7.62
    captureFT.y = _H/5.54

    messageDisplay = display.newText("Picture saved. Touch here to proceed.",_W*0.5,_H*0.7,font1,50)
    messageDisplay.anchorX = 0.5
    messageDisplay.anchorY = 0
    
    messageDisplay:setFillColor(0, 0.8, 0)
    messageDisplay.alpha = 1

    captureFTFileName = os.date("%d")..os.date("%m")..os.date("%Y")..os.date("%H")..os.date("%M")..os.date("%S")..".jpg"
    display.save(captureFT, {filename = captureFTFileName, baseDir = system.DocumentsDirectory })
	 groupFTRecord:insert(captureFT)
	timer.performWithDelay(500,NextFTRF)
    for i = 1,#pixelCountAdding do
    	NumberOfPixels = NumberOfPixels+pixelCountAdding[i] 
    end
    for row in db:nrows([[SELECT COUNT(*) AS NumberOfRecords FROM FloatersTracker]]) do
    	if(CheckEye == "Left Eye") then
    	insertAt = row.NumberOfRecords
        local sql = [[UPDATE FloatersTracker SET LeftEyeRecord="]]..captureFTFileName..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET NumberOfPixelsLeftEye = "]]..NumberOfPixels..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET NumberOfAssortedFloatersLeftEye = "]]..CountFloaters..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET darkDotLeftEye = "]]..DarkDotCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET haloDotLeftEye = "]]..HaloDotCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET DarkPatchLeftEye = "]]..DarkPatchCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET WeissRingLeftEye = "]]..WeissRingCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        elseif(CheckEye == "Right Eye") then
        insertAt = row.NumberOfRecords + 1
    	local sql = [[INSERT INTO FloatersTracker (Serial) VALUES ("]]..insertAt..[["); WHERE id = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET Date ="]]..dateNow..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET RightEyeRecord = "]]..captureFTFileName..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET NumberOfPixelsRightEye = "]]..NumberOfPixels..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET NumberOfAssortedFloatersRightEye = "]]..CountFloaters..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET darkDotRightEye = "]]..DarkDotCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET haloDotRightEye = "]]..HaloDotCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET DarkPatchRightEye = "]]..DarkPatchCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
        local sql = [[UPDATE FloatersTracker SET WeissRingRightEye = "]]..WeissRingCounter..[[" WHERE Serial = "]]..insertAt..[["]]
        db:exec(sql)
    end
    end
end
	ButtonArrayFT[27]= widget.newButton({
		defaultFile = "DoneFT.png",
		onRelease = DoneFunction
		})
ButtonArrayFT[27].anchorX = 0
ButtonArrayFT[27].anchorY = 0
ButtonArrayFT[27]:scale(0.21,0.21)
ButtonArrayFT[27].x = _W/1.06
ButtonArrayFT[27].y = _H/2.4
end
InstructionFTRecording()
end
function scene:enterScene( event )
storyboard.purgeScene("FloatersTracker")

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
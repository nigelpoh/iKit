display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
_W = display.viewableContentWidth
_H = display.viewableContentHeight


function scene:createScene(event)
local font1 = "Wensleydale Gothic NBP"
groupFloatersTrackerDescription = self.view
informationBoxFloatersTracker = display.newImageRect("Floaters.png", _W*0.94, _H*0.67)

informationBoxFloatersTracker.width = _W*0.94
informationBoxFloatersTracker.height = _H*0.67
informationBoxFloatersTracker.x = _W*0.03 
informationBoxFloatersTracker.y = _H*0.03

informationBoxFloatersTracker.anchorX = 0
informationBoxFloatersTracker.anchorY = 0
groupFloatersTrackerDescription:insert(informationBoxFloatersTracker)

local optionsinformationText = {
	
	text = "Eye floaters are suspended in the vitreous humour, the thick fluid or gel that fills the eye. The vitreous humour is a jelly-like, transparent substance that fills a majority of the eye. It lies within the vitreous chamber behind the lens, and is one of the four optical components of the eye. About 70% of the people will experience floaters in one form or another through their lives, especially when they age. Floaters are deposits of various size, shape, consistency, refractive index and motility within the eye's vitreous humour. At a young age, the vitreous is transparent. But as one ages, imperfections gradually develop. Floaters usually appears as spots, threads, strings, fragments of cobwebs.",
	x = _W*0.5,
	y = _H/1.5,
	font = font1,
	fontSize = 40,
	width = _W/1.1-20,
	height = _W/1.5,
	align = "center"
}
local informationText = display.newText(optionsinformationText)
informationText:setFillColor(0.1,0.1,0.1)
groupFloatersTrackerDescription:insert(informationText)
-- Function to handle button events

function FloatersGoBackMainMenu()
   storyboard.gotoScene("menu",{effect = "zoomOutIn"})
end
BackButtonFloaters = widget.newButton({
  	defaultFile = "back-button.png",
  	onRelease = FloatersGoBackMainMenu
 })

BackButtonFloaters.x = _W*0.9
BackButtonFloaters.y = _H*0.9
BackButtonFloaters:scale(0.3,0.3)
groupFloatersTrackerDescription:insert(BackButtonFloaters)



local function handleButtonEventFTVPR( event )
	storyboard.gotoScene("FloatersTrackerPastRecordViewing",{effect="zoomOutIn"})
end

local ViewPastRecords = widget.newButton
{
width = 150,
height = 150,
defaultFile = "ViewPastRecords.png",
onRelease = handleButtonEventFTVPR
}
ViewPastRecords.anchorX = 0
ViewPastRecords.anchorY = 0
ViewPastRecords.x = _W*0.1
ViewPastRecords.y = _H/1.35

groupFloatersTrackerDescription:insert(ViewPastRecords)

local function handleButtonEventFTRF( event )
	storyboard.gotoScene("FloatersTrackerRecordFloaters",{effect="zoomOutIn"})
end
local RecordFloaters = widget.newButton
{
width = 150,
height = 150,
defaultFile = "RecordFloaters.png",
onRelease = handleButtonEventFTRF
}
RecordFloaters.anchorX = 0
RecordFloaters.anchorY = 0
RecordFloaters.x = _W*0.6
RecordFloaters.y = _H/1.35

groupFloatersTrackerDescription:insert(RecordFloaters)
local function handleButtonEventFTA( event )
	storyboard.gotoScene("FloatersTrackerAnalyse",{effect="zoomOutIn"})
end
local Analyse = widget.newButton
{
width = 150,
height = 150,
defaultFile = "AnalysisFloatersTrackers.png",
onRelease = handleButtonEventFTA
}
Analyse.anchorX = 0
Analyse.anchorY = 0
Analyse.x = _W*0.35
Analyse.y = _H/1.35

groupFloatersTrackerDescription:insert(Analyse)
end
function scene:enterScene( event )
	storyboard.purgeScene("FloatersTrackerPastRecordViewing")
	storyboard.purgeScene("FloatersTrackerRecordFloaters")
	storyboard.purgeScene("FloatersTrackerAnalyse")
	storyboard.purgeScene("menu")
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
display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
local sqlite = require("sqlite3")
widget.setTheme("widget_theme_ios7")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
function scene:createScene(event)
    groupTable = display.newGroup()
	switchOn = {}
	CountFTASwitch = 0
    CountFTAFloatersLeft = 0
    CountFTAFloatersRight = 0
    CounterPixelAreaL = 0
    CounterPixelAreaR = 0
	local font1 = "Wensleydale Gothic NBP"
	local font2 = "Capitals"
    local path = system.pathForFile("iKit.sqlite",system.DocumentsDirectory)
    local db = sqlite.open(path)
    db:exec("CREATE TABLE IF NOT EXISTS FloatersTracker(id INTEGER PRIMARY KEY,Serial,Date,LeftEyeRecord,RightEyeRecord,NumberOfPixelsRightEye,NumberOfPixelsLeftEye,NumberOfAssortedFloatersLeftEye,NumberOfAssortedFloatersRightEye,darkDotRightEye,darkDotLeftEye,haloDotRightEye,haloDotLeftEye,DarkPatchLeftEye,DarkPatchRightEye,WeissRingLeftEye,WeissRingRightEye);") 
    local function onRowRender( event )
    local row = event.row
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
    indexNumberRow = row.index - 1
    function ResultDisplayFTA()
    groupAF = display.newGroup()
    displayTextFTARect = display.newRect(0,0,_W,_H)
    displayTextFTARect.anchorX = 0
    displayTextFTARect.anchorY = 0
    displayTextFTARect:setFillColor(1,1,1)
    groupAF:insert(displayTextFTARect)
    RightDisplay = display.newRect(_W/15,_H/1.4,_W/2.5,_H/4)
    RightDisplay.anchorX = 0
    RightDisplay.anchorY = 0
    RightDisplay:setStrokeColor(0,1,0)
    RightDisplay.strokeWidth = 10
    groupAF:insert(RightDisplay)
    LeftDisplay = display.newRect(_W/1.89,_H/1.4,_W/2.5,_H/4)
    LeftDisplay.anchorX = 0
    LeftDisplay.anchorY = 0
    LeftDisplay:setStrokeColor(0,1,0)
    LeftDisplay.strokeWidth = 10
    groupAF:insert(LeftDisplay)
    optionsAR = {
    text = "Left Eye ----- Analysis Results ----- Right Eye",
    y = _H*0.625,
    x = _W*0.5,
    fontSize = 30,
    font = font2,
    align = "center"
}
    AnalysisResults = display.newText(optionsAR)
    AnalysisResults.anchorX = 0.5
    AnalysisResults.anchorY = 0
    AnalysisResults:setFillColor(0,0,0)
    groupAF:insert(AnalysisResults)

    local scrollViewR = widget.newScrollView
    {
    top = _H/1.4,
    left = _W/1.89,
    width = _W/2.5,
    height = _H/4,
    backgroundColor = {0,199/255,209/255}
    }
    groupAF:insert(scrollViewR)
    local scrollViewL = widget.newScrollView
    {
    top = _H/1.4,
    left = _W/15,
    width = _W/2.5,
    height = _H/4,
    backgroundColor = {0,199/255,209/255}
    }
    groupAF:insert(scrollViewL)
    optionsDTFTAR = {
        text = " ",
        x = _W/100,
        y = _H/150,
        font = native.systemFont,
        fontSize = 24,
        width = _W/2.6
    }
    optionsDTFTAL = {
        text = " ",
        x = _W/100,
        y = _H/150,
        font = native.systemFont,
        fontSize = 24,
        width = _W/2.6
    }
    
        local displayTextFTAR = display.newText(optionsDTFTAR)
        displayTextFTAR.anchorX = 0
        displayTextFTAR.anchorY = 0
        displayTextFTAR:setFillColor(0,0,0)
        groupAF:insert(displayTextFTAR)
        local displayTextFTAL = display.newText(optionsDTFTAL)
        displayTextFTAL.anchorX = 0
        displayTextFTAL.anchorY = 0
        displayTextFTAL:setFillColor(0,0,0)
        groupAF:insert(displayTextFTAL)

        -- back button to Floaters Tracker
        function AnalyseGoBackMainMenu()
            groupAF:removeSelf()
            groupTable:removeSelf()
            storyboard.gotoScene("FloatersTracker",{effect = "zoomOutIn"})
        end
        BackButtonAnalyse = widget.newButton({
            defaultFile = "back-button.png",
            onRelease = AnalyseGoBackMainMenu
        })

        BackButtonAnalyse.x = _W*0.9
        BackButtonAnalyse.y = _H*0.2
        BackButtonAnalyse:scale(0.3,0.3)
        groupAF:insert(BackButtonAnalyse)

    	table.sort( switchOn )
			for i in db:nrows([[SELECT * FROM FloatersTracker WHERE id = "]]..switchOn[1]..[["]]) do
			for j in db:nrows([[SELECT * FROM FloatersTracker WHERE id = "]]..switchOn[2]..[["]]) do
            LeftEyeRecordFTANew = display.newImageRect(j.LeftEyeRecord,system.DocumentsDirectory,_W,_H)
            LeftEyeRecordFTANew.anchorX = 0
            LeftEyeRecordFTANew.anchorY = 0
            LeftEyeRecordFTANew.x = _W/5
            LeftEyeRecordFTANew.y = _H/2.5
            LeftEyeRecordFTANew:setStrokeColor(0,1,0)
            LeftEyeRecordFTANew.strokeWidth = 10
            LeftEyeRecordFTANew:scale(0.2,0.2)
            groupAF:insert(LeftEyeRecordFTANew)
            RightEyeRecordFTANew = display.newImageRect(j.RightEyeRecord,system.DocumentsDirectory,_W,_H)
            RightEyeRecordFTANew.anchorX = 0
            RightEyeRecordFTANew.anchorY = 0
            RightEyeRecordFTANew.x = _W/1.7
            RightEyeRecordFTANew.y = _H/2.5
            RightEyeRecordFTANew:setStrokeColor(0,1,0)
            RightEyeRecordFTANew.strokeWidth = 10
            RightEyeRecordFTANew:scale(0.2,0.2)
            groupAF:insert(RightEyeRecordFTANew)
            LeftEyeRecordFTAOld = display.newImageRect(i.LeftEyeRecord,system.DocumentsDirectory,_W,_H)
            LeftEyeRecordFTAOld.anchorX = 0
            LeftEyeRecordFTAOld.anchorY = 0
            LeftEyeRecordFTAOld.x = _W/5
            LeftEyeRecordFTAOld.y = _H/10
            LeftEyeRecordFTAOld:setStrokeColor(0,1,0)
            LeftEyeRecordFTAOld.strokeWidth = 10
            LeftEyeRecordFTAOld:scale(0.2,0.2)
            groupAF:insert(LeftEyeRecordFTAOld)
            RightEyeRecordFTAOld = display.newImageRect(i.RightEyeRecord,system.DocumentsDirectory,_W,_H)
            RightEyeRecordFTAOld.anchorX = 0
            RightEyeRecordFTAOld.anchorY = 0
            RightEyeRecordFTAOld.x = _W/1.7
            RightEyeRecordFTAOld.y = _H/10
            RightEyeRecordFTAOld:setStrokeColor(0,1,0)
            RightEyeRecordFTAOld.strokeWidth = 10
            RightEyeRecordFTAOld:scale(0.2,0.2)
            groupAF:insert(RightEyeRecordFTAOld)

            EyeRecordFTAOldDateOptions = {
            text = i.Date, 
            y = _H/3.1, 
            x = _W/2.4,
            font = font2,
            fontSize = 30,
            align = "center"
            }

            ProgressArrowOld = display.newText("↜",_W/3.8,_H/2.6,native.systemFontBold,60)
            ProgressArrowOld.anchorX = 0
            ProgressArrowOld.anchorY = 0
            ProgressArrowOld:rotate(270)
            ProgressArrowOld:setFillColor(0,0,0)
            groupAF:insert(ProgressArrowOld)
            ProgressArrowNew = display.newText("↜",_W/1.555,_H/2.6,native.systemFontBold,60)
            ProgressArrowNew.anchorX = 0
            ProgressArrowNew.anchorY = 0
            ProgressArrowNew:rotate(270)
            ProgressArrowNew:setFillColor(0,0,0)
            groupAF:insert(ProgressArrowNew)
            EyeRecordFTAOldDate = display.newText(EyeRecordFTAOldDateOptions)
            EyeRecordFTAOldDate.anchorX = 0
            EyeRecordFTAOldDate.anchorY = 0
            EyeRecordFTAOldDate:setFillColor(0,0,0)
            groupAF:insert(EyeRecordFTAOldDate)

            EyeRecordFTANewDateOptions = {
            text = j.Date, 
            y = _H/35, 
            x = _W/2.4,
            font = font2,
            fontSize = 30,
            align = "center"
            }
            EyeRecordFTANewDate = display.newText(EyeRecordFTANewDateOptions)
            EyeRecordFTANewDate.anchorX = 0
            EyeRecordFTANewDate.anchorY = 0
            EyeRecordFTANewDate:setFillColor(0,0,0)
            groupAF:insert(EyeRecordFTANewDate)
            gotResultL = false
            gotResultR = false

        if(tonumber(i.haloDotRightEye) > 5 and ((tonumber(j.haloDotRightEye)-tonumber(i.haloDotRightEye))/tonumber(i.haloDotRightEye))*100 >= 100) then
			CountFTAFloatersRight = CountFTAFloatersRight + 1
            displayTextFTAR.text = displayTextFTAR.text.."\n\nRisk of retinal tear as there is a significant increase in halo dots you see (More than 100%)."  	
    	    gotResultR = true
        end
        if(tonumber(i.darkDotRightEye) > 5 and ((tonumber(j.darkDotRightEye)-tonumber(i.darkDotRightEye))/tonumber(i.darkDotRightEye))*100 >= 100) then
            CountFTAFloatersRight = CountFTAFloatersRight + 1
            displayTextFTAR.text = displayTextFTAR.text.."\n\nIt seems that you have many blood dots in your retina as there is a significant increase in dots you see (More than 100%)." 
            gotResultR = true
        end    
        if(tonumber(j.DarkPatchRightEye) >= 1) then
            CountFTAFloatersRight = CountFTAFloatersRight + 1
            displayTextFTAR.text = displayTextFTAR.text.."\n\nRisk of mascula degeneration as you see a Dark Patch. Please use the Amsler Grid Test to confirm. If tested positive, please consult your doctor immediately as muscula degeneration might result in retinal detachment and/or total blindness." 
            gotResultR = true
        end
        if(tonumber(j.WeissRingRightEye) >= 1) then
            CountFTAFloatersRight = CountFTAFloatersRight + 1
            displayTextFTAR.text = displayTextFTAR.text.."\n\nA Weiss ring floater is always associated with a Posterior Vitreous Detachment (PVD) and can occasionally lead to retinal tear or detachment. It is usually clustered away from the retina and lens and can be treated with laser." 
            gotResultR = true
        end

        if(tonumber(i.NumberOfAssortedFloatersRightEye) > 3 and ((tonumber(j.NumberOfAssortedFloatersRightEye)-tonumber(i.NumberOfAssortedFloatersRightEye))/tonumber(i.NumberOfAssortedFloatersRightEye))*100 >= 100) then
            CountFTAFloatersRight = CountFTAFloatersRight + 1
            displayTextFTAR.text = displayTextFTAR.text.."\n\nThere is a risk of retina tear or retinal detachment as there is a significant increase in the number of floaters you see (More than 100%)." 
            gotResultR = true
        end
        if(tonumber(i.haloDotLeftEye) > 5 and ((tonumber(j.haloDotLeftEye)-tonumber(i.haloDotLeftEye))/tonumber(i.haloDotLeftEye))*100 >= 100) then
            CountFTAFloatersLeft = CountFTAFloatersLeft + 1
            displayTextFTAL.text = displayTextFTAL.text.."\n\nRisk of retinal tear as there is a significant increase in halo dots you see (More than 100%)."
            gotResultL = true
        end
        if(tonumber (i.darkDotLeftEye) > 5 and ((tonumber(j.darkDotLeftEye)-tonumber(i.darkDotLeftEye))/tonumber(i.darkDotLeftEye))*100 >= 100) then
            CountFTAFloatersLeft = CountFTAFloatersLeft + 1
            displayTextFTAL.text = displayTextFTAL.text.."\n\nIt seems that you have many blood dots in your retina as there is a significant increase in dots you see (More than 100%)."
            gotResultL = true
        end 
        if(tonumber(j.DarkPatchLeftEye) >= 1) then
            CountFTAFloatersLeft = CountFTAFloatersLeft + 1
            displayTextFTAL.text = displayTextFTAL.text.."\n\nRisk of mascula degeneration as you see a Dark Patch. Please use the Amsler Grid Test to confirm. If tested positive, please consult your doctor immediately as muscula degeneration might result in retinal detachment and/or total blindness."
            gotResultL = true
        end

        if(tonumber(j.WeissRingLeftEye) >= 1) then
            CountFTAFloatersLeft = CountFTAFloatersLeft + 1
            displayTextFTAL.text = displayTextFTAL.text.."\n\nA Weiss ring floater is always associated with a Posterior Vitreous Detachment (PVD) and can occasionally lead to retinal tear or detachment. It is usually clustered away from the retina and lens and can be treated with laser."
            gotResultL = true
        end 

        if(tonumber(i.NumberOfAssortedFloatersLeftEye) > 3 and ((tonumber(j.NumberOfAssortedFloatersLeftEye)-tonumber(i.NumberOfAssortedFloatersLeftEye))/tonumber(i.NumberOfAssortedFloatersLeftEye))*100 >= 100) then
            CountFTAFloatersLeft = CountFTAFloatersLeft + 1
            displayTextFTAL.text = displayTextFTAL.text.."\n\nThere is a risk of retina tear or retinal detachment as there is a significant increase in the number of floaters you see (More than 100%)."
            gotResultL = true
        end
        if(CountFTAFloatersLeft > 0) then
            displayTextFTAL.text = "It is advisable that you consult your Eye Doctor. "..displayTextFTAL.text
            
        end
        if(tonumber(i.NumberOfPixelsLeftEye) > 0 and ((tonumber(j.NumberOfPixelsLeftEye)-tonumber(i.NumberOfPixelsLeftEye))/tonumber(i.NumberOfPixelsLeftEye))*100 >= 100 and CountFTAFloatersLeft == 0) then
            CounterPixelAreaL = CounterPixelAreaL + 1
            displayTextFTAL.text = "Please consult your doctor as the floaters area in your left eye have increased significantly, which will impede your vision."     
            gotResultL = true
        end
        if(tonumber(i.NumberOfPixelsRightEye)> 0 and ((tonumber(j.NumberOfPixelsRightEye)-tonumber(i.NumberOfPixelsRightEye))/tonumber(i.NumberOfPixelsRightEye))*100 >= 100 and CountFTAFloatersRight == 0) then
            CounterPixelAreaR = CounterPixelAreaR + 1
            displayTextFTAR.text = "Please consult your doctor as the floaters area in your right eye have increased significantly, which will impede your vision."     
            gotResultR = true
        end
        

        if(CountFTAFloatersRight > 0) then
            displayTextFTAR.text = "It is advisable that you consult your Eye Doctor. "..displayTextFTAR.text
            
        end
        end
    end
    if(NumberOfPixelsLeftEye == 0) then
            displayTextFTAL.text = "Your left eye is in tip top condition. You do not have any floaters in your left eye."
            gotResultL = true
    end
    if(NumberOfPixelsRightEye == 0) then
        displayTextFTAR.text = "Your right eye is in tip top condition. You do not have any floaters in your right eye."
        gotResult = true
    end



    if(gotResultL == false) then
        displayTextFTAL.text = "Your left eye's situation is stable. Please continue to monitor the floaters in your left eye."
    end

    if(gotResultR == false) then
        displayTextFTAR.text = "Your right eye's situation is stable. Please continue to monitor the floaters in your right eye."
    end

    
    scrollViewR:insert(displayTextFTAR)
    scrollViewL:insert(displayTextFTAL)
    end
    local function onSwitchPress( event )
    	switch = event.target
    	function DoneFTAFunction()
    	ResultDisplayFTA()
    	end
    	if(switch.isOn == true) then
    	CountFTASwitch = CountFTASwitch + 1
        if(CountFTASwitch == 0) then
            CountFTASwitch = 1
        end
    	
    	if CountFTASwitch > 2 then
    		switch:setState({isOn = false})
    	else
    	if CountFTASwitch == 2 then
    	local DoneFTA = display.newImage("DoneFT.png")
    	DoneFTA.anchorX = 0
    	DoneFTA.anchorY = 0
    	DoneFTA.x = _W/1.1
    	DoneFTA.y = _H/1.2
    	DoneFTA:scale(0.3,0.3)
        groupTable:insert(DoneFTA)
    	DoneFTA:addEventListener("touch",DoneFTAFunction)
    	switchOn[CountFTASwitch] = switch.id
   		
else 
	switchOn[CountFTASwitch] = switch.id
    
end
end
else
	if CountFTASwitch > 2 then
	CountFTASwitch = 1
	table.remove(switchOn,switch.id)
	
else
	table.remove(switchOn,switch.id)
	CountFTASwitch = CountFTASwitch - 1
	
end
end
end
    if row.index == 1 then
    local IndexNumberTitle = display.newText( row, "Index Number", 0, 0, font2, 20 )
    IndexNumberTitle:setFillColor( 0,0,0 )
    IndexNumberTitle.anchorX = 0
    IndexNumberTitle.x = _W/100
    IndexNumberTitle.y = rowHeight * 0.5
    groupTable:insert(IndexNumberTitle)
    local dateFTATitle = display.newText(row,"Date", 0,0,font2,20)
    dateFTATitle:setFillColor( 0.3,0.3,0.3 )
    dateFTATitle.anchorX = 0
    dateFTATitle.x = _W/6
    dateFTATitle.y = rowHeight * 0.5
    groupTable:insert(dateFTATitle)
    local PickTitle = display.newText(row,"Pick 2 records",0,0,font2,20)
    PickTitle:setFillColor(0.5,0,0.8)
    PickTitle.anchorX = 0
    PickTitle.x = _W/1.25
    PickTitle.y = rowHeight * 0.5
    groupTable:insert(PickTitle)
    local leftEyeRecordFTATitle = display.newText(row,"Left Eye Record",0,0,font2,20)
    leftEyeRecordFTATitle:setFillColor( 0,0,0.5 )
    leftEyeRecordFTATitle.anchorX = 0
    leftEyeRecordFTATitle.x = _W/3
    leftEyeRecordFTATitle.y = rowHeight * 0.5
    groupTable:insert(leftEyeRecordFTATitle)
    local rightEyeRecordFTATitle = display.newText(row,"Right Eye Record",0,0,font2,20)
    rightEyeRecordFTATitle:setFillColor( 0,0.5,0.5 )
    rightEyeRecordFTATitle.anchorX = 0
    rightEyeRecordFTATitle.x = _W/1.8
    rightEyeRecordFTATitle.y = rowHeight * 0.5
    groupTable:insert(rightEyeRecordFTATitle)
    else
    for i in db:nrows([[SELECT * FROM FloatersTracker WHERE id = "]]..indexNumberRow..[["]]) do
    local IndexNumber = display.newText( row, row.index-1, 0, 0, font2, 14 )
    IndexNumber:setFillColor( 0 )
    IndexNumber.anchorX = 0
    IndexNumber.x = _W/100
    IndexNumber.y = rowHeight * 0.5
   
    local date = display.newText(row,i.Date, 0,0,font2,20)
    date:setFillColor( 0.3,0.3,0.3 )
    date.anchorX = 0
    date.x = _W/6
    date.y = rowHeight * 0.5
    
    optionsFTAS = {
    left = _W/1.2,
    top = rowHeight * 0.2,
    style = "checkbox",
    id = indexNumberRow,         
    onRelease = onSwitchPress
	}  
    checkbox = widget.newSwitch(optionsFTAS)    
	checkbox.anchorX = 0
    groupTable:insert(checkbox)
	row:insert(checkbox)
	local leftEyeRecordFTA = display.newText(row,i.LeftEyeRecord,0,0,font2,15)
    leftEyeRecordFTA:setFillColor( 0,0,0.5 )
    leftEyeRecordFTA.anchorX = 0
    leftEyeRecordFTA.x = _W/3
    leftEyeRecordFTA.y = rowHeight * 0.5
    
    local rightEyeRecordFTA = display.newText(row,i.RightEyeRecord,0,0,font2,15)
    rightEyeRecordFTA:setFillColor( 0,0.5,0.5 )
    rightEyeRecordFTA.anchorX = 0
    rightEyeRecordFTA.x = _W/1.8
    rightEyeRecordFTA.y = rowHeight * 0.5
    
    end
end
	-- Handle press events for the checkbox
end
tableViewFloatersAnalysis = widget.newTableView
{
    left = 0,
    top = 0,
    height = _H,
    width = _W,
    onRowRender = onRowRender,
    onRowTouch = onRowTouch,
    listener = scrollListener
}

-- Insert 101 rows
for i = 1, 101 do

    local isCategory = false
    local rowHeight = 50
    local rowColor = { default={ 1, 1, 1}, over={ 1, 0.5, 0, 0.2 } }
    local lineColor = { 0.5, 0.5, 0.5 }

    -- Make some rows categories
    if ( i == 1) then
        isCategory = true
        rowHeight = 40
        rowColor = { default={ 0.8, 0.5, 0.5, 0.8 } }
        lineColor = { 1, 0, 0 }
    end

    -- Insert a row into the tableView
    tableViewFloatersAnalysis:insertRow(
        {
            isCategory = isCategory,
            rowHeight = rowHeight,
            rowColor = rowColor,
            lineColor = lineColor
        }
    )

end  
groupTable:insert(tableViewFloatersAnalysis ) 

-- back button to Floaters Tracker on the first page
        function Analyse1GoBackMainMenu()
            
            groupTable:removeSelf()
            storyboard.gotoScene("FloatersTracker",{effect = "zoomOutIn"})
        end
        BackButtonAnalyse1 = widget.newButton({
            defaultFile = "back-button.png",
            onRelease = Analyse1GoBackMainMenu
        })

        BackButtonAnalyse1.x = _W*0.1
        BackButtonAnalyse1.y = _H*0.9
        BackButtonAnalyse1:scale(0.3,0.3)
        groupTable:insert(BackButtonAnalyse1)

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
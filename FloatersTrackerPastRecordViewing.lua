display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")
local sqlite = require("sqlite3")
_W = display.viewableContentWidth
_H = display.viewableContentHeight
widget.setTheme("widget_theme_ios7")
--widget.setTheme("widget_theme_android_holo_light")

function scene:createScene(event)
    storage = {}
    
    viewFTGroupPRV = display.newGroup()
    viewFTGroup = display.newGroup()
    
    local font1 = "Wensleydale Gothic NBP" 
	local font2 = "Capitals"
    local path = system.pathForFile("iKit.sqlite",system.DocumentsDirectory)
    local db = sqlite.open(path)
    
    db:exec("CREATE TABLE IF NOT EXISTS FloatersTracker(id INTEGER PRIMARY KEY,Serial,Date,LeftEyeRecord,RightEyeRecord,NumberOfPixelsRightEye,NumberOfPixelsLeftEye,NumberOfAssortedFloatersLeftEye,NumberOfAssortedFloatersRightEye,darkDotRightEye,darkDotLeftEye,haloDotRightEye,haloDotLeftEye,DarkPatchLeftEye,DarkPatchRightEye,WeissRingLeftEye,WeissRingRightEye);") 
    
    rowHeight = 40

    --white background
    whiteBK = display.newRect(0,0,_W,_H)
    whiteBK:setFillColor(0.8, 0.5, 0.5)
    whiteBK.anchorX = 0;whiteBK.anchorY = 0

    viewFTGroupPRV:insert(whiteBK)
    local serialNumberTitle = display.newText( "Serial Number", 0, 0, font2, 20 )
    serialNumberTitle:setFillColor( 0,0,0 )

    -- Align the label left and vertically centered
    serialNumberTitle.anchorX = 0
    
    serialNumberTitle.x = _W/100
    serialNumberTitle.y = rowHeight * 0.5
    viewFTGroupPRV:insert(serialNumberTitle)
    local dateTitle = display.newText("Date", 0,0,font2,20)
    dateTitle:setFillColor( 0.3,0.3,0.3 )
    dateTitle.anchorX = 0
   
    dateTitle.x = _W/6
    dateTitle.y = rowHeight * 0.5
    viewFTGroupPRV:insert(dateTitle)
    local leftEyeRecordTitle = display.newText("Left Eye Record",0,0,font2,20)
    leftEyeRecordTitle:setFillColor( 0,0,0.5 )
    leftEyeRecordTitle.anchorX = 0
  
    leftEyeRecordTitle.x = _W/3
    leftEyeRecordTitle.y = rowHeight * 0.5
    viewFTGroupPRV:insert(leftEyeRecordTitle)
    local rightEyeRecordTitle = display.newText("Right Eye Record",0,0,font2,20)
    rightEyeRecordTitle:setFillColor( 0,0.5,0.5 )
    rightEyeRecordTitle.anchorX = 0
   
    rightEyeRecordTitle.x = _W/2
    rightEyeRecordTitle.y = rowHeight * 0.5
    viewFTGroupPRV:insert(rightEyeRecordTitle)
    local emailTitle = display.newText("Email",0,0,font2,20)
    emailTitle:setFillColor(0.5,0,0.8)
    emailTitle.anchorX = 0
   
    emailTitle.x = _W/1.43
    emailTitle.y = rowHeight * 0.5
    viewFTGroupPRV:insert(emailTitle)
    local deleteTitle = display.newText("Delete",0,0,font2,20)
    deleteTitle:setFillColor(0.5,0.5,0)
    deleteTitle.anchorX = 0
    
    deleteTitle.x = _W/1.25
    deleteTitle.y = rowHeight * 0.5
    viewFTGroupPRV:insert(deleteTitle)
    local viewTitle = display.newText("View",0,0,font2,20)
    viewTitle:setFillColor(0.5,0.4,0.8)
    viewTitle.anchorX = 0
  
    viewTitle.x = _W/1.1
    viewTitle.y = rowHeight * 0.5 
    viewFTGroupPRV:insert(viewTitle) 


    local function onRowRender( event )
    -- Get reference to the row group
    local row = event.row
    local rowHeight = row.height * 0.5
    local rowWidth = row.width
    
    rowIndex = row.index-1
    row.Serial = display.newText( row, row.index, 0, 0, font2, 14 )
    row.Serial:setFillColor( 0 )
    row.Serial.anchorX = 0
    row.Serial.x = _W/100
    row.Serial.y = rowHeight * 0.5
    
    
    function delRow(event)

        
        -- Load the data from database into the temp memory
       
        local sql = [[SELECT * FROM FloatersTracker]]  
        p = 0
        for row in db:nrows(sql) do
        
        p = p + 1
        storage[p]={}
        
        storage[p].Serial = row.Serial
        storage[p].Date = row.Date
        storage[p].LeftEyeRecord = row.LeftEyeRecord
        storage[p].RightEyeRecord = row.RightEyeRecord
        storage[p].NumberOfPixelsRightEye = row.NumberOfPixelsRightEye
        storage[p].NumberOfPixelsLeftEye = row.NumberOfPixelsLeftEye
        storage[p].NumberOfAssortedFloatersRightEye = row.NumberOfAssortedFloatersRightEye
        storage[p].NumberOfAssortedFloatersLeftEye = row.NumberOfAssortedFloatersLeftEye
        storage[p].darkDotRightEye = row.darkDotRightEye
        storage[p].darkDotLeftEye = row.darkDotLeftEye
        storage[p].haloDotRightEye = row.haloDotRightEye
        storage[p].haloDotLeftEye = row.haloDotLeftEye
        storage[p].DarkPatchRightEye = row.DarkPatchRightEye
        storage[p].DarkPatchLeftEye = row.DarkPatchLeftEye
        storage[p].WeissRingRightEye = row.WeissRingRightEye
        storage[p].WeissRingLeftEye = row.WeissRingLeftEye

        end -- for row

        -- Flush out all the data in the database
        local sql = [[DROP TABLE FloatersTracker]]
        db:exec(sql)
        tableViewFloaters:deleteRow(event.target.id)
        
        -- dete row from temp memory
        table.remove(storage,event.target.id)
        
        -- Re-render the serial number
       
        for u = 1, #storage do
            storage[u].Serial = u
        end
        
        
        
        db:exec("CREATE TABLE IF NOT EXISTS FloatersTracker (id INTEGER PRIMARY KEY, Serial INTEGER, Date, LeftEyeRecord, RightEyeRecord,NumberOfPixelsRightEye,NumberOfPixelsLeftEye,NumberOfAssortedFloatersLeftEye,NumberOfAssortedFloatersRightEye,darkDotRightEye,darkDotLeftEye,haloDotRightEye,haloDotLeftEye,DarkPatchLeftEye,DarkPatchRightEye,WeissRingLeftEye,WeissRingRightEye);") 

        local rowCount = 0
        for row in db:nrows("SELECT * FROM FloatersTracker") do 
            rowCount = rowCount + 1
        end
      
            for k=1,#storage  do
                   
            local sql = [[INSERT INTO FloatersTracker ("Date") VALUES("]] .. storage[k].Date.. [[");]]
            db:exec(sql)

            local sql = [[SELECT COUNT(Date) AS count FROM FloatersTracker]]
                    for row in db:nrows(sql) do
                    local sql = [[UPDATE FloatersTracker SET Serial ="]] .. storage[k].Serial..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                
                    local sql = [[UPDATE FloatersTracker SET LeftEyeRecord = "]]..storage[k].LeftEyeRecord..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET RightEyeRecord = "]]..storage[k].RightEyeRecord..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET NumberOfPixelsRightEye = "]]..storage[k].NumberOfPixelsRightEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET NumberOfPixelsLeftEye = "]]..storage[k].NumberOfPixelsLeftEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET NumberOfAssortedFloatersRightEye = "]]..storage[k].NumberOfAssortedFloatersRightEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET NumberOfAssortedFloatersLeftEye = "]]..storage[k].NumberOfAssortedFloatersLeftEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET darkDotRightEye = "]]..storage[k].darkDotRightEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET darkDotLeftEye = "]]..storage[k].darkDotLeftEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET haloDotRightEye = "]]..storage[k].haloDotRightEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET haloDotLeftEye = "]]..storage[k].haloDotLeftEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET DarkPatchRightEye = "]]..storage[k].DarkPatchRightEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET DarkPatchLeftEye = "]]..storage[k].DarkPatchLeftEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET WeissRingRightEye = "]]..storage[k].WeissRingRightEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    local sql = [[UPDATE FloatersTracker SET WeissRingLeftEye = "]]..storage[k].WeissRingLeftEye..[[" WHERE id="]]..k..[["]]
                    db:exec(sql)
                    end -- for row
        
            end -- for k
        
        
        tableViewFloaters.isVisible = false
        backButtonFTPRV.isVisible = false
        viewFTGroupPRV.isVisible = false
        viewFTGroup.isVisible = false
        
        storyboard.gotoScene("RefreshScene")
    end --delRow
    

    row.btn1 = widget.newButton ({

        id = row.index,
        defaultFile = "Delete.png",
        overFile = "Delete.png",
        width = rowHeight*1.3,
        height = rowHeight*1.3,
        onRelease = delRow
    })
    row.btn1.anchorX = 0
    row.btn1.x = _W/1.23
    row.btn1.y = row.height * 0.5
    
    row.Date = display.newText(row,row.params.Date, 0,0,font2,20)
    row.Date:setFillColor( 0.3,0.3,0.3 )
    row.Date.anchorX = 0
    row.Date.x = _W/6
    row.Date.y = rowHeight * 0.5
    
    row.LeftEyeRecord = display.newText(row,row.params.LeftEyeRecord,0,0,font2,15)
    row.LeftEyeRecord:setFillColor( 0,0,0.5 )
    row.LeftEyeRecord.anchorX = 0
    row.LeftEyeRecord.x = _W/3
    row.LeftEyeRecord.y = rowHeight * 0.5
    
    row.rightEyeRecord = display.newText(row,row.params.RightEyeRecord,0,0,font2,15)
    row.rightEyeRecord:setFillColor( 0,0.5,0.5 )
    row.rightEyeRecord.anchorX = 0
    row.rightEyeRecord.x = _W/2
    row.rightEyeRecord.y = rowHeight * 0.5
    
    function emailTo()
    local options =
    {
     subject = "Floaters Diagrams Recorded on: "..row.params.Date,
     body = "Floaters diagrams recorded on: "..row.params.Date..". Left Eye File: "..row.params.LeftEyeRecord..", Right Eye File: "..row.params.RightEyeRecord,
     attachment = {
     { baseDir = system.DocumentsDirectory, filename=row.params.LeftEyeRecord, type="image" },
     { baseDir = system.DocumentsDirectory, filename=row.params.RightEyeRecord,type="image"},
        },
    }
        native.showPopup( "mail", options )
    end -- emailTo

    row.btn2 = widget.newButton ({
        id = row.index,
        defaultFile = "Email.png",
        overFile = "Email.png",
        width = rowHeight * 1.8,
        height = rowHeight,
        onRelease = emailTo

    })
    row.btn2.anchorX = 0
    row.btn2.x = _W/1.43
    row.btn2.y = row.height * 0.5


    function viewFunction()
        tableViewFloaters.isVisible = false
        backButtonFTPRV.isVisible = false
        viewFTGroupPRV.isVisible = false
        backgroundBlanking = display.newRect(0,0,_W,_H)
        backgroundBlanking.anchorX = 0
        backgroundBlanking.anchorY = 0
        backgroundBlanking:setFillColor(1,1,1)
        viewFTGroup:insert(backgroundBlanking)
       

        -- Title of page
        ViewTitleText = display.newText("Viewing of Records from "..row.params.Date,_W*0.5,_H*0.1,font1,50)
        ViewTitleText.anchorX = 0.5
        ViewTitleText.anchorY = 0.5
        ViewTitleText:setFillColor(0,0.8,0)
        viewFTGroup:insert(ViewTitleText)

        LED = display.newImageRect(row.params.LeftEyeRecord,system.DocumentsDirectory,_W*0.5,_H*0.5)
        LED:setStrokeColor( 1, 0, 0 )
        LED.strokeWidth = 5
        LED.anchorX = 0
        LED.anchorY = 0
        LED.x = 0;LED.y = _H*0.15
        
        viewFTGroup:insert(LED)
        
        LEDText = display.newText("Left Eye File: "..row.params.LeftEyeRecord,_W*0.25,_H*0.7,font2,25)
        LEDText.anchorX = 0.5
        LEDText.anchorY = 0.5
        LEDText:setFillColor(0.7,0.7,0.7)
        viewFTGroup:insert(LEDText)
        
        RED = display.newImageRect(row.params.RightEyeRecord,system.DocumentsDirectory,_W*0.5,_H*0.5)
        RED.anchorX = 0
        RED.anchorY = 0
        RED.x = _W*0.5;RED.y = _H*0.15
        
        RED:setStrokeColor( 1, 0, 0 )
        RED.strokeWidth = 5
        
        viewFTGroup:insert(RED)
        REDText = display.newText("Right Eye File: "..row.params.RightEyeRecord,_W*0.75,_H*0.7,font2,25)
        REDText.anchorX = 0.5
        REDText.anchorY = 0.5
        REDText:setFillColor(0.7,0.7,0.7)
        viewFTGroup:insert(REDText)
        
        function backButtonFTBack()
            
            viewFTGroup:toBack()
            backButtonFTPRV.isVisible = true
            tableViewFloaters.isVisible = true
            viewFTGroupPRV.isVisible = true
        end 
        backButtonFT = widget.newButton({
            defaultFile = "back-button.png",
            onRelease = backButtonFTBack
            })
        backButtonFT.width = 100
        backButtonFT.height = 100
        backButtonFT.x = _W/2
        backButtonFT.y = _H/1.1
        viewFTGroup:insert(backButtonFT)
        return true
    end -- view function

    row.btn3 = widget.newButton({
        id = row.index,
        defaultFile = "View.png",
        overFile = "View.png",
        width = rowHeight*1.8,
        height = rowHeight,
        onRelease = viewFunction
    })
    row.btn3.anchorX = 0
    row.btn3.x = _W/1.1
    row.btn3.y = row.height * 0.5

    
    row:insert(row.btn1)
    row:insert(row.btn2)
    row:insert(row.btn3)
    --end -- for the big if
--end
end -- for onRowRender


	tableViewFloaters = widget.newTableView
    {
    left = 0,
    top = rowHeight,
    height = _H,
    width = _W,
    onRowRender = onRowRender,
    backgroundColor = {1,1,1}
    }



local sql = "SELECT * FROM FloatersTracker"

    local isCategory = false
    local rowHeight = 50
    local rowColor = { default={ 1, 1, 1}, over={ 1, 0.5, 0, 0.2 } }
    local lineColor = { 0.5, 0.5, 0.5 }


for row in db:nrows(sql) do 
    local rowParams = {
        SerialNumber = row.Serial,
        Date = row.Date,
        LeftEyeRecord = row.LeftEyeRecord,
        RightEyeRecord = row.RightEyeRecord

    }
    
    -- Insert a row into the tableView
    tableViewFloaters:insertRow(
        {
            isCategory = isCategory,
            rowHeight = rowHeight,
            rowColor = rowColor,
            lineColor = lineColor,
            params = rowParams
        }
    )
end

    function eventReleaseFTPRV(event)
        if event.phase == "ended" then
       
        viewFTGroupPRV:removeSelf()
        viewFTGroup:removeSelf()
        display.remove(backButtonFTPRV)
        display.remove(tableViewFloaters)
      
        storyboard.gotoScene("FloatersTracker",{effect = "zoomOutIn"})   
        end
    end
    backButtonFTPRV = widget.newButton({
    defaultFile = "back-button.png",
    onEvent = eventReleaseFTPRV
    })
    backButtonFTPRV.x = _W/1.1
    backButtonFTPRV.y = _H/1.15
    backButtonFTPRV:scale(0.5,0.5)
    
    
end
function scene:enterScene( event ) 
	storyboard.purgeScene("FloatersTracker")
    storyboard.purgeScene("RefreshScene")
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
display.setStatusBar(display.HiddenStatusBar)
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require("widget")


function scene:createScene(event)
_W = display.viewableContentWidth
_H = display.viewableContentHeight
local physics = require ("physics")	--Require physics
physics.start(); physics.setGravity( 0, 0 ) --Start physics

-----------------------------------------------
--*** Set up our variables and group ***
-----------------------------------------------
local levelGroup = display.newGroup()
local enemyGroup = display.newGroup()
local weaponGroup = display.newGroup()

local _W = display.viewableContentWidth
local _H = display.viewableContentHeight
local mr = math.random --Localise math.random

local stars1, stars2 --Background moving stars
local gameIsActive = true 
local spawnInt = 0 --Gameloop spawn control
local spawnIntMax = 30 --Gameloop max spawn
local spawned = 0 --Keep track of enemies
local spawnedMax = 10 --Max allowed per level
local score = 0
local wave = 1
local enemySpeed = 3 --How fast the enemies are
local scoreTextSS; local levelTextSS; local ship; 


GSgroup = self.view

--load background music
GSbackMusic = audio.loadSound("BGM_0.mp3")
audio.setVolume (0.1)
GSbackSound = audio.play(GSbackMusic)

	

-----------------------------------------------
--*** Set up our text objects and ship ***
-----------------------------------------------
local function levelSetup()
	stars1 = display.newImageRect("images/starField.jpg", _W,_H)
	stars1.x = _W*0.5; stars1.y = _H*0.5
	levelGroup:insert(stars1)
	stars2 = display.newImageRect("images/starField.jpg", _W,_H)
	stars2.x = _W*0.5; stars2.y = _H*0.5-480
	levelGroup:insert(stars2)
	font1 = "Wensleydale Gothic NBP"

	--[[function GoBackLazyEyeTrainerMenu(event)
   	if event.phase == "ended" then
   		physics.stop()	
   		storyboard.gotoScene("LazyEyeTrainerMenu",{effect = "crossFade", time = 250})
	end
	end
	BackButtonGS = widget.newButton({
  		defaultFile = "back-button.png",
  		onEvent = GoBackLazyEyeTrainerMenu
	})

	BackButtonGS.x = _W*0.9
	BackButtonGS.y = _H * 0.1
	BackButtonGS:scale(0.3,0.3)
	--BackButtonGS.isVisible = false
	--BackButtonGS:toFront()
	levelGroup:insert(BackButtonGS)]]--

	scoreTextSS = display.newText("Score: "..score, 0, 0, native.systemFontBold, 30)
	scoreTextSS:setFillColor(220/255, 0, 0)
	scoreTextSS.x = _W*0.5; scoreTextSS.y = 10
	levelGroup:insert(scoreTextSS)

	levelTextSS = display.newText("Level: "..wave, 0, 0, native.systemFontBold, 30)
	levelTextSS:setFillColor(220/255, 0, 0)
	levelTextSS.x = _W*0.5; levelTextSS.y = scoreTextSS.y + 25
	levelGroup:insert(levelTextSS)

	local function moveShip( event )
		local tSS = event.target; local phase = event.phase
		if "began" == phase then
			display.getCurrentStage():setFocus( tSS )
			tSS.isFocus = true
			tSS.x0 = event.x - tSS.x
		elseif tSS.isFocus then
			if "moved" == phase then
				tSS.x = event.x - tSS.x0
				if tSS.x >= _W then tSS.x = _W end
				if tSS.x <= 0 then tSS.x = 0 end
			elseif "ended" == phase or "cancelled" == phase then
				display.getCurrentStage():setFocus( nil )
				tSS.isFocus = false
			end
		end
		return true
	end
	ship = display.newImageRect("images/ship_3.png", 60, 48)	
	ship.x = _W*0.5; ship.y = _H+30; ship.name = "ship"
	physics.addBody( ship, { isSensor = true } )
	ship:addEventListener("touch",moveShip)
	levelGroup:insert(ship)		
	transition.to(ship, {time = 600, y = _H-60})

	local laserBlock = display.newRect(0,-80,320,2)
	laserBlock.name = "blocker"; physics.addBody( laserBlock, { isSensor = true } )
	levelGroup:insert(laserBlock)

	local shipBlock = display.newRect(0,_H+30,320,2)
	shipBlock.name = "blocker"; physics.addBody( shipBlock, { isSensor = true } )
	levelGroup:insert(shipBlock)	
end
levelSetup()

-----------------------------------------------
--*** Start the ship firing automatically ***
-----------------------------------------------
local function startProjectiles()
	local fireTimer
	local function fireNow()
		if gameIsActive == false then
			timer.cancel(fireTimer); fireTimer = nil
		else
			local bullet = display.newImageRect( "images/projectile_red.png", 10, 38 )
			bullet.x = ship.x -25; bullet.y = ship.y-25; bullet.name = "laser"
			physics.addBody( bullet, { isSensor = true } )
			weaponGroup:insert( bullet )

			local bullet = display.newImageRect( "images/projectile_red.png", 10, 38 )
			bullet.x = ship.x +25; bullet.y = ship.y-25; bullet.name = "laser"
			physics.addBody( bullet, { isSensor = true } )	
			weaponGroup:insert( bullet )
		end
	end
	fireTimer = timer.performWithDelay(850, fireNow, 0)
end
startProjectiles()

-----------------------------------------------
--*** Spawn/collision/gameloop functions! ***
-----------------------------------------------
local function gameOver()
	gameIsActive = false --Stop the loops from running
	
	local function restartGame( event ) --Reset and restart everything...
		if event.phase == "ended" then
			--Loop through the groups deleting all their children..
			local i
			for i = levelGroup.numChildren,1,-1 do
				local child = levelGroup[i]
				child.parent:remove( child )
				child = nil
			end
			for i = weaponGroup.numChildren,1,-1 do
				local child = weaponGroup[i]
				child.parent:remove( child )
				child = nil
			end
			for i = enemyGroup.numChildren,1,-1 do
				local child = enemyGroup[i]
				child.parent:remove( child )
				child = nil
			end
			--Now reset the vars and call the funtions to create everything again.
			gameIsActive = true
			enemySpeed = 3
			spawnInt = 0; spawnIntMax = 30
			spawned = 0; spawnedMax = 10
			score = 0
			wave = 1
			levelSetup()
			startProjectiles()
		end

		return true
	end

	function exitGame (event)
		if event.phase == "ended" then
		GSgroup:removeSelf()
		levelGroup:removeSelf()
		enemyGroup:removeSelf()
		weaponGroup:removeSelf()
		audio.stop(GSbackSound)	
		physics.stop()	
   		storyboard.gotoScene("LazyEyeTrainerMenu",{effect = "crossFade", time = 250})
		end
	end	
	--Show game over text and restart text.
	local gameOverText = display.newText("Ouch! You died on wave "..wave, 0,0, font1, 40)
	gameOverText.x = _W*0.5; gameOverText.y = _H*0.4; weaponGroup:insert(gameOverText)
	local gameOverScore = display.newText("With a score of "..score, 0,0, font1, 40)
	gameOverScore.x = _W*0.5; gameOverScore.y = gameOverText.y + 50; weaponGroup:insert(gameOverScore)
	tryAgainText = display.newText("Click me to try again!", 0,0, font1, 40)
	tryAgainText.x = _W*0.5; tryAgainText:setFillColor(0,0,1);tryAgainText.y = gameOverScore.y + 70; weaponGroup:insert(tryAgainText)
	tryAgainText:addEventListener("touch", restartGame)
	ExitText = display.newText("Click me to go back to menu!", 0,0, font1, 40)
	ExitText.x = _W*0.5; ExitText:setFillColor(1,0,0);ExitText.y = tryAgainText.y + 70; weaponGroup:insert(ExitText)
	ExitText:addEventListener("touch", exitGame)
	
end
local function spawnEnemy()
	local imageInt = mr(1,4)
    local enemy = display.newImageRect("images/ship_"..imageInt..".png",50,54)
	enemy.x = mr( 0, _W ); enemy.y = -30; enemy.rotation = 180
	enemy.name = "enemy"; physics.addBody( enemy, { isSensor = true } )
	enemyGroup:insert( enemy )

	if spawned == spawnedMax then 
		wave = wave + 1 --Increase the wave.
   		if wave <= 18 then --Limit max speed/spawn
   			enemySpeed = enemySpeed + 0.7
   			spawnIntMax = math.round(spawnIntMax * 0.9)
   		end
   		spawned = 0 --Reset so that the next wave starts from 0
   	end
	spawnInt = 0
end

local function gameLoop(event)
	if gameIsActive == true then
		--Increase the int until it spawns an enemy..
		spawnInt = spawnInt + 1
		if spawnInt == spawnIntMax then --You can change the amount to change the spawntimes.
			spawnEnemy()
			spawned = spawned + 1
		end

		--Set score and level text here..
		scoreTextSS.text = "Score: "..score
		levelTextSS.text = "Level: "..wave

		--Move the starfields.
		stars1:translate(0,2); stars2:translate(0,2) 
	
		if stars1.y >= (_H*0.5)+480 then
			stars1.y = (_H*0.5)-480
		end
		if stars2.y >= (_H*0.5)+480 then
			stars2.y = (_H*0.5)-480
		end

		--Move the enemies down each frame!
		local i
		for i = enemyGroup.numChildren,1,-1 do
			local enemy = enemyGroup[i]
			if enemy ~= nil and enemy.y ~= nil then
				enemy:translate( 0, enemySpeed)
			end
		end		
		
		--Move our lasers up each frame!
		for i = weaponGroup.numChildren,1,-1 do
			local weapon = weaponGroup[i]
			if weapon ~= nil and weapon.y ~= nil then
				weapon:translate(0, -18);
			end
		end		
	end
end

local function onCollision(event)
	if event.phase == "began" and gameIsActive == true then
		local obj1 = event.object1; 
		local obj2 = event.object2; 

		if obj1.name == "laser" and obj2.name == "enemy" or obj1.name == "enemy" and obj2.name == "laser" then
			display.remove( obj1 ); obj1 = nil
			display.remove( event.object2 ); event.object2 = nil
			hitAudio = audio.loadSound ("explo.mp3")
			audio.setVolume (0.1)
			hitSound = audio.play (hitAudio)
			score = score + 100 --Yay points!

		elseif obj1.name == "ship" and obj2.name == "enemy" or obj2.name == "ship" and obj1.name == "enemy" then
			display.remove( obj1 ); obj1 = nil
			display.remove( event.object2 ); event.object2 = nil
			display.remove( event.object2 ); event.object2 = nil
			--gameOverAudio = audio.loadSound ("game_over_0.mp3")
			--audio.setVolume (0.5)
			--gameOverSound = audio.play (gameOverAudio)
			gameOver()--Weve died so call gameover...

		elseif obj1.name == "enemy" and obj2.name == "blocker" or obj2.name == "enemy" and obj1.name == "blocker"then
			if obj1.name == "enemy" then 
				explosionAudio = audio.loadSound("explo.mp3")
				audio.setVolume(0.1)
				explosionSound = audio.play (explosionAudio)
				display.remove(obj1); obj1 = nil
			elseif obj2.name == "enemy" then
				explosionAudio = audio.loadSound("explo.mp3")
				audio.setVolume(0.1)
				explosionSound = audio.play (explosionAudio) 
				display.remove( event.object2 ); event.object2 = nil
			end
		elseif obj1.name == "laser" and obj2.name == "blocker" or obj2.name == "laser" and obj1.name == "blocker"then
			if obj1.name == "laser" then 
				display.remove(obj1); obj1 = nil
			elseif obj2.name == "laser" then 
				display.remove( event.object2 ); event.object2 = nil
			end
		end
	end
end
--Runtime:addEventListener("touch", GoBackLazyEyeTrainerMenu)
Runtime:addEventListener ("enterFrame", gameLoop)
Runtime:addEventListener( "collision", onCollision )
end
function scene:enterScene( event )
	storyboard.purgeScene("LazyEyeTrainerMenu")
end
function scene:exitScene( event )
	--tryAgainText:removeEventListener("touch", restartGame)
	--ExitText:addEventListener("touch", exitGame)
	Runtime:removeEventListener ("enterFrame", gameLoop)
	Runtime:removeEventListener( "collision", onCollision )
end
function scene:destroyScene( event )

end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
return scene
-- example love app

-- first, one time
function love.load()
  image = love.graphics.newImage("player.jpg")

  local f = love.graphics.newFont(12)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(255,255,255)

  num = 0
  dt = 0

  gameIsPaused = false

  screen_height = love.graphics.getHeight()
  screen_width = love.graphics.getWidth()

  x = "x"
  y = "y"
  player = {x = screen_width/2, y = screen_height/2}
end

function getX()
  return player[x]
end

-- every frame, drawing
function love.draw()
  love.graphics.draw(image, player.x, player.y)

  love.graphics.print("Click and drag the cake around or use the arrow keys", 10, 10)
  love.graphics.print("Player x:"..player[x], 10, 30)
  love.graphics.print("Player y:"..player[y], 10, 50)
end

function love.keypressed(key, unicode)
  if unicode > 31 and unicode < 127 then
    -- cheat codes?
  elseif love.keyboard.isDown("escape") then
    love.event.push("q")
  end
end

-- every frame, calculations
function love.update(dt)
  if gameIsPaused then return end

  if love.keyboard.isDown("up") then
    num = num + 100 * dt -- this would increment num by 100 per second
    player.y = player.y - 5
  elseif love.keyboard.isDown("down") then
    player.y = player.y + 5
  elseif love.keyboard.isDown("left") then
    player.x = player.x - 5
  elseif love.keyboard.isDown("right") then
    player.x = player.x + 5
  elseif love.keyboard.isDown("escape") then
    love.event.push("q")
  end
end

function love.mousepressed(x, y, button)
   if button == 'l' then -- left mouse click
      update_player_position(x,y)
   end
end

function love.mousereleased(x, y, button)
   if button == 'l' then
      fireSlingshot(x,y)
   end
end

function love.focus(f)
  gameIsPaused = not f
  if not f then
    print("LOST FOCUS")
  else
    print("GAINED FOCUS")
  end
end

function love.quit()
  print("Thanks for playing! Come back soon!")
end

function fireSlingshot(x,y)
  print("released")
  update_player_position(x, y)
end

function update_player_position(x, y)
  player.x = x
  player.y = y
end

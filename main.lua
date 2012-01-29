-- example love app

require "player"

-- first, one time
function love.load()
  image = love.graphics.newImage("player.jpg")

  local f = love.graphics.newFont(12)
  love.graphics.setFont(f)
  love.graphics.setBackgroundColor(255,255,255) -- white

  num = 0
  dt = 0

  gameIsPaused = false

  screen_height = love.graphics.getHeight()
  screen_width = love.graphics.getWidth()

  x = "x"
  y = "y"
  player.update_position(screen_width/2, screen_height/2)
end

-- every frame, drawing
function love.draw()
  -- love.graphics.setColor(255,255,255,0)
  love.graphics.draw(image, player.x, player.y, 0, player.size, player.size)
  -- love.graphics.setColor(0,0,0,255)
  love.graphics.print("Click and drag the cake around or use the arrow keys", 10, 10)
  love.graphics.print("Player x:"..player.getX(), 10, 30)
  love.graphics.print("Player y:"..player.getY(), 10, 50)
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

  handle_keys()
end

function love.mousepressed(x, y, button)
   if button == 'l' then -- left mouse click
      player.update_position(x,y)
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
  player.update_position(x, y)
end

function handle_keys()
  if love.keyboard.isDown("up") then
    num = num + 100 * dt -- this would increment num by 100 per second
    player.move_up()
  elseif love.keyboard.isDown("down") then
    player.move_down()
  elseif love.keyboard.isDown("left") then
    player.move_left()
  elseif love.keyboard.isDown("right") then
    player.move_right()
  elseif love.keyboard.isDown("escape") then
    love.event.push("q")
  elseif love.keyboard.isDown("+") then
    player.bigger()
  end
end

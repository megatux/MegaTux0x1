-- example love app

function love.load()
  image = love.graphics.newImage("tag_ruby.jpg")

  local f = love.graphics.newFont(12)
  love.graphics.setFont(f)
  love.graphics.setColor(0,0,0,255)
  love.graphics.setBackgroundColor(255,255,255)

  num = 0
  dt = 0
  gameIsPaused = false
  imgx, imgy = 100, 100
end

function love.draw()
  love.graphics.draw(image, imgx, imgy)
  love.graphics.print("Click and drag the cake around or use the arrow keys", 10, 10)
end

function love.update(dt)
  if gameIsPaused then return end

  if love.keyboard.isDown("up") then
    num = num + 100 * dt -- this would increment num by 100 per second
  elseif love.keyboard.isDown("escape") then
    love.quit()
    -- system.exit(0)
  end
end

function love.mousepressed(x, y, button)
   if button == 'l' then
      imgx = x -- move image to where mouse clicked
      imgy = y
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
  print("bum!")
end

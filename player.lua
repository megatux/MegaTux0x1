player = {}
player.size = 1

player.getX = function()
  return player[x]
end

player.getY = function()
  return player[y]
end

player.update_position = function(x, y)
  player.x = x
  player.y = y
end

player.move_up = function()
  player.y = player.y - 5
end

player.move_down = function()
  player.y = player.y + 5
end

player.move_left = function()
  player.x = player.x - 5
end

player.move_right = function()
  player.x = player.x + 5
end

player.bigger = function()
  player.size = player.size * 1.1
end

player.smaller = function()
  player.size = player.size * 0.9
end


player.c = false
player.camera = function()
  if not player.c then
    player.c = true
    camera.x = 50
    camera:scale(2)
  end
end
player = {}

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

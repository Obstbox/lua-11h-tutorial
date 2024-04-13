local love = require "love"
local Player = require "Player"

function love.load()
    love.mouse.setVisible(false)
    mouse_x, mouse_y = 0, 0

    local show_debugging = true

    player = Player(show_debugging)
end


function love.update()
    mouse_x, mouse_y = love.mouse.getPosition()
    player:movePlayer()
end


function love.draw()
    player:draw()
end

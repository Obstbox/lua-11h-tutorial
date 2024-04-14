local love   = require "love"

local Player = require "objects/Player"
local Game   = require "states/Game"

function love.load()
    love.mouse.setVisible(false)
    mouse_x, mouse_y = 0, 0

    local show_debugging = true

    player = Player(show_debugging)
    game   = Game()
end

function love.keypressed(key)
    if game.state.running then
        if key == "w" or key == "up" or key == "kp8" then
            player.thrusting = true
        end

        if key == "escape" then
            game:changeGameState("paused")
        end

    elseif game.state.paused then
        if key == "escape" then
            game:changeGameState("running")
        end
    end
end

function love.keyreleased(key)
    if game.state.running then
        if key == "w" or key == "up" or key == "kp8" then
            player.thrusting = false
        end
    end
end

function love.update()
    mouse_x, mouse_y = love.mouse.getPosition()

    if game.state.running then
        player:movePlayer()
    end
end


function love.draw()
    if game.state.running or game.state.paused then
        player:draw(game.state.paused)
        game:draw(game.state.paused)
        -- love.graphics.setColor(1, 1, 0, 0.8)
        -- love.graphics.print(tostring(game.state.paused), 30, 10)
    end

    love.graphics.setColor(0.44, 0.44, 0.44, 1)
    love.graphics.print(love.timer.getFPS(), 10, 10)
end

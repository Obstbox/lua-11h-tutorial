_G.love = require("love")

function love.load()
    love.graphics.setBackgroundColor(0.5, 0.5, 1)

    -- Unnessesary. Define pacman as global
    -- _G.pacman = {}
    pacman = {}
    pacman.x = 200
    pacman.y = 250
    pacman.eat = true

    _G.food = {
        x = 400,
        eaten = false
    }
end

function love.update(dt)
    pacman.x = pacman.x + 5
    -- if pacman.x >= 680 then
    --     pacman.x = 5
    --     food_eaten = false
    -- end
    if pacman.x >= food.x + 20 then
        food.eaten = true
    end
end

function love.draw()
    if not food.eaten then
        love.graphics.setColor(62/255, 62/255, 62/255)
        love.graphics.rectangle("fill", food.x, 225, 50, 50)
    end

    love.graphics.setColor(1, 0.7, 0.1)
    love.graphics.arc("fill", pacman.x, pacman.y, 60, 1, 5)
end


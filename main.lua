_G.love = require("love")

function love.load()
    love.graphics.setBackgroundColor(0.5, 0.5, 1)

    -- explicit define pacman as a global
    -- _G.pacman = {}
    pacman = {}
    pacman.x = 200
    pacman.y = 250
    pacman.size = 60
    pacman.angle1 = 0.5
    pacman.angle2 = 5.5

    _G.food = {
        x = 400,
        eaten = false
    }
end

function love.update(dt)
    delta = 2

    if love.keyboard.isDown("down") then
        pacman.angle1 = pacman.angle1 + math.pi * dt * 2
        pacman.angle2 = pacman.angle2 + math.pi * dt * 2
    end

    if love.keyboard.isDown("up") then
        pacman.angle1 = pacman.angle1 - math.pi * dt * 2
        pacman.angle2 = pacman.angle2 - math.pi * dt * 2
    end

    if love.keyboard.isDown("a") then
        if pacman.x >= pacman.size then
            pacman.x = pacman.x - delta
        end
    end
    if love.keyboard.isDown("d") then
        -- how to access global window width?
        if pacman.x <= 680 - pacman.size then
            pacman.x = pacman.x + delta
        end
    end
    if love.keyboard.isDown("w") then
        if pacman.y >= pacman.size then
            pacman.y = pacman.y - delta
        end
    end
    if love.keyboard.isDown("s") then
        if pacman.y <= 480 - pacman.size then
            pacman.y = pacman.y + delta
        end
    end

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
    love.graphics.arc("fill", pacman.x, pacman.y, pacman.size, pacman.angle1, pacman.angle2)
end


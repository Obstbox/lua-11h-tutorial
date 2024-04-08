local love = require("love")
local enemy = require("Enemy")

math.randomseed(os.time())

local game = {
    difficulty = 1,
    state = {
        menu = true,
        paused = false,
        running = true,
        ended = false,
    }

}

local player = {
    radius = 20,
    x = 30,
    y = 30
}

local buttons = {
    menu_state = {}
}

local enemies = {}

function love.load()
    love.window.title = "Save the ball"
    love.mouse.setVisible(false)

    table.insert(enemies, 1, enemy())
end

function love.update(dt)
    player.x, player.y = love.mouse.getPosition()

    for i = 1, #enemies do
        enemies[i]:move(player.x, player.y)
    end
end

function love.draw()
    love.graphics.printf(
        "FPS: " .. love.timer.getFPS(),
        love.graphics.newFont(12),
        10,
        love.graphics.getHeight() - 30,
        love.graphics.getWidth()
    )

    if game.state['running'] then
        for i = 1, #enemies do
            enemies[i]:draw()
        end

        love.graphics.circle("fill", player.x, player.y, player.radius)
    end

    if not game.state['running'] then
        love.graphics.circle("fill", player.x, player.y, player.radius / 2)
    end
end
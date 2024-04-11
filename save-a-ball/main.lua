local love = require("love")
local enemy = require("Enemy")
local button = require("Button")

math.randomseed(os.time())

local game = {
    difficulty = 1,
    state = {
        menu = true,
        paused = false,
        running = false,
        ended = false,
    },
    points = 0,
    levels = {15, 30, 60, 120}  -- points when to increase count of enemies

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

local function startNewGame()
    game.state["menu"] = false
    game.state["running"] = true

    game.points = 0

    enemies = { enemy(1) }
end

function love.mousepressed(x, y, button, istouch, presses)
    if not game.state['running'] then
        if button == 1 then     -- left button
            if game.state['menu'] then
                for index in pairs(buttons.menu_state) do
                    buttons.menu_state[index]:checkPressed(x, y, player.radius)
                end
            end
        end
    end
end

function love.load()
    love.window.title = "Save the ball"
    love.mouse.setVisible(false)

    -- use startNewGame and not startNewGame() because the second
    -- will be executed but not passed to the button
    buttons.menu_state.play_game = button("Play Game", startNewGame, nil, 120, 40)
    buttons.menu_state.settings  = button("Settings", nil, nil, 120, 40)
    buttons.menu_state.exit_game = button("Exit Game", love.event.quit, nil, 120, 40)
end

function love.update(dt)
    player.x, player.y = love.mouse.getPosition()

    -- to implement for menu state roaming color balls?
    if game.state["running"] then
        for i = 1, #enemies do
            enemies[i]:move(player.x, player.y)
        end
        game.points = game.points + dt
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
        love.graphics.printf(
            math.floor(game.points),
            love.graphics.newFont(24),
            0,
            10,
            love.graphics.getWidth(), "center"
        )

        for i = 1, #enemies do
            enemies[i]:draw()
        end

        love.graphics.circle("fill", player.x, player.y, player.radius)

    elseif game.state["menu"] then
        buttons.menu_state.play_game:draw(10, 20, 5, 15)
        buttons.menu_state.settings:draw(10, 70, 5, 15)
        buttons.menu_state.exit_game:draw(10, 120, 5, 15)
    end

    if not game.state['running'] then
        love.graphics.circle("fill", player.x, player.y, player.radius / 2)
    end
end

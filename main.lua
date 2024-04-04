_G.love = require("love")

function love.load()
    jack = {
        x = 0,
        y = 0,
        sprite = love.graphics.newImage("assets/sprites/werewolf.png"),
        animation = {
            direction = "right",
            idle = true,
            frame = 1,
            max_frames = 4,
            speed = 16,
            timer = 0.1
        }
    }

    SPRITE_WIDTH, SPRITE_HEIGHT = 288, 288
    QUAD_WIDTH = 72
    QUAD_HEIGHT = QUAD_WIDTH

    quads_down = {}
    quads_left = {}
    quads_right = {}
    quads_up = {}

    for i = 1, jack.animation.max_frames do
        quads_down[i] = love.graphics.newQuad(QUAD_WIDTH * (i - 1), 0, QUAD_WIDTH, QUAD_HEIGHT, SPRITE_WIDTH, SPRITE_HEIGHT)
    end

    for i = 1, jack.animation.max_frames do
        quads_left[i] = love.graphics.newQuad(QUAD_WIDTH * (i - 1), 72+1, QUAD_WIDTH, QUAD_HEIGHT, SPRITE_WIDTH, SPRITE_HEIGHT)
    end

    for i = 1, jack.animation.max_frames do
        quads_right[i] = love.graphics.newQuad(QUAD_WIDTH * (i - 1), 144+1, QUAD_WIDTH, QUAD_HEIGHT, SPRITE_WIDTH, SPRITE_HEIGHT)
    end
    
    for i = 1, jack.animation.max_frames do
        quads_up[i] = love.graphics.newQuad(QUAD_WIDTH * (i - 1), 216+1, QUAD_WIDTH, QUAD_HEIGHT, SPRITE_WIDTH, SPRITE_HEIGHT)
    end

end

function love.update(dt)

    -- how to access global window width?

    if love.keyboard.isDown("a") then
        jack.animation.idle = false
        jack.animation.direction = "left"

    elseif love.keyboard.isDown("d") then
        jack.animation.idle = false
        jack.animation.direction = "right"

    elseif love.keyboard.isDown("w") then
        jack.animation.idle = false
        jack.animation.direction = "up"

    elseif love.keyboard.isDown("s") then
        jack.animation.idle = false
        jack.animation.direction = "down"

    else
        jack.animation.idle = true
        jack.animation.direction = "right"
        jack.animation.frame = 1
    end

    if not jack.animation.idle then
        jack.animation.timer = jack.animation.timer + dt

        if jack.animation.timer > 0.2 then
            jack.animation.timer = 0.1

            jack.animation.frame = jack.animation.frame + 1

            if jack.animation.direction == "right" then
                jack.x = jack.x + jack.animation.speed
            elseif jack.animation.direction == "left" then
                jack.x = jack.x - jack.animation.speed
            elseif jack.animation.direction == "up" then
                jack.y = jack.y - jack.animation.speed
            elseif jack.animation.direction == "down" then
                jack.y = jack.y + jack.animation.speed
            end

            if jack.animation.frame > jack.animation.max_frames then
                jack.animation.frame = 1
            end
        end
    end
end

function love.draw()
    -- love.graphics.scale(2)
    if jack.animation.direction == "right" then
        love.graphics.draw(jack.sprite, quads_right[jack.animation.frame], jack.x, jack.y)
    else
        -- flip by x-axis ( .., -1, .. )
        love.graphics.draw(jack.sprite, quads_right[jack.animation.frame], jack.x, jack.y,
        0, -1, 1, QUAD_WIDTH, 0)
    end
end


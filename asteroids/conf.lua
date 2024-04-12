local love = require "love"

function love.conf(app)
    -- 16:9
    -- 1280 x 720 or:
    app.window.width = 960
    app.window.height = 540
    app.window.title = "Asteroids"
end

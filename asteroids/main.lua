local love = require "love"

function love.load()
    love.mouse.setVisible(false)
    mouse_x, mouse_y = 0, 0

    local show_debugging = true
end


function love.update()
    mouse_x, mouse_y = love.mouse.getPosition()
end


function love.draw()

end

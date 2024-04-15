local love = require "love"

function Laser(x, y, angle)
    local LASER_SPEED = 500

    return {
        x = x,
        y = y,

        draw = function(self, faded)
            local opacity = 1

            if faded then
                opacity = 0.2
            end

            love.graphics.setColor(0.2, 0.8, 0.2)
            love.graphics.setPointSize(3)
            love.graphics.points(self.x, self.y)
        end
    }
end

return Laser
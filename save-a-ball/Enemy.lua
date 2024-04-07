local love = require "love"

function Enemy()
    -- these lines are part of a function, not of a table down below
    -- that is why we need a _x and _y: to be accessable by 'self'
    local dice = math.random(1, 4)
    local _x, _y
    local _radius = 20

    return {
        level = 1,
        radius = _radius,
        x = _x,
        y = _y,

        move = function (self, player_x, player_y)
            if player_x - self.x > 0 then
                self.x = self.x + self.level
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level
            end

            if player_y - self.y > 0 then
                self.y = self.y + self.level
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level
            end
        end,

        draw = function (self)
           love.graphics.setColor(1, 0.5, 0.7)
           love.graphics.circle("fill", self.x, self.y, self.radius)

           -- revert color to the default
           -- to prevent bugs in future
           love.graphics.setColor(1, 1, 1)      
       end
   }
end

return Enemy

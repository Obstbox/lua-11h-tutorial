local love = require "love"
local Text = require "../components/Text"
local Asteroids = require "../objects/Asteroids"

function Game()
    return {
        level = 1,
        state = {
            menu    = true,
            paused  = false,
            running = false,
            ended   = false
        },

        changeGameState = function(self, state)
            self.state.menu    = state == "menu"
            self.state.paused  = state == "paused"
            self.state.running = state == "running"
            self.state.ended   = state == "ended"
        end,

        draw = function(self, faded)
            if faded then
                Text(
                    "PAUSED",
                    0,
                    love.graphics.getHeight() * 0.4,
                    "h1",
                    false,
                    false,
                    love.graphics.getWidth(),
                    "center"
                ):draw()
            end
        end,

        startNewGame = function(self, player)
            self:changeGameState("running")

            asteroids = {}  -- global scope

            local as_x = math.floor(math.random(love.graphics.getWidth()))
            local as_y = math.floor(math.random(love.graphics.getHeight()))

            table.insert(asteroids, 1, Asteroids(as_x, as_y, 100, self.level))
        end
    }
end

return Game

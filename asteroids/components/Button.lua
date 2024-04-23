local love = require "love"

local Text = require "components.Text"

function Button(func, text_color, button_color, width, height, text, text_align, font_size, button_x, button_y, text_x, text_y)
    local btn_text = {}
    func = func or function () print("This button has no function attached") end

    if text_y then
        btn_text.y = text_y + button_y
    else
        btn_text.y = button_y
    end
    if text_x then
        btn_text.x = text_x + button_y
    else
        btn_text.x = button_x
    end

    return {

    }
end

return Button

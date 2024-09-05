push = require 'push'
class = require 'class'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest");
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = false
	})
end

function love.draw()
	push:apply('start')

	love.graphics.printf('Hello', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center');



	push:apply('end')
end

function love.update(dt)

end

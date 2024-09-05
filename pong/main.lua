Push = require 'push'
Class = require 'class'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200
function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest");
	smallFont = love.graphics.newFont('font.ttf', 8);
	scoreFont = love.graphics.newFont('font.ttf', 32);
	love.graphics.setFont(smallFont);
	P1Score = 0
	P2Score = 0
	P1Y = 30
	P2Y = VIRTUAL_HEIGHT - 50
	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = false
	})
end

function love.draw()
	Push:apply('start')
	love.graphics.clear(40 / 255, 45 / 255, 52 / 255, 255 / 255)
	love.graphics.printf('Hello', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center');
	love.graphics.rectangle("fill", 10, P1Y, 5, 20)
	love.graphics.rectangle("fill", VIRTUAL_WIDTH - 10, P2Y - 50, 5, 20);

	love.graphics.setFont(scoreFont)
	love.graphics.print(tostring(P1Score), VIRTUAL_WIDTH / 2 - 50,
		VIRTUAL_HEIGHT / 3)
	love.graphics.print(tostring(P2Score), VIRTUAL_WIDTH / 2 + 30,
		VIRTUAL_HEIGHT / 3)

	Push:apply('end')
end

function love.update(dt)
	-- Player 1 Movement
	if love.keyboard.isDown('w') then
		P1Y = P1Y + -PADDLE_SPEED * dt
	elseif love.keyboard.isDown('s') then
		P1Y = P1Y + PADDLE_SPEED * dt
	end
	-- Player 2 Movement
	if love.keyboard.isDown('up') then
		P1Y = P2Y + -PADDLE_SPEED * dt
	elseif love.keyboard.isDown('down') then
		P1Y = P2Y + PADDLE_SPEED * dt
	end
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

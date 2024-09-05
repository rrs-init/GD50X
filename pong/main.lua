Push = require 'push'
Class = require 'class'
require 'Paddle'
require 'Ball'
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200
function love.load()
	gameState = 'start'
	love.graphics.setDefaultFilter("nearest", "nearest");
	smallFont = love.graphics.newFont('font.ttf', 8);
	scoreFont = love.graphics.newFont('font.ttf', 32);
	love.graphics.setFont(smallFont);
	P1Score = 0
	P2Score = 0
	player1 = Paddle(10, 30, 5, 20)
	player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 20)
	ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
	Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = false
	})
end

function love.draw()
	Push:apply('start')
	love.graphics.clear(40 / 255, 45 / 255, 52 / 255, 255 / 255)
	player1:render()
	player2:render()
	ball:render()

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
		player1.dy = -PADDLE_SPEED
	elseif love.keyboard.isDown('s') then
		player1.dy = PADDLE_SPEED
	else
		player1.dy = 0
	end
	-- Player 2 Movement
	if love.keyboard.isDown('up') then
		player2.dy = -PADDLE_SPEED
	elseif love.keyboard.isDown('down') then
		player2.dy = PADDLE_SPEED
	else
		player2.dy = 0
	end
	if gameState == 'play' then
		ball:update(dt)
	end
	player1:update(dt)
	player2:update(dt)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

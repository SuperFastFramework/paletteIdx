require("palettes")

function love.load(arg)
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.graphics.setFont(love.graphics.newFont("assets/pico8.ttf", 16))
	sfx1 = love.audio.newSource("assets/sfx1.ogg")
	palIdx = 1
	sfx1:play()
end

function love.keyreleased(key)
	if key == "left" then
		palIdx =  (palIdx - 1) % (#sff.palettes.names+1)
	elseif key == "right" then
		palIdx = (palIdx + 1) % (#sff.palettes.names+1)
	end
	if palIdx == 0 then palIdx = 1 end
 end

function love.draw(dt)
	local pal = sff.palettes[sff.palettes.names[palIdx]]
	local xx = 0
	local yy = 0
	local ww = ((CONF.width/4)*CONF.cameraZoom)

	for i=1, #pal do
		love.graphics.setColor(pal[i])
		love.graphics.rectangle("fill", xx, yy, ww, ww)

		love.graphics.setColor(1,1,1,1)
		love.graphics.printf(i, xx, yy+25, ww, "center")

		xx = xx + ww
		if (i % 4) == 0 then
			xx = 0
			yy = yy + ww
		end
	end
end

function love.load()
    player = {
        x = 400,
        y = 300,
        speed = 300,
        width = 40,
        height = 60
    }
end

function love.update(dt)
    -- Movimento
    if love.keyboard.isDown('d') then
        player.x = player.x + player.speed * dt
    end
    if love.keyboard.isDown('a') then
        player.x = player.x - player.speed * dt
    end
    if love.keyboard.isDown('s') then
        player.y = player.y + player.speed * dt
    end
    if love.keyboard.isDown('w') then
        player.y = player.y - player.speed * dt
    end
end

function love.draw()
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)
end
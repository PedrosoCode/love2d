function love.load()
    player = {
        x = 400,
        y = 300,
        speed = 300,
        width = 40,
        height = 60
    }

    obstacle = {
        x = 400,
        y = 400,
        width = 100,
        height = 50
    }
end

function checkCollision(a, b)
    return a.x < b.x + b.width and
           a.x + a.width > b.x and
           a.y < b.y + b.height and
           a.y + a.height > b.y
end

function love.update(dt)
    local newX, newY = player.x, player.y

    -- Captura a posição sem atualizar
    if love.keyboard.isDown('d') then
        newX = newX + player.speed * dt
    end
    if love.keyboard.isDown('a') then
        newX = newX - player.speed * dt
    end
    if love.keyboard.isDown('s') then
        newY = newY + player.speed * dt
    end
    if love.keyboard.isDown('w') then
        newY = newY - player.speed * dt
    end

    -- Criar uma versão temporária do player para testar a colisão
    local tempPlayer = {
        x = newX,
        y = newY,
        width = player.width,
        height = player.height
    }

    -- Atualiza apenas se não houver colisão
    if not checkCollision(tempPlayer, obstacle) then
        player.x = newX
        player.y = newY
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1) -- Branco
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)

    love.graphics.setColor(1, 0, 0) -- Vermelho
    love.graphics.rectangle('fill', obstacle.x, obstacle.y, obstacle.width, obstacle.height)
end

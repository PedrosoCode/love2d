function love.load()
    player = {
        x = 400,
        y = 300,
        speed = 300,
        width = 40,
        height = 60,
        velocityY = 0,
        jumpForce = -400, 
        gravity = 800
    }

    obstacle = {
        x = 400,
        y = 400,
        width = 100,
        height = 50
    }
end

function love.update(dt)
    local newX = player.x

    if love.keyboard.isDown('d') then
        newX = newX + player.speed * dt
    end
    if love.keyboard.isDown('a') then
        newX = newX - player.speed * dt
    end

    if love.keyboard.isDown('w') and player.onGround then
        player.velocityY = player.jumpForce 
        player.onGround = false
    end

    player.velocityY = player.velocityY + player.gravity * dt
    local newY = player.y + player.velocityY * dt

    local tempPlayerX = { x = newX, y = player.y, width = player.width, height = player.height }
    local tempPlayerY = { x = player.x, y = newY, width = player.width, height = player.height }

    if not checkCollision(tempPlayerX, obstacle) then
        player.x = newX
    end

    if not checkCollision(tempPlayerY, obstacle) then
        player.y = newY
    else
        player.velocityY = 0
        player.onGround = true
    end
end



function love.draw()
    local screenW, screenH = love.graphics.getDimensions()

    -- Translada a tela para manter o jogador centralizado
    love.graphics.push()
    love.graphics.translate(-player.x + screenW / 2, -player.y + screenH / 2)

    -- Desenha os elementos
    love.graphics.setColor(1, 1, 1) -- Branco
    love.graphics.rectangle('fill', player.x, player.y, player.width, player.height)

    love.graphics.setColor(1, 0, 0) -- Vermelho
    love.graphics.rectangle('fill', obstacle.x, obstacle.y, obstacle.width, obstacle.height)

    love.graphics.pop() -- Restaura a matriz de transformação
end

--FUNCS

function checkCollision(a, b)
    return a.x < b.x + b.width and
           a.x + a.width > b.x and
           a.y < b.y + b.height and
           a.y + a.height > b.y
end
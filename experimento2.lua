-- Acendendo o LED com um botão

-- Experimento 1: Acender um LED
--
-- Ligar um LED no pino D1

-- configurando o pino D1 para saída de dados.
pino_led = 1
pino_botao = 2

gpio.mode(pino_led, gpio.OUTPUT)

-- função para acender o LED. 
function acende()
    gpio.write(pino_led, gpio.HIGH)
end

-- função para apagar o LED.
function apaga()
    gpio.write(pino_led, gpio.LOW)
end 

-- função chamada quando aperta um botão.
function callback_botao(level, when)
    print("callback: " .. level .. " quando: " .. when)
    if (level == 1) then
        acende()
    else
        apaga()
    end
    
    gpio.trig(pino_botao, level == gpio.HIGH  and "down" or "up")
end

gpio.trig(pino_botao, "down", callback_botao)



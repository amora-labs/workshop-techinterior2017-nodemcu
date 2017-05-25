-- Experimento 1: Acender um LED
--
-- Ligar um LED no pino D1

-- configurando o pino D1 para saída de dados.
pin = 1
gpio.mode(pin, gpio.OUTPUT)

-- função para acender o LED. 
function acende()
    gpio.write(pin, gpio.HIGH)
end

-- função para apagar o LED.
function apaga()
    gpio.write(pin, gpio.LOW)
end 

-- Liga um temporizador de 1 segundo que pisca o LED.
function pisca()
    local timer = tmr.create()
    local aceso = false

    timer:register(1000, tmr.ALARM_AUTO, function(t) 
        gpio.write(pin, aceso and gpio.HIGH or gpio.LOW)
        aceso = not aceso
    end)

    timer:start()
end



-- Experimento 3: Luz de emergencia


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

function ativa_sensor()
    local timer = tmr.create()

    timer:register(1000, tmr.ALARM_AUTO, function(t) 
        local valor = adc.read(0)
        print("luz: " .. valor)

        if (valor < 700) then
            acende()
        else
            apaga()
        end
    end)

    timer:start()
end



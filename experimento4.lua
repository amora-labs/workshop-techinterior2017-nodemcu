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

function envia_email()
    local para = "andre@andregarzia.com"
    local quando = tmr.now()
    local url = "http://andregarzia.com/auxiliary/workshop/mailer.php?to=" .. para .. "&time=" .. quando

    http.get(url, nil, function(code, data)
    if (code < 0) then
      print("HTTP request falhou")
    else
      print(code, data)
    end
  end)
end

function ativa_sensor()
    local timer = tmr.create()

    timer:register(1000, tmr.ALARM_AUTO, function(t) 
        local valor = adc.read(0)
        print("luz: " .. valor)

        if (valor < 700) then
            acende()
            envia_email()
        else
            apaga()
        end
    end)

    timer:start()
end



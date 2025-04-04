--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Recebe evento client e envia para o display + tempo que aumenta quando for mais de 45 Caracteres
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('Fox_ChatME:shareDisplay')
AddEventHandler('Fox_ChatME:shareDisplay', function(text)
    local src = source
    local players = GetPlayers()
    
    for _, playerId in ipairs(players) do
        local ped = GetPlayerPed(playerId)
        local targetPed = GetPlayerPed(src)

        if ped and targetPed then
            local dist = #(GetEntityCoords(ped) - GetEntityCoords(targetPed))
            if dist < Config.distanceME then
                local brokenText, totalChars = BreakText(text, 45)

                local extraTime = math.max(0, totalChars - 45) * 50 -- 50ms por caractere extra
                local displayTime = Config.timeME + extraTime

                TriggerClientEvent('Fox_ChatME:triggerDisplay', playerId, brokenText, src, displayTime)

                if Config.chatMessageMe then
                    TriggerClientEvent('chat:addMessage', playerId, {
                        args = { "[ME] ", table.concat(brokenText, "\n") }
                    })
                end
            end
        end
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Funçào que quebra o texto em linhas -- Esta função quebra o texto em linhas, garantindo que cada linha não exceda o número máximo de caracteres especificado.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function BreakText(text, maxChars)
    local lines = {}
    local line = ""
    local totalChars = 0

    for word in text:gmatch("%S+") do
        if #line + #word + 1 > maxChars then
            table.insert(lines, line)
            totalChars = totalChars + #line
            line = word .. " "
        else
            line = line .. word .. " "
        end
    end

    table.insert(lines, line)
    totalChars = totalChars + #line

    return lines, totalChars
end


-------------------------------------------------------------------------------------
-- ME Command  
-------------------------------------------------------------------------------------
RegisterCommand('me', function(_, args)
    local text = table.concat(args, ' ')
    if text ~= "" then
        TriggerServerEvent('Fox_ChatME:shareDisplay', text)
    end
end)

-------------------------------------------------------------------------------------
-- Recebe evento do servidor e exibe
-------------------------------------------------------------------------------------
RegisterNetEvent('Fox_ChatME:triggerDisplay')
AddEventHandler('Fox_ChatME:triggerDisplay', function(lines, playerId, displayTime)
    Display(GetPlayerFromServerId(playerId), lines, displayTime)
end)

-------------------------------------------------------------------------------------
-- Função que gerencia a exibição do texto 3D
-------------------------------------------------------------------------------------
local displayingPlayers = {}

function Display(playerId, lines, duration)
    if displayingPlayers[playerId] then
        displayingPlayers[playerId].active = false
    end

    local display = {
        active = true,
        lines = lines,
        duration = duration or Config.timeME
    }

    displayingPlayers[playerId] = display

    Citizen.CreateThread(function()
        local startTime = GetGameTimer()

        while display.active and (GetGameTimer() - startTime < display.duration) do
            Wait(0)

            local meCoords = GetEntityCoords(GetPlayerPed(playerId))
            local myCoords = GetEntityCoords(PlayerPedId())
            local distance = #(meCoords - myCoords)

            if distance < Config.distanceME then
                local baseZ = 1.0
                local lineSpacing = 0.055
                local totalHeight = #lines * lineSpacing
                local bgCenterZ = meCoords.z + baseZ + (totalHeight / 2) - (lineSpacing / 2)

                DrawBackground(meCoords.x, meCoords.y, bgCenterZ, lines)

                for i, line in ipairs(lines) do
                    local offset = (#lines - i) * lineSpacing
                    DrawText3D(meCoords.x, meCoords.y, meCoords.z + baseZ + offset, line)
                end
            end
        end

        if displayingPlayers[playerId] == display then
            displayingPlayers[playerId] = nil
        end
    end)
end

-------------------------------------------------------------------------------------
-- Função para Mostrar o texto 3D na tela
-------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    if not onScreen then return end

    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextScale(0.30, 0.30)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    SetTextCentre(true)
    DisplayText(str, _x, _y)

    -- local bgWidth = 0.035 + (string.len(text) / 225)
    -- DrawSprite("feeds", "hud_menu_4a", _x, _y + 0.0125, bgWidth, 0.03, 0.1, 35, 35, 35, 190, 0)
end


function DrawBackground(x, y, z, lines)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    if not onScreen then return end

    -- Tamanho do fundo
    local longestLine = 0
    for _, line in ipairs(lines) do
        if #line > longestLine then
            longestLine = #line
        end
    end

    local bgWidth = 0.020 + (longestLine / 200) -- largura baseado na linha mais longa
    local bgHeight = #lines * 0.020 + 0.01      -- altura baseada nas linhas

    DrawSprite("feeds", "hud_menu_4a", _x, _y + 0.0125, bgWidth, bgHeight, 0.1, 35, 35, 35, 190, 0)
end

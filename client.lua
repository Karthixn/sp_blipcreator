local open = false

RegisterCommand("blipcreator", function()
    if not open then
        SetNuiFocus(true, true)
        SendNUIMessage({ action = "open" })
        open = true
    else
        SetNuiFocus(false, false)
        SendNUIMessage({ action = "close" })
        open = false
    end
end, false)

RegisterNUICallback("createBlip", function(data, cb)
    local coords = GetEntityCoords(PlayerPedId())

    -- Create local blip
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, tonumber(data.sprite))
    SetBlipScale(blip, tonumber(data.scale))
    SetBlipColour(blip, tonumber(data.color))
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.label)
    EndTextCommandSetBlipName(blip)

    -- Send to server for saving
    TriggerServerEvent("sp_blipcreator:saveBlip", {
        label = data.label,
        x = coords.x,
        y = coords.y,
        z = coords.z,
        sprite = tonumber(data.sprite),
        color = tonumber(data.color),
        scale = tonumber(data.scale),
    })

    SetNuiFocus(false, false)
    SendNUIMessage({ action = "close" })
    open = false
    cb("ok")
end)

RegisterNUICallback("closeUI", function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "close" })
    open = false
    cb("ok")
end)

RegisterNetEvent("sp_blipcreator:loadBlips", function(blips)
    for _, blipData in pairs(blips) do
        local blip = AddBlipForCoord(blipData.x, blipData.y, blipData.z)
        SetBlipSprite(blip, blipData.sprite)
        SetBlipScale(blip, blipData.scale)
        SetBlipColour(blip, blipData.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipData.label)
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    TriggerServerEvent("sp_blipcreator:requestBlips")
end)

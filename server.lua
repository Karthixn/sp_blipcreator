RegisterNetEvent("sp_blipcreator:requestBlips", function()
    local src = source
    Wait(1000)
    local blips = loadBlipsFromConfig()
    TriggerClientEvent("sp_blipcreator:loadBlips", src, blips)
end)

RegisterNetEvent("sp_blipcreator:saveBlip", function(blip)
    appendBlipToConfig(blip)
end)

function appendBlipToConfig(blip)
    local config = LoadResourceFile("sp_blipcreator", "config.lua")
    if not config then return end

    local lines = {}
    local injected = false
    for line in config:gmatch("[^\r\n]+") do
        table.insert(lines, line)
        if not injected and line:find("Config.SavedBlips%s*=%s*{") then
            table.insert(lines, string.format(
                "    { label = %q, x = %.2f, y = %.2f, z = %.2f, sprite = %d, color = %d, scale = %.2f },",
                blip.label, blip.x, blip.y, blip.z, blip.sprite, blip.color, blip.scale
            ))
            injected = true
        end
    end

    SaveResourceFile("sp_blipcreator", "config.lua", table.concat(lines, "\n"), -1)
end

function loadBlipsFromConfig()
    local config = LoadResourceFile("sp_blipcreator", "config.lua")
    local env = {}
    local func = load(config, nil, "t", env)
    if func then func() end
    return env.Config and env.Config.SavedBlips or {}
end

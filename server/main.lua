print("ALPR by MrJohnDowe")

local function getVehicleInfo(plate)
    return MySQL.single.await(
        'SELECT * FROM mdt_vehicleinfo WHERE plate = ? LIMIT 1',
        { plate }
    )
end

local function getBoloInfo(plate)
    return MySQL.single.await(
        'SELECT * FROM mdt_bolos WHERE plate = ? LIMIT 1',
        { plate }
    )
end

RegisterNetEvent('alpr:checkPlate', function(plate, camera)
    local src = source

    local vehicle = getVehicleInfo(plate)
    local bolo = getBoloInfo(plate)

    TriggerClientEvent('alpr:returnPlate', src, {
        plate = plate,
        camera = camera,
        vehicle = vehicle or false,
        bolo = bolo or false
    })
end)
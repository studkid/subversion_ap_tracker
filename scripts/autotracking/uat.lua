ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

locations = {}

local updateLocations = function(store, vars)
    print("updateLocations")

    for _, var in ipairs(vars) do
        local vals = store:ReadVariable(var)
        locations = vals

        local ping = Tracker:FindObjectForCode("ping")
        ---@cast ping JsonItem
        ping.Active = not ping.Active
    end
end

function get_access_to_loc(name)
    for _, loc in ipairs(locations) do
        if loc == name then
            return 1
        end
    end
    return 0
end

ScriptHost:AddVariableWatch("locations", {"locations"}, updateLocations)
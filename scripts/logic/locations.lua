LOCATIONS = {
    -- Oceania
    ["Impact Crater"] = {
        access_from = function()
            return has_access_to('SunkenNestL')
        end,
        available = function()
            return wand({
                gravity(),
                morph(),
                spazer()
            })
        end
    },
    ["Subterranean Burrow"] = {
        access_from = function()
            return has_access_to('SunkenNestL')
        end
    },
    ["Impact Crater Alcove"] = {
        access_from = function()
            return has_access_to('SunkenNestL')
        end,
        available = function()
            return wand({
                gravity(),
                can_bomb(2)
            })
        end
    },
    ["Impact Crater Overlook"] = {
        access_from = function()
            return has_access_to('SunkenNestL')
        end,
        available = function()
            return wand({
                gravity(),
                can_bomb(2),
                wor({
                    can_use_pbs(1),
                    wand({
                        super(),
                        wor({
                            speedball(),
                            can_bomb(1)
                        })
                    })
                })
            })
        end,
        post_available = function()
            return wor({
                speedball(),
                bomb()
            })
        end
    },
    ["Ocean Shore Bottom"] = {
        access_from = function()
            return has_access_to('OceanShoreR')
        end
    },
    ["Ocean Shore Top"] = {
        access_from = function()
            return has_access_to("OceanShoreR")
        end,
        available = function()
            return oceanShoreTop()
        end
    },
    ["Sandy Cache"] = {
        access_from = function()
            return has_access_to("OceanShoreR")
        end,
        available = function()
            return shaftToGreenMoon()
        end
    },
    ["Submarine Nest"] = {
        access_from = function()
            return has_access_to("OceanShoreR")
        end,
        available = function()
            return wand({
                gravity(),
                shaftToGreenMoon(),
                shaftToSubmarineNest()
            })
        end
    },
    ["Shrine Of the Penumbra"] = {
        access_from = function()
            return has_access_to("OceanShoreR")
        end,
        available = function()
            return wand({
                gravity(),
                missileDamage(),
                pinkDoor(),
                
            })
        end
    }
}

function get_access_to_loc(name)    
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_LOCATION then
        print(string.format("called get_access_to_loc: name: %s", name))
    end
    local loc = LOCATIONS[name]
    if loc == nil or type(loc) ~= "table" then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_LOCATION then
            -- print(string.format("\tunknown location: %s", name))
        end
        return 0
    end
    if loc.access_from == nil then
        loc.access_from = function()
            return 1
        end
    end
    if loc.available == nil then
        loc.available = function()
            return 1
        end
    end
    if loc.post_available == nil then
        loc.post_available = function()
            return 1
        end
    end
    local value_access_from = loc.access_from()
    local value_available = loc.available()
    local value_post_available = loc.post_available()
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_LOCATION then
        if value_access_from == nil then
            print(string.format("\taccess_from has no return value: %s", name))      
        else
            print(string.format("\taccess_from: value: %s", value_access_from))
        end
        if value_available == nil then
            print(string.format("\tavailable has no return value: %s", name))      
        else
            print(string.format("\tavailable: value: %s", value_available))
        end
        if value_post_available == nil then
            print(string.format("\tpost_available has no return value: %s", name))      
        else
            print(string.format("\tpost_available: value: %s", value_post_available))
        end
    end
    local value = wand({
        value_access_from,
        value_available,
        value_post_available
    })
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_LOCATION then
        print(string.format("\tvalue: %s", value))
    end
    if value > 0 then
        return 1
    end
    return 0
end
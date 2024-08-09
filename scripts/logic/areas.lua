CLEAN_REGIONS = {
    ["PreDrop"] = {
        exits = {
            ["SunkenNestL"] = function()
                return 1
            end,
        }
    },

    -- Early
    ["SunkenNestL"] = {
        exits = {
            ["CraterR"] = function()
                return wand({ 
                    gravity(), 
                    wor({ 
                        wand({
                            space(),
                            wor({
                                hijump(),
                                spaceboost()
                            })
                        }),
                        speed()
                    })
                })
            end,
            ["RuinedConcourseBL"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missileBarrier(),
                    cisternAccessTunnel(),
                })
            end,
            ["RuinedConcourseTR"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missileBarrier(),
                    cisternAccessTunnel(),
                })
            end,
            ["SporeFieldBR"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missileBarrier(),
                    shootThroughWalls(),
                    sporeFieldEntrance()
                })
            end,
            ["OceanShoreR"] = function()
                return 1
            end
        },
    },
    ["CraterR"] = {
        exits = {
            ["SunkenNestL"] = function()
                return wand({ 
                    gravity(), 
                    powerbomb(),
                    wor({ 
                        wand({
                            space(),
                            wor({
                                hijump(),
                                spaceboost()
                            })
                        }),
                        speed()
                    })
                })
            end,
        }
    },
    ["RuinedConcourseBL"] = {
        exits = {
            ["SunkenNestL"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missileBarrier(),
                    cisternAccessTunnel(),
                })
            end,
            ["CausewayR"] = function()
                return wand({
                    gravity(),
                    causeway()
                })
            end
        }
    },
    ["RuinedConcourseTR"] = {
        exits = {
            ["SunkenNestL"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missileBarrier(),
                    cisternAccessTunnel(),
                    concourseShinespark()
                })
            end,
            ["RuinedConcourseBL"] = function()
                return wand({
                    gravity(),
                    concourseShinespark()
                })
            end,
            ["CausewayR"] = function()
                return wand({
                    gravity(),
                    causeway(),
                    concourseShinespark()
                })
            end
        }
    },
    ["CausewayR"] = {
        exits = {
            ["SunkenNestL"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missile(),
                    cisternAccessTunnel(),
                    causeway(),
                })
            end,
            ["RuinedConcourseBL"] = function()
                return wand({
                    gravity(),
                    causeway()
                })
            end,
            ["RuinedConcourseTR"] = function()
                return wand({
                    gravity(),
                    causeway(),
                    concourseShinespark()
                })
            end
        }
    },
    ["SporeFieldTR"] = {
        exits = {
            ["SunkenNest"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missileBarrier(),
                    cisternAccessTunnel()
                })
            end,
            ["RuinedConcourseBL"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    sporeFieldEntrance(),
                    cisternAccessTunnel()
                })
            end,
            ["RuinedConcourseTR"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    sporeFieldEntrance(),
                    cisternAccessTunnel(),
                    concourseShinespark()
                })
            end,
            ["CausewayR"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    sporeFieldEntrance(),
                    cisternAccessTunnel(),
                    causeway()
                })
            end
        }
    },  
    ["SporeFieldBR"] = {
        exits = {
            ["SunkenNestL"] = function()
                return wand({
                    gravity(),
                    pinkDoor(),
                    missileBarrier(),
                    shootThroughWalls(),
                    sporeFieldEntrance()
                })
            end,
            ["RuinedConcourseBL"] = function()
                return wand({
                    gravity(),
                    shootThroughWalls(),
                    pinkDoor(),
                    sporeFieldEntrance(),
                    cisternAccessTunnel()
                })
            end,
            ["SporeFieldTR"] = function()
                return wand({
                    gravity(),
                    shootThroughWalls()
                })
            end,
            ["CausewayR"] = function()
                return wand({
                    gravity(),
                    shootThroughWalls(),
                    pinkDoor(),
                    sporeFieldEntrance(),
                    cisternAccessTunnel(),
                    causeway()
                })
            end
        }
    },

    -- SandLand
    ["OceanShoreR"] = {
        exits = {
            ["SunkenNestL"] = function()
                return 1
            end,
            ["EleToTurbidPassigeR"] = function()
                return wand({
                    turbidToSedFloor(),
                    wor({
                        super(),
                        wand({
                            underwaterSuperSink(),
                            pinkDoor()
                        })
                    }),
                    wor({
                        wand({
                            sedFloorToCanyon(),
                            canyonToGreenMoon(),
                            GreenMoonDown()
                        }),
                        wand({
                            sedFloorToCanyon(),
                            canyonToShaft(),
                            shaftToGreenMoon()
                        }),
                        wand({
                            lowerLowerToSubCrevice(),
                            subCreviceToSedFloor(),
                            super(),
                            shaftToLowerLower(),
                            wor({
                                wand({
                                    canyonToShaft(),
                                    canyonToGreenMoon(),
                                    GreenMoonDown()
                                }),
                                shaftToGreenMoon()
                            })
                        })
                    })
                })
            end
        }
    }
}
REGIONS = CLEAN_REGIONS

function has_access_to(region_name)
    local start = 'PreDrop'

    if not start or not REGIONS[start] then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
            print(string.format("called has_access_to: unknown start location %s", start))
        end
        return 0
    end
    if start == region_name then
        return 1
    end
    local value = check_access(start, region_name, {})
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
        print(string.format("called has_access_to: region_name: %s, start: %s, value: %s", region_name, start, value))
    end
    if value > 0 then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
            print(string.format("\t we found a way from %s to %s! yay \\o/", start, region_name))
        end
        return 1
    end
    return 0
end

function check_access(region_name, goal, checked_regions)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
        print(string.format("called check_access: region_name: %s, goal: %s, checked_regions: %s", region_name, goal,
            #checked_regions))
        for k, v in pairs(checked_regions) do
            print(string.format('\t already checked %s', v))
        end
    end
    local value = 0
    if not REGIONS[region_name] or not REGIONS[region_name].exits then
        return 0
    end
    for k, v in pairs(REGIONS[region_name].exits) do
        local exit_func_return = v()
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
            if exit_func_return == nil then
                print(string.format("\t exits function has no return value: region_name: %s -> k: %s", region_name, k))
            end
            print(string.format("\t region_name: %s -> k: %s, v(): %s", region_name, k, exit_func_return))
        end
        if k == goal and exit_func_return > 0 then
            return 1
        elseif exit_func_return > 0 then
            local already_checked = false
            for _, region in pairs(checked_regions) do
                if region == k then
                    already_checked = true
                end
            end
            if not already_checked then
                table.insert(checked_regions, region_name)
                value = check_access(k, goal, checked_regions)
                if value > 0 then
                    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
                        print(string.format(
                        "\t we found it \\o/, returning 1; region_name: %s, goal: %s, checked_regions: %s", region_name,
                            goal, #checked_regions))
                    end
                    return 1
                end
            else
                if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
                    print(string.format("\t skipping k %s: already checked", k))
                end
            end
        end
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
        print(string.format("\t deadend returning 0; region_name: %s, goal: %s, checked_regions: %s", region_name, goal,
            #checked_regions))
    end
    return 0
end

function get_start_location()
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
        print(string.format("called get_start_location"))
    end
    if not SLOT_DATA or not SLOT_DATA['start_location'] or not START_LOCATIONS[SLOT_DATA['start_location']] then
        return nil
    end
    return START_LOCATIONS[SLOT_DATA['start_location']]
end

function set_transitions(slot_data)
    REGIONS = CLEAN_REGIONS
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
        print(string.format("called set_transitions"))
    end
    if slot_data == nil or slot_data['InterAreaTransitions'] == nil or slot_data['area_randomization'] == nil then
        return
    end
    for k, v in pairs(slot_data['InterAreaTransitions']) do
        local obj = Tracker:FindObjectForCode("trans_" .. k:gsub("[%s]+", ""))
        if obj then
            obj:Set("state", 0)
            obj:Set("active", false)
        end
    end
    for k, v in pairs(slot_data['InterAreaTransitions']) do
        local obj = Tracker:FindObjectForCode("trans_" .. k:gsub("[%s]+", ""))
        if obj then
            obj:Set("state", Transition.STATES[v])
            if k:find('In') or k:find('Out') then
                obj:Set("active", is_boss_rando() == 0)
            else
                obj:Set("active", is_area_rando() == 0)
            end
        end
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_ACCESS then
        --print(string.format("REGIONS: %s", dump_table(REGIONS)))
    end
end

--function inject_area_trans(slot_data)
--    REGIONS = CLEAN_REGIONS
--    if AUTOTRACKER_ENABLE_DEBUG_LOGGING then
--        print(string.format("called inject_area_trans"))
--    end
--    if slot_data == nil or slot_data['InterAreaTransitions'] == nil then
--       return
--    end
--    for k, v in pairs(slot_data['InterAreaTransitions']) do
--        if REGIONS[k] and not REGIONS[k].exits[v] and REGIONS[k].traverse then
--            if AUTOTRACKER_ENABLE_DEBUG_LOGGING then
--                print(string.format("\tinjecting %s exit into %s", v, k))
--            end
--            REGIONS[k].exits[v] = REGIONS[k].traverse
--        else
--            if AUTOTRACKER_ENABLE_DEBUG_LOGGING then
--                print(string.format("\tskipping injecting %s exit into %s", v, k))
--            end
--        end
--    end
--end

function get_connection(region_name)
    if REGIONS == nil or REGIONS[region_name] == nil then
        return nil
    end
    return REGIONS[region_name]
end

function is_vanilla_draygon()
    if get_connection('DraygonRoomOut') == 'DraygonRoomIn' then
        return 1
    end
    return 0
end
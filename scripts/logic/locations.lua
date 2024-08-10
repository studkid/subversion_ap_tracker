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
    ["Shrine Of The Penumbra"] = {
        access_from = function()
            return has_access_to("OceanShoreR")
        end,
        available = function()
            return wand({
                gravity(),
                missileDamage(),
                pinkDoor(),
                kraid(),
                wor({
                    wand({
                        aqua(),
                        wor({
                            canFly(),
                            hijump(),
                            gravity_jump(),
                            short_charge_2(),
                            sbj_no_hjb()
                        })
                    }),
                    sbj_underwater_w_hjb()
                }),
                wor({
                    wand({
                        can_bomb(1),
                        darkvisor()
                    }),
                    can_use_pbs(2),
                    wand({
                        darkvisor(),
                        morph(),
                        wor({
                            wand({
                                shootThroughWalls(),
                                wor({
                                    morph_jump_4_tile(),
                                    speedball()
                                })
                            }),
                            wand({
                                screw(),
                                speedball(),
                                bonkCeilingSuperSink()
                            })
                        })
                    })
                })
            })
        end
    },
    ["Sandy Burrow Top"] = {
        access_from = function()
            return has_access_to("OceanShoreR")
        end,
        available = function()
            return wand({
                morph(),
                gravity(),
                wor({
                    aqua(),
                    wand({
                        hijump(),
                        movement_zoast()
                    }),
                    sbj_underwater_w_hjb()
                }),
                wor({
                    wand({
                        aqud(),
                        wor({
                            screw(),
                            wand({
                                can_bomb(1),
                                movement_moderate()
                            }),
                            can_bomb(2)
                        })
                    }),
                    wand({
                        wor({
                            sbj_underwater_no_hjb(),
                            hijump()
                        }),
                        wor({
                            wand({
                                can_bomb(1),
                                movement_zoast()
                            }),
                            can_bomb(2)
                        })
                    })
                }),
                wor({
                    energy_req(150),
                    movement_moderate()
                })
            })
        end
    },
    ["Sandy Burrow Bottom"] = {
        access_from = function()
            return has_access_to("OceanShoreR")
        end,
        available = function()
            return wand({
                morph(),
                gravity(),
                wor({
                    aqua(),
                    wand({
                        hijump(),
                        movement_zoast()
                    }),
                    sbj_underwater_w_hjb()
                }),
                wor({
                    speedball(),
                    wand({
                        aqua(),
                        bomb()
                    }),
                    wand({
                        aqua(),
                        powerbomb()
                    }),
                    morph_jump_3_tile_water()
                }),
                wor({
                    aqua(),
                    sbj_underwater_w_hjb(),
                    wand({
                        hijump(), 
                        ice(),
                        freeze_hard()
                    })
                })
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
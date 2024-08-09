-- Item Usability
function ammo_req(amount)
    ammo = 0
    if missile() == 1 then
        ammo = ammo + 10
    end
    if super() == 1 then
        ammo = ammo + 10
    end
    if powerbomb() == 1 then
        ammo = ammo + 10
    end

    ammo = ammo + (get_consumable_qty("small") * 5) + (get_consumable_qty("large") * 10)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_LOGIC then
        print ("\tCalling ammo_req: Total Ammo = %s", ammo)
    end
    
    if ammo >= amount then
        return 1
    else
        return 0
    end
end

function energy_req(ammount)
    return 99 * get_consumable_qty("etank")
end

function can_use_pbs(pbNeeded)
    return wand({
        morph(),
        powerbomb(),
        ammo_req(pbNeeded * 10)
    })
end

function can_bomb(pbNeeded)
    return wand({
        morph(),
        wor({
            bomb(),
            wand({
                powerbomb(),
                ammo_req(pbNeeded * 10)
            })
        })
    })
end

function shootThroughWalls()
    return wand({
        wave(),
        wor({
            charge(),
            hyper()
        })
    })
end

function iceSBA()
    return wand({
        ice(),
        charge(),
        powerbomb()
    })
end

function plasmaSBA()
    return wand({
        plasma(),
        charge(),
        powerbomb()
    })
end

function iceSBA()
    return wand({
        spazer(),
        charge(),
        powerbomb()
    })
end

function canFly()
    return wand({
        gravity(),
        wor({
            space(),
            0 -- Tricks.infinite_bomb_jump
        })
    })
end

function darkRoom()
    return wor({
        darkvisor,
        0 -- Tricks.dark_medium
    })
end

--Walls
function missileDamage()
    return wor({
        missile(),
        super()
    })
end

function pinkDoor()
    return missileDamage()
end

function missileBarrier()
    return wor({
        missileDamage,
        wand({
            charge(),
            hyper(),
        })
    })
end

-- Tricks (NYI)
function underwaterSuperSink()
    return wand({
        0, -- Tricks.super_sink_hard
        wor({
            0, --Tricks.patience
            xray(),
            0, --Tricks.movement_zoast
        }),
        0 -- Placeholder for if/when this trick is added to logic.  Currently is forced to False
    })
end

-- Early shortcuts
function cisternAccessTunnel()
    return wand({
        morph(),
        wor({
            speedball(),
            bomb(),
            powerbomb()
        })
    })
end

function causeway()
    return wor({
        speed(),
        wand({
            can_bomb(2),
            speedball()
        }),
        wand({
            aqua(),
            gravity(),
            screw(),
            morph(),
            wor({
                speedball(),
                can_bomb(1)
            })
        })
    })
end

function concourseShinespark()
    return wand({
        speed(),
        energy_req(180),
        morph()
    })
end

function sporeFieldEntrance() 
    return wand({
        morph(),
        wor({
            speedball(),
            bomb(),
            powerbomb(),
        })
    })
end

-- SandLand Shortcuts
function oceanShoreTop()
    return wand({
        gravity(),
        wor({
            wand({
                0, -- Tricks.movement_moderate
                0  -- Tricks.wall_jump_delayed
            }),
            canFly(),
            hijump(),
            wand({
                0, -- Tricks.wall_jump_precise
                ice()
            }),
            speed()
        })
    })
end

function sedimentTunnel()
    return wand({
        aqua(),
        morph(),
        gravity(),
        wor({
            speedball(),
            0 -- Tricks.movement_zoast
        })
    })
end

function lowerLowerToSubCrevice()
    return wand({
        gravity,
        darkRoom(),
        wor({
            aqua(),
            wor({
                hijump,
                0 -- Tricks.crouch_precise
            }),
            0, -- Tricks.sbj_underwater_no_hjb
            0  -- Tricks.freeze_hard
        }),
        pinkDoor(),
        wor({
            aqua(),
            wand({
                hijump(),
                wor({
                    0, -- Tricks.uwu_2_tile
                    wand({
                        super,
                        wor({
                            0, -- Tricks.freeze_hard
                            0, -- Tricks.sbj_underwater_w_hjb
                        })
                    })
                })
            })
        })
    })
end

function subCreviceToSedFloor()
    return wand({
        gravity(),
        darkRoom(),
        morph(),
        pinkDoor(),
        wor({
            aqua(),
            wand({
                hijump(),
                0, -- Tricks.crouch_or_downgrab
                0  -- Tricks.movement_moderate
            })
        })
    })
end

function sedFloorToCanyon()
    return wand({
        gravity(),
        pinkDoor(),
        wor({
            aqua(),
            hijump()
        })
    })
end

function canyonToGreenMoon()
    return wand({
        gravity(),
        wor({
            aqua(),
            wand({
                hijump(),
                wor({
                    wand({
                        0, -- Tricks.uwu_2_tile
                        0  -- Tricks.crouch_precise
                    }),
                    0, -- Tricks.freeze_hard
                    0  -- Tricks.sbj_underwater_w_hjb
                })
            })
        })
    })
end

function canyonToShaft()
    return wand({
        super(),
        sedimentTunnel()
    })
end

function shaftToGreenMoon()
    return wand({
        gravity(),
        wor({
            pinkDoor(),
            wand({
                morph(),
                wor({
                    aqua(),
                    hijump(),
                    0 -- Tricks.sbj_underwater_no_hjb
                })
            })
        })
    })
end

function shaftToLowerLower()
    return wand({
        gravity(),
        pinkDoor(),
        wor({
            aqua(),
            hijump(),
            0 -- Tricks.sbj_underwater_no_hjb
        }), 
        pinkDoor(),
        morph(),
        wor({
            wand({
                aqua(),
                screw(),
            }),
            wand({
                darkvisor(),
                morph(),
                wor({
                    speedball(),
                    wand({
                        aqua(),
                        can_bomb(1)
                    }),
                }),
                shootThroughWalls(),
                iceSBA(),
                plasmaSBA(),
                spazerSBA(),
                wand({
                    aqua(),
                    speed()
                })
            })
        }),
        wand({
            morph(),
            aqua(),
            speed(),
            0, -- Tricks.super_sink_easy
            wor({
                speed(),
                can_bomb(1)
            })
        }),
        darkRoom()
    })
end

function eddy()
    return wand({
        morph(),
        wor({
            speedball(),
            wand({
                aqua(),
                bombs(),
                0 -- Tricks.movement_zoast
            })
        }),
        darkRoom()
    })
end

function benthic()
    return wand({
        gravity(),
        can_bomb(2),
        super(),
        wor({
            aqua(),
            hijump(),
            0, -- Tricks.movement_moderate
            wor({
                0, -- Tricks.crouch_precise
                0, -- Tricks.sbj_underwater_w_hjb
                0  -- Tricks.uwu_2_tile
            })
        }),
        darkRoom()
    })
end

function turbidToSedFloor()
    return wand({
        gravity(),
        morph(),
        wor({
            morph(),
            wor({
                wand(
                    hijump(),
                    0 -- Tricks.movement_moderate
                ),
                wand({
                    super(),
                    eddy()
                })
            })
        })
    })
end

function directionalSedFloorToGreenMoonThroughSeaCaves()
    return wand({
        pinkDoor(),
        subCreviceToSedFloor(),
        lowerLowerToSubCrevice(),
        shaftToLowerLower(),
        shaftToGreenMoon()
    })
end

function GreenMoonDown()
    return wor({
        super(),
        wand({
            0, -- Tricks.moonfall_clip
            gravity(),
            wor({
                aqua(),
                oceanShoreTop()
            }),
            wor({
                morph(),
                aqua()
            }),
            wor({
                can_use_pbs(1),
                wand({
                    canyonToShaft(),
                    shaftToGreenMoon()
                }),
                wand({
                    sedFloorToCanyon(),
                    directionalSedFloorToGreenMoonThroughSeaCaves()
                })
            })
        })
    })
end

function shaftToSubmarineNest()
    return wand({
        pinkDoor(),
        wor({
            wand({
                aqua(),
                wor({
                    morph(),
                    0, -- Tricks.gravity_jump
                    ice(),
                    space()
                })
            }),
            wand({
                hijump(),
                wor({
                    ice(),
                    0, -- Tricks.crouch_or_downgrab
                    0  -- tricks.sbj_underwater_w_hjb
                })
            }),
            0 -- Tricks.sbj_underwater_no_hjb
        })
    })
end
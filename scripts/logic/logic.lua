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
            infinite_bomb_jump()
        })
    })
end

function darkRoom()
    return wor({
        darkvisor(),
        dark_medium()
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
        missileDamage(),
        wand({
            charge(),
            hyper(),
        })
    })
end

-- Boss Kill Logic
function kraid()
    return wand({
        gravity(),
        missileDamage(),
        wor({
            aqua(),
            wand({
                sbj_underwater_w_hjb(),
                wor({
                    movement_zoast()m
                })
            })

        })
    })

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
                movement_moderate(),
                wall_jump_delayed()
            }),
            canFly(),
            hijump(),
            wand({
                Tricks.wall_jump_precise(),
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
            Tricks.movement_zoast()
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
                hijump(),
                crouch_precise()
            }),
            sbj_underwater_no_hjb(),
            freeze_hard()
        }),
        pinkDoor(),
        wor({
            aqua(),
            wand({
                hijump(),
                wor({
                    uwu_2_tile(),
                    wand({
                        super,
                        wor({
                            freeze_hard(),
                            sbj_underwater_w_hjb()
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
                crouch_or_downgrab(),
                movement_moderate()
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
                        uwu_2_tile(),
                        crouch_precise()
                    }),
                    freeze_hard(),
                    sbj_underwater_w_hjb()
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
                    sbj_underwater_no_hjb()
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
            sbj_underwater_no_hjb()
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
            super_sink_easy(),
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
                movement_zoast()
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
            movement_moderate(),
            wor({
                crouch_precise(),
                sbj_underwater_w_hjb(),
                uwu_2_tile()
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
                    movement_moderate()
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
            moonfall_clip(),
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
                    gravity_jump(),
                    ice(),
                    space()
                })
            }),
            wand({
                hijump(),
                wor({
                    ice(),
                    crouch_or_downgrab, 
                    sbj_underwater_w_hjb 
                })
            }),
            sbj_underwater_no_hjb
        })
    })
end

-- Tricks (NYI)
function infinite_bomb_jump()
    return wand({
        morph(),
        bomb(),
        0
    })
end

function sbj_underwater_no_hjb()
    return wand({
        morph(),
        speedball(),
        0
    })
end

function sbj_underwater_w_hjb()
    return wand({
        morph(),
        speedball(),
        hijump(),
        0
    })
end 

function sbj_no_hjb()
    return wand({
        morph(),
        speedball(),
        0
    })
end

function sbj_w_hjb()
    return wand({
        morph(),
        speedball(),
        hijump(),
        0
    })
end 

function sbj_wall()
    return wand({
        morph(),
        speedball(),
        0
    })
end

function uwu_2_tile()
    return 0
end

function uwu_2_tile_surface()
    return 0 
end

function gravity_jump()
    return wand({
        gravity(),
        0
    })
end

function hell_run_hard()
    return 0
end

function hell_run_medium()
    return 0
end

function hell_run_easy()
    return 0
end

function movement_moderate()
    return 0
end

function movement_zoast()
    return 0
end

function wall_jump_delayed()
    return 0
end

function wall_jump_precise()
    return 0
end

function crumble_jump()
    return 0
end

function mockball_hard()
    return wand({
        morph(),
        0
    })
end

function morphless_tunnel_crawl()
    return 0
end

function morph_jump_3_tile()
    return wand({
        morph(),
        0
    })
end

function morph_jump_4_tile()
    return wand({
        morph(),
        0
    })
end

function morph_jump_3_tile_up_1()
    return wand({
        morph(),
        0
    })
end

function morph_jump_3_tile_water()
    return wand({
        morph(),
        0
    })
end

function crouch_or_downgrab()
    return 0
end

function crouch_precise()
    return 0
end

function dark_easy()
    return 0
end

function dark_medium()
    return 0
end

function dark_hard()
    return 0
end

function freeze_hard()
    return wand({
        ice(),
        0
    })
end

function wave_gate_glitch()
    return 0
end

function ggg()
    return 0
end

function clip_crouch()
    return 0
end

function short_charge_2()
    return wand({
        speed(),
        0
    })
end

function short_charge_3()
    return wand({
        speed(),
        0
    })
end

function short_charge_4()
    return wand({
        speed(),
        0
    })
end

function xray_climb()
    return wand({
        xray(),
        0
    })
end

function ice_clip()
    return wand({
        ice(),
        0
    })
end

function moonfall_clip()
    return 0
end

function super_sink_easy()
    return wand({
        gravity(),
        0
    })
end

function super_sink_hard()
    return wand({
        gravity(),
        morph(),
        0
    })
end

function patience()
    return 0
end

function searing_gate_tricks()
    return wand({
        morph(),
        0
    })
end

function spazer_into_lower_pirate_lab()
    return wand({
        spazer(),
        0
    })
end

function underwaterSuperSink()
    return wand({
        super_sink_hard()
        wor({
            patience(),
            xray(),
            movement_zoast()
        }),
        0 -- Placeholder for if/when this trick is added to logic.  Currently is forced to False
    })
end
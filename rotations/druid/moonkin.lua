-- Thanks to Boomkin for some ideas codes.
ProbablyEngine.rotation.register_custom(102, "CodeMyLife Moonkin", {
	{"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126","!player.hasaura(1)"},
	-- Pause Rotation - Bear Form
	{"pause","player.seal = 1"},
	-- Pause Rotation - Cat Form
	{"pause","player.seal = 3"},
	-- Moonkin Form
	{"24858","player.seal != 5"},
	-- Tranquility 
	{"108288",{ -- Heart of the Wild
  		"player.spell(108288).exists",
  		"Tranquility.pqikeybind",
 	}},
 	{"740","Tranquility.pqikeybind"}, -- Tranquility
	-- innervate
	{"29166","player.mana < 50"},
	-- Barkskin
	{"22812","Barkskin.novaHealing(0)"},
	-- Nature Swiftness
	{"132158","HealingTouch.novaHealing(0)"},
	-- Healing Touch
	{"5185",{
		"player.buff(132158)",
		"HealingTouch.novaHealing(0)",
	}},
	-- Renewal
	{"108238",{
		"player.spell(108238).exists",
		"Renewal.novaHealing(0)",
	}},
	-- Rejuvenation 
	{"774",{
		"macros(ActiveHealing)",
		"!player.buff(774)",
		"Rejuvenation.novaHealing(0)",
	}},
	-- Cenarion Ward
	{"Cenarion Ward",{ 
		"player.spell(108238).exists",
		"player.health <= 75",
	}},            
    -- Healthstone   
    {"#5512",{
        "@CML.HealthStone()",
        "Healthstone.novaHealing(0)",
    }},   
	-- jade_serpent_potion,if=buff.bloodlust.react|target.time_to_die<=40|buff.celestial_alignment.up
	{"#76093",{
        "DPSPotiononHeroism.pqicheck",
        "@CML.DPSPotion(76093)",
    }},
	-- use_item,slot=hands,if=buff.celestial_alignment.up|cooldown.celestial_alignment.remains>30
    {"#gloves",{ -- Gloves  -- On CD
        "ProfessionsCDs.pqivalue = 2",
        "target.exists",
    }}, 
    {"#gloves",{ -- Gloves  -- On ActiveCooldowns
        "ProfessionsCDs.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "target.exists",
    }}, 
    {"#trinket1",{ -- Trinket1  -- On CD
        "Trinkets.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }},
    {"#trinket1",{ -- Trinket1 -- On ActiveCooldowns
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "pet.exists",
        "target.exists",
    }},
    {"#trinket2",{ -- Trinket2    -- On CD
        "Trinkets.pqivalue = 2",
        "pet.exists",
        "target.exists",
    }},
    {"#trinket2",{ -- Trinket2  -- On ActiveCooldowns 
        "Trinkets.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "pet.exists",
        "target.exists",
    }},
	-- celestial_alignment,if=(!buff.lunar_eclipse.up&!buff.solar_eclipse.up)&(buff.chosen_of_elune.up|!talent.incarnation.enabled|cooldown.incarnation.remains>10)
	{"112071",{ -- On CD
        "Incarnation.pqicheck",
        "Incarnation.pqivalue = 2",
		"@CML.NotEclipse()",
	}},  
	{"112071",{ -- On ActiveCooldowns 
        "Incarnation.pqicheck",
        "Incarnation.pqivalue = 1",
        "macros(ActiveCooldowns)",
		"@CML.NotEclipse()",
	}},
   	-- Berserking
    {"26297",{ -- On CD
        "Racials.pqicheck",
        "Racials.pqivalue = 2",
        "spell.exists",
    }},
    {"26297",{ -- On ActiveCooldowns 
        "Racials.pqicheck",
        "Racials.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
    }},
   -- Lifeblood
    {"121279",{ -- On CD
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 2",
        "spell.exists",
    }},
    {"121279",{ -- On ActiveCooldowns 
        "ProfessionsCDs.pqicheck",
        "ProfessionsCDs.pqivalue = 1",
        "macros(ActiveCooldowns)",
        "spell.exists",
    }},
    -- Mirror Images
	{"110621","player.spell(110621).exists"}, 
	-- Force of Nature
	{"106737",{
		"player.spell(106737).exists",
		"player.buff(16886)",
		"player.spell(106737).charges >= 2",
	}},
	-- starfall,if=!buff.starfall.up
	{"48505",{
		"!player.buff(48505)"
	}},
	-- wild_mushroom_detonate,moving=0,if=buff.wild_mushroom.stack>0&buff.solar_eclipse.up
	{"88747",{
		"PlaceSchrooms.pqikeybind", 
	},"ground"},
	{"88751",{
		"DetonateSchrooms.pqikeybind",
	}},
	-- incarnation,if=talent.incarnation.enabled&(buff.lunar_eclipse.up|buff.solar_eclipse.up)
	{"106731","player.spell(106731).exists"},


	-- natures_vigil,if=talent.natures_vigil.enabled


	-- starsurge,if=buff.shooting_stars.react&(active_enemies<5|!buff.solar_eclipse.up)
	{"78674",{
		"player.buff(48517)",
	}},
	-- moonfire,cycle_targets=1,if=buff.lunar_eclipse.up&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"8921",{ 
		"!target.debuff(8921)",
		"player.buff(48518)",
		"@CML.StopDotsCheck(target)",
	}},
	-- sunfire,cycle_targets=1,if=buff.solar_eclipse.up&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"93402",{ 
		"!target.debuff(93402)",
		"player.buff(48517)",
		"@CML.StopDotsCheck(target)",
	}},
	-- hurricane,if=active_enemies>4&buff.solar_eclipse.up&buff.natures_grace.up
	{"16914","Hurricane.pqikeybind","ground"},
	-- moonfire,cycle_targets=1,if=active_enemies<5&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"8921",{ 
		"!target.debuff(8921)",
		"@CML.StopDotsCheck(target)",
	}},
	-- sunfire,cycle_targets=1,if=active_enemies<5&(remains<(buff.natures_grace.remains-2+2*set_bonus.tier14_4pc_caster))
	{"93402",{ 
		"!target.debuff(93402)",
		"@CML.StopDotsCheck(target)",
	}},
	-- hurricane,if=active_enemies>5&buff.solar_eclipse.up&mana.pct>25

	-- moonfire,cycle_targets=1,if=buff.lunar_eclipse.up&ticks_remain<2
	{"8921",{ 
		"target.debuff(8921).duration < 2",
		"player.buff(48518)",
		"@CML.StopDotsCheck(target)",
	}},
	-- sunfire,cycle_targets=1,if=buff.solar_eclipse.up&ticks_remain<2
	{"93402",{ 
		"target.debuff(93402).duration < 2",
		"player.buff(48517)",
		"@CML.StopDotsCheck(target)",
	}},
	-- hurricane,if=active_enemies>4&buff.solar_eclipse.up&mana.pct>25
	-- natures_swiftness,if=talent.dream_of_cenarius.enabled
	{"132158",{
		"player.spell(108373).exists",
		"!player.buff(145151)",
		"player.mana > 25",
	}},
	 -- healing_touch,if=talent.dream_of_cenarius.enabled&!buff.dream_of_cenarius.up&mana.pct>25
	{"5185",{
		"player.spell(108373).exists",
		"player.spell(5185).exists",
		"!player.buff(145151)",
		"player.mana > 25",
	},"player"},
	-- starsurge,if=cooldown_react
	{"78674","!player.moving"},	
	-- starfire,if=buff.celestial_alignment.up&cast_time<buff.celestial_alignment.remains
	{"2912",{
		"!player.moving",
		"player.buff(112071)",
		"player.spell(2912).quickcast",
		"@CML.StopCasting()",
	}},
	-- wrath,if=buff.celestial_alignment.up&cast_time<buff.celestial_alignment.remains
	{"5176",{
		"!player.moving",
		"player.buff(112071)",
		"player.spell(5176).quickcast",
		"@CML.StopCasting()",
	}},	
	-- starfire,if=eclipse_dir=1|(eclipse_dir=0&eclipse>0)
	{"2912",{
		"!player.moving",
		"player.balance.sun",
		"@CML.StopCasting()",
	}},
	-- wrath,if=eclipse_dir=-1|(eclipse_dir=0&eclipse<=0)
	{"5176",{
		"!player.moving",
		"player.balance.moon",
		"@CML.StopCasting()",
	}},
	-- moonfire,moving=1,cycle_targets=1,if=ticks_remain<2
	{"8921",{ 
		"target.debuff(8921).duration < 2",
		"player.buff(48518)",
		"@CML.StopDotsCheck(target)",
	}},
	-- sunfire,moving=1,cycle_targets=1,if=ticks_remain<2
	{"93402",{ 
		"!target.debuff(93402).duration < 2",
		"player.buff(48517)",
		"@CML.StopDotsCheck(target)",
	}},
	-- wild_mushroom,moving=1,if=buff.wild_mushroom.stack<buff.wild_mushroom.max_stack

	-- moonfire,moving=1,if=buff.lunar_eclipse.up
	{"8921",{ 
		"player.buff(48518)",
		"@CML.StopDotsCheck(target)",
	}},
	-- sunfire,moving=1
	{"93402",{ 
		"@CML.StopDotsCheck(target)",
	}},
		
},
{
	{"TaMere","@CML.PQIConfing()"},{"TaMere","@CML.Status()"},{"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
	-- Mark of the Wild
	{"1126",{ 
        "!player.hasaura(1)", -- Does not have Buff
    },"player"},
	-- Rejuvenation 
	{"774",{
		"!player.buff(774)",
		"Rejuvenation.novaHealing(0)",
	}},
})
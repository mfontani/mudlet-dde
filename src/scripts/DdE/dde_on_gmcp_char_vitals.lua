function dde_on_gmcp_char_vitals()
    -- echo("dde_on_gmcp_char_vitals()\n")

    -- display(gmcp.Char.Vitals)

    if (gmcp.Char.Name ~= nil and gmcp.Char.Name.name ~= nil) then
        DdE.Self_Name:echo(gmcp.Char.Name.name)
    end
    dde_set_gauge_val_and_pct(DdE.Self_HP, gmcp.Char.Vitals.hp, gmcp.Char.Vitals.maxhp, "Hp")
    local val = gmcp.Char.Vitals.mana or 0
    local max = gmcp.Char.Vitals.maxmana or 0
    if (val == 0 and max == 0) then
        dde_set_gauge_val_and_pct(DdE.Self_Mana, gmcp.Char.Vitals.blood, gmcp.Char.Vitals.maxblood, "Bl")
    else
        dde_set_gauge_val_and_pct(DdE.Self_Mana, gmcp.Char.Vitals.mana, gmcp.Char.Vitals.maxmana, "Mn")
    end
    dde_set_gauge_val_and_pct(DdE.Self_Move, gmcp.Char.Vitals.move, gmcp.Char.Vitals.maxmove, "Mv")
    val = gmcp.Char.Vitals.lag or 0
    DdE.Self_Lag:setValue(val, 5, "&nbsp;Lag: " .. val)
    if gmcp.Char.Vitals.allineamento == nil or gmcp.Char.Vitals.favori == nil then
        DdE.Self_Align:echo("&nbsp;n/a")
    else
        DdE.Self_Align:echo(gmcp.Char.Vitals.allineamento .. " / " .. gmcp.Char.Vitals.favori)
    end
    if (gmcp.Char.Vitals.ore ~= nil and gmcp.Char.Vitals.periodo ~= nil) then
        DdE.When:echo(gmcp.Char.Vitals.periodo .. " / " .. gmcp.Char.Vitals.ore)
    else
        DdE.When:echo("&nbsp;n/a")
    end
    if (gmcp.Char.Vitals.stato ~= nil) then
        DdE.Stato:echo(gmcp.Char.Vitals.stato)
    else
        DdE.Stato:echo("&nbsp;n/a")
    end
    if (gmcp.Char.Vitals.tank ~= nil and gmcp.Char.Vitals.tankpct ~= nil) then
        DdE.Tank_HP:setValue(gmcp.Char.Vitals.tankpct, 100, "&nbsp;" .. gmcp.Char.Vitals.tankpct .. "% - " .. gmcp.Char.Vitals.tank)
        DdE.Tank_HP:show()
    else
        DdE.Tank_HP:setValue(0, 1, "&nbsp;n/a")
        DdE.Tank_HP:hide()
    end
    if (gmcp.Char.Vitals.target ~= nil and gmcp.Char.Vitals.targetpct ~= nil) then
        DdE.Target_HP:setValue(gmcp.Char.Vitals.targetpct, 100, "&nbsp;" .. gmcp.Char.Vitals.targetpct .. "% - " .. gmcp.Char.Vitals.target)
        DdE.Target_HP:show()
    else
        DdE.Target_HP:setValue(0, 1, "&nbsp;n/a")
        DdE.Target_HP:hide()
    end
end

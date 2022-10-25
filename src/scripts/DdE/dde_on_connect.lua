function dde_on_connect()
    -- echo("dde_on_connect()\n")

    if (DdE == nil) then
        dde_sysinstall()
    end

    DdE.XPStart = nil
    DdE.XPPH:echo("N/A")
    DdE.Self_Name:echo("Disconnesso..")
    DdE.Self_HP:setValue(0, 1, "&nbsp;n/a")
    DdE.Self_Mana:setValue(0, 1, "&nbsp;n/a")
    DdE.Self_Move:setValue(0, 1, "&nbsp;n/a")
    DdE.Self_Lag:setValue(0, 1, "&nbsp;n/a")
    DdE.Self_Align:echo("&nbsp;n/a")
    DdE.When:echo("&nbsp;n/a")
    DdE.Stato:echo("&nbsp;n/a")
    DdE.Tank_HP:setValue(0, 1, "&nbsp;n/a")
    DdE.Tank_HP:hide()
    DdE.Target_HP:setValue(0, 1, "&nbsp;n/a")
    DdE.Target_HP:hide()
    DdE.Gruppo_Nome:hide()
    DdE.Gruppo_Leader:hide()

    local i = 1
    for i = 1, 10 do
        DdE.Gruppo[i]["hp"]:hide()
        DdE.Gruppo[i]["mana"]:hide()
        DdE.Gruppo[i]["move"]:hide()
        DdE.Gruppo[i]["magie"]:hide()
    end

end

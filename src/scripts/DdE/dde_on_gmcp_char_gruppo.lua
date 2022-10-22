function dde_on_gmcp_char_gruppo()
    -- echo("dde_on_gmcp_char_gruppo()");

    -- display(gmcp.Char.Gruppo)

    local i = 1
    for i = 1, 10 do
        DdE.Gruppo[i]["hp"]:hide()
        DdE.Gruppo[i]["mana"]:hide()
        DdE.Gruppo[i]["move"]:hide()
        DdE.Gruppo[i]["magie"]:hide()
    end
    if gmcp.Char.Gruppo.leader == nil then
        DdE.Gruppo_Nome:hide()
        DdE.Gruppo_Leader:hide()
        return
    end
    DdE.Gruppo_Nome:decho(ansi2decho(gmcp.Char.Gruppo.nome))
    DdE.Gruppo_Nome:show()
    DdE.Gruppo_Leader:echo("Leader: " .. gmcp.Char.Gruppo.leader)
    DdE.Gruppo_Leader:show()
    for i, v in ipairs(gmcp.Char.Gruppo.gruppo) do
        DdE.Gruppo[i]["hp"]:setValue(v.hp, 100, "Hp " .. v.nome)
        DdE.Gruppo[i]["mana"]:setValue(v.mana, 100, "Mn " .. v.nome)
        DdE.Gruppo[i]["move"]:setValue(v.move, 100, "Mv " .. v.nome)
        DdE.Gruppo[i]["hp"]:show()
        DdE.Gruppo[i]["mana"]:show()
        DdE.Gruppo[i]["move"]:show()
        local sp = {}
        sp["Vo"]=0
        sp["Le"]=0
        sp["Sa"]=0
        sp["Sc"]=0
        sp["Ar"]=0
        sp["SV"]=0
        sp["Fo"]=0
        sp["Be"]=0
        sp["Ag"]=0
        sp["AD"]=0
        if v.incantesimi ~= nil then
            for _, v in ipairs(v.incantesimi) do
                if (v == "volo") then sp["Vo"]=1 end
                if (v == "levitazione") then sp["Le"]=1 end
                if (v == "benedizione") then sp["Be"]=1 end
                if (v == "santificazione" or v == "aura sacra") then sp["Sa"]=1 end
                if (v == "volo") then sp["Vo"]=1 end
                if (v == "forza") then sp["Fo"]=1 end
                if (v == "scudo") then sp["Sc"]=1 end
                if (v == "armatura") then sp["Ar"]=1 end
                if (v == "seconda vista") then sp["SV"]=1 end
                if (v == "agilita felina") then sp["Ag"]=1 end
                if (v == "aiuto divino") then sp["AD"]=1 end
            end
        end
        local spt = ""
        for s, v in pairs(sp) do
            if v == 1 then
                spt = spt .. "<cyan>" .. s .. "</cyan>"
            else
                spt = spt .. "<firebrick>" .. s .. "</firebrick>"
            end
        end
        DdE.Gruppo[i]["magie"]:cecho(spt)
        DdE.Gruppo[i]["magie"]:show()
    end

end

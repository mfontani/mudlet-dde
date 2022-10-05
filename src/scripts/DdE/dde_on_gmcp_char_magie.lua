function getKeysSortedByValue(tbl, sortFunction)
    local keys = {}
    for key in pairs(tbl) do
        table.insert(keys, key)
    end
    table.sort(keys, function(a, b)
        return sortFunction(tbl[a], tbl[b])
    end)
    return keys
end

function dde_on_gmcp_char_magie()
    local magie = gmcp.Char.Magie
    local castate = {}
    local mvolute = {}
    -- mvolute["forza"] = 1
    -- mvolute["benedizione"] = 1
    -- mvolute["individuazione male"] = 1
    -- mvolute["percepisci magico"] = 1
    -- mvolute["volo"] = 1
    -- mvolute["scudo"] = 1
    -- mvolute["armatura"] = 1
    -- mvolute["invisibilita"] = 1
    -- mvolute["vedi invisibile"] = 1
    local avolute = {}
    -- avolute["strisciare"] = 1
    clearWindow("DdE Magie")
    -- DEBUG:  DdE.Magie:echo(yajl.to_string(magie) .. "\n")
    -- Itera incantesimi
    local mn = 0;
    if magie.incantesimi ~= nil then
        local sk = getKeysSortedByValue(magie.incantesimi, function(a,b) return b.durata < a.durata end)
        for _, k in ipairs(sk) do
            DdE.Magie:decho(
            (
            tonumber(magie.incantesimi[k].durata) <= 2 and "<234,35,35>"
            or tonumber(magie.incantesimi[k].durata) <= 20 and "<234,236,35>"
            or tonumber(magie.incantesimi[k].durata) >= 150 and "<37,188,36>"
            or "<200,200,200>")
            .. magie.incantesimi[k].durata .. ") " .. magie.incantesimi[k].nome .. "\n")
            castate[magie.incantesimi[k].nome] = 1
            mn = mn + 1
        end
    end
    DdE.Magie:decho("<200,200,200>")
    if mn == 0 then
        DdE.Magie:echo("-- 0 Magie\n")
    end

    -- FIXME mostra in rosso quelli "voluti ma mancanti"

    if magie.proprieta == nil then
        DdE.Magie:echo("-- 0 Proprietà\n")
    else
        for i, v in ipairs(magie.proprieta) do
            DdE.Magie:echo("P: " .. v.nome .. "\n")
            castate[v.nome] = 1
        end
    end
    if magie.resistenze == nil then
        DdE.Magie:echo("-- 0 Resistenze\n")
    else
        for i, v in ipairs(magie.resistenze) do
            DdE.Magie:echo("R: " .. v.nome .. " (" .. v.valore .. "%)\n")
        end
    end
    if magie.immunita == nil then
        DdE.Magie:echo("-- 0 Immunità\n")
    else
        for i, v in ipairs(magie.immunita) do
            DdE.Magie:echo("I: " .. v.nome .. "\n")
        end
    end
    if magie.suscettibilita == nil then
        DdE.Magie:echo("-- 0 Suscettibilità\n")
    else
        for i, v in ipairs(magie.suscettibilita) do
            DdE.Magie:echo("S: " .. v.nome .. "\n")
        end
    end

    for v, i in pairs(mvolute) do
        if castate[v] == nil then
            DdE.Magie:decho("<255,0,0>- ")
            DdE.Magie:dechoLink(v, function() send("form '"..v.."'") end, "Casta " .. v, true)
            DdE.Magie:decho("\n")
        end
    end

    for v, i in pairs(avolute) do
        if castate[v] == nil then
            DdE.Magie:decho("<255,0,0>- ")
            DdE.Magie:dechoLink(v, function() send(v) end, "Lancia " .. v, true)
            DdE.Magie:decho("\n")
        end
    end

    if gmcp.Char.Skills ~= nil then
        local skills = gmcp.Char.Skills
        local mignorate = {}
        mignorate["conosci allineamento"] = 1
        mignorate["disperdi magia"] = 1
        mignorate["fuoco fatuo"] = 1
        mignorate["paralisi"] = 1
        mignorate["paura"] = 1
        mignorate["teletrasporto"] = 1
        mignorate["valuta mostri"] = 1
        mignorate["parola di richiamo"] = 1
        mignorate["nascondersi"] = 1
        DdE.Magie:decho("------------\n")
        for i, k in ipairs(skills) do
            if skills[i].mana == nil then
                skills[i].mana = 0
            end
        end
        local sortedkeys = getKeysSortedByValue(skills, function(a,b)
            if a.mana == b.mana then
                return b.nome < a.nome
            else
                return a.mana < b.mana
            end
        end)
        -- display(sortedkeys)
        for _, k in ipairs(sortedkeys) do
            local sk = skills[k]
            if sk.tipo ~= nil then
                if sk.tipo == "abilita" or sk.tipo == "incantesimo" then
                    if sk.target ~= nil then
                        if sk.target == "self" or sk.target == "defensive" then
                            if sk.nome ~= nil and mignorate[sk.nome] == nil then
                                -- Se la hai gia' castata, non mostrarla
                                local trovata = 0
                                if gmcp.Char.Magie ~= nil and gmcp.Char.Magie.incantesimi ~= nil then
                                    for i, v in ipairs(gmcp.Char.Magie.incantesimi) do
                                        if v.nome ~= nil and v.nome == sk.nome then
                                            trovata = 1
                                        end
                                    end
                                end
                                if gmcp.Char.Magie ~= nil and gmcp.Char.Magie.proprieta ~= nil then
                                    for i, v in ipairs(gmcp.Char.Magie.proprieta) do
                                        if v.nome ~= nil and v.nome == sk.nome then
                                            trovata = 1
                                        end
                                    end
                                end
                                if trovata == 0 then
                                    -- if sk.livello ~= nil then
                                    --     DdE.Magie:echo("[" .. sk.livello .. "] ")
                                    -- end
                                    if sk.tipo == "incantesimo" then
                                        if gmcp.Char.Vitals ~= nil and gmcp.Char.Vitals.mana ~= nil then
                                            if sk.mana <= gmcp.Char.Vitals.mana then
                                                DdE.Magie:decho("<0,255,0>" .. sk.mana .. "<255,255,255>M<127,127,127>: ")
                                            else
                                                DdE.Magie:decho("<255,0,0>" .. sk.mana .. "<255,255,255>M<127,127,127>: ")
                                            end
                                        else
                                            DdE.Magie:echo(sk.mana .. "M: ")
                                        end
                                    else
                                        DdE.Magie:echo("Sk: ")
                                    end
                                    -- DdE.Magie:echo(sk.tipo)
                                    if sk.nome ~= nil then
                                        -- DdE.Magie:echo(" / ")
                                        if sk.tipo == "incantesimo" then
                                            DdE.Magie:dechoLink(sk.nome,
                                                function() send("form '" .. sk.nome .. "'") end,
                                                "Casta " .. sk.nome, true)
                                        else
                                            DdE.Magie:dechoLink(sk.nome,
                                                function() send(sk.nome) end,
                                                "Esegui " .. sk.nome, true)
                                        end
                                    end
                                    -- if sk.target ~= nil then
                                    --     DdE.Magie:echo(" (" .. sk.target .. ")")
                                    -- end
                                    DdE.Magie:echo("\n")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

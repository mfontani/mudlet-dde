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
end

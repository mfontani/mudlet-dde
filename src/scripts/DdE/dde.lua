DdE = {}

if DdE.RHS ~= nil then
    DdE.RHS:deleteSaveFile()
end
DdE.RHS = Adjustable.Container:new({
    name = "DdE RHS",
    titleText = "Status",
    attached = "right",
    width = "300",
    height = "100%",
    x = "-300"
})
DdE.RHS:connectToBorder("right")
DdE.RHS:attachToBorder("right")
DdE.RHS:lockContainer()
DdE.RHS:show()

if DdE.LHS ~= nil then
    DdE.LHS:deleteSaveFile()
end
DdE.LHS = Adjustable.Container:new({
    name = "DdE LHS",
    titleText = "PG & Gruppo",
    attached = "left",
    width = "200",
    height = "100%"
})
DdE.LHS:connectToBorder("left")
DdE.LHS:attachToBorder("left")
DdE.LHS:lockContainer()
DdE.LHS:move(0, 0)
DdE.LHS:show()

if DdE.TOP ~= nil then
    DdE.TOP:deleteSaveFile()
end
DdE.TOP = Adjustable.Container:new({
    name = "DdE Top",
    titleText = "Tells",
    attached = "top",
    width = "100%",
    height = "200"
})
DdE.TOP:attachToBorder("top")
DdE.TOP:connectToBorder("left")
DdE.TOP:lockContainer()
DdE.TOP:show()

DdE.Chat = Geyser.MiniConsole:new({
    name = "DdE Chat",
    x = 0,
    y = 0,
    autoWrap = true,
    color = 'black',
    scrollBar = false,
    fontSize = 10,
    width = "100%",
    height = "100%"
}, DdE.TOP)

DdE.Magie = Geyser.MiniConsole:new({
    name = "DdE Magie",
    x = 0,
    y = 0,
    autoWrap = true,
    color = 'black',
    scrollBar = false,
    fontSize = 9,
    width = "100%",
    height = "100%"
}, DdE.RHS)

DdE.Self = Geyser.Container:new({
    name = "DdE Self",
    x = 0, y = -8*20,
    width = "100%", height = 8*20
}, DdE.LHS)

DdE.Self_Name = Geyser.Label:new({
    name = "dde_self_name",
    x = 0, y = 0,
    height = 20, width = "100%"
}, DdE.Self)
DdE.Self_Name:setAlignment("center")
DdE.Self_Name:echo("N/A")
-- DdE.Self_Name:setFontSize(11)
DdE.Self_Name:setStyleSheet("background-color:transparent;")

DdE.Self_HP = Geyser.Gauge:new({
    name = "dde_self_hp",
    x = 0, y = 20,
    width = "100%", height = 20
}, DdE.Self)
DdE.Self_HP.front:setStyleSheet([[
background-color: #307000;
border-top: 1px black solid;
border-left: 1px black solid;
border-bottom: 1px black solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_HP.back:setStyleSheet([[
background-color: #002000;
border-width: 1px;
border-color: black;
border-style: solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_HP:setValue(0, 1, "&nbsp;n/a")

DdE.Self_Mana = Geyser.Gauge:new({
    name = "dde_self_mana",
    x = 0, y = 40,
    width = "100%", height = 20
}, DdE.Self)
DdE.Self_Mana.front:setStyleSheet([[
background-color: #0066cc;
border-top: 1px black solid;
border-left: 1px black solid;
border-bottom: 1px black solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_Mana.back:setStyleSheet([[
background-color: #002850;
border-width: 1px;
border-color: black;
border-style: solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_Mana:setValue(0, 1, "&nbsp;n/a")

DdE.Self_Move = Geyser.Gauge:new({
    name = "dde_self_move",
    x = 0, y = 60,
    width = "100%", height = 20
}, DdE.Self)
DdE.Self_Move.front:setStyleSheet([[
background-color: #5200a3;
border-top: 1px black solid;
border-left: 1px black solid;
border-bottom: 1px black solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_Move.back:setStyleSheet([[
background-color: #180050;
border-width: 1px;
border-color: black;
border-style: solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_Move:setValue(0, 1, "&nbsp;n/a")

DdE.Self_Lag = Geyser.Gauge:new({
    name = "dde_self_lag",
    x = 0, y = 80,
    width = "100%", height = 20
}, DdE.Self)
DdE.Self_Lag.front:setStyleSheet([[
background-color: #a35200;
border-top: 1px black solid;
border-left: 1px black solid;
border-bottom: 1px black solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_Lag.back:setStyleSheet([[
background-color: #401800;
border-width: 1px;
border-color: black;
border-style: solid;
border-radius: 4;
padding: 3px;
]])
DdE.Self_Lag:setValue(0, 1, "&nbsp;n/a")

DdE.Self_Align = Geyser.Label:new({
    name = "dde_self_align",
    x = 0, y = 100,
    width = "100%", height = 20
}, DdE.Self);
DdE.Self_Align:setAlignment("center")
DdE.Self_Align:setStyleSheet("background-color:transparent;")
DdE.Self_Align:echo("&nbsp;n/a")

DdE.When = Geyser.Label:new({
    name = "dde_self_when",
    x = 0, y = 120,
    width = "100%", height = 20
}, DdE.Self);
DdE.When:setAlignment("center")
DdE.When:setStyleSheet("background-color:transparent;")
DdE.When:echo("&nbsp;n/a")

DdE.Stato = Geyser.Label:new({
    name = "dde_self_stato",
    x = 0, y = 140,
    width = "100%", height = 20
}, DdE.Self);
DdE.Stato:setAlignment("center")
DdE.Stato:setStyleSheet("background-color:transparent;")
DdE.Stato:echo("&nbsp;n/a")

-- DdE.Self sta a 100% - 8*20
-- Questo sta a 100% - 11*20 e contiene 2*20
DdE.Combat = Geyser.Container:new({
    name = "dde_combat",
    x = 0, y = -11*20,
    width = "100%", height = 2*20
}, DdE.LHS);

DdE.Tank_HP = Geyser.Gauge:new({
    name = "dde_tank_hp",
    x = 0, y = 0,
    width = "100%", height = 20
}, DdE.Combat)
DdE.Tank_HP.front:setStyleSheet([[
background-color: #307000;
border-top: 1px black solid;
border-left: 1px black solid;
border-bottom: 1px black solid;
border-radius: 4;
padding: 3px;
]])
DdE.Tank_HP.back:setStyleSheet([[
background-color: #002000;
border-width: 1px;
border-color: black;
border-style: solid;
border-radius: 4;
padding: 3px;
]])
DdE.Tank_HP:setValue(0, 1, "&nbsp;n/a")
DdE.Tank_HP:hide()

DdE.Target_HP = Geyser.Gauge:new({
    name = "dde_target_hp",
    x = 0, y = 20,
    width = "100%", height = 20
}, DdE.Combat)
DdE.Target_HP.front:setStyleSheet([[
background-color: #307000;
border-top: 1px black solid;
border-left: 1px black solid;
border-bottom: 1px black solid;
border-radius: 4;
padding: 3px;
]])
DdE.Target_HP.back:setStyleSheet([[
background-color: #002000;
border-width: 1px;
border-color: black;
border-style: solid;
border-radius: 4;
padding: 3px;
]])
DdE.Target_HP:setValue(0, 1, "&nbsp;n/a")
DdE.Target_HP:hide()

DdE.GruppoC = Geyser.Container:new({
    name = "DdE Gruppo",
    x = 0, y = 0,
    width = "100%", height = "100%-240"
}, DdE.LHS)

DdE.Gruppo_Nome = Geyser.Label:new({
    name = "dde_gruppo_nome",
    x = 0, y = -20,
    width = "100%", height = 20
}, DdE.GruppoC);
DdE.Gruppo_Nome:setStyleSheet("background-color:transparent;")
DdE.Gruppo_Nome:echo("&nbsp;n/a")
DdE.Gruppo_Nome:hide()

DdE.Gruppo_Leader = Geyser.Label:new({
    name = "dde_gruppo_leader",
    x = 0, y = -40,
    width = "100%", height = 20
}, DdE.GruppoC);
DdE.Gruppo_Leader:setStyleSheet("background-color:transparent;")
DdE.Gruppo_Leader:echo("&nbsp;n/a")
DdE.Gruppo_Leader:hide()

DdE.Gruppo = {}
local i = 1
for i = 1, 10 do
    DdE.Gruppo[i] = {}
    DdE.Gruppo[i]["hp"] = Geyser.Gauge:new({
        name = "dde_group" .. i .. "_hp",
        x = 0, y = -40 -80 - 10 - (i-1) * 80,
        width = "100%", height = 20
    }, DdE.GruppoC)
    DdE.Gruppo[i]["hp"]:setValue(0, 1, i .. "&nbsp;n/a")
    DdE.Gruppo[i]["hp"]:setFontSize(12)
    DdE.Gruppo[i]["hp"].front:setStyleSheet([[
    background-color: #307000;
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 4;
    padding: 3px;
    ]])
    DdE.Gruppo[i]["hp"].back:setStyleSheet([[
    background-color: #002000;
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 4;
    padding: 3px;
    ]])
    DdE.Gruppo[i]["mana"] = Geyser.Gauge:new({
        name = "dde_group" .. i .. "_mana",
        x = 0, y = -40 -60 - 10 - (i-1) * 80,
        width = "100%", height = 10
    }, DdE.GruppoC)
    DdE.Gruppo[i]["mana"]:setValue(0, 1, i .. "&nbsp;n/a")
    DdE.Gruppo[i]["mana"]:setFontSize(7)
    DdE.Gruppo[i]["mana"].front:setStyleSheet([[
    background-color: #0066cc;
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 3;
    padding: 3px;
    ]])
    DdE.Gruppo[i]["mana"].back:setStyleSheet([[
    background-color: #002850;
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 3;
    padding: 3px;
    ]])
    DdE.Gruppo[i]["move"] = Geyser.Gauge:new({
        name = "dde_group" .. i .. "_move",
        x = 0, y = -40 -50 - 10 - (i-1) * 80,
        width = "100%", height = 10
    }, DdE.GruppoC)
    DdE.Gruppo[i]["move"]:setValue(0, 1, i .. "&nbsp;n/a")
    DdE.Gruppo[i]["move"]:setFontSize(7)
    DdE.Gruppo[i]["move"].front:setStyleSheet([[
    background-color: #5200a3;
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 3;
    padding: 3px;
    ]])
    DdE.Gruppo[i]["move"].back:setStyleSheet([[
    background-color: #180050;
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 3;
    padding: 3px;
    ]])
    DdE.Gruppo[i]["magie"] = Geyser.Label:new({
        name = "dde_group" .. i .. "_magie",
        x = 0, y = -40 -40 - 10 - (i-1) * 80,
        width = "100%", height = 20
    }, DdE.GruppoC);
    DdE.Gruppo[i]["magie"]:setStyleSheet("background-color:transparent;")
    DdE.Gruppo[i]["magie"]:setFontSize(8)
    DdE.Gruppo[i]["magie"]:echo("&nbsp;n/a")
    DdE.Gruppo[i]["magie"]:hide()
    DdE.Gruppo[i]["hp"]:hide()
    DdE.Gruppo[i]["mana"]:hide()
    DdE.Gruppo[i]["move"]:hide()
end

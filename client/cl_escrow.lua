local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = nil
L1_1 = false
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L0_2 = L0_2.targetSettings
  if L0_2 then
    L1_2 = L0_2.hasSavedTargetOptions
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2["Target-Settings"]
      L1_2 = L1_2.Settings
      L1_2 = L1_2["Enable-Player-Menu"]
      if L1_2 then
        L1_2 = {}
        L2_2 = L0_2.mainColor
        L1_2.mainColor = L2_2
        L2_2 = L0_2.hoverColor
        L1_2.hoverColor = L2_2
        L2_2 = L0_2.backgroundColor
        L1_2.backgroundColor = L2_2
        L2_2 = L0_2.eyeIcon
        L1_2.eyeIcon = L2_2
        L2_2 = L0_2.eyeSize
        L1_2.eyeSize = L2_2
        L2_2 = L0_2.eyeColor
        L1_2.defaultEyeColor = L2_2
        L2_2 = L0_2.textColor
        L1_2.textColor = L2_2
        L2_2 = L0_2.eyeLeft
        L1_2.eyeLeft = L2_2
        L2_2 = L0_2.eyeTop
        L1_2.eyeTop = L2_2
        L2_2 = L0_2.uiScale
        L1_2.uiScale = L2_2
        L2_2 = L0_2.textSize
        L1_2.textSize = L2_2
        L0_1 = L1_2
        L1_2 = L0_1
        return L1_2
    end
  end
  else
    L1_2 = {}
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Main-Color"]
    L1_2.mainColor = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Hover-Color"]
    L1_2.hoverColor = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Background-Color"]
    L1_2.backgroundColor = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Eye-Icon"]
    L1_2.eyeIcon = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Eye-Size"]
    L1_2.eyeSize = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Eye-Color"]
    L1_2.defaultEyeColor = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Text-Color"]
    L1_2.textColor = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Eye-Left"]
    L1_2.eyeLeft = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Eye-Top"]
    L1_2.eyeTop = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["UI-Scale"]
    L1_2.uiScale = L2_2
    L2_2 = Config
    L2_2 = L2_2["Target-Settings"]
    L2_2 = L2_2.Defaults
    L2_2 = L2_2["Text-Size"]
    L1_2.textSize = L2_2
    return L1_2
  end
end
GetTargetSettings = L2_1
L2_1 = AddStateBagChangeHandler
L3_1 = "targetSettings"
L4_1 = "player:%s"
L5_1 = L4_1
L4_1 = L4_1.format
L6_1 = cache
L6_1 = L6_1.serverId
L4_1 = L4_1(L5_1, L6_1)
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2
  if A2_2 then
    L5_2 = nil
    L0_1 = L5_2
    L5_2 = true
    L1_1 = L5_2
  end
end
L2_1(L3_1, L4_1, L5_1)
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.event = "openTargetSettings"
  L0_2(L1_2)
end
OpenTargetSettings = L2_1
L2_1 = RegisterNUICallback
L3_1 = "saveTargetConfigurations"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = TriggerServerEvent
  L3_2 = "SK-Target:Server:SaveTargetConfig"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "closeTargetSettings"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L2_1(L3_1, L4_1)
L2_1 = Config
L2_1 = L2_1["Target-Settings"]
L2_1 = L2_1.Settings
L2_1 = L2_1["Enable-Player-Menu"]
if L2_1 then
  L2_1 = RegisterCommand
  L3_1 = Config
  L3_1 = L3_1["Target-Settings"]
  L3_1 = L3_1.Settings
  L3_1 = L3_1["Player-Menu-Command"]
  function L4_1()
    local L0_2, L1_2
    L0_2 = OpenTargetSettings
    L0_2()
  end
  L5_1 = false
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = CreateThread
function L3_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = cache
    L0_2 = L0_2.serverId
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 100
    L0_2(L1_2)
  end
  L0_2 = Config
  L0_2 = L0_2["Target-Settings"]
  L0_2 = L0_2.Settings
  L0_2 = L0_2["Enable-Player-Menu"]
  if L0_2 then
    L0_2 = TriggerServerEvent
    L1_2 = "SK-Target:Server:UpdateTargetConfig"
    L2_2 = cache
    L2_2 = L2_2.serverId
    L0_2(L1_2, L2_2)
  end
end
L2_1(L3_1)

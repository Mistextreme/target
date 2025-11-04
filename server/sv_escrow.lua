local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = ipairs
  L2_2 = GetPlayerIdentifiers
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L2_2(L3_2)
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L8_2 = L6_2
    L7_2 = L6_2.sub
    L9_2 = 1
    L10_2 = 8
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    if "license:" == L7_2 then
      return L6_2
    end
  end
  L1_2 = nil
  return L1_2
end
L1_1 = {}
L2_1 = Config
L2_1 = L2_1["Target-Settings"]
L2_1 = L2_1.Settings
L2_1 = L2_1["Enable-Player-Menu"]
if L2_1 then
  L2_1 = AddEventHandler
  L3_1 = "playerJoining"
  function L4_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    L1_2 = A0_2
    L2_2 = L0_1
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      return
    end
    L3_2 = GetResourceKvpString
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = json
      L4_2 = L4_2.decode
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L5_2 = Player
        L6_2 = L1_2
        L5_2 = L5_2(L6_2)
        L5_2 = L5_2.state
        L6_2 = L5_2
        L5_2 = L5_2.set
        L7_2 = "targetSettings"
        L8_2 = L4_2
        L9_2 = true
        L5_2(L6_2, L7_2, L8_2, L9_2)
        L5_2 = L1_1
        L5_2[L1_2] = L4_2
      end
    end
  end
  L2_1(L3_1, L4_1)
  L2_1 = AddEventHandler
  L3_1 = "playerDropped"
  function L4_1()
    local L0_2, L1_2
    L0_2 = source
    L1_2 = L1_1
    L1_2[L0_2] = nil
  end
  L2_1(L3_1, L4_1)
  L2_1 = RegisterServerEvent
  L3_1 = "SK-Target:Server:SaveTargetConfig"
  function L4_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L1_2 = source
    L2_2 = L0_1
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      return
    end
    L3_2 = TriggerClientEvent
    L4_2 = "ox_lib:notify"
    L5_2 = L1_2
    L6_2 = {}
    L6_2.description = "Saving, Please wait: 2 seconds."
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = {}
    L3_2.hasSavedTargetOptions = true
    L4_2 = A0_2.mainColor
    L3_2.mainColor = L4_2
    L4_2 = A0_2.hoverColor
    L3_2.hoverColor = L4_2
    L4_2 = A0_2.backgroundColor
    L3_2.backgroundColor = L4_2
    L4_2 = A0_2.eyeIcon
    L3_2.eyeIcon = L4_2
    L4_2 = A0_2.eyeSize
    L3_2.eyeSize = L4_2
    L4_2 = A0_2.defaultEyeColor
    L3_2.eyeColor = L4_2
    L4_2 = A0_2.activeEyeColor
    L3_2.eyeActiveColor = L4_2
    L4_2 = A0_2.textColor
    L3_2.textColor = L4_2
    L4_2 = A0_2.eyeLeft
    L3_2.eyeLeft = L4_2
    L4_2 = A0_2.eyeTop
    L3_2.eyeTop = L4_2
    L4_2 = A0_2.uiScale
    L3_2.uiScale = L4_2
    L4_2 = A0_2.textSize
    L3_2.textSize = L4_2
    L4_2 = Player
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L5_2 = L4_2
    L4_2 = L4_2.set
    L6_2 = "targetSettings"
    L7_2 = L3_2
    L8_2 = true
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = L1_1
    L4_2[L1_2] = L3_2
    L4_2 = SetResourceKvp
    L5_2 = L2_2
    L6_2 = json
    L6_2 = L6_2.encode
    L7_2 = L3_2
    L6_2, L7_2, L8_2 = L6_2(L7_2)
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = TriggerClientEvent
    L5_2 = "ox_lib:notify"
    L6_2 = L1_2
    L7_2 = {}
    L7_2.description = "Saving, Please wait: 1 seconds."
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = TriggerClientEvent
    L5_2 = "ox_lib:notify"
    L6_2 = L1_2
    L7_2 = {}
    L7_2.description = "Saving Complete"
    L7_2.type = "success"
    L4_2(L5_2, L6_2, L7_2)
  end
  L2_1(L3_1, L4_1)
  L2_1 = RegisterServerEvent
  L3_1 = "SK-Target:Server:UpdateTargetConfig"
  function L4_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    L1_2 = L0_1
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      return
    end
    L2_2 = GetResourceKvpString
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L3_2 = json
      L3_2 = L3_2.decode
      L4_2 = L2_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L4_2 = Player
        L5_2 = A0_2
        L4_2 = L4_2(L5_2)
        L4_2 = L4_2.state
        L5_2 = L4_2
        L4_2 = L4_2.set
        L6_2 = "targetSettings"
        L7_2 = L3_2
        L8_2 = true
        L4_2(L5_2, L6_2, L7_2, L8_2)
        L4_2 = L1_1
        L4_2[A0_2] = L3_2
      end
    end
  end
  L2_1(L3_1, L4_1)
end
L2_1 = lib
L2_1 = L2_1.callback
L2_1 = L2_1.register
L3_1 = "SK-Target:GetIdent"
function L4_1(A0_2)
  local L1_2
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
L2_1(L3_1, L4_1)
L2_1 = Config
L2_1 = L2_1["Target-Settings"]
L2_1 = L2_1.Settings
L2_1 = L2_1["Reset-Player-Target"]
if L2_1 then
  L2_1 = RegisterCommand
  L3_1 = Config
  L3_1 = L3_1["Target-Settings"]
  L3_1 = L3_1.Settings
  L3_1 = L3_1["Player-Reset-Command"]
  function L4_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
    if 0 == A0_2 then
      return
    end
    L3_2 = L0_1
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      return
    end
    L4_2 = DeleteResourceKvp
    L5_2 = L3_2
    L4_2(L5_2)
    L4_2 = Player
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2.state
    L5_2 = L4_2
    L4_2 = L4_2.set
    L6_2 = "targetSettings"
    L7_2 = nil
    L8_2 = true
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = L1_1
    L4_2[A0_2] = nil
    L4_2 = TriggerClientEvent
    L5_2 = "ox_lib:notify"
    L6_2 = A0_2
    L7_2 = {}
    L7_2.description = "Resetting, Please wait: 2 seconds."
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = TriggerClientEvent
    L5_2 = "ox_lib:notify"
    L6_2 = A0_2
    L7_2 = {}
    L7_2.description = "Resetting, Please wait: 1 seconds."
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = TriggerClientEvent
    L5_2 = "ox_lib:notify"
    L6_2 = A0_2
    L7_2 = {}
    L7_2.description = "Target Reset Complete | Refresh your eye by opening and closing it!"
    L7_2.type = "success"
    L4_2(L5_2, L6_2, L7_2)
  end
  L5_1 = false
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = AddEventHandler
L3_1 = "onResourceStop"
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 ~= A0_2 then
    return
  end
  L1_2 = pairs
  L2_2 = L1_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = GetPlayerPing
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if L7_2 > 0 then
      L7_2 = Player
      L8_2 = L5_2
      L7_2 = L7_2(L8_2)
      L7_2 = L7_2.state
      L8_2 = L7_2
      L7_2 = L7_2.set
      L9_2 = "targetSettings"
      L10_2 = nil
      L11_2 = true
      L7_2(L8_2, L9_2, L10_2, L11_2)
    end
  end
end
L2_1(L3_1, L4_1)

local L0_1, L1_1, L2_1, L3_1
L0_1 = RegisterCommand
L1_1 = "migratetargetsettings"
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if 0 ~= A0_2 then
    return
  end
  L3_2 = print
  L4_2 = "^3Starting target settings migration...^7"
  L3_2(L4_2)
  L3_2 = 0
  L4_2 = GetResourceKvpKeys
  L5_2 = ""
  L4_2 = L4_2(L5_2)
  L5_2 = 1
  L6_2 = #L4_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = L4_2[L8_2]
    L11_2 = L9_2
    L10_2 = L9_2.sub
    L12_2 = 1
    L13_2 = 8
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    if "license:" == L10_2 then
      L10_2 = GetResourceKvpString
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      if L10_2 then
        L11_2 = GlobalState
        L11_2 = L11_2[L9_2]
        if L11_2 then
          L11_2 = GlobalState
          L11_2[L9_2] = nil
          L3_2 = L3_2 + 1
        end
      end
    end
  end
  L5_2 = print
  L6_2 = "^2Migration complete! Migrated %d player settings from GlobalState to StateBags^7"
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = L3_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2(L7_2, L8_2)
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
L3_1 = true
L0_1(L1_1, L2_1, L3_1)

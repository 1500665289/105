local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_A19");
local time = 100
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
npc:AddModifier("MY_NormalAttack",1,false,99)
npc:AddModifier("MY_FabaoAttack",1,false,99)
local disciples = GetDisciples()
CS.MapCamera.Instance:ShakeCamera(2,1.5)
    for _,disciple in pairs(disciples) do
	local sk = disciple.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.FightSkill)
		if disciple and sk >= 20 then
		CS.XiaWorld.NpcMgr.Instance:RebornNpc(disciple, false, 4)
		world:ShowMsgBox(disciple.Name.."的道心崩溃了，修为尽失！","万法之源诞生")
		end
	end
end

--modifier step
function tbModifier:Step(modifier, npc, dt)

end

--离开modifier
function tbModifier:Leave(modifier, npc)

end


function tbModifier:UpdateStack(modifier, npc, add)
	end
--获取存档数据
function tbModifier:OnGetSaveData()
end

--载入存档数据
function tbModifier:OnLoadData(modifier, npc, tbData)
end

function GetDisciples()
  --获取所有的友方内门弟子列表。
  local npcs = Map.Things:GetPlayerActiveNpcs()
  local nogt_disciples = {}
  for k,disciple in pairs(npcs) do
    if disciple.IsDisciple then
      
        table.insert(nogt_disciples, disciple)
      
    end
  end
  return nogt_disciples
end
local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_A9");
local time = 0
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
time = time + dt 
if time > 10 then 
local cost = npc.PropertyMgr.Practice:GetDaoHang()/100
npc.Needs:AddNeedValue(CS.XiaWorld.g_emNeedType.Rest, -cost)
npc.PropertyMgr.Practice:AddResource(CS.XiaWorld.g_emPracticeResourceType.Experience, cost*cost*cost*100)
npc.PropertyMgr.Practice:AddResource(CS.XiaWorld.g_emPracticeResourceType.Stage, cost*cost*200)
npc.PropertyMgr:ModifierProperty("NpcFight_FabaoPowerAddP",cost*0.05,0,0,0)
npc.PropertyMgr:ModifierProperty("NpcFight_SpellPowerAddP",cost*0.07,0,0,0)
npc.PropertyMgr:ModifierProperty("NpcFight_ShieldConversionRate",cost*0.0003,0,0,0)
time = 0
end
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
  --self.duration = 0
end
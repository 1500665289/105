local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_A2");
local time = 0
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
  self.duration = 0
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
  time = time + dt
  if time >= 100 then
    time = 0
	local sk1 = npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Fabao)
	local sk2 = npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.FightSkill)
	local sk3 = npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Barrier)
	local sk = (sk1 + sk2 + sk3)/10000
	if World:RandomRate(sk) then 
		npc:DestroySelf()
	end
	
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
  self.duration = 0
end
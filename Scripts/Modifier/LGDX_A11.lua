local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_A11");
local time = 0
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
  time = time + dt
  if time >= 5 then
    time = 0
	local tq = -npc.PropertyMgr.Practice:GetPenalty()
	if tq > 0 then 
	local lv = math.sqrt(tq)
	npc:RemoveModifier("LGDX_A11s")
	npc:AddModifier("LGDX_A11s", 1, false, math.ceil(lv))
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
end
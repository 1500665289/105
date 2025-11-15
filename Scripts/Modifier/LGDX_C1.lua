local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_C1");
local time = 0
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
  time = 0
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
	if World.DaySecond ==150  then
	npc:AddModifier("LGDX_yy")
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
  time = 0
end
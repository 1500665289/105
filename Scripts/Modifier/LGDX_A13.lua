local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_A13");
local time = 100
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
		npc.AddActiveFuCount = 3
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
  time = time + dt
  if time >= 50 then
    time = 0
		npc.AddActiveFuCount = 3
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
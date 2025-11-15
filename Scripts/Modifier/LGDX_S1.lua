local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_S1");
local time = {}
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
  self.duration = 0
end

--modifier step
function tbModifier:Step(modifier, npc, dt)
  self.duration = (self.duration or 0) + dt
  if self.duration >= 1 then
    self.duration = 0
	local lq = npc.LingV * 0.01 + 1000
	npc:DynamicAddLing(0)
	npc:AddLing(-lq)
	
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
local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_S2");
local time = 100
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
if CS.XiaWorld.GameWatch.Instance.Mode == CS.XiaWorld.g_emGameMode.Normal then
CS.XiaWorld.GameWatch.Instance.Mode = CS.XiaWorld.g_emGameMode.HardCore
CS.XiaWorld.World.Instance.GameMode = CS.XiaWorld.g_emGameMode.HardCore
world:ShowMsgBox("天地倒转，已变成真仙模式")
else
CS.XiaWorld.GameWatch.Instance.Mode = CS.XiaWorld.g_emGameMode.Normal
CS.XiaWorld.World.Instance.GameMode = CS.XiaWorld.g_emGameMode.Normal
world:ShowMsgBox("天地倒转，已变成普通模式")
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
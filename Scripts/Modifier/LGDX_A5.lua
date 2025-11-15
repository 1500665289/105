local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_A5");
local time = 0
local LGDX = GameMain:GetMod("LGDX");
local tbEvent = GameMain:GetMod("_Event");



--进入modifier
function tbModifier:Enter(modifier, npc)
	if  CS.XiaWorld.PracticeMgr.Instance:GetGongDef("Gong_WJ").Name == "Gong_WJ" then 
	npc.PropertyMgr.Practice:Up2Disciple("Gong_WJ")
npc.LuaHelper:AddMsg("[NAME]在突破之时，隐隐感受到一片深渊，自身仿佛置身其中。")
npc.LuaHelper:AddMsg("[NAME]心境逐渐紊乱起来，但[NAME]丝毫没有畏惧深渊对他的影响。")
npc.LuaHelper:AddMsg("突然深渊中传来一阵怪异的声音......")
npc.LuaHelper:AddMsg("“想不到又有人前来此处进行给我打牙祭！”")
npc.LuaHelper:AddMsg("[NAME]停下了脚步，不敢轻举妄动，却由于实力过差，当即晕倒。")
npc.LuaHelper:AddMsg("“奇怪？怎么我感觉到这股气息与我魔界中人有点接近，难道你是魔界的人？”")
npc.LuaHelper:AddMsg("只见深渊中传来一股吸力将[NAME]吸入深渊......")
npc.LuaHelper:AddMsg("原来是有我魔族血脉之人，看来这次的计划要靠你来实现了......")
npc.LuaHelper:AddMsg("当[NAME]醒来后，发现自己已经身处门派，但自己的力量开始与修仙界截然不同。")
npc.LuaHelper:AddMsg("[NAME]脑海中出现了一些奇怪的画面，同时也得知自己获得了一份顶级传承。")
npc.LuaHelper:AddMsg("[NAME]血脉中的力量开始激活，但[NAME]不能轻易暴露。")
npc.PropertyMgr:AddFeature("MoShen");
npc.LuaHelper:AddTitle("魔神传人","传说中魔界之主魔神至高无上的顶级传承——【无极魔典】的传人！",3);
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
  --self.duration = 0
end
local LGDX = GameMain:GetMod("LGDX");
LGDX.Events = LGDX.Events or {}
local Events = LGDX.Events
local tbEvent = GameMain:GetMod("_Event")
function LGDX:OnInit()
  
	GameMain:GetMod("_Event"):RegisterEvent(CS.XiaWorld.g_emEvent.NpcPracticeChange, LGDX.NpcPracticeChange1, "LGDX-property") 
	print("注册内门灵根事件")
end
function LGDX:OnLeave()
	tbEvent:UnRegisterEvent(g_emEvent.NpcPracticeChange, "LGDX-property")
end
function LGDX.NpcPracticeChange1(data, npc, objs)
	if npc.PropertyMgr:HasModifier("LG_Num") and npc.LuaHelper:CheckMood("LG_Used")== false   then
	--如果npc有灵根并且未觉醒过则觉醒灵根（加buff）
	local n = npc.PropertyMgr.FeatureList:ToArray()
		for i=0,n.Count-1 do
			if string.find(n[i].Name,"LGDX") ~= nil then 
			npc:AddModifier(n[i].Name)
			end
		end
	npc:AddMood("LG_Used")--添加觉醒标识
	end
end
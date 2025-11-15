

--以下内容请不要修改。
local LGDX = GameMain:NewMod("LGDX")
LGDX.Events = LGDX.Events or {}
local Events = LGDX.Events

function LGDX:OnBeforeInit()
end

function LGDX:OnInit()
  
	GameMain:GetMod("_Event"):RegisterEvent(CS.XiaWorld.g_emEvent.NpcPracticeChange, LGDX.NpcPracticeChange1, "LGDX-property") 
	print("注册内门灵根事件")
end
function LGDX:OnLeave()
end
function LGDX.NpcPracticeChange1(data, npc, objs)
--npc.PropertyMgr:HasModifier("LG_Num") and
	if  npc.PropertyMgr:HasModifier("LG_Used")== false   then
	--如果npc有灵根并且未觉醒过则觉醒灵根（加buff）
	local n = npc.PropertyMgr.FeatureList:ToArray()
		for i=0,n.Length-1 do
			if string.find(n[i].Name,"LGDX") ~= nil then 
			npc:AddModifier(n[i].Name)
			print(n[i].Name)
			end
		end
	npc:AddModifier("LG_Used")--添加觉醒标识
	end
end
function LGDX:OnEnter() 
	--GameMain:GetMod("_Event"):RegisterEvent(g_emEvent.WindowEvent,LGDX.OnWindowEvent, "LGDXLearnLimit")
end

function LGDX:GetLG1()
	local Npc = me.npcObj
	--local TX = me:CheckFearture()
	--local GF = me:GetGElementKind()
	local ID = world:GetSchoolName(Npc:GetSchoolID())
	--获取其他属性
	local SS = me:GetPerception()
	local GG = me:GetPhysique()
	local ML = me:GetCharisma()
	local WX = me:GetIntelligence()
	local JY = me:GetLuck()
	local JS = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Mining)/2	
	local NG = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Farming)/2	
	local JZ = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Building)/2	
	local QJ = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Manual)	/2
	local Chs = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.SocialContact)/2	
	local YY = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Art)/2	
	local PR = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Cooking)/2	
	local QH = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Medicine)/2
	local ZD = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Fight)/2	
	local QG = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.Qi)/2	
	local DF = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.DouFa)/2	
	local DQ = Npc.PropertyMgr.SkillData:GetSkillLevel(CS.XiaWorld.g_emNpcSkillType.DanQi)/2	
	--获取人物五维属性与技能属性
	local whole = SS + GG + ML + WX + JY + JS+NG+JZ+QJ+Chs+YY+PR+QH+ZD+QG+DF+DQ
	print(whole)
	--计算五维占比
	local LG = { 
	[1] = "先天金灵根,LGDX_D1",
	[2] = "先天木灵根,LGDX_D2",
	[3] = "先天水灵根,LGDX_D3",
	[4] = "先天火灵根,LGDX_D4",
	[5] = "先天土灵根,LGDX_D5",
	[6] = "先天元灵根,LGDX_D6",
	[7] = "先天剑灵根,LGDX_D7",
	[8] = "先天术灵根,LGDX_D8",
	[9] = "先天器灵根,LGDX_D9",
	[10] = "先天丹灵根,LGDX_D10",
	[11] = "先天盾灵根,LGDX_D11",
	[12] = "先天阳灵根,LGDX_C1",
	[13] = "先天阴灵根,LGDX_C2",
	[14] = "先天雷灵根,LGDX_C3",
	[15] = "先天风灵根,LGDX_C4",
	[16] = "先天冰灵根,LGDX_C5",
	[17] = "先天爆灵根,LGDX_C6",
	[18] = "先天山灵根,LGDX_C7",
	[19] = "先天道灵根,LGDX_A1",
	[20] = "先天极灵根,LGDX_A2",
	[21] = "先天皇灵根,LGDX_A3",
	[22] = "先天杀灵根,LGDX_A4",
	[23] = "先天魔灵根,LGDX_A5",
	[24] = "先天星灵根,LGDX_A6",
	[25] = "先天天灵根,LGDX_A7",
	[26] = "先天坤灵根,LGDX_A8",
	[27] = "先天梦灵根,LGDX_A9",
	[28] = "先天噬灵根,LGDX_A10",
	[29] = "先天德灵根,LGDX_A11",
	[30] = "先天空灵根,LGDX_S1",
	[31] = "极道金灵根,LGDX_D12",
	[32] = "极道木灵根,LGDX_D13",
	[33] = "极道水灵根,LGDX_D14",
	[34] = "极道火灵根,LGDX_D15",
	[35] = "极道土灵根,LGDX_D16",
	[36] = "乾相剑灵根,LGDX_C8",
	[37] = "坤相剑灵根,LGDX_C9",
	[38] = "震相剑灵根,LGDX_C10",
	[39] = "巽相剑灵根,LGDX_C11",
	[40] = "坎相剑灵根,LGDX_C12",
	[41] = "离相剑灵根,LGDX_C13",
	[42] = "艮相剑灵根,LGDX_C14",
	[43] = "兑相剑灵根,LGDX_C15",
	[44] = "乾相术灵根,LGDX_C16",
	[45] = "坤相术灵根,LGDX_C17",
	[46] = "震相术灵根,LGDX_C18",
	[47] = "巽相术灵根,LGDX_C19",
	[48] = "坎相术灵根,LGDX_C20",
	[49] = "离相术灵根,LGDX_C21",
	[50] = "艮相术灵根,LGDX_C22",
	[51] = "兑相术灵根,LGDX_C23",
	[52] = "先天战灵根,LGDX_B1",
	[53] = "先天蛮灵根,LGDX_B2",
	[54] = "先天荒灵根,LGDX_B3",
	[55] = "先天狄灵根,LGDX_B4",
	[56] = "先天古灵根,LGDX_B5",
	[57] = "先天绝灵根,LGDX_B6",
	[58] = "先天吞灵根,LGDX_B7",
	[59] = "先天幻灵根,LGDX_B8",
	[60] = "先天霸灵根,LGDX_B9",
	[61] = "先天全灵根,LGDX_A12",
	[62] = "先天符灵根,LGDX_A13",
	[63] = "先天御灵根,LGDX_A14",
	[64] = "先天法灵根,LGDX_A15",
	[65] = "先天恒灵根,LGDX_A16",
	[66] = "先天神灵根,LGDX_A17",
	[67] = "天下剑主道,LGDX_A18",
	[68] = "万法之源祖,LGDX_A19",
	[69] = "苍天在上魂,LGDX_A20",
	[70] = "天道破灵根,LGDX_S2"
	}
	--封装28种灵根
	local array = {};
	local succ = 1 
	
	local n = Npc.PropertyMgr.FeatureList:ToArray()--判定人物是否已拥有灵根
		for i=0,n.Length-1 do
			if string.find(n[i].Name,"LGDX") ~= nil then 
			succ = 0
		me:AddMsg("[NAME]已拥有灵根属性，无法重复获取！");
			end
		end
	
	if Npc.PropertyMgr:HasModifier("LG_Num")  then    
	 
	--print(whole)
		me:AddMsg("[NAME]已拥有灵根属性，无法重复获取！");
		succ = 0
	end
	if Npc.IsDisciple then
		me:AddMsg("[NAME]已经是内门弟子了，除非奇遇，否则不能再获得灵根了。");
		succ = 0
	--print(whole)
	end
	if Npc.Race.Name ~= "Human" then 
		
		me:AddMsg("[NAME]是非人弟子，被[color=#BC1717]太极混元台[/color]直接排斥在外。");
		succ = 0
	end
	if  succ == 1 then    --判定为外门则赋予先天特性
			print(whole)
			array[1] = GetLGScore1(whole,SS,nil,nil,0,1)	
			array[2] = GetLGScore1(whole,WX,nil,nil,0,1)	
			array[3] = GetLGScore1(whole,ML,nil,nil,0,1)	
			array[4] = GetLGScore1(whole,JY,nil,nil,0,1)	
			array[5] = GetLGScore1(whole,GG,nil,nil,0,1)		
			array[6] = GetLGScore1(whole,-50,nil,nil,0,1) 
			array[7] = GetLGScore1(whole,DF,(SS+GG)/2,nil,0,1)	
			array[8] = GetLGScore1(whole,DF,(WX+ML)/2,nil,0,1)	
			array[9] = GetLGScore1(whole,DQ,SS,nil,0,1)	
			array[10] = GetLGScore1(whole,DQ,WX,nil,0,1)	
			array[11] = GetLGScore1(whole,DF,GG,nil,0,1)	
			array[12] = GetLGScore1(whole,QG,SS,GG,0,0.8)	
			array[13] = GetLGScore1(whole,QG,WX,ML,0,0.8)	
			array[14] = GetLGScore1(whole,SS,GG,nil,0,0.8)	
			array[15] = GetLGScore1(whole,WX,JY,nil,0,0.8)	
			array[16] = GetLGScore1(whole,ML,WX,nil,0,0.8)	
			array[17] = GetLGScore1(whole,JY,SS,nil,0,0.8)	
			array[18] = GetLGScore1(whole,GG,ML,nil,0,0.8)	
			array[19] = GetLGScore1(whole,QG,JY,DF,0,0.3)	
			array[20] = GetLGScore1(whole,DF,JY,ZD,0,0.3)	
			array[21] = GetLGScore1(whole,Chs,JY,DF,0,0.3)	
			array[22] = GetLGScore1(whole,ZD,SS,GG,0,0.3)	
			array[23] = GetLGScore1(whole,ZD,JY,DF,0,0.3)	
			array[24] = GetLGScore1(whole,YY,DF,QG,0,0.3)	
			array[25] = GetLGScore1(whole,QG,JY,Chs,0,0.3)	
			array[26] = GetLGScore1(whole,ZD,GG,QG,0,0.3)	
			array[27] = GetLGScore1(whole,JY,QG,WX,0,0.3)	
			array[28] = GetLGScore1(whole,PR,QH,QG,0,0.3)	
			array[29] = GetLGScore1(whole,QG,ML,WX,0,0.3)		
			array[30] = GetLGScore1(whole,-100,nil,nil,0,1)
			array[31] = GetLGScore1(whole,SS,nil,nil,150,1)	
			array[32] = GetLGScore1(whole,WX,nil,nil,150,1)	
			array[33] = GetLGScore1(whole,ML,nil,nil,150,1)	
			array[34] = GetLGScore1(whole,JY,nil,nil,150,1)	
			array[35] = GetLGScore1(whole,GG,nil,nil,150,1)	
			array[36] = GetLGScore1(whole,DF,(SS+GG)/2,JS,125,0.8)
			array[37] = GetLGScore1(whole,DF,(SS+GG)/2,NG,125,0.8)
			array[38] = GetLGScore1(whole,DF,(SS+GG)/2,JZ,125,0.8)
			array[39] = GetLGScore1(whole,DF,(SS+GG)/2,QJ,125,0.8)
			array[40] = GetLGScore1(whole,DF,(SS+GG)/2,Chs,125,0.8)
			array[41] = GetLGScore1(whole,DF,(SS+GG)/2,YY,125,0.8)
			array[42] = GetLGScore1(whole,DF,(SS+GG)/2,PR,125,0.8)
			array[43] = GetLGScore1(whole,DF,(SS+GG)/2,QH,125,0.8)
			array[44] = GetLGScore1(whole,DF,(WX+ML)/2,JS,125,0.8)
			array[45] = GetLGScore1(whole,DF,(WX+ML)/2,NG,125,0.8)
			array[46] = GetLGScore1(whole,DF,(WX+ML)/2,JZ,125,0.8)
			array[47] = GetLGScore1(whole,DF,(WX+ML)/2,QJ,125,0.8)
			array[48] = GetLGScore1(whole,DF,(WX+ML)/2,Chs,125,0.8)
			array[49] = GetLGScore1(whole,DF,(WX+ML)/2,YY,125,0.8)
			array[50] = GetLGScore1(whole,DF,(WX+ML)/2,PR,125,0.8)
			array[51] = GetLGScore1(whole,DF,(WX+ML)/2,QH,125,0.8)	
			array[52] = GetLGScore1(whole,ZD,nil,nil,150,1)
			array[53] = GetLGScore1(whole,ZD,nil,JS,0,0.5)
			array[54] = GetLGScore1(whole,ZD,nil,NG,0,0.5)
			array[55] = GetLGScore1(whole,ZD,nil,JZ,0,0.5)
			array[56] = GetLGScore1(whole,ZD,nil,QJ,0,0.5)
			array[57] = GetLGScore1(whole,ZD,nil,Chs,0,0.5)
			array[58] = GetLGScore1(whole,ZD,nil,YY,0,0.5)
			array[59] = GetLGScore1(whole,ZD,nil,PR,0,0.5)
			array[60] = GetLGScore1(whole,ZD,nil,QH,0,0.5)	
			array[61] = GetLGScore1(whole,QG,Chs,nil,0,0.3)
			array[62] = GetLGScore1(whole,QG,YY,QJ,0,0.3)
			array[63] = GetLGScore1(whole,DF,QJ,nil,0,0.3)
			array[64] = GetLGScore1(whole,DF,QH,nil,0,0.3)
			array[65] = GetLGScore1(whole,QH,Chs,NG,0,0.3)
			array[66] = GetLGScore1(whole,JY,SS,JS,0,0.3)
			array[67] = GetLGScore1(whole,999,nil,nil,0,0.001)
			array[68] = GetLGScore1(whole,999,nil,nil,0,0.001)
			array[69] = GetLGScore1(whole,999,nil,nil,0,0.001)
			array[70] = GetLGScore1(whole,999,nil,nil,0,0.01)
			local MyLG = table_maxn(array) --灵根为分数最大的，比如1为先天水灵根
				Npc.PropertyMgr:AddFeature(string.sub(LG[MyLG],17));--加灵根feature
				Npc:AddModifier("LG_Num");--更新灵根个数
				me:AddMsg("[NAME]盘坐于[color=#BC1717]太极混元台[/color]之上，静静的等待着[color=#BC1717]太极混元台[/color]的反应，毕竟一个好的灵根，决定着[NAME]以后的修行之路。。。");
				me:AddMsg("大约过了半柱香的时间，只见一道耀眼的银白色光芒从[color=#BC1717]太极混元台[/color]中发散出来！异常闪耀的光芒惊艳了".."中众人！");
				me:AddMsg("待到这光芒逐渐淡去，[NAME]的周身似乎仍被一层灵气薄雾所笼罩，流光溢彩，甚是玄妙；");
				me:AddMsg("然而[NAME]依旧端坐于[color=#BC1717]太极混元台[/color]之上，神情紧张，静静的等待着最后的灵根鉴定结果。。。");
				me:ShowMsgBox("弟子鉴定出了[color=#007FFF]"..string.sub(LG[MyLG],1,15).."[/color]！可喜可贺！");
	--print(whole)
		
			--这里内门
	end
		
				CS.MapCamera.Instance:ShakeCamera(2,1.5)
	
end
function GetLGScore1(Whole,main,num1,num2,lmit,prob)--总分，主要因素，两个次要因素，最低标准，概率
	
	local avg = Whole/13 
	local k = main / Whole *1000 
	if num1 ~= nil then
	k= (num1  - avg)/ Whole *500 +k
	end
	if num2 ~= nil then 
	k= (num2  - avg)/ Whole *500 +k
	end
	if main == -50 then 
	k=0
	local SS = me:GetPerception()
	local GG = me:GetPhysique()
	local ML = me:GetCharisma()
	local WX = me:GetIntelligence()
	local JY = me:GetLuck()
		if SS > 9.5 and GG > 9.5 and ML > 9.5 and WX > 9.5 and JY > 9.5 then
				k = 1000
			end
		print(k)
		return k 
	end
	if main == -100 then 
		k = 0
	local SS = me:GetPerception()
	local GG = me:GetPhysique()
	local ML = me:GetCharisma()
	local WX = me:GetIntelligence()
	local JY = me:GetLuck()
		if SS < 0.5 and GG < 0.5 and ML < 0.5 and WX < 0.5 and JY < 0.5 then
		k = 1000
		end
	print(k)
	return k 
	end
	if k > lmit and world:RandomFloat(0,1) <= prob then
		k = world:RandomFloat(k,k+1);					--用来计算分数
	else
	k = 0
	end
	print(k)
	return k
end
function table_maxn(t)--获取最大值下标
  local mn=nil;
  local maxd = 1
  for k, v in pairs(t) do
    if(mn==nil) then
      mn=v
    end
    if mn < v then
      mn = v
	  maxd = k
    end
  end
  return maxd
end
function LGDX.OnWindowEvent(e,thing,obj)
	local Window = obj[0];
	local Show = (obj[1] == 1) and true or false;
	if Window:ToString() == "Wnd_SkillTree" and Show then
		xlua.private_accessible(CS.Wnd_SkillTree)
		xlua.private_accessible(CS.Wnd_Message)
		LGDX:AddNpc(Window.npc)
	end
	
	if Window:ToString() == "Wnd_Message" and Show and Window.UIInfo.m_frame.text == "消息" and LGDX:SkillLimit(Window.UIInfo.m_text.text) then
	--Window:Hide()
	--Window.UIInfo.m_frame.text = "技能学习限制"
	--Window.UIInfo.m_text.text = "";
		local Npc = LGDX:GetNpc()
	print("cnm")
	print(Window.UIInfo.m_frame.text)
	print(string.sub(Window.UIInfo.m_text.text,15,25))
	end
end


function LGDX:AddNpc(Npc)
npc = Npc
end

function LGDX:GetNpc()
return npc;
end

function LGDX:SkillLimit(strings)
--local skillnamne =  string.sub(LG[MyLG],1,15)
return true;
end


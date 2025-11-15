local tbModifier = GameMain:GetMod("_ModifierScript"):GetModifier("LGDX_A10");
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
  if time >= 10 then
    time = 0
	local pl = npc.ElixirFesistance
	local iter = pl:GetEnumerator()
	local tble ={}
	local vt = pl.Count
	while iter:MoveNext() do 
		local v = iter.Current.Key
		if v then 
			table.insert(tble,v)
		end
	end
	npc.ElixirFesistance:Clear();
	for i=1,vt do
	--print(tble[i])
	npc.ElixirFesistance:Add(tble[i],0.1)
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
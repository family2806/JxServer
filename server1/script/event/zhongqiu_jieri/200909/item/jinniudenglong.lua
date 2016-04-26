
--
--未转生的角色	获得最多 2.000.000.000 Exp	新增
--第一转的角色	获得最多 3.000.000.000 Exp	新增
--第二转的角色	获得最多 4.000.000.000 Exp	保留
Include("\\script\\activitysys\\g_itemuse.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")



function main(nItemIndex)
	
	local tb = 
	{
		[0] = 2000,
		[1] = 3000,
		[2] = 4000,
	}
	
	if not PlayerFunLib:CheckLevel(0,"default",">=") then
		return 1
	end
	if not PlayerFunLib:IsCharged("default") then
		return 1
	end
	
	
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount > 2 then
		nTransLifeCount = 2
	end
	local nExpLimit = tb[nTransLifeCount]
	
	if not PlayerFunLib:CheckTask(1925,nExpLimit,format("每人使用[金牛灯笼] 最多只能获得%u 经验",nExpLimit*1e6 ),"<") then
		return 1
	end
	PlayerFunLib:AddExp(50000000,0,"MidAutumn,UseGoldDragonLantern ")
	PlayerFunLib:AddTask(1925,50)
end
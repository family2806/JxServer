Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\remoteexc.lua");

tb2010ZhongQiu = {};
tb2010ZhongQiu.nTaskGroupId 				 = 11;
tb2010ZhongQiu.nTask_HuDie 					 = 1;
tb2010ZhongQiu.nTask_XinXin 				 = 2;
tb2010ZhongQiu.nTask_ZhuXin_YuanXin  = 3;
tb2010ZhongQiu.tbNpcSet = 
{
-- [nNpcIdx] = "XXX", (所有者名字)
};
tb2010ZhongQiu.tbNpcInfo = 
{
	["大力侍卫"] = 
	{
		nTempId   = 1579,
		nTaskId   = tb2010ZhongQiu.nTask_XinXin,
		nMaxExp   = 2000000000,
		nAwardExp = 2000000,
		tbDrop		= nil,
	},
	
	["常胜侍卫"] = 
	{
		nTempId   = 1580,
		nTaskId   = tb2010ZhongQiu.nTask_ZhuXin_YuanXin,
		nMaxExp   = 6000000000,
		nAwardExp = 3000000,
		tbDrop		= {
									{szName = "走，马灯笼", tbProp = {6, 1, 2506, 1, 0, 0}, nExpiredTime = 20101018, },
									{
										{szName = "富贵锦盒", 				nRate = 1,   tbProp = {6, 1, 2402, 1, 0, 0}, nExpiredTime = 20101018,},
										{szName = "仙草露", 					nRate = 5,   tbProp = {6, 1,   71, 1, 0, 0}, },
										{szName = "福缘露(小) ", 		nRate = 5,   tbProp = {6, 1,  122, 1, 0, 0}, },
										{szName = "飞速丸", 					nRate = 2,   tbProp = {6, 0,    6, 1, 0, 0}, },
										{szName = "大力丸", 					nRate = 2,   tbProp = {6, 0,    3, 1, 0, 0}, },
										{szName = "盘若心经", 				nRate = 0.4, tbProp = {6, 1,   12, 1, 0, 0}, },
										{szName = "天王锤法.卷1", 		nRate = 0.2, tbProp = {6, 1,   37, 1, 0, 0}, },
										{szName = "天王枪法.卷 2", 		nRate = 0.2, tbProp = {6, 1,   38, 1, 0, 0}, },
										{szName = "天王刀法.卷3", 		nRate = 0.2, tbProp = {6, 1,   39, 1, 0, 0}, },
										{szName = "少林拳法 卷1", 		nRate = 0.2, tbProp = {6, 1,   56, 1, 0, 0}, },
										{szName = "少林棍法 卷 2", 		nRate = 0.2, tbProp = {6, 1,   57, 1, 0, 0}, },										
										{szName = "少林棍法 卷 3", 		nRate = 0.2, tbProp = {6, 1,   58, 1, 0, 0}, },										
										{szName = "飞刀术.摄魂月影", 	nRate = 0.2, tbProp = {6, 1,   45, 1, 0, 0}, },										
										{szName = "飞镖术.九宫飞星", 	nRate = 0.2, tbProp = {6, 1,   46, 1, 0, 0}, },										
										{szName = "聚箭术.暴雨梨花", 	nRate = 0.2, tbProp = {6, 1,   27, 1, 0, 0}, },
										{szName = "函静术.乱还击", 		nRate = 0.2, tbProp = {6, 1,   28, 1, 0, 0}, },										
										{szName = "五毒掌法.卷1", 	nRate = 0.2, tbProp = {6, 1,   47, 1, 0, 0}, },										
										{szName = "五毒刀法.卷2", 		nRate = 0.2, tbProp = {6, 1,   48, 1, 0, 0}, },
										{szName = "五毒摄心术.卷3", 	nRate = 0.2, tbProp = {6, 1,   49, 1, 0, 0}, },										
										{szName = "灭剑秘籍", 				nRate = 0.2, tbProp = {6, 1,   42, 1, 0, 0}, },
										{szName = "峨眉佛光掌秘籍", 	nRate = 0.2, tbProp = {6, 1,   43, 1, 0, 0}, },										
										{szName = "普渡秘籍", 				nRate = 0.2, tbProp = {6, 1,   59, 1, 0, 0}, },
										{szName = "翠烟刀法", 				nRate = 0.2, tbProp = {6, 1,   40, 1, 0, 0}, },
										{szName = "翠烟双刀", 				nRate = 0.2, tbProp = {6, 1,   41, 1, 0, 0}, },										
										{szName = "丐帮掌法", 				nRate = 0.2, tbProp = {6, 1,   54, 1, 0, 0}, },	
										{szName = "丐帮棍法", 				nRate = 0.2, tbProp = {6, 1,   55, 1, 0, 0}, },
										{szName = "云龙击.矛法", 			nRate = 0.2, tbProp = {6, 1,   35, 1, 0, 0}, },										
										{szName = "流星.刀法", 				nRate = 0.2, tbProp = {6, 1,   36, 1, 0, 0}, },	
										{szName = "摄魂.咒术", 				nRate = 0.2, tbProp = {6, 1,   53, 1, 0, 0}, },
										{szName = "太极拳谱.卷3", 		nRate = 0.2, tbProp = {6, 1,   33, 1, 0, 0}, },										
										{szName = "太极剑谱.卷2", 		nRate = 0.2, tbProp = {6, 1,   34, 1, 0, 0}, },	
										{szName = "御风术", 					nRate = 0.2, tbProp = {6, 1,   50, 1, 0, 0}, },		
										{szName = "御雷术", 					nRate = 0.2, tbProp = {6, 1,   51, 1, 0, 0}, },		
										{szName = "御心术", 					nRate = 0.2, tbProp = {6, 1,   52, 1, 0, 0}, },		
										{szName = "1 名望值", 					nRate = 28,  pFun = function(selfpoint, nItemCount, szLogTitle, nBelongerIndex)
																															   local nOldPlayerIdx = PlayerIndex;
																															 	 PlayerIndex = nBelongerIndex;
																															 	 AddRepute(1);	
																															 	 Msg2Player("增加 1 名望值");
																															 	 WriteLog(format("%s 增加1 名望值", szLogTitle));
																															 	 PlayerIndex = nOldPlayerIdx;
																												 			 end, },		
										{szName = "2 名望值", 					nRate = 26,  pFun = function(selfpoint, nItemCount, szLogTitle, nBelongerIndex)
																															   local nOldPlayerIdx = PlayerIndex;
																															 	 PlayerIndex = nBelongerIndex;
																															 	 AddRepute(2);	
																															 	 Msg2Player("增加2 名望值");
																															 	 WriteLog(format("%s 增加2 名望值", szLogTitle));
																															 	 PlayerIndex = nOldPlayerIdx;
																															 end, },	
										{szName = "3 名望值", 					nRate = 25,  pFun = function(selfpoint, nItemCount, szLogTitle, nBelongerIndex)
																															   local nOldPlayerIdx = PlayerIndex;
																															 	 PlayerIndex = nBelongerIndex;
																															 	 AddRepute(3);	
																															 	 Msg2Player("增加3 名望值");
																															 	 WriteLog(format("%s增加3 名望值", szLogTitle));
																															 	 PlayerIndex = nOldPlayerIdx;
																															 end, },																													 																												 									
									},
								},
	},
	
	["金刚侍卫"] = 
	{
		nTempId   = 1581,
		nTaskId   = tb2010ZhongQiu.nTask_ZhuXin_YuanXin,
		nMaxExp   = 6000000000,
		nAwardExp = {
									{ 5000000, 30,  30 },
									{ 6000000, 47,  77 },
									{ 8000000, 20,  97 },
									{10000000,  2,  99 },
									{20000000,  1, 100 },
								},
		tbDrop		= {
									{szName = "走马灯笼", tbProp = {6, 1, 2506, 1, 0, 0}, nExpiredTime = 20101018, },
									{
										{szName = "玄猿令", nRate = 0.3,   tbProp = {6, 1, 2351, 1, 0, 0}, },	
										{szName = "苍狼令", nRate = 0.8,   tbProp = {6, 1, 2352, 1, 0, 0}, },	
										{szName = "云鹿令", nRate = 1,   tbProp = {6, 1, 2353, 1, 0, 0}, },	
										{szName = "混元灵露", nRate = 9,   tbProp = {6, 1, 2312, 1, 0, 0}, },	
										{szName = "玄天锦囊", nRate = 2,   tbProp = {6, 1, 2355, 1, 0, 0}, },	
										{szName = "龙血丸", nRate = 2,   tbProp = {6, 1, 2117, 1, 0, 0}, },	
										{szName = "飞速丸", nRate = 2,   tbProp = {6, 0,    6, 1, 0, 0}, },	
										{szName = "大力丸", nRate = 3,   tbProp = {6, 0,    3, 1, 0, 0}, },	
										{szName = "特效仙草露",nRate = 4,   tbProp = {6, 1, 1181, 1, 0, 0}, },	
										{szName = "挑战礼包", nRate = 8,tbProp = {6, 1, 2006, 1, 0, 0}, },	
										{szName = "神秘矿石", nRate = 0.3,   tbProp = {6, 1,  398, 1, 0, 0}, },	
										{szName = "富贵锦盒", nRate = 5,   tbProp = {6, 1, 2402, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "五行奇石", nRate = 22.7,tbProp = {6, 1, 2125, 1, 0, 0}, },	
										{szName = "神农真丹", nRate = 1,   tbProp = {6, 1, 2113, 1, 0, 0}, },	
										{szName = "八珍福月蜡烛", nRate = 3,   tbProp = {6, 1, 1817, 1, 0, 0}, },	
										{szName = "成都中秋月饼", nRate = 4,   tbProp = {6, 1, 2507, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "大理中秋月饼", nRate = 4,  tbProp = {6, 1, 2508, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "凤翔中秋月饼", nRate = 4,  tbProp = {6, 1, 2509, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "襄阳中秋月饼", nRate = 4,  tbProp = {6, 1, 2510, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "汴京中秋月饼", nRate = 4,  tbProp = {6, 1, 2511, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "临安中秋月饼", nRate = 4,  tbProp = {6, 1, 2512, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "扬州中秋月饼", nRate = 4,  tbProp = {6, 1, 2513, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName="100 万两", nRate = 2, nJxb = 1000000,},	
										{szName="200 万两", nRate = 2,  nJxb = 2000000,},	
										{szName="500 万两", nRate = 5,  nJxb = 5000000,},	
										{szName="1000 万两", nRate = 0.2,  nJxb = 10000000,},	
										{szName="回天再造锦囊", nRate = 1,  tbProp={6,1,1781,1,0,0},tbParam={60},},	
										{szName="神行符", nRate = 0.2,  tbProp={6,1,1266,1,0,0}, nExpiredTime = 10080,},	
										{szName="海龙珠", nRate = 2,  tbProp={6,1,2115,1,0,0},},	
									},
								},
	},
};
tb2010ZhongQiu.tbHengE = 
{
	nNpcRabbitId = 1124,
	
	tbNpcTempId = 
	{
		[1] = 1594,
		[2] = 1595,
		[3] = 1596,
	},
	
	tbInfo = 
	{
		-- 成都
		{
			tbPos = {11, 3121, 4997},
			nNpcIndex = nil,
			tbRabbitPos = {11, 3123, 4996},
			nRabbitIndex = nil,
		},
	
		-- 扬州
		{
			tbPos = {80, 1750, 3000},
			nNpcIndex = nil,
			tbRabbitPos = {80, 1752, 3000},
			nRabbitIndex = nil,			
		},
	
		-- 襄阳
		{
			tbPos = {78, 1532, 3241},
			nNpcIndex = nil,
			tbRabbitPos = {78, 1534, 3242},
			nRabbitIndex = nil,			
		},
	
		-- 大理
		{
			tbPos = {162, 1591, 3214},
			nNpcIndex = nil,
			tbRabbitPos = {162, 1593, 3213},
			nRabbitIndex = nil,			
		},	
	},
};
tb2010ZhongQiu.tbFireworks = 
{
	-- 成都
	{
		tbPos = {11,  3124, 5002},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	
	-- 扬州
	{
		tbPos = {80,  1751, 3018},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	
	-- 襄阳
	{
		tbPos = {78,  1549, 3233},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	
	-- 大理
	{
		tbPos = {162, 1614, 3201},
		nNpcIndex = nil,
		nLeftCount = 0,
	},		
};


-- 是否活动时间
function tb2010ZhongQiu:IsActivityTime()
	local nCruDate = tonumber(GetLocalDate("%Y%m%d"));
	if (20100920 <= nCruDate and nCruDate < 20101018) then
		return 1;
	end
	return 0;
end

-- 加经验
function tb2010ZhongQiu:AwardExp(nAwardExp, nTaskID, nMaxExp, szReason, szLog)
	
	local nUnit   = 1000000;
	local nCurExp = TaskManager:GetTask(self.nTaskGroupId, nTaskID) * nUnit;
	
	if nCurExp >= nMaxExp then
		Msg2Player("达到最高经验，不能再领取了!");
		return
	end
	
	tbAwardTemplet:GiveAwardByList({nExp = nAwardExp}, szLog);	
	nCurExp = nCurExp + nAwardExp;
	TaskManager:SetTask(self.nTaskGroupId, nTaskID, floor(nCurExp / nUnit));
	
	local szMsg = format("%s, 阁下获得%s/%s经验!", szReason, tostring(nCurExp), tostring(nMaxExp));
	Msg2Player(szMsg);
end

-- 新增NPC
function tb2010ZhongQiu:AddNpc(szNpcName)
	
	local nTempId = self.tbNpcInfo[szNpcName].nTempId;
	if nTempId == nil then 
		return 
	end
	
	local w,x,y = GetWorldPos();
	local nNpcIdx = AddNpc(nTempId, 95, SubWorldID2Idx(w), x*32, y*32, 1);
	
	if nNpcIdx <= 0 then
		return
	end
	
	self.tbNpcSet[nNpcIdx] = GetName();
	SetNpcDeathScript(nNpcIdx, "\\script\\event\\zhongqiu_jieri\\201009\\npcdeath.lua");
	AddTimer(1800 * 18, "OnTimeout", nNpcIdx);
end

-- 定时器到时间 删除NPC
function OnTimeout(nNpcIndex)
	
	if tb2010ZhongQiu.tbNpcSet[nNpcIndex] ~= nil then
		 tb2010ZhongQiu.tbNpcSet[nNpcIndex] =  nil;
		 DelNpc(nNpcIndex);
	end

	return 0;
end

-- 加载姮娥
function tb2010ZhongQiu:AddTaskNpc()
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2010\\head.lua", "tbMidAut2010:SynShape", {}, "", "", {});
end

-- 姮娥变形
function tb2010ZhongQiu:TaskNpcChangeShape(nShape)
		
	local nNpcTempId = self.tbHengE.tbNpcTempId[nShape];
	local tbNpcInfo  = self.tbHengE.tbInfo;
	
	if nNpcTempId == nil or tbNpcInfo == nil then 
		return 
	end
	
	for i = 1,getn(tbNpcInfo) do
		
		-- 删除原有NPC
		if tbNpcInfo[i].nNpcIndex ~= nil then
			DelNpc(tbNpcInfo[i].nNpcIndex);
			tbNpcInfo[i].nNpcIndex = nil;
		end
		
		if tbNpcInfo[i].nRabbitIndex ~= nil then
			DelNpc(tbNpcInfo[i].nRabbitIndex);
			tbNpcInfo[i].nRabbitIndex = nil;
		end
		
		-- 加载新的NPC
		local tbPos = tbNpcInfo[i].tbPos;
		local nSubWorldIdx = SubWorldID2Idx(tbPos[1]);

		if nSubWorldIdx >= 0 then
			local nNpcIdx = AddNpc(nNpcTempId, 90, nSubWorldIdx, tbPos[2]*32, tbPos[3]*32, 0, "嫦娥");
			if nNpcIdx > 0 then
				SetNpcScript(nNpcIdx, "\\script\\activitysys\\npcdailog.lua");
				tbNpcInfo[i].nNpcIndex = nNpcIdx;
			end
			local nRabbitIndex = AddNpc(self.tbHengE.nNpcRabbitId, 90, nSubWorldIdx, tbNpcInfo[i].tbRabbitPos[2]*32, tbNpcInfo[i].tbRabbitPos[3]*32, 0, " ");
			if nRabbitIndex > 0 then
				tbNpcInfo[i].nRabbitIndex = nRabbitIndex;
			end			
		end
	end	
	
end

-- 上交走军灯笼
function tb2010ZhongQiu:GiveItem2HengE()
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2010\\head.lua", "tbMidAut2010:AddCount", {GetName()}, "\\script\\event\\zhongqiu_jieri\\201009\\support.lua", "tb2010ZhongQiu:GiveItem2HengE_CallBack", {});
end

-- 上交走军灯笼（回调）
function tb2010ZhongQiu:GiveItem2HengE_CallBack(szName, nCount)
	
	local nPlayerIndex = SearchPlayer(szName);
	if nPlayerIndex <= 0 then
		return
	end

	local nOldPlayerIndex = PlayerIndex;	
	PlayerIndex = nPlayerIndex;
	
	Msg2Player(format("大侠是第%d个交走马灯笼的人.", nCount));
	
	if mod(nCount, 1000) == 0 then
		Msg2Player("恭喜大侠获得额外奖励!")
		tbAwardTemplet:GiveAwardByList({nExp = 5000000}, format("[中秋活动][走马灯笼奖励增加] 第%d人", nCount));	
	end
	
	PlayerIndex = nOldPlayerIndex;
end

-- 显示上交的灯笼数目
function tb2010ZhongQiu:ShowGiveCount(nTaskID)
	local nCurCount = TaskManager:GetTask(self.nTaskGroupId, nTaskID);
	CreateTaskSay({format("<dec><npc>阁下已交 %d 走马灯笼!", nCurCount),  "可以!/Cancel",});
end

-- 设置上交数目
function tb2010ZhongQiu:SetCountForDeBug(nCount)
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2010\\head.lua", "tbMidAut2010:SetCountForDeBug", {nCount}, "", "", {});
end

-- 放烟花
function tb2010ZhongQiu:Fireworks()
	for i = 1,getn(self.tbFireworks) do
		local tbPos = self.tbFireworks[i].tbPos;
		local nSubWorldIdx = SubWorldID2Idx(tbPos[1]);
		if nSubWorldIdx >= 0 then
			local nNpcIdx = AddNpc(1575, 90, nSubWorldIdx, tbPos[2]*32, tbPos[3]*32, 0, "");
			if nNpcIdx > 0 then
				self.tbFireworks[i].nNpcIndex = nNpcIdx;
				self.tbFireworks[i].nLeftCount = 80;			-- 每分钟4次，20分钟 一共 80次
				AddTimer(15 * 18, "FireworksOnTimeout", i);
			end
		end
	end		
end

-- 烟花定时器
function FireworksOnTimeout(nIndex)
	
	local tbNpc = tb2010ZhongQiu.tbFireworks[nIndex];
	if tbNpc == nil then
		return 0;
	end
	
	if tbNpc.nNpcIndex == nil then
		tbNpc.nLeftCount = 0;
		return 0;
	end
	
	if tbNpc.nLeftCount <= 0 then
		DelNpc(tbNpc.nNpcIndex);
		tbNpc.nNpcIndex = nil;
		tbNpc.nLeftCount = 0;
		return 0;
	end
	
	-- 加经验
	local nOldPlayer = PlayerIndex;	
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(tbNpc.nNpcIndex, 16);
	for i = 1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i];
		if ST_IsTransLife() ~= 1 and GetLevel() < 50 then
			Msg2Player("需要50级以上才能参加活动!");
		else
			tbAwardTemplet:GiveAwardByList({nExp = 1000000}, "[中秋活动][烟花领经验]");	
		end
	end	
	
	PlayerIndex = nOldPlayer;
	tbNpc.nLeftCount = tbNpc.nLeftCount - 1;
	return 15 * 18, nIndex;
end

-- 加载装饰NPC
function tb2010ZhongQiu:AddDecorationNpc()
	
	local tbNpcPosInfo = 
	{
		-- 凤翔
		[1] = 
		{
			{	1656	,	3156	},
			{	1649	,	3164	},
			{	1655	,	3172	},
			{	1662	,	3165	},
			{	1634	,	3178	},
			{	1644	,	3169	},
			{	1642	,	3186	},
			{	1650	,	3177	},
			{	1620	,	3085	},
			{	1611	,	3095	},
			{	1604	,	3088	},
			{	1612	,	3078	},
			{	1605	,	3296	},
			{	1598	,	3276	},
			{	1594	,	3273	},
			{	1602	,	3264	},
			{	1643	,	3285	},
			{	1636	,	3278	},
			{	1651	,	3278	},
			{	1643	,	3249	},
			{	1574	,	3117	},
			{	1582	,	3109	},
			{	1581	,	3125	},
			{	1589	,	3117	},
			{	1516	,	3117	},
			{	1523	,	3170	},
			{	1518	,	3182	},
			{	1526	,	3174	},
			{	1526	,	3167	},
			{	1532	,	3161	},
			{	1529	,	3171	},
			{	1535	,	3164	},
			{	1553	,	3122	},
			{	1545	,	3220	},
			{	1560	,	3220	},
			{	1551	,	3288	},
			{	1562	,	3228	},
			{	1579	,	3268	},
			{	1570	,	3258	},
			{	1566	,	3262	},
			{	1574	,	3270	},
			{	1589	,	3277	},
			{	1581	,	3270	},
			{	1578	,	3274	},
			{	1586	,	3282	},
			{	1620	,	3247	},
			{	1611	,	3238	},
			{	1604	,	3246	},
			{	1612	,	3254	},
		},
		
		-- 襄阳
		[78] = 
		{
			{	1645	,	3276	},
			{	1638	,	3268	},
			{	1636	,	3287	},
			{	1628	,	3279	},
			{	1637	,	3267	},
			{	1627	,	3279	},
			{	1620	,	3271	},
			{	1628	,	3258	},
			{	1618	,	3250	},
			{	1618	,	3269	},
			{	1609	,	3260	},
			{	1706	,	3234	},
			{	1714	,	3225	},
			{	1698	,	3224	},
			{	1705	,	3216	},
			{	1553	,	3179	},
			{	1546	,	3173	},
			{	1545	,	3192	},
			{	1537	,	3183	},
			{	1520	,	3146	},
			{	1531	,	3135	},
			{	1530	,	3155	},
			{	1539	,	3144	},
			{	1538	,	3128	},
			{	1546	,	3119	},
			{	1545	,	3137	},
			{	1553	,	3127	},
			{	1535	,	3108	},
			{	1541	,	3113	},
			{	1551	,	3102	},
			{	1545	,	3097	},
			{	1520	,	3232	},
			{	1511	,	3223	},
			{	1520	,	3214	},
			{	1529	,	3222	},
			{	1530	,	3309	},
			{	1599	,	3316	},
			{	1592	,	3323	},
			{	1602	,	3336	},
			{	1610	,	3328	},
			{	1449	,	3198	},
			{	1439	,	3208	},
			{	1405	,	3221	},
			{	1460	,	3211	},
			{	1450	,	3220	},
			{	1492	,	3268	},
			{	1500	,	3278	},
			{	1481	,	3279	},
			{	1489	,	3288	},
			{	1522	,	3298	},
			{	1531	,	3290	},
			{	1510	,	3287	},
			{	1519	,	3278	},
		},
				
		-- 汴京
		[37] = 
		{
			{	1603	,	3007	},
			{	1611	,	3016	},
			{	1606	,	3021	},
			{	1597	,	3012	},
			{	1613	,	3018	},
			{	1622	,	3026	},
			{	1617	,	3032	},
			{	1608	,	3023	},
			{	1624	,	3029	},
			{	1632	,	3036	},
			{	1619	,	3034	},
			{	1626	,	3041	},
			{	1633	,	3049	},
			{	1623	,	3060	},
			{	1629	,	3066	},
			{	1640	,	3056	},
			{	1616	,	3066	},
			{	1606	,	3076	},
			{	1622	,	3072	},
			{	1612	,	3082	},
			{	1591	,	3092	},
			{	1600	,	3083	},
			{	1596	,	3098	},
			{	1606	,	3088	},
			{	1622	,	3127	},
			{	1612	,	3117	},
			{	1616	,	3132	},
			{	1607	,	3123	},
			{	1628	,	3133	},
			{	1639	,	3143	},
			{	1633	,	3149	},
			{	1623	,	3138	},
			{	1842	,	2960	},
			{	1851	,	2969	},
			{	1846	,	2975	},
			{	1837	,	2966	},
			{	1845	,	2972	},
			{	1862	,	2980	},
			{	1857	,	2985	},
			{	1849	,	2978	},
			{	1885	,	3003	},
			{	1886	,	3016	},
			{	1876	,	3026	},
			{	1882	,	3032	},
			{	1892	,	3032	},
			{	1863	,	3051	},
			{	1854	,	3060	},
			{	1849	,	3055	},
			{	1859	,	3045	},
			{	1837	,	3067	},
			{	1848	,	3057	},
			{	1853	,	3062	},
			{	1843	,	3072	},
			{	1661	,	3221	},
			{	1672	,	3232	},
			{	1666	,	3237	},
			{	1656	,	3227	},
			{	1693	,	3222	},
			{	1684	,	3230	},
			{	1679	,	3225	},
			{	1688	,	3216	},
			{	1696	,	3028	},
			{	1704	,	3200	},
			{	1701	,	3213	},
			{	1710	,	3205	},
			{	1705	,	3165	},
			{	1715	,	3176	},
			{	1710	,	3181	},
			{	1700	,	3171	},
			{	1650	,	3166	},
			{	1639	,	3177	},
			{	1650	,	3188	},
			{	1660	,	3177	},
			{	1655	,	3160	},
			{	1666	,	3150	},
			{	1676	,	3161	},
			{	1666	,	3172	},
			{	1741	,	3057	},
			{	1731	,	3047	},
			{	1726	,	3053	},
			{	1736	,	3063	},
			{	1759	,	2989	},
			{	1770	,	2978	},
			{	1775	,	2984	},
			{	1765	,	2994	},
			{	1815	,	2994	},
			{	1826	,	2954	},
			{	1831	,	2924	},
			{	1820	,	2938	},
		},
				
		-- 大理
		[162] = 
		{
			{	1621	,	3169	},
			{	1628	,	3161	},
			{	1639	,	3171	},
			{	1631	,	3180	},
			{	1570	,	3163	},
			{	1580	,	3154	},
			{	1590	,	3164	},
			{	1581	,	3174	},
			{	1605	,	3258	},
			{	1597	,	3267	},
			{	1603	,	3276	},
			{	1613	,	3266	},
			{	1565	,	3283	},
			{	1555	,	3273	},
			{	1562	,	3265	},
			{	1572	,	3276	},
			{	1537	,	3294	},
			{	1530	,	3302	},
			{	1539	,	3310	},
			{	1536	,	3292	},
			{	1527	,	3283	},
			{	1519	,	3290	},
			{	1528	,	3300	},
			{	1456	,	3281	},
			{	1466	,	3271	},
			{	1465	,	3291	},
			{	1475	,	3281	},
			{	1464	,	3171	},
			{	1466	,	3188	},
			{	1456	,	3179	},
			{	1473	,	3180	},
			{	1483	,	3191	},
			{	1467	,	3189	},
			{	1476	,	3197	},
			{	1623	,	3199	},
			{	1632	,	3208	},
			{	1623	,	3219	},
			{	1613	,	3210	},
			{	1654	,	3136	},
			{	1643	,	3146	},
			{	1653	,	3157	},
			{	1664	,	3146	},
			{	1583	,	3220	},
			{	1593	,	3230	},
			{	1587	,	3239	},
			{	1576	,	3228	},
		},
		
		-- 扬州
		[80] = 
		{
			{	1684	,	3003	},
			{	1691	,	3009	},
			{	1699	,	3000	},
			{	1694	,	2993	},
			{	1717	,	2982	},
			{	1709	,	2991	},
			{	1703	,	2983	},
			{	1710	,	2975	},
			{	1654	,	3031	},
			{	1662	,	3037	},
			{	1651	,	3048	},
			{	1644	,	3041	},
			{	1667	,	3095	},
			{	1656	,	3083	},
			{	1650	,	3091	},
			{	1645	,	3117	},
			{	1652	,	3126	},
			{	1661	,	3117	},
			{	1653	,	3109	},
			{	1660	,	3117	},
			{	1660	,	3102	},
			{	1667	,	3110	},
			{	1657	,	3121	},
			{	1650	,	3112	},
			{	1621	,	3142	},
			{	1628	,	3151	},
			{	1618	,	3160	},
			{	1612	,	3152	},
			{	1662	,	3224	},
			{	1670	,	3231	},
			{	1671	,	3214	},
			{	1678	,	3222	},
			{	1703	,	3230	},
			{	1694	,	3237	},
			{	1693	,	3220	},
			{	1686	,	3228	},
			{	1681	,	3157	},
			{	1688	,	3165	},
			{	1681	,	3173	},
			{	1673	,	3165	},
			{	1653	,	3170	},
			{	1663	,	3160	},
			{	1661	,	3178	},
			{	1670	,	3168	},
			{	1771	,	3089	},
			{	1780	,	3098	},
			{	1777	,	3080	},
			{	1786	,	3089	},
			{	1810	,	3061	},
			{	1817	,	3069	},
			{	1810	,	3076	},
			{	1802	,	3068	},
			{	1838	,	3050	},
			{	1828	,	3059	},
			{	1835	,	3067	},
			{	1844	,	3058	},
		},
				
		-- 成都
		[11] = 
		{
			{	3169	,	5178	},
			{	3161	,	5186	},
			{	3168	,	5194	},
			{	3177	,	5185	},
			{	3164	,	5198	},
			{	3147	,	5201	},
			{	3157	,	5190	},
			{	3154	,	5209	},
			{	3095	,	5024	},
			{	3103	,	5031	},
			{	3111	,	5022	},
			{	3106	,	5014	},
			{	3139	,	4980	},
			{	3145	,	4988	},
			{	3154	,	4979	},
			{	3148	,	4971	},
			{	3158	,	4961	},
			{	3164	,	4969	},
			{	3173	,	4961	},
			{	3167	,	4952	},
			{	3197	,	4960	},
			{	3190	,	4969	},
			{	3199	,	4978	},
			{	3206	,	4970	},
			{	3214	,	4978	},
			{	3222	,	4969	},
			{	3199	,	4978	},
			{	3206	,	4970	},
			{	3214	,	4978	},
			{	3222	,	4986	},
			{	3217	,	4994	},
			{	3205	,	4984	},
			{	3249	,	5013	},
			{	3260	,	5025	},
			{	3259	,	5005	},
			{	3268	,	5015	},
			{	3220	,	5045	},
			{	3227	,	5075	},
			{	3218	,	5067	},
			{	3209	,	5065	},
			{	3008	,	5112	},
			{	3016	,	5120	},
			{	3011	,	5126	},
			{	3002	,	5119	},
			{	3030	,	5134	},
			{	3025	,	5141	},
			{	3036	,	5152	},
			{	3041	,	5144	},
			{	3061	,	5165	},
			{	3049	,	5153	},
			{	3045	,	5160	},
			{	3056	,	5171	},
		},		
	};
	
	local tbNpcTempId = {1592, 1593};
	
	for nSubWorldId,tbPos in tbNpcPosInfo do
		local nSubWorldIdx = SubWorldID2Idx(nSubWorldId);
		if nSubWorldIdx > 0 then
			local nRand = random(1, getn(tbNpcTempId));
			for i = 1, getn(tbPos) do
				AddNpc(tbNpcTempId[nRand], 90, nSubWorldIdx, tbPos[i][1]*32, tbPos[i][2]*32, 0, " ");
			end
		end
	end

end

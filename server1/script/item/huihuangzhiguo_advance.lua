Include("\\script\\activitysys\\playerfunlib.lua");

huihuangzhiguo_advance = {}

huihuangzhiguo_advance.nDailyCountLimit = 5;
huihuangzhiguo_advance.nLevelLimit = 120;
huihuangzhiguo_advance.tbEXP =  --果子对应经验表
{
	{15000000, "百年辉煌果"},
	{23000000, "千年辉煌果"},
	{30000000, "万年辉煌果"},
};

huihuangzhiguo_advance.tbZhenLuTSK =  --使用珍露TSKID和给予对应物品表
{
	{2669, {tbProp={6,1,2269,1,0,0}}, "百年珍露", "百年辉煌果"},
	{2670, {tbProp={6,1,2270,1,0,0}}, "千年珍露", "千年辉煌果"},
	{2671, {tbProp={6,1,2271,1,0,0}}, "万年珍露", "万年辉煌果"},
};

function huihuangzhiguo_advance:UseGuoZi(nGuoziLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	if (self:CheckCountLimit() ~= 1) then
		return 0;
	end
	
	if (self.tbEXP[nGuoziLevel] == nil) then
		return 0;
	end
	
	PlayerFunLib:AddExp(self.tbEXP[nGuoziLevel][1], 0, format("%s 奖励",self.tbEXP[nGuoziLevel][2]));
	SetTask(2313, GetTask(2313) + 1)
	return 1;
end

function huihuangzhiguo_advance:UseZhenLu(nZhenLuLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	self:AddZhenLuCount(nZhenLuLevel);
	Msg2Player(format("使用%d %s, 捡辉煌果时还能获得%d %s, 该状态将于0时消失", 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][3], 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][4]));
	return 1;
end

function huihuangzhiguo_advance:CheckLevelLimit()
	if (GetLevel() < self.nLevelLimit) then
		lib:ShowMessage(format("级%d 以上(包括%d) 才能使用!", self.nLevelLimit, self.nLevelLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:CheckCountLimit()
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(2312) ~= nDate ) then
		SetTask(2312, nDate)
		SetTask(2313, 0)
	end
	
	if (GetTask(2313) >= self.nDailyCountLimit) then
		lib:ShowMessage(format("今天阁下已使用%d辉煌果了，功力增加过快也会被反作用哦。等明天再来用哦", self.nDailyCountLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:AddZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], 1);
	end
end

function huihuangzhiguo_advance:ReduceZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], -1);
	end
end

function huihuangzhiguo_advance:GetGuoZiAvd()
	local nCount = 0;
	for i=getn(self.tbZhenLuTSK),1,-1 do --从高级到低级遍历
		local nZhenLu = PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[i][1]);
		if (nZhenLu > 0) then
			tbAwardTemplet:GiveAwardByList(self.tbZhenLuTSK[i][2], "捡辉煌果");
			self:ReduceZhenLuCount(i);
			nCount = 1;
			break;
		end
	end
	
	return nCount;
end
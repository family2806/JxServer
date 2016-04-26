IncludeLib("ITEM")
Include("\\script\\tong\\tong_award_head.lua");-- by志山，帮会周目标贡献度
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

--	local GREADSEED_SEEDID_TASKID = 2310;
--	local GREADSEED_TIME_TASKID = 2311;

local _Limit = function(nNpcIdx)
	
	if (0 == GetCamp()) then
		Msg2Player("你还未加入门派，不能拾取果实.")
		return
	end

	if (0 == GetFightState() or GetLife(0) <= 0 or GetProtectTime() > 0 ) then
		Msg2Player("不能拾取果实.")
		return
	end
	
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel = nil;
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	
	if (nGetSeedLevel ~= 3) then -- 如果级别不对,不能进行拾取
		--这里告诉玩家级别不对,不能拾取
		Msg2Player("此类果实只有120级以上的玩家可以拾取")
		return
	end;
	
	return nGetSeedLevel
end

local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	local nGetSeedLevel = %_Limit(nNpcIdx)
	
	if nGetSeedLevel == nil then
		return 0
	end
	
	
	DelNpc(nNpcIdx)
	
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,907,1,0,0,0}, nExpiredTime = 10080}, "辉煌夜", 1);
	--暂关闭活动性能- Modified by DinhHQ - 20110427
	--tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2804,1,0,0,0}}, "辉煌夜", 30);
	
	tongaward_goldenseed();-- by志山，帮会周目标贡献度
	--Msg2Player("你得到了一个黄金之果。");
	AddGlobalNews(format("大侠拾取了 %s 黄金之果!!!",GetName()));
end


local _OnBreak = function()
	Msg2Player("断断续续收集")
end

function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if %_Limit(nNpcIdx) == nil then
		return
	end
	--开启进度条
	tbProgressBar:OpenByConfig(2, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;


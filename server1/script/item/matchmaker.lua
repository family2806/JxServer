-- 文件名　：matchmaker.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-22 15:11:22
--每日限制n低字位9位记录计数，高位记录日期， 计数可以直接n=n+1
Include("\\script\\event\\valentine2008\\head.lua")
Include("\\script\\event\\valentine2008\\lib\\addaward.lua")
Include("\\script\\lib\\pay.lua")
function IsPickable( nItemIndex, nPlayerIndex )
	--时间
	if not valentine2008_isGetItemPeriod() then
		Msg2Player(format("活动<color=yellow>%s<color>已经结束，不能得到什么东西了。",valentine2008_szActName))
		return 0;
	end
	if check_valentine2008_team() ~= 1 then
		Msg2Player("只能是一男一女组队才能与他对话。")
		return 0;
	end
	local nTeamSize = GetTeamSize()
	local i
	for i=1, nTeamSize do
		if valentine2008_PlayerDo(GetTeamMember(i), valentine2008_PlayerLimit) == 0 then
			Msg2Team("队伍有人条件不符合不能得到月光宝盒。")
			return 0;
		end
	end
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		local i
		local nCollectExpLimit = GetTask(TSK_valentine2008_CollectExpLimit)
		--拾取的人得到
		local tbExp = 
		{
			{nExp = 10000, nRate = 30},
			{nExp = 40000, nRate = 40},
			{nExp = 70000, nRate = 30},
		}
		if nCollectExpLimit < TSKV_valentine2008_CollectExpLimit then
			local nCurSelect = valentine2008_lib_AddAwardByRate(tbExp, valentine2008_szActName)
			nCollectExpLimit = nCollectExpLimit + tbExp[nCurSelect].nExp
			SetTask(TSK_valentine2008_CollectExpLimit, nCollectExpLimit)
		else
			Msg2Player(format("你获得月光宝盒得到的经验达%d，到了本次活动上限。", nCollectExpLimit))
		end
		--集体得到
		local nTeamSize = GetTeamSize()
		for i=1, nTeamSize do
			valentine2008_PlayerDo(GetTeamMember(i), valentine2008_GetYueGuangBaoHe);
		end	
		return 0;	-- 删除物品
	end
end

--某个人执行某个函数
function valentine2008_PlayerDo(nPlayerIdx,fun,...)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIdx
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end

--检查是否2人男女队伍

function check_valentine2008_team()
	if (GetTeamSize() == 2) then		-- 组队、人数为2、
		Player1_ID = GetTeamMember(1)
		Player2_ID = GetTeamMember(2)
		if ( (valentine2008_PlayerDo(Player1_ID,GetSex) + valentine2008_PlayerDo(Player2_ID,GetSex) ) ~= 1) then --男女情况11 10 00 相加为1说明是异性队伍
			return 0
		end
		return 1
	end
	return 0
end
--人物有关的限制条件
function valentine2008_PlayerLimit()
	local nDate			= tonumber(GetLocalDate("%y%m%d"));
	local nMaxCount		= GetTask(TSK_valentine2008_CollectMaxLimit)
	local nCollectLimit	= GetTask(TSK_valentine2008_CollectLimit)
	--等级
	if (IsCharged() == 0 or GetLevel() < 100) then
		
		Msg2Team(format("%s不是100级以上的充值玩家。", GetName()))
		return 0;
	end
	
	--最大拾取个数
	if(nMaxCount  >= TSKV_valentine2008_CollectMaxLimit) then
		Msg2Team(format("%s获得月光宝盒达%d个，已经到达本次活动上限了。", GetName(), nMaxCount));
		return 0;
	end
	--每天拾取个数
	
	if( nDate ~= floor(nCollectLimit/512) ) then
		nCollectLimit = nDate * 512
		SetTask(TSK_valentine2008_CollectLimit, nCollectLimit)
	end
	if(mod(nCollectLimit, 512) >= TSKV_valentine2008_CollectDayLimit) then
		Msg2Team(format("%s今天获得月光宝盒达%d个，已经到达上限了，请明天继续吧。", GetName(), TSKV_valentine2008_CollectDayLimit));
		return 0;
	end
	return 1
end
--得到月光宝盒，任务变量设置
function valentine2008_GetYueGuangBaoHe()
	local nMaxCount		= GetTask(TSK_valentine2008_CollectMaxLimit)
	local nCollectLimit	= GetTask(TSK_valentine2008_CollectLimit)
	local nStackCount	= 10
	local tbItemList	= 
	{
		{szName="蝴蝶簪", tbProp={6, 1, 1667, 1, 0, 0}},
		{szName="鸳鸯帕", tbProp={6, 1, 1666, 1, 0, 0}},
	}
	
	SetTask(TSK_valentine2008_CollectLimit, nCollectLimit+1);--今天最大个数+1
	nMaxCount = nMaxCount + 1
	SetTask(TSK_valentine2008_CollectMaxLimit, nMaxCount);--最大个数+1
	Msg2Player(format("一共得到了%d个月光宝盒。", nMaxCount))
	if mod(nMaxCount, nStackCount) == 0 then
		AddSkillState(703, 1, 1, 18*60*10)
		if GetSex() == 0 then --男
			valentine2008_lib_AddAward(tbItemList[2], valentine2008_szActName)
		else
			valentine2008_lib_AddAward(tbItemList[1], valentine2008_szActName)
		end
	end	
end

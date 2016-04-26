-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 战胜礼包
-- 文件名　：zhansheng_libao.lua
-- 创建者　：子非魚
-- 创建时间：2009-04-14 14:08:44

-- ======================================================

Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");
IncludeLib("ITEM")

SONGJIN_LIBAO_TASK_NO = 2619
SONGJIN_LIBAO_LIMIT   = 20


if not TB_QIANQIU_YINGLIE0904 then
	Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");
end


function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("物品过使用期，自动消失.")
		return 0;
	end
	
--	TB_QIANQIU_YINGLIE0904:reset_task()
	
	if IsCharged() == 0 or GetLevel() < 50 then
		Say("只有50级已充值玩家才能使用.", 0)
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 5) then
		Say(format("为确保财产安全，请确保装备还剩 %d 空位.", 5), 0);
		return 1;
	end
	
	local tb_award = {
		{szName = "挑战礼包", tbProp = {6,1,2006,1,1,0}, nRate = 50},
		{szName = "神秘矿石", tbProp = {6,1,398,1,0,0}, nRate = 0.05},
		{szName = "紫水晶", tbProp = {4,239,1,1,1,0}, nRate = 0.2},
		{szName = "绿水晶", tbProp = {4,240,1,1,1,0}, nRate = 0.2},
		{szName = "蓝水晶", tbProp = {4,238,1,1,1,0}, nRate = 0.2},
		{szName = "晶红宝石", tbProp = {4,353,1,1,1,0}, nRate = 0.5},
		{szName = "白真丹", tbProp = {6,1,1676,1,0,0}, nRate = 0.03, tbParam = {500000000}},
		{szName = "血真丹", tbProp = {6,1,1677,1,0,0}, nRate = 0.02, tbParam = {1000000000}},
		{szName = "玄真丹", tbProp = {6,1,1678,1,0,0}, nRate = 0.01, tbParam = {1500000000}},
		{szName = "安邦冰晶石项链", nQuality=1, tbProp = {0,164}, nRate = 0.01},
		{szName = "安邦鸡血石戒指", nQuality=1, tbProp = {0,167}, nRate = 0.02},
		{szName = "安邦菊花石指环", nQuality=1, tbProp = {0,165}, nRate = 0.02},
		{szName = "安邦田黄石玉佩", nQuality=1, tbProp = {0,166}, nRate = 0.02},
		{szName = "200万经验值", nExp = 2000000, nRate = 48.72},
	}
	
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local n_award_idx = 0;
	for i=1,getn(tb_award) do
		rstep=rstep+floor(tb_award[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			n_award_idx = i;
			break
		end
	end
	
	if (n_award_idx == 0 or n_award_idx > getn(tb_award)) then
		return 1;
	end
	
	-- 限制每天使用20个
	local ndate = tonumber(GetLocalDate("%m%d"));
	local nUseTimes = GetBitTask(SONGJIN_LIBAO_TASK_NO, 0, 8) -- 使用次数
	local nLastUseDate = GetBitTask(SONGJIN_LIBAO_TASK_NO, 8, 24) -- 上次使用时间
	
	if( nLastUseDate ~= ndate) then
		nLastUseDate =  ndate;
		nUseTimes = 0;
	end
	
	if (nUseTimes >= SONGJIN_LIBAO_LIMIT) then
		Say(format("每日只能使用 %d 宋金礼包", SONGJIN_LIBAO_LIMIT), 0)
		return 1;
	end
		
	nUseTimes = nUseTimes + 1;
	SetBitTask(SONGJIN_LIBAO_TASK_NO, 0, 8,  nUseTimes);
	SetBitTask(SONGJIN_LIBAO_TASK_NO, 8, 24, nLastUseDate);
	
	tbAwardTemplet:GiveAwardByList(tb_award[n_award_idx], "宋金礼包");
end

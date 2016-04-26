-- 文件名　：chuangongdan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("只有重生的人物才能使用紫金真丹", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("使用该紫金真丹不能获得经验.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d 日 %d 时%d分%d 秒<color>",nDay,nHour,nMin,nSec);
	end
		
	local szTitle;
	local tbOpt;
	
	if szMsg_ZiJin ~= nil then
		szTitle	= format("您好 <color=yellow>%s<color>, 在60天内只能使用1次资金真丹，大侠多等%s然后再重试.",GetName(),szMsg_ZiJin)
		tbOpt = 
		{
			"确认/OnCancel"
		}
	else
		szTitle	= format("您好 <color=yellow>%s<color>, 使用该仙丹可以获得<color=yellow>%s<color>经验。确认想使用?",GetName(), nContainExp)
		tbOpt = 
		{
			format("确认/#BeiDouChuanGong_UseItem(%d)", nItemIndex),
			"放弃/OnCancel"
		}
	end
	Say(szTitle, getn(tbOpt), tbOpt);
	return 1;
end

function BeiDouChuanGong_UseItem(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("只有重生的人才能使用紫金真丹", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("使用该真丹不能获得经验.", 0)
		return 0;
	end
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);	
	local szMsg_ZiJin  		= nil;
			
	if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_ZiJin = format("<color=yellow>%d 天 %d时%d 分%d 秒<color>",nDay,nHour,nMin,nSec);
	end	
	
	
	if szMsg_ZiJin ~= nil then
		local szTitle = format("您好 <color=yellow>%s<color>, 在60天内只能使用1次资金真丹，大侠多等%s然后再重试",GetName(),szMsg_ZiJin)
		local tbOpt = 
		{
			"确认/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			
			tbAwardTemplet:GiveAwardByList({nExp_tl = nContainExp;}, format("%s 使用紫金真丹", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
			
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\n含有 <color=yellow>%s<color> 经验", nContainExp);
end

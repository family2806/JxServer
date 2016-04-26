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
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
	local szMsg_Huang  		= nil;	
	
	if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_Huang = format("<color=yellow>%d 日%d 时%d 分%d 秒<color>",nDay,nHour,nMin,nSec);
	end		

	local szTitle;
	local tbOpt;
	
	if szMsg_Huang ~= nil then
		szTitle	= format("您好<color=yellow>%s<color>, 在60天内只能使用1次黄真丹，大侠多等%s然后再重试.",GetName(), szMsg_Huang);
		tbOpt = 
		{
			"确认OnCancel"
		}
	else
		szTitle	= format("您好 <color=yellow>%s<color>, 使用黄真丹可以获得<color=yellow>%s<color> 经验。确认想使用?",GetName(), 2000000000)
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
	
	local nCurTime			= GetCurServerTime()
	local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
	local szMsg_Huang  		= nil;	
	
	if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
		local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
		local nDay	= floor(nTime  / (24*60*60) );
			  nTime	= mod( nTime, 24*60*60);
		local nHour	= floor( nTime / (60*60) );
			  nTime	= mod(nTime, 60*60);
		local nMin	= floor(nTime / 60 );
		local nSec	= mod(nTime, 60);
			
		szMsg_Huang = format("<color=yellow>%d 日%d 时%d 分%d 秒<color>",nDay,nHour,nMin,nSec);
	end			
	
	if szMsg_Huang ~= nil then
		local szTitle = format("您好<color=yellow>%s<color>, 在60天内只能使用1次黄真丹，大侠多等%s然后再重试.",GetName(), szMsg_Huang)
		local tbOpt = 
		{
			"确认/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
		
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tbAwardTemplet:GiveAwardByList({nExp_tl = 2000000000;}, format("%s 使用黄真丹", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	return format("\n含有 <color=yellow>%s<color> 经验", 2000000000);
end

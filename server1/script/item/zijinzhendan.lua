-- �ļ�������chuangongdan.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-02-25 16:25:21
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
		Say("ֻ���������������ʹ���Ͻ��浤", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("ʹ�ø��Ͻ��浤���ܻ�þ���.", 0)
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
			
		szMsg_ZiJin = format("<color=yellow>%d �� %d ʱ%d��%d ��<color>",nDay,nHour,nMin,nSec);
	end
		
	local szTitle;
	local tbOpt;
	
	if szMsg_ZiJin ~= nil then
		szTitle	= format("���� <color=yellow>%s<color>, ��60����ֻ��ʹ��1���ʽ��浤���������%sȻ��������.",GetName(),szMsg_ZiJin)
		tbOpt = 
		{
			"ȷ��/OnCancel"
		}
	else
		szTitle	= format("���� <color=yellow>%s<color>, ʹ�ø��ɵ����Ի��<color=yellow>%s<color>���顣ȷ����ʹ��?",GetName(), nContainExp)
		tbOpt = 
		{
			format("ȷ��/#BeiDouChuanGong_UseItem(%d)", nItemIndex),
			"����/OnCancel"
		}
	end
	Say(szTitle, getn(tbOpt), tbOpt);
	return 1;
end

function BeiDouChuanGong_UseItem(nItemIndex)
	
	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	if ST_GetTransLifeCount() <= 0  then
		Say("ֻ���������˲���ʹ���Ͻ��浤", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("ʹ�ø��浤���ܻ�þ���.", 0)
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
			
		szMsg_ZiJin = format("<color=yellow>%d �� %dʱ%d ��%d ��<color>",nDay,nHour,nMin,nSec);
	end	
	
	
	if szMsg_ZiJin ~= nil then
		local szTitle = format("���� <color=yellow>%s<color>, ��60����ֻ��ʹ��1���ʽ��浤���������%sȻ��������",GetName(),szMsg_ZiJin)
		local tbOpt = 
		{
			"ȷ��/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			
			tbAwardTemplet:GiveAwardByList({nExp_tl = nContainExp;}, format("%s ʹ���Ͻ��浤", GetName()));
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
	return format("\n���� <color=yellow>%s<color> ����", nContainExp);
end

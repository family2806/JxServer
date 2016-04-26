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
			
		szMsg_Huang = format("<color=yellow>%d ��%d ʱ%d ��%d ��<color>",nDay,nHour,nMin,nSec);
	end		

	local szTitle;
	local tbOpt;
	
	if szMsg_Huang ~= nil then
		szTitle	= format("����<color=yellow>%s<color>, ��60����ֻ��ʹ��1�λ��浤���������%sȻ��������.",GetName(), szMsg_Huang);
		tbOpt = 
		{
			"ȷ��OnCancel"
		}
	else
		szTitle	= format("���� <color=yellow>%s<color>, ʹ�û��浤���Ի��<color=yellow>%s<color> ���顣ȷ����ʹ��?",GetName(), 2000000000)
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
			
		szMsg_Huang = format("<color=yellow>%d ��%d ʱ%d ��%d ��<color>",nDay,nHour,nMin,nSec);
	end			
	
	if szMsg_Huang ~= nil then
		local szTitle = format("����<color=yellow>%s<color>, ��60����ֻ��ʹ��1�λ��浤���������%sȻ��������.",GetName(), szMsg_Huang)
		local tbOpt = 
		{
			"ȷ��/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
		
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tbAwardTemplet:GiveAwardByList({nExp_tl = 2000000000;}, format("%s ʹ�û��浤", GetName()));
			SetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG, GetCurServerTime());
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	return format("\n���� <color=yellow>%s<color> ����", 2000000000);
end

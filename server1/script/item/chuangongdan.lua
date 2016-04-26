-- 文件名　：chuangongdan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-02-25 16:25:21
IncludeLib("SETTING");
Include("\\script\\lib\\pay.lua");
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function main(nItemIndex)
	local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
	if (parttype == 30036 or parttype == 30037) then	
			return 1
	end

	local nContainExp	= GetItemParam(nItemIndex, 1);
	nContainExp = nContainExp + GetItemParam(nItemIndex, 2)*1e8;
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime		= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime		= GetCurServerTime()
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("50级以上充值的人物才能使用各种真丹(白真丹，血真丹，玄真丹).", 0)
		return 1;
	end
	
	if nContainExp <= 0 then
		Say("使用该真丹不能获得经验.", 0)
		return 0
	end
	
	local szTime = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit < nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d 日%d 时%d 分%d 秒﹜", nDay, nHour, nMin, nSec);
		end
	end
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	
	
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("您好<color=yellow>%s<color>, 大侠使用各种仙丹获得的总经验最多为30亿点，所以不能多使用仙丹了。请等 <color=yellow>%s<color>然后重试.",GetName(),szTime)
		tbOpt = 
		{
			"确认/OnCancel"
		}
	else
		szTitle	= format("您好 <color=yellow>%s<color>, 大侠使用各种仙丹获得<color=yellow>%s<color> 经验，还能额外获得<color=yellow>%s<color> 经验. <enter>该仙丹有 <color=yellow>%s<color> 经验，如果使用该仙丹可以获得<color=yellow>%s<color>经验，阁下想使用吗？",GetName(), nTSKVExp, nRemnant, nContainExp, nExp)
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
	
	local nTSKVExp		= GetBeiDouChuanGongExp();
	local nTSKVTime	= GetTask(TSK_BeiDouChuanGong_NIANYUE);
	local nCurTime	= tonumber(GetLocalDate("%Y%m"));
	if GetLevel() < 50 or IsCharged() ~= 1 then
		Say("50级以上充值客户才能使用各种仙丹(白真丹，血真丹，玄真丹).", 0)
		return 1;
	end
	
	
	if nContainExp <= 0 then
		Say("使用该真丹不能获得经验.", 0)
		return 1
	end
	
	
	local nDay = 0;
	
	if nTSKVExp >= 30e8 then
		if nTSKVTime + TSKV_BeiDouChuanGong_UseLimit <= nCurTime then
			nTSKVExp = 0
			SetBeiDouChuanGongExp(nTSKVExp)
		else
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime)
			nDay		= floor(nTime  / (24*60*60) )
			nTime		= mod( nTime, 24*60*60)
			local nHour	= floor( nTime / (60*60) )
			nTime		= mod(nTime, 60*60)
			local nMin	= floor(nTime / 60 )
			local nSec	= mod(nTime, 60)
			szTime 		= format("%d 日 %d 时%d 分 %d 秒﹜", nDay, nHour, nMin, nSec);
		end
	end
	
	
	local nRemnant	= 30e8 - nTSKVExp;
	local nExp = nContainExp
	if nRemnant < nContainExp then
		nExp = nRemnant
	end
	local szTitle
	local tbOpt
	if nExp <= 0 then
		szTitle	= format("传功丹<color=yellow>%s<color>, 大侠使用各种仙丹获得的总经验最多为30亿点，所以不能多使用仙丹了。请等 <color=yellow>%s<color>然后重试.",GetName(), szTime)
		tbOpt = 
		{
			"确认/OnCancel"
		}
		Say(szTitle, getn(tbOpt), tbOpt);
	else
		if RemoveItemByIndex(nItemIndex) == 1 then
			tl_addPlayerExp(nExp);
			SetBeiDouChuanGongExp(nTSKVExp+nExp);
			if nTSKVExp+nExp >= 30e8 then 
				SetTask(TSK_BeiDouChuanGong_NIANYUE, GetCurServerTime());
			end
			AddSkillState( 509, 1, 0, 180);
		end
	end
end

function OnCancel()
	
end

function GetDesc(nItem)
	local itemgenre, detailtype, parttype = GetItemProp(nItem)
	if (itemgenre == 6 and detailtype == 1 and parttype == 30003 or parttype == 30004) then	
			local nVar = GetItemParam(nItem, 1);
			return format("\nMang m?s?<color=yellow>%s<color>", nVar);
	end
	local nContainExp = GetItemParam(nItem, 1);
	nContainExp = nContainExp + GetItemParam(nItem, 2)*1e8;
	return format("\含有 <color=yellow>%s<color> 经验", nContainExp);
end

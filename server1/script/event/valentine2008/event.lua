-- 文件名　：event.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-23 09:50:53
--月老对话，物品换经验
Include("\\script\\event\\valentine2008\\head.lua")
Include("\\script\\event\\valentine2008\\lib\\compose.lua")
Include("\\script\\event\\valentine2008\\lib\\addaward.lua")
Include("\\script\\lib\\pay.lua")

function valentine2008_yuelao_main()
	local szTitle = "月下老人：千里姻缘一线牵，是前生注定事，莫错过姻缘。情人节又到了，<color=red>2008年02月12日维修后～2008年02月15日维护前<color>，侠士只要在华山、青城山、点苍山、武夷山打怪，就有机会看见老夫并获得情人节礼品。"
	local tbOpt = 
	{
		"我这有1支蝴蝶簪/#valentine2008_Exchange(1,1)",
		"我这有1块鸳鸯帕/#valentine2008_Exchange(0,1)",
		"我这有10支蝴蝶簪/#valentine2008_Exchange(1,10)",
		"我这有10块鸳鸯帕/#valentine2008_Exchange(0,10)",
		"谢谢老人家，我过一会再来/no"
	}
	Say(szTitle, getn(tbOpt), tbOpt);
end

function valentine2008_Exchange(nType,nCount)
	local tbItemList = 
	{
		[0] = {szName="鸳鸯帕", tbProp={6, 1, 1666, 1, 0, 0}},
		[1] = {szName="蝴蝶簪", tbProp={6, 1, 1667, 1, 0, 0}},
	}
	local tbSex2Word = 
	{
		[0] = "侠士",
		[1] = "侠女"
	}
	local nExp = 99.9
	nExp = floor(nExp * nCount) * 10000
	local nComposeExpLimit = GetTask(TSK_valentine2008_ComposeExpLimit)
	if nType ~= GetSex() then
		Say(format("不好意思，只有<color=red>%s<color>才能使用<color=red>%s<color>兑换经验", tbSex2Word[nType], tbItemList[nType].szName), 0)
		return 0;
	end
	--时间
	if not valentine2008_isActPeriod() then
		Say(format("活动<color=yellow>%s<color>已经结束，谢谢您的参与。",valentine2008_szActName), 0)
		return 0;
	end
	--等级
	if (IsCharged() == 0 or GetLevel() < 100) then
		Say("你不是100级以上的充值玩家。", 0)
		return 0;
	end
	if nComposeExpLimit >= TSKV_valentine2008_ComposeExpLimit then
		Say("活动期间，玩家使用「蝴蝶簪」和「鸳鸯帕」最多可以获得5000W经验。", 0)
		return 0;
	end
	
	if nCount ~= 1 and nComposeExpLimit + nExp > TSKV_valentine2008_ComposeExpLimit then
		Say("本次兑换将超出活动期间的最大经验上限，请减少兑换的个数。", 0)
		return 0;
	end
	
	tbItemList[nType].nCount = nCount
	valentine2008_ComposeClass:Compose({tbItemList[nType]}, 0, valentine2008_ComposeAward, nExp)
end

function valentine2008_ComposeAward(nExp)
	AddOwnExp(nExp)
	SetTask(TSK_valentine2008_ComposeExpLimit, GetTask(TSK_valentine2008_ComposeExpLimit)+nExp);
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tget exp %d.","2008情人节合成",
	            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(), nExp ))
end
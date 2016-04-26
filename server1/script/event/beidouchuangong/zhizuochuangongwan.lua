-- 文件名　：zhizuochuangongwan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-02-22 17:16:36
--制作传功丸的脚本
IncludeLib("SETTING");
Include("\\script\\event\\BeiDouChuanGong\\lib\\compose.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function BeiDouChuanGong_main(nStep)
	local tbSay 
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>来找我是要炼传功仙丹吧?",
			"我来炼仙丹/#BeiDouChuanGong_main(2)",
			"和北斗传功术/#BeiDouChuanGong_main(3)",
			"使用时间信息/#BeiDouChuanGong_main(4)",
			"结束对话/OnCancel",
		}
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>你要炼哪种仙丹",
			"白真丹/#BeiDouChuanGong_zuodan([[bai]])",
			"血真丹/#BeiDouChuanGong_zuodan([[xue]])",
			"玄真丹/#BeiDouChuanGong_zuodan([[xuan]])",
			"紫金真丹/#BeiDouChuanGong_zuodan([[zijin]])",
			"结束对话/OnCancel",
		}
	elseif nStep == 3 then
		tbSay = 
		{
			format("<dec><npc>仙丹条件: 当传功给以上仙丹时要有100万经验值. 仙丹的所需原料如下.<enter>白真丹: 1北斗传功术, 1株七星草<enter>血真丹: 1北斗传功术, 1百年七星草 <enter>玄真丹: 1北斗传功术, 1千年七星草<enter>紫金真丹: 1北斗传功术, 1朵万年五彩花<enter>黄真丹:  北传<enter>3种仙丹, 只需达到50级并且充值了就可以使用并领取30亿总经验, 达到最高经验后要等 %d 天才可以再使用. 只有玩家转生才可以使用紫真丹. 紫金真丹和黄金真丹领取的经验值可以共用并且在使用完之后要60后才可以继续使用",floor( TSKV_BeiDouChuanGong_UseLimit/(60*60*24) ) ),
			"结束对话/OnCancel",
		}
	elseif nStep == 4 then
		
		local nCurTime			= GetCurServerTime()
		local nTSKVExp			= GetBeiDouChuanGongExp();
		local nTSKVTime			= GetTask(TSK_BeiDouChuanGong_NIANYUE);
		local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);
		local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
		
		local szMsg_Common = "以现在的功力, 你可以使用普通传功仙丹.";
		local szMsg_ZiJin  = "以现在的功力, 你可以使用紫金真丹.";
		local szMsg_Huang  = "以现在的功力, 你可以使用黄真丹.";
		
		-- 普通真丹
		if nTSKVExp >= 30e8 and nTSKVTime + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Common = format("现在需要再等 <color=yellow>%d 天 %d 小时 %d 分钟 %d 秒<color> 才可以使用普通传功仙丹.",nDay,nHour,nMin,nSec);
		end
		
		-- 紫金真丹
		if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_ZiJin = format("现在需要再等 <color=yellow>%d 天 %d 小时 %d 分钟 %d 秒<color> 才可以使用紫金真丹.",nDay,nHour,nMin,nSec);
		end
		
		-- 黄真丹
		if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Huang = format("现在需要再等 <color=yellow>%d 天 %d 小时 %d 分钟 %d 秒<color> 才可以使用黄真丹.",nDay,nHour,nMin,nSec);
		end		
		
		tbSay = 
		{
			format("<dec><npc>%s<enter>%s<enter>%s", szMsg_Common, szMsg_ZiJin, szMsg_Huang),
			"结束对话/OnCancel",
		}
	end
	CreateTaskSay(tbSay)
end

BeiDouChuanGong_tbItem = 
{
	[1] = {szName="北斗传功术", tbProp={6, 1, 1672}, nCount = 1},      
	[2] = {szName="七星草", tbProp={6, 1, 1673}, nCount = 1},          
	[3] = {szName="百年七星草", tbProp={6, 1, 1674}, nCount = 1},      
	[4] = {szName="千年七星草", tbProp={6, 1, 1675}, nCount = 1},      
	[5] = {szName="白真丹", tbProp={6, 1, 1676, 1, 0, 0}, nCount = 1},          
	[6] = {szName="血真丹", tbProp={6, 1, 1677, 1, 0, 0}, nCount = 1},          
	[7] = {szName="玄真丹", tbProp={6, 1, 1678, 1, 0, 0}, nCount = 1},
	[8] = {szName="万年五彩花", tbProp={6, 1, 2265, 1, 0, 0}, nCount = 1},
	[9] = {szName="紫金真丹", tbProp={6, 1, 2263, 1, 0, 0}, nCount = 1},
}
BeiDouChuanGong_tbRecipe = 
{
	bai		= {tbItemList = {1,2}, nExp = 5e8, tbAwardItem = 5},
	xue		= {tbItemList = {1,3}, nExp = 10e8, tbAwardItem = 6},
	xuan	= {tbItemList = {1,4}, nExp = 15e8, tbAwardItem = 7},
	zijin	= {tbItemList = {1,8}, nExp = 20e8,tbAwardItem = 9},
}
function BeiDouChuanGong_zuodan(szDanType,nStep)
	local tbRecipe = BeiDouChuanGong_tbRecipe[szDanType]
	local tbAwardItem = BeiDouChuanGong_tbItem[tbRecipe.tbAwardItem]
	if nStep ~= 1 then
		local szTitle = format("各位同意练<color=yellow>%s<color> 吗? 如果现在领取经验值将会有损耗.", tbAwardItem.szName)
		local tbOpt = {}
		tbOpt[1] = format("уng ?!/#BeiDouChuanGong_zuodan([[%s]],1)", szDanType)
		tbOpt[2] = "取消/OnCancel"
		return Say(szTitle,getn(tbOpt),tbOpt);
	end
	
	if GetExp() < 1000000 then
		return Say("抱歉, 现在经验不够1百万, 不能炼丹.", 0)
	end
	
	local tbMaterial = {};
	for i=1, getn(tbRecipe.tbItemList) do
		tinsert(tbMaterial, i, BeiDouChuanGong_tbItem[tbRecipe.tbItemList[i]]);
	end
	BeiDouChuanGong_ComposeClass:Compose(tbMaterial,0,BeiDouChuanGong_zuodan_complished, tbRecipe.nExp, tbAwardItem)
	
end

function BeiDouChuanGong_zuodan_complished(nMaxExp, tbAwardItem)
	local nPlayerCurExp = GetExp();
	local nExp = nMaxExp;
	if nPlayerCurExp < nMaxExp then
		nExp = nPlayerCurExp
	end
	ReduceOwnExp(nExp);
	local nItemIndex = BeiDouChuanGong_lib_AddAward(tbAwardItem, "北斗传功")
	SetSpecItemParam(nItemIndex, 1, mod(nExp, 1e8));	--设置物品能得到的经验
	SetSpecItemParam(nItemIndex, 2, nExp / 1e8);		--设置物品能得到的经验
	SyncItem(nItemIndex);
end

-- 功能：重铸装备
-- 小浪多多 2008.1.14

Include( "\\script\\task\\system\\task_string.lua" );

-- 重铸
Include("\\script\\global\\recoin_goldenequip.lua")
-- 完美安邦首饰
Include("\\script\\task\\equipex\\head.lua");
-- 白金装备
Include("\\script\\global\\platina_upgrade.lua")
--重铸白金装备
--Include("\\script\\global\\recoin_platinaequip.lua")
--Include("\\script\\event\\reclaim_equip\\reclaim_equip.lua") --回收绑定物品
--重铸金乌装备
Include("\\script\\event\\equip_publish\\jinwu\\refine_equip.lua")
Include("\\script\\misc\\itemexchangevalue\\itemexchangevalue.lua") -- 兑换精炼宝箱
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_lingpai.lua")	-- 兑换新装备令牌（紫蟒等）
Include("\\script\\activitysys\\npcdailog.lua")

--重铸紫蟒 - By DinhHQ
Include("\\script\\vng_feature\\trungluyen\\refine_equip.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- 全局经济系统交易开关
		return
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<dec><npc>想不到我忍姓埋名那么久，还是被你找到了，想必你是为打造<color=yellow>白金装备<color>而来的吧。"
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg , "<dec>", "")
	local aryDescribe =
	{
		--"我想打听关于完美安邦首饰的事情/main_talk",		
		--"我想请你铸造白金装备/platina_main",
		"我想请你重铸金乌装备/refine_jinwu",		
		--"我想请你重铸白金装备/recoin_platina_main",
		--Change request 04/06/2011,关闭制造白金装备 - Modified by DinhHQ - 20110605
		--"我想请你帮忙拆分一些黄金装备/split_entry",
		--"我想用碎片合成一些黄金装备/compose_entry",
		--"我想换铁血丹/exchange_tiexuedan",
		--"我想进行完美鸿影首饰的制作/perfect_hongying_main",
		--"我这里有一些多余的打造材料/equipex_recycle_main",
		--"我想把碎片换成相同黄金装备的其他碎片/exchange_entry",
		"我想用装备换取精炼宝箱/exchange_olditem",
		"我想用精炼宝箱换取装备令牌/exchange_lingpai",
		"我想用令牌换取装备/exchange_lingpai2goldequip",
	}	
	
	--重练紫蟒
	--tbDailog:AddOptEntry("我想请人重练紫蟒装备", tbVNG_RefineEquip.ShowDialog, {tbVNG_RefineEquip})	
	
	for i = 1, getn(aryDescribe) do
		local _,_, szOpt, szFun = strfind(aryDescribe[i], "([^/]+)/([^/]+)")
		local fn = getglobal(szFun)
		if fn then
			tbDailog:AddOptEntry(szOpt, fn);	
		end
	end
	
	--弹出对话框
	tbDailog:Show()
	
-- 如果接了完美安邦任务，插入选项
--	local nNextStatus = check_nexttask_status();
--	if (check_nexttask_condition() == 1) then
--		tinsert(aryDescribe, 2, "我想继续打造完美的安邦首饰/nexttask_talk");
--	end
--	tinsert(aryDescribe, 2, "回收永久绑定装备/reclaimBindEquip_main");
	
end

function exchange_tiexuedan()
	if (CalcFreeItemCellCount() < 2) then
		Say("为保障物品的安全，请留出2个以上的空格", 0);
		return
	end
	GiveItemUI("换铁血丹", "请把任意1套门派黄金装备放在下面", "do_exchange_tiexuedan", "onCancel")
end

function do_exchange_tiexuedan(nCount)
	if nCount ~= 1 then
		CreateTaskSay({"放入物品的数量不合要求", "真不好意思，我重新整理/exchange_tiexuedan", "真不好意思，我一会回来./onCancel"});
		return
	end

	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);	--品质
	
	if (nQuality ~= 1 or GetGlodEqIndex(nItemIndex) > 140) then
		CreateTaskSay({"要带给我1套门派黄金装备", "真不好意思，我重新整理/exchange_tiexuedan", "真不好意思，我一会回来./onCancel"});
		return
	end
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"换铁血丹Error",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"清除门派黄金装备失败:\t"..GetItemName(nCurItemIdx)));
	end
	
	
	for i = 1, 20 do
		AddItem(6, 1, 2163, 1, 1, 0);
	end
	Msg2Player("恭喜你得到20颗铁血丹!");
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"换铁血丹 Success",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			format("换 %s 得到铁血丹", GetItemName(nItemIndex))));
end

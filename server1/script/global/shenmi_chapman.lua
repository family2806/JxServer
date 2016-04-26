-- 神秘商人 对话脚本
-- Li_Xin(2004-07-20)

--Include("\\script\\global\\systemconfig.lua") -- 系统配置
IncludeLib("ITEM")
IncludeLib("SETTING")

function writeChapManLog(str)
	WriteLog(date("%H%M%S").."：账号："..GetAccount().."，角色："..GetName().."，"..str);
end;

function writeChapManGoldLog( str, nPaidGold, nPaidSilver, nPaidCoin, nPaidTicket )
	WriteGoldLog( GetAccount().."("..GetName()..") "..str, -nPaidGold, -nPaidSilver, -nPaidCoin, -nPaidTicket );
end;

function get1()
	str=
	{
		"<#>神秘商人：这就是武林中盛传的绝世珍品武器图谱了。武器图谱用来锻造兵器，经秘法淬炼，可达升级之效。你可以用水晶来交换，有兴趣吗？",
		"<#>只是看看/no",
		"<#>陵王枪锻造残篇(枪)/yes1",
		"<#>玄武锤之铸造术(锤)/yes2",
		"<#>龙吟剑锻造图(剑)/yes3",
		"<#>诸葛机括密要(弩)/yes4",
		"<#>柳叶碎风刀·萃取篇(飞刀)/yes5",
		"<#>玄月刀紫荆宝录(刀)/yes6",
		"<#>天机棍图谱(棍)/yes7",
		"<#>暗器总谱·卷一(飞镖)/yes8",
		"<#>鸳鸯刀·开光篇(双刀)/yes9"
	};
	Say(str[1],10,str[2],str[3],str[4],str[5],str[6],str[7],str[8],str[9],str[10],str[11])
end;

function get2()
	str=
	{
		"<#>神秘商人：这便是我亲赴塞外天山和三苗荒原购得的域外奇珍了。域外奇珍用于锻造衣服、帽子，诸多妙用。有兴趣吗？",
		"<#>冰蚕无极丝(提升等级)/buy_silk",
		"<#>南明之精(降低等级)/buy_stone",
		"<#>只是看看/no",
	};
	Say(str[1],3,str[2],str[3],str[4])
end;

function yes1()
	-- 越南版本价格改动：
	Say("神秘商人：你确定要换<color=red>陵王枪锻造残篇<color>吗？陵王枪锻造残篇需要1颗<color=red>紫水晶<color>、<color=red>2颗绿水晶<color>和<color=red>1颗兰水晶<color>交换。",2,"确定/sure1","取消/no")
end;

function sure1()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(406)
	  	writeChapManLog("你得到陵王枪锻造残篇。")
	  	Msg2Player("你得到陵王枪锻造残篇。")
	else
	  	Talk(1,"","神秘商人：陵王枪锻造残篇需要1颗紫水晶、1颗绿水晶和1颗兰水晶交换，你的水晶好像不够呢！")
	end
end;

function yes2()
	Say("神秘商人：你确定要换<color=red>玄武锤之铸造术<color>吗？玄武锤之铸造术需要1颗<color=red>紫水晶<color>、1颗<color=red>绿水晶<color>和1颗<color=red>兰水晶<color>交换。",2,"确定/sure2","取消/no")
end;

function sure2()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(407)
	  	writeChapManLog("你得到玄武锤之铸造术。")
	  	Msg2Player("你得到玄武锤之铸造术。")
	else
	  	Talk(1,"","神秘商人：玄武锤之铸造术需要1颗紫水晶、1颗绿水晶和1颗兰水晶交换，你的水晶好像不够呢！")
	end
end;

function yes3()
	Say("神秘商人：你确定要换<color=red>龙吟剑锻造图<color>吗？龙吟剑锻造图需要1颗<color=red>紫水晶<color>、1颗<color=red>绿水晶<color>和1颗<color=red>兰水晶<color>交换。",2,"确定/sure3","取消/no")
end;

function sure3()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(408)
	  	writeChapManLog("你得到龙吟剑锻造图。")
	  	Msg2Player("你得到龙吟剑锻造图。")
	else
	  	Talk(1,"","神秘商人：龙吟剑锻造图需要1颗紫水晶、1颗绿水晶和1颗兰水晶交换，你的水晶好像不够呢！")
	end
end;

function yes4()
	Say("神秘商人：你确定要换<color=red>诸葛机括密要<color>吗？诸葛机括密要需要1颗<color=red>紫水晶<color>和1颗<color=red>绿水晶<color>和1颗<color=red>兰水晶<color>交换。",2,"确定/sure4","取消/no")
end;

function sure4()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(409)
	  	writeChapManLog("你得到诸葛机括密要。")
	  	Msg2Player("你得到诸葛机括密要。")
	else
	  	Talk(1,"","神秘商人：诸葛机括密要需要1颗紫水晶和1颗绿水晶和1颗蓝水晶交换，你的水晶好像不够呢！")
	end
end;

function yes5()
	Say("神秘商人：你确定要换<color=red>柳叶碎风刀·萃取篇<color>吗？柳叶碎风刀·萃取篇需要1颗<color=red>紫水晶<color>和1颗<color=red>绿水晶<color>和1颗<color=red>兰水晶<color>交换。",2,"确定/sure5","取消/no")
end;

function sure5()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(410)
	  	writeChapManLog("你得到柳叶碎风刀·萃取篇。")
	  	Msg2Player("你得到柳叶碎风刀·萃取篇。")
	else
	  	Talk(1,"","神秘商人：柳叶碎风刀·萃取篇需要1颗紫水晶、1颗绿水晶和1颗兰水晶交换，你的水晶好像不够呢！")
	end
end;

function yes6()
	Say("神秘商人：你确定要换<color=red>玄月刀紫荆宝录<color>吗？玄月刀紫荆宝录需要1颗<color=red>紫水晶<color>和1颗<color=red>绿水晶<color>和1颗<color=red>兰水晶<color>交换。",2,"确定/sure6","取消/no")
end;

function sure6()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(411)
	  	writeChapManLog("你得到玄月刀紫荆宝录。")
	  	Msg2Player("你得到玄月刀紫荆宝录。")
	else
	  	Talk(1,"","神秘商人：玄月刀紫荆宝录需要1颗紫水晶和1颗绿水晶和1颗兰水晶交换，你的水晶好像不够呢！")
	end
end;

function yes7()
	Say("神秘商人：你确定要换<color=red>天机棍图谱<color>吗？天机棍图谱需要1颗<color=red>紫水晶<color>、1颗<color=red>绿水晶<color>和1颗<color=red>兰水晶<color>交换。",2,"确定/sure7","取消/no")
end;

function sure7()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(412)
	  	writeChapManLog("你得到天机棍图谱。")
	  	Msg2Player("你得到天机棍图谱。")
	else
	  	Talk(1,"","神秘商人：天机棍图谱需要1颗紫水晶、1颗绿水晶和1颗兰水晶交换，你的水晶好像不够呢！")
	end
end;

function yes8()
	Say("神秘商人：你确定要换<color=red>暗器总谱·卷一<color>吗？暗器总谱·卷一需要2颗<color=red>紫水晶<color>交换。",2,"确定/sure8","取消/no")
end;

function sure8()
	if ((GetItemCountEx(239)>=2)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(239)
	  	DelItemEx(239)
	  	AddEventItem(413)
	  	writeChapManLog("你得到暗器总谱·卷一。")
	  	Msg2Player("你得到暗器总谱·卷一。")
	else
	  	Talk(1,"","神秘商人：暗器总谱·卷一需要2颗紫水晶交换，你的水晶好像不够呢！")
	end
end;

function yes9()
	Say("神秘商人：你确定要换<color=red>鸳鸯刀·开光篇<color>吗？鸳鸯刀·开光篇需要1颗<color=red>紫水晶<color>交换。",2,"确定/sure9","取消/no")
end;

function sure9()
	if ((GetItemCountEx(239)>=1)) then 
		Talk(1,"","神秘商人：好的，收到水晶了。这是你的图谱，你看看，保证能够提升你的武器等级。")
	  	DelItemEx(239)
	  	AddEventItem(414)
	  	writeChapManLog("你得到鸳鸯刀·开光篇。")
	  	Msg2Player("你得到鸳鸯刀·开光篇。")
	else
	  	Talk(1,"","神秘商人：鸳鸯刀·开光篇需要1颗紫水晶交换，你的水晶好像不够呢！")
	end
end;

function buy_silk()
	str=
	{
		"<#>神秘商人：你确定要购买<color=red>冰蚕无极丝<color>吗？需要1个<color=red>金元宝<color>，或者1张<color=red>银票<color>才能购买哦。",
		"<#>用金元宝购买/sure10",
		"<#>取消/no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure10()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","神秘商人：好的，收到金元宝了。这是你的<color=red>冰蚕无极丝<color>，你看看，保证能够提升你的衣服、帽子等级。")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(415)
	  	UseSilver(1, 2, 2); -- 金元宝兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
	  	SaveNow(); -- 立即存盘
	  	-- writeChapManLog("你得到冰蚕无极丝。")
	  	writeChapManGoldLog("花费1个金元宝，得到冰蚕无极丝", 1, 0, 0, 0);
	  	Msg2Player("你得到冰蚕无极丝。")
	else
	  	Talk(1,"","神秘商人：冰蚕无极丝需要1个金元宝才能购买，你的金元宝好像不够呢！")
	end
end;

function buy_stone()
	str=
	{
		"<#>神秘商人：你确定要购买<color=red>南明之精<color>吗？需要1个<color=red>金元宝<color>，或者1张<color=red>银票<color>才能购买哦。",
		"<#>用金元宝购买/sure11",
		"<#>取消/no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure11()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","神秘商人：好的，收到金元宝了。这是你的<color=red>南明之精<color>，你看看，保证能够降低你的衣服、帽子等级。")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(416)
		UseSilver(1, 2, 2); -- 金元宝兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
		SaveNow(); -- 立即存盘
		
	  	-- writeChapManLog("你得到南明之精。")
	  	writeChapManGoldLog("花费1个金元宝，得到南明之精", 1, 0, 0, 0);
	  	Msg2Player("你得到南明之精。")
	else
	  	Talk(1,"","神秘商人：南明之精需要1个金元宝才能购买，你的金元宝好像不够呢！")
	end
end;


function deal_brokenequip()
	if (ST_CheckLockState() == 1) then
		Say("神秘商人：要处理<color=red><损坏的装备><color>，须先解锁储物箱。你的储物箱处于<color=red>已锁定<color>状态！请先解锁！", 0)
		return
	end
	Say("神秘商人：你有<color=red><损坏的装备><color>？想怎么处理呢？", 2, "我想用修复矿石将它复原/restore_brokenequip", "我不要了，请你将它回收吧/throw_brokenequip")	
end

function check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("神秘商人：一次只能处理一件<color=red><损坏的装备><color>哦", 2, "原来是放错了，我再重放一次/"..szDealFunc, "我再检查看看/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	if (itemgenre ~= 7) then -- 不是损坏的装备
		Say("神秘商人：你放进来的不是<color=red><损坏的装备><color>，请仔细检查一下", 2, "原来是放错了，我再重放一次/"..szDealFunc, "我再检查看看/no")
		return	0	
	end
	
	return nItemIdx
end

------------------------------------
-- ”损坏的装备“丢弃
function throw_brokenequip()
	GiveItemUI( "<损坏的装备>回收界面", "请将想被回收的<损坏的装备>放到放在下面的空格里。", "on_throw_be", "no" );
end

function on_throw_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "throw_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	Say("神秘商人：<color=red><损坏的装备>"..szItemName.."<color>一旦被回收，将会消失，你确定要将它丢弃吗？", 2, "我确定不要了，请回收吧/#throw_be_sure("..nItemIdx..")", "我再考虑考虑/no")
end

function throw_be_sure(nItemIdx)
	local szItemName = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
	Msg2Player("<损坏的装备>"..szItemName.." 已被回收");
	writeChapManLog("[Remove]: RestoreBrokenEquip Remove: "..szItemName);
end
------------------------------------

------------------------------------
-- ”损坏的装备“恢复
function restore_brokenequip()
	GiveItemUI( "<损坏的装备>复原界面", "请将<损坏的装备>放在下面的空格里。消耗修复矿石数：普通装备需1个，紫色装备需2个，黄金装备需5个。特别注意：进行复原之前，请检查背包是否有足够的空间。", "on_restore_be", "no" );	
end

function on_restore_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "restore_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)
	local nCoinCount = CalcEquiproomItemCount(6,1,2163,1)
	local nNeedCoin = 0;

	if (nQuality == 0) then
		nNeedCoin = 1;
	elseif (nQuality == 1) then -- 黄金装备
		nNeedCoin = 5;
	elseif (nQuality == 2) then -- 紫色装备
		nNeedCoin = 2;
	elseif (nQuality == 4) then -- 白金装备
		nNeedCoin = 10;
	end
	
	if (nNeedCoin <= 0) then
		Say("神秘商人：这件是什么装备，我怎不认识？请与客服联系。", 1, "哦/no")
		writeChapManLog("[Error]: RestoreBrokenEquip Fail. ItemQuality:"..nQuality);
		return
	end
	
	if (nCoinCount < nNeedCoin) then
		Say("神秘商人：要复原<color=red><损坏的装备>"..szItemName.."<color>，需要"..nNeedCoin.."个修复矿石。你带的修复矿石不够，请再去取一些吧", 1, "明白，我先去取修复矿石了/no")
		return
	end
	
	if (ConsumeEquiproomItem(nNeedCoin, 6, 1, 2163, -1) == 1) then
		if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
			SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) -- 耐久度恢复为最大耐久度
			Msg2Player("消耗"..nNeedCoin.."个修复矿石，<损坏的装备>"..szItemName.." 复原成功，请检查背包");
			writeChapManGoldLog("[Succeed]: RestoreBrokenEquip Ok: "..szItemName, 0, 0, nNeedCoin, 0)
			-- Fix ch鴆 n╪g s鯽  - Created by AnhHH - 20110704
			KickOutSelf()
		else
			Msg2Player("<损坏的装备>"..szItemName.." 复原失败，请与客服联系");
			Say("神秘商人：<损坏的装备>"..szItemName.." 复原失败，请与客服联系。", 1, "好的/no")
			writeChapManGoldLog("[Error]: RestoreBrokenEquip Fail: "..szItemName, 0, 0, nNeedCoin, 0)
		end
	end
end
------------------------------------

function no()
end

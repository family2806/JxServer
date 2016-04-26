Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composelistclass.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\npc.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\composeex.lua")
--换取行侠令出错 - modified by DinhHQ - 20110921
Include("\\script\\vng_event\\doi_hanh_hiep_lenh\\exchangeitem.lua")

function OnExit()

end;

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	
	tbDailog.szTitleMsg = "<#><npc>这里全是奇珍异宝，您尽管随意选择!"
	
	--Change request 04/06/2011, 制造白金装备- Modified by DinhHQ - 20110605
--	local w,x,y = GetWorldPos()
--	if w == 176 then
--		tbDailog:AddOptEntry("买天石碎片.", Sale, {171}); 
--	end
	--换取行侠令出错- modified by DinhHQ - 20110921
	tbVng_Exchange_HHL:AddDialog(tbDailog)
	tbDailog:AddOptEntry("买回天再造锦囊", WantBuyHuiTian)
	tbDailog:AddOptEntry("买紫蟒令", WantBuyJinpai)
	tbDailog:AddOptEntry("买金乌令", WantBuyJinWuJinpai)
	--tbDailog:AddOptEntry("换取宝石", WantBuyBaoshi)
	
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
--	tbDailog:AddOptEntry("让我看看(旧货商店)", OpenSecondStore); 
--	if tbTriumphDrum:CheckCondition_BuyDrum() == 1 then
--		tbDailog:AddOptEntry("买凯环鼓",  tbTriumphDrum.NpcTalk,{tbTriumphDrum});  	
--	end

	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	--tbDailog:AddOptEntry("离开", OnExit, {}); 	
	tbDailog:Show()
end;

function OpenSecondStore()
	do return end	
	CreateStores();
	AddShop2Stores(178, "旧货店", 1, 100, "", 1);
	OpenStores();

end

function WantBuyHuiTian()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 1
	local szTitle = format("买回天再造锦囊需要有%s行侠令",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"确认", BuyHuiTian}) 
	tinsert(tbOpt, {"顺便路过而已"}) 
	CreateNewSayEx(szTitle, tbOpt);
end

function WantBuyJinpai()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 100
	local szTitle = format("买紫蟒令需要有%s行侠令",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"确认", BuyJinpai}) 
	tinsert(tbOpt, {"顺便路过而已"}) 
	CreateNewSayEx(szTitle, tbOpt);
end

function WantBuyJinWuJinpai()
	local nPrice = 400
	local szTitle = format("买金乌令需要有%s行侠令，你要确定买吗?",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"确认", BuyJinWuJinpai}) 
	tinsert(tbOpt, {"顺便路过而已"}) 
	CreateNewSayEx(szTitle, tbOpt);
end


function BuyHuiTian()
	local tbFormula = 
	{
		szName = "回天再造锦囊",
		--Change request 04/06/2011 - Modified by DinhHQ - 20110605
		tbMaterial = {{szName="行侠令",tbProp={6,1,2566,1,0,0},nCount = 1,},},
		tbProduct = {szName="回天再造锦囊",tbProp={6,1,1781,1,0,0}, tbParam={60},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin1huitian", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end

function BuyJinpai()
	local tbFormula = 
	{
		szName = "紫蟒金牌",
		--Change request 04/06/2011 - Modified by DinhHQ - 20110605
		tbMaterial = {{szName="行侠令",tbProp={6,1,2566,1,0,0},nCount = 100,},},
		tbProduct = {szName="紫蟒令",tbProp={6,1,2350,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.02,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin2zimangjinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end

function BuyJinWuJinpai()
	local tbFormula = 
	{
		szName = "金乌金牌",
		tbMaterial = {{szName="行侠令",tbProp={6,1,2566,1,0,0},nCount = 400,},},
		tbProduct = {szName="金乌金牌",tbProp={6,1,2349,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end


tbEquip2Item = tbActivityCompose:new()

function tbEquip2Item:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	
	local tbRecItem = self:MakeItem(nItemIndex)
	local nExpiredTime = ITEM_GetExpiredTime(nItemIndex)
	local nLeftUsageTime = ITEM_GetLeftUsageTime(nItemIndex)
	if nExpiredTime ~= 0 or nLeftUsageTime ~= 4294967295 then
		return 
	end
	
	for k,v in tbItem do
		if k ~= "szName" and type(v) ~= "table" and v ~= -1 and tbRecItem[k] and v~= tbRecItem[k] then
			return
		elseif  k == "tbProp" and type(v) == "table" then
			local tbProp = tbRecItem[k]
			for k1,v1 in v do
				if type(v1) ~= "table" then
					if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and v1~= tbProp[k1] then
						return 
					end
				else
					if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and ( v1[1] > tbProp[k1] or tbProp[k1] > v1[2] )  then
						return 
					end
				end
			end
		end
	end		
	for key, value in tbItem do 
		if strfind(key, "Limit") and  type(value) == "function" then
			if value(tbItem, nItemIndex) ~= 1 then
				return
			end
		end
	end			
	return 1
end

function WantBuyBaoshi()
	local nPrice = 400
	local szTitle = format("你想换哪种宝石呢",tostring(nPrice))
	local tbOpt = {}
	local tbFormulaList = 
	{
		[1] = 
		{
			tbMaterial = 
			{
				{szName = "青驹装备", tbProp = {0, {905,1134}}, nQuality = 1 },
			},
			tbProduct = {szName="青驹石", tbProp={6, 1, 2710, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[2] = 
		{
			tbMaterial = 
			{
				{szName = "云鹿装备", tbProp = {0, {1135,1364}}, nQuality = 1 },
			},
			tbProduct = {szName="云鹿石", tbProp={6, 1, 2711, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[3] = 
		{
			tbMaterial = 
			{
				{szName = "苍狼装备", tbProp = {0, {1365,1594}}, nQuality = 1 },
			},
			tbProduct = {szName="苍狼石", tbProp={6, 1, 2712, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[4] = 
		{
			tbMaterial = 
			{
				{szName = "玄猿装备", tbProp = {0, {1595,1824}}, nQuality = 1 },
			},
			tbProduct = {szName="玄猿石", tbProp={6, 1, 2713, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},		
		[5] = 
		{
			tbMaterial = 
			{
				{szName = "紫蟒装备", tbProp = {0, {1825,2054}}, nQuality = 1 },
			},
			tbProduct = {szName="紫蟒石", tbProp={6, 1, 3000, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},	
	}
		
	local tbOpt = {}
	local pEventType = EventSys:GetType("AddNpcOption")
	for i=1, getn(tbFormulaList) do
		local p = tbEquip2Item:new(tbFormulaList[i], "Equip2Stone", INVENTORY_ROOM.room_giveitem)
		local szOpt = format("获得 %s", tbFormulaList[i].tbProduct.szName)
		tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
	end
	tinsert(tbOpt, {"取消"})
	CreateNewSayEx(szTitle, tbOpt);
end
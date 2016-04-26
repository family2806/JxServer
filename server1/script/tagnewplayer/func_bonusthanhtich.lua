Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\tagnewplayer\\tbitemBK2.lua");
Include("\\script\\tagnewplayer\\tbitemBK5.lua");
Include("\\script\\tagnewplayer\\SkillID.lua");

function GetBonusThanhTich_main()	
	local nValuePoint	= GetExtPoint(NWP_EXTPOINT);
	local nBit = GetBit(nValuePoint, NWP_E5_IsCode_BIT);
	if (nBit ~= 1) then
		Talk(1, "", "请检查参加条件.");
		return
	end
	local tbOpp = {}
	local str = "<#> 请大侠选择奖励";
	local str2 = "<#> 你不是领过奖励了吗?";
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich1) == 1) then
		tinsert(tbOpp,"我想领取第一次重生的奖励/Bonus1");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich2) == 1) then
		tinsert(tbOpp,"我想领取第一次重生后的125级奖励/Bonus2");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich3) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"我想领取第一次重生后的130级奖励/Bonus3");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich4) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"我想领取第一次重生后的150级奖励/Bonus4");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich5) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"我想领取加入帮会奖励 /Bonus5");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich6) == 1 and IsNewAccount() == 1 ) then
		tinsert(tbOpp,"我想领取90技能达到20级的奖励/Bonus6");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich7) == 1 and IsNewAccount() ==1 ) then
		tinsert(tbOpp,"我想领取120技能达到20级的奖励/Bonus7");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich8) == 1 and IsNewAccount() == 1) then
			tinsert(tbOpp,"我想领取达到500名望值奖励/Bonus8");
	end
	tinsert(tbOpp, "<#>退出/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str2, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function Bonus1()	
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "给第一次重生的人的奖励");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "你未加入门派，不能领奖!");
			return
		end
		
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
		end
		ShowHKMP() -- 秀出HKMP玩家可以获得
end
function Bonus2()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "奖励只给重生一次的人");
			return
		end
		if (GetLevel() < 125) then
			Talk(1, "", "阁下依然未达125级条件!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
		end
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich2, 1)
		-- add 5 vo lam mat tich
		for i=1,5 do
				local itemindx = AddItem(6,1,26,1,0,0)
				nExpiredTime = OneDayTime * 7
				ITEM_SetExpiredTime(itemindx, nExpiredTime);
				SetItemBindState(itemindx, -2);
				SyncItem(itemindx)
				local strItem = GetItemName(itemindx)
				Msg2Player("你获得"..strItem)
				WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItem)
		end
		--add 5 tay tuy kinh
		for i=1,5 do
				local itemindx = AddItem(6,1,22,1,0,0)
				nExpiredTime = OneDayTime * 7
				ITEM_SetExpiredTime(itemindx, nExpiredTime);
				SetItemBindState(itemindx, -2);
				SyncItem(itemindx)
				local strItem = GetItemName(itemindx)
				Msg2Player("你获得"..strItem)
				WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItem)
		end
		--add item phung nguyet qua dung
		local itemindx = AddItem(6,1,127,1,0,0)
		nExpiredTime = OneDayTime * 7
		ITEM_SetExpiredTime(itemindx, nExpiredTime);
		SetItemBindState(itemindx, -2);
		SyncItem(itemindx)
		local strItem = GetItemName(itemindx)
		Msg2Player("你获得"..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItem)
		-- add item 龚月芙蓉
		local itemindx = AddItem(6,1,128,1,0,0)
		nExpiredTime = OneDayTime * 7
		ITEM_SetExpiredTime(itemindx, nExpiredTime);
		SetItemBindState(itemindx, -2);
		SyncItem(itemindx)
		local strItem = GetItemName(itemindx)
		Msg2Player("你获得"..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItem)
end

function Bonus3()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "奖励只给重生一次的人");
			return
		end
		if (GetLevel() < 130) then
			Talk(1, "", "你未达到130级条件!");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "你未加入门派，不能领奖!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
		end
		ShowBK2()-- 秀出BK玩家可以获得
end
function Bonus4()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "奖励只给重生一次的人");
			return
		end
		if (GetLevel() < 150) then
			Talk(1, "", "你还未达到50级条件!");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "你未加入门派，不能领奖!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
		end
		ShowBK5()
end
function ShowBK2()
		local strFaction = GetFaction()
		if (tbItemHK[strFaction] == nil) then
			Talk(1, "", "你还未加入门派!");
			return
		end
		local tbOpp = {}
		local str = "<#> 在该奖励中，我允许你选择其中一个白金装备，这些装备已被强化+2";
		for i=1, getn(tbItemBK2[strFaction]) do
			local strItemName = tbItemBK2[strFaction][i].szName
			local nID =  tbItemBK2[strFaction][i].nID
			tinsert(tbOpp,"我想领取".. strItemName.." /#GetBonusBK2(" .. nID .. ")");
		end
		tinsert(tbOpp, "<#>退出/OnCancel")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
end
function ShowBK5()
		local strFaction = GetFaction()
		if (tbItemHK[strFaction] == nil) then
			Talk(1, "", "你还未加入门派!");
			return
		end
		local tbOpp = {}
		local str = "<#> 在该奖励中，我允许你选择其中一个白金装备，这些装备已被强化+5";
		for i=1, getn(tbItemBK5[strFaction]) do
			local strItemName = tbItemBK5[strFaction][i].szName
			local nID =  tbItemBK5[strFaction][i].nID
			tinsert(tbOpp,"我想领取".. strItemName.." /#GetBonusBK5(" .. nID .. ")");
		end
		tinsert(tbOpp, "<#>退出/OnCancel")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
end
function GetBonusBK5(nID)
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich4, 1)
		--nhan trang bi BK
		local nItemIdx = AddPlatinaItem(0,nID);
		for i = 1,5 do
			UpgradePlatinaItem(nItemIdx)
		end
		SetItemBindState(nItemIdx, -2);
		SyncItem(nItemIdx)
		local strItemName = GetItemName(nItemIdx)
		Msg2Player("你获得"..strItemName)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."BK5成绩奖励获得"..strItemName)
end

function GetBonusBK2(nID)
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich3, 1)
		--nhan trang bi BK
		local nItemIdx = AddPlatinaItem(0,nID);
		for i = 1,2 do
			UpgradePlatinaItem(nItemIdx)
		end
		SetItemBindState(nItemIdx, -2);
		SyncItem(nItemIdx)
		local strItemName = GetItemName(nItemIdx)
		Msg2Player("你获得"..strItemName)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."BK2成绩奖励获得"..strItemName)
end
function ShowHKMP()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "你还未加入门派!");
		return
	end
	local tbOpp = {}
	local str = "<#> 在该奖励中，我允许你选择其中一个白金装备，这些装备已被强化";
	for i=1, getn(tbItemHK[strFaction]) do
		local strItemName = tbItemHK[strFaction][i].szName
		local nID =  tbItemHK[strFaction][i].nID
		tinsert(tbOpp,"我想领取".. strItemName.." /#GetBonusHK(" .. nID .. ")");
	end
	tinsert(tbOpp, "<#>退出/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function GetBonusHK(nID)
	SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich1, 1)
	--nhan trang bi HK
	nIndex = AddGoldItem(0, nID)
	SetItemBindState(nIndex, -2);
	SyncItem(nIndex)
	local strItemName = GetItemName(nIndex)
	Msg2Player("你获得"..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."HKMP成绩奖励获得"..strItemName)
	--thang cap 90 sau khi 產 trung sinh
	if (GetLevel() < 90) then
		LevelUp(90)
		Msg2Player("你获得第一次重生升级为90级的奖励")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得第一次重生升级为90级的奖励")
	end
	
	-- add 5 vo lam mat tich
	for i=1,5 do
			local itemindx = AddItem(6,1,26,1,0,0)
			nExpiredTime = OneDayTime * 7
			ITEM_SetExpiredTime(itemindx, nExpiredTime);
			SetItemBindState(itemindx, -2);
			SyncItem(itemindx)
			local strItemName = GetItemName(itemindx)
			Msg2Player("你获得"..strItemName)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItemName)
	end
	--add 5 tay tuy kinh
	for i=1,5 do
			local itemindx = AddItem(6,1,22,1,0,0)
			nExpiredTime = OneDayTime * 7
			ITEM_SetExpiredTime(itemindx, nExpiredTime);
			SetItemBindState(itemindx, -2);
			SyncItem(itemindx)
			local strItemName = GetItemName(itemindx)
			Msg2Player("你获得"..strItemName)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItemName)
	end
	--Add mat na quy anh
	local itemindx = AddItem(0,11,455,1,0,0)
	nExpiredTime = OneDayTime * 7
	ITEM_SetExpiredTime(itemindx, nExpiredTime);
	SetItemBindState(itemindx, -2);
	SyncItem(itemindx)
	local strItemName = GetItemName(itemindx)
	Msg2Player("你获得"..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItemName)
	-- add ngua bon tieu cap 10
	local numindx = AddItem(0,10,6,10,0,0)
	SetItemBindState(numindx, -2);
	SyncItem(numindx)
	local strItemName = GetItemName(numindx)
	Msg2Player("你获得"..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItemName)
end

function Bonus5()
		local szTongName , nTongID = GetTongName()
		if (nTongID < 1) then
			Talk(1, "", "你未加入帮会!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
		end
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich5, 1)
		--ADD hoi thanh phu nho
			local ndx = AddItem(6,1,1082,1,0,0)
			nExpiredTime = OneDayTime * 14
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("你获得"..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItem)
end

function Bonus8()
		if (GetRepute() < 500) then
			Talk(1, "", "你未达500名望值");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
		end
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich8, 1)
		--ADD 白真丹
			local ndx = AddItem(6,1,1676,1,0,0)
			SetSpecItemParam(ndx, 1, 500000000)
			nExpiredTime = OneDayTime * 14
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("你获得"..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItem)

end

function Bonus6()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "你还未加入门派!");
		return
	end
	if (CheckIsSkill90() ~= 1) then
		Talk(1, "", "请大侠练习90技能到20级后来领奖 !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "装备不足60空位.");
		return
	end
	SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich6, 1)
	-- add item nhat ky cang khon phu
			local ndx = AddItem(6,1,2126,1,0,0)
			nExpiredTime = OneDayTime * 14
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("你获得"..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得"..strItem)
end


function Bonus7()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "你还未加入门派!");
		return
	end
	if (CheckIsSkill120() ~= 1) then
		Talk(1, "", "请大侠练习120技能到20级后来领奖!");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "装备不足60空位.");
		return
	end
	SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich7, 1)
	--M?rng chua do thu 1
	OpenStoreBox(1)
	Msg2Player("你获得打开第一个储物箱")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."成绩奖励获得打开第一个储物箱")
end

function CheckIsSkill90()
	local strFaction = GetFaction()
	for i=1, getn(tbSkill90[strFaction]) do
		local nID =  tbSkill90[strFaction][i].nID
		if (GetCurrentMagicLevel(nID, 0) >= 20) then
			return 1
		end
	end
	return 0
end
function CheckIsSkill120()
	local strFaction = GetFaction()
	for i=1, getn(tbSkill120[strFaction]) do
		local nID =  tbSkill120[strFaction][i].nID
		if (GetCurrentMagicLevel(nID, 0) >= 20) then
			return 1
		end
	end
	return 0
end

function OnCancel()
end
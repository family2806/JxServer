Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\tbitemHK.lua");
Include("\\script\\tagnewplayer\\tbitemBK2.lua");
Include("\\script\\tagnewplayer\\tbitemBK5.lua");
Include("\\script\\tagnewplayer\\SkillID.lua");

function GetBonusThanhTich_main()	
	local nValuePoint	= GetExtPoint(NWP_EXTPOINT);
	local nBit = GetBit(nValuePoint, NWP_E5_IsCode_BIT);
	if (nBit ~= 1) then
		Talk(1, "", "����μ�����.");
		return
	end
	local tbOpp = {}
	local str = "<#> �����ѡ����";
	local str2 = "<#> �㲻�������������?";
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich1) == 1) then
		tinsert(tbOpp,"������ȡ��һ�������Ľ���/Bonus1");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich2) == 1) then
		tinsert(tbOpp,"������ȡ��һ���������125������/Bonus2");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich3) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"������ȡ��һ���������130������/Bonus3");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich4) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"������ȡ��һ���������150������/Bonus4");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich5) == 1 and IsNewAccount() == 1) then
		tinsert(tbOpp,"������ȡ�����ά�� /Bonus5");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich6) == 1 and IsNewAccount() == 1 ) then
		tinsert(tbOpp,"������ȡ90���ܴﵽ20���Ľ���/Bonus6");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich7) == 1 and IsNewAccount() ==1 ) then
		tinsert(tbOpp,"������ȡ120���ܴﵽ20���Ľ���/Bonus7");
	end
	if (CheckGetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich8) == 1 and IsNewAccount() == 1) then
			tinsert(tbOpp,"������ȡ�ﵽ500����ֵ����/Bonus8");
	end
	tinsert(tbOpp, "<#>�˳�/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str2, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function Bonus1()	
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "����һ���������˵Ľ���");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "��δ�������ɣ������콱!");
			return
		end
		
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
			return
		end
		ShowHKMP() -- ���HKMP��ҿ��Ի��
end
function Bonus2()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "����ֻ������һ�ε���");
			return
		end
		if (GetLevel() < 125) then
			Talk(1, "", "������Ȼδ��125������!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
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
				Msg2Player("����"..strItem)
				WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItem)
		end
		--add 5 tay tuy kinh
		for i=1,5 do
				local itemindx = AddItem(6,1,22,1,0,0)
				nExpiredTime = OneDayTime * 7
				ITEM_SetExpiredTime(itemindx, nExpiredTime);
				SetItemBindState(itemindx, -2);
				SyncItem(itemindx)
				local strItem = GetItemName(itemindx)
				Msg2Player("����"..strItem)
				WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItem)
		end
		--add item phung nguyet qua dung
		local itemindx = AddItem(6,1,127,1,0,0)
		nExpiredTime = OneDayTime * 7
		ITEM_SetExpiredTime(itemindx, nExpiredTime);
		SetItemBindState(itemindx, -2);
		SyncItem(itemindx)
		local strItem = GetItemName(itemindx)
		Msg2Player("����"..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItem)
		-- add item ����ܽ��
		local itemindx = AddItem(6,1,128,1,0,0)
		nExpiredTime = OneDayTime * 7
		ITEM_SetExpiredTime(itemindx, nExpiredTime);
		SetItemBindState(itemindx, -2);
		SyncItem(itemindx)
		local strItem = GetItemName(itemindx)
		Msg2Player("����"..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItem)
end

function Bonus3()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "����ֻ������һ�ε���");
			return
		end
		if (GetLevel() < 130) then
			Talk(1, "", "��δ�ﵽ130������!");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "��δ�������ɣ������콱!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
			return
		end
		ShowBK2()-- ���BK��ҿ��Ի��
end
function Bonus4()
		if (ST_GetTransLifeCount() ~= 1) then
			Talk(1, "", "����ֻ������һ�ε���");
			return
		end
		if (GetLevel() < 150) then
			Talk(1, "", "�㻹δ�ﵽ50������!");
			return
		end
		if (GetFaction() == "") then
			Talk(1, "", "��δ�������ɣ������콱!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
			return
		end
		ShowBK5()
end
function ShowBK2()
		local strFaction = GetFaction()
		if (tbItemHK[strFaction] == nil) then
			Talk(1, "", "�㻹δ��������!");
			return
		end
		local tbOpp = {}
		local str = "<#> �ڸý����У���������ѡ������һ���׽�װ������Щװ���ѱ�ǿ��+2";
		for i=1, getn(tbItemBK2[strFaction]) do
			local strItemName = tbItemBK2[strFaction][i].szName
			local nID =  tbItemBK2[strFaction][i].nID
			tinsert(tbOpp,"������ȡ".. strItemName.." /#GetBonusBK2(" .. nID .. ")");
		end
		tinsert(tbOpp, "<#>�˳�/OnCancel")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
end
function ShowBK5()
		local strFaction = GetFaction()
		if (tbItemHK[strFaction] == nil) then
			Talk(1, "", "�㻹δ��������!");
			return
		end
		local tbOpp = {}
		local str = "<#> �ڸý����У���������ѡ������һ���׽�װ������Щװ���ѱ�ǿ��+5";
		for i=1, getn(tbItemBK5[strFaction]) do
			local strItemName = tbItemBK5[strFaction][i].szName
			local nID =  tbItemBK5[strFaction][i].nID
			tinsert(tbOpp,"������ȡ".. strItemName.." /#GetBonusBK5(" .. nID .. ")");
		end
		tinsert(tbOpp, "<#>�˳�/OnCancel")
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
		Msg2Player("����"..strItemName)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."BK5�ɼ��������"..strItemName)
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
		Msg2Player("����"..strItemName)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."BK2�ɼ��������"..strItemName)
end
function ShowHKMP()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "�㻹δ��������!");
		return
	end
	local tbOpp = {}
	local str = "<#> �ڸý����У���������ѡ������һ���׽�װ������Щװ���ѱ�ǿ��";
	for i=1, getn(tbItemHK[strFaction]) do
		local strItemName = tbItemHK[strFaction][i].szName
		local nID =  tbItemHK[strFaction][i].nID
		tinsert(tbOpp,"������ȡ".. strItemName.." /#GetBonusHK(" .. nID .. ")");
	end
	tinsert(tbOpp, "<#>�˳�/OnCancel")
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
	Msg2Player("����"..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."HKMP�ɼ��������"..strItemName)
	--thang cap 90 sau khi �a trung sinh
	if (GetLevel() < 90) then
		LevelUp(90)
		Msg2Player("���õ�һ����������Ϊ90���Ľ���")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ�������õ�һ����������Ϊ90���Ľ���")
	end
	
	-- add 5 vo lam mat tich
	for i=1,5 do
			local itemindx = AddItem(6,1,26,1,0,0)
			nExpiredTime = OneDayTime * 7
			ITEM_SetExpiredTime(itemindx, nExpiredTime);
			SetItemBindState(itemindx, -2);
			SyncItem(itemindx)
			local strItemName = GetItemName(itemindx)
			Msg2Player("����"..strItemName)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItemName)
	end
	--add 5 tay tuy kinh
	for i=1,5 do
			local itemindx = AddItem(6,1,22,1,0,0)
			nExpiredTime = OneDayTime * 7
			ITEM_SetExpiredTime(itemindx, nExpiredTime);
			SetItemBindState(itemindx, -2);
			SyncItem(itemindx)
			local strItemName = GetItemName(itemindx)
			Msg2Player("����"..strItemName)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItemName)
	end
	--Add mat na quy anh
	local itemindx = AddItem(0,11,455,1,0,0)
	nExpiredTime = OneDayTime * 7
	ITEM_SetExpiredTime(itemindx, nExpiredTime);
	SetItemBindState(itemindx, -2);
	SyncItem(itemindx)
	local strItemName = GetItemName(itemindx)
	Msg2Player("����"..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItemName)
	-- add ngua bon tieu cap 10
	local numindx = AddItem(0,10,6,10,0,0)
	SetItemBindState(numindx, -2);
	SyncItem(numindx)
	local strItemName = GetItemName(numindx)
	Msg2Player("����"..strItemName)
	WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItemName)
end

function Bonus5()
		local szTongName , nTongID = GetTongName()
		if (nTongID < 1) then
			Talk(1, "", "��δ������!");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
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
			Msg2Player("����"..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItem)
end

function Bonus8()
		if (GetRepute() < 500) then
			Talk(1, "", "��δ��500����ֵ");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
			return
		end
		SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich8, 1)
		--ADD ���浤
			local ndx = AddItem(6,1,1676,1,0,0)
			SetSpecItemParam(ndx, 1, 500000000)
			nExpiredTime = OneDayTime * 14
			ITEM_SetExpiredTime(ndx, nExpiredTime);
			SetItemBindState(ndx, -2)
			SyncItem(ndx);
			local strItem = GetItemName(ndx)
			Msg2Player("����"..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItem)

end

function Bonus6()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "�㻹δ��������!");
		return
	end
	if (CheckIsSkill90() ~= 1) then
		Talk(1, "", "�������ϰ90���ܵ�20�������콱 !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
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
			Msg2Player("����"..strItem)
			WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ��������"..strItem)
end


function Bonus7()
	local strFaction = GetFaction()
	if (tbItemHK[strFaction] == nil) then
		Talk(1, "", "�㻹δ��������!");
		return
	end
	if (CheckIsSkill120() ~= 1) then
		Talk(1, "", "�������ϰ120���ܵ�20�������콱!");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return
	end
	SetBit2GetItem(NWP_EXTPOINT_CheckGetItem, NWP_E6_BIT_GetItemBonusThanhTich7, 1)
	--M?r��ng chua do thu 1
	OpenStoreBox(1)
	Msg2Player("���ô򿪵�һ��������")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�ɼ�������ô򿪵�һ��������")
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
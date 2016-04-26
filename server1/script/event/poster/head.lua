Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\random\\task_head.lua");

ExtPointPoster5 = 5
ExtPointPoster6 = 6
Poster_E5_BIT_Code = 10											--acc co code hay ko
--Poster_E5_BIT_Bonus_Exp = 11								-- check nhan phan thuong exp hay chua
--Poster_E5_BIT_Bonus_TTL = 12								--check nhan tien thao lo hay chua
--Poster_E5_BIT_Bonus_MocNhan = 13						-- check nhan moc nhan hay	 chua
--Poster_E5_BIT_Bonus_LBNVBH = 14							-- chech da nhan lenh bai nhiem vu bang hoi hay chua	
--Poster_E5_BIT_Bonus_LongHuyetHoan = 15				-- check da nhan long huyet hoan hay chua
--Poster_E6_BIT_Bonus_ThienLongLenh = 10				-- check da nhan thien long lenh hay chua
--Poster_E6_BIT_Bonus_HaiLongChau = 11					-- check da nhan hai long chau hay chua
--Poster_E6_BIT_Bonus_MNNS = 12							-- check da nhan mat na nguyen soai hay chua
--Poster_E6_BIT_Bonus_HCLK = 13								-- check da nha Huyet chien lenh ky hay chua
OneDayTime = 60 * 24
tbItem =
{
	{szName = "经验值", nExp_tl = 200000000},
	{szName = "仙草露", tbProp={6,1,71,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 10},
	{szName = "木人", tbProp={6,1,1085,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 30},
	{szName = "帮会任务令牌", tbProp={6,2,1020,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 60},
	{szName = "龙血丸", tbProp={6,1,2117,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 6},
	{szName = "天龙令", tbProp={6,1,2256,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 6},
	{szName = "海龙珠", tbProp={6,1,2115,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 6},
	{szName = "元帅面具", tbProp={0,11,447,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 3},
	{szName = "血战令旗", tbProp={6,1,2212,1,0,0}, nExpiredTime = 43200, nBindState = -2, nCount = 3},
}

function ShowAwardDialog()
	local tbOpt = {}
	for i = 1, getn(tbItem) do
		local nExtp;
		local nBit;
		if (i <= 5 ) then
			 nBit = i + 10 
			 nExtp = ExtPointPoster5
		else
			nBit = i + 4
			nExtp = ExtPointPoster6
		end
		
		if (CheckExtPointBit(nBit, nExtp) == 0) then
			if (tbItem[i].szName ~= nil) then
				tinsert(tbOpt, "我想领奖" .. tbItem[i].szName .. "/#GetAward(" .. nBit .. "," .. nExtp .. "," .. i .. ")")
			end
		end
	end
	tinsert(tbOpt, "<#>离开/OnCancel")
	if (getn(tbOpt) >= 2) then
		Say("大侠请选择奖品.", getn(tbOpt), tbOpt)
	else
		Talk(1, "",  "大侠已经领够奖品怎么还要领啊?")
	end
end

function CheckExtPointBit(nBit, nExtp)
	local nValuePoint	= GetExtPoint(nExtp)
	local nBit = GetBit(nValuePoint, nBit)
	if (nBit < 1) then
		return 0
	end
	if (nBit > 0) then
		return 1
	end
end

function SetBit2GetItem(numExtpoint, numBit, numValue)
	local nValuePoint	= GetExtPoint(numExtpoint);
	local nBit = SetBit(nValuePoint, numBit, numValue);
	local nBitTemp = nBit - nValuePoint;
	AddExtPoint(numExtpoint, nBitTemp);
end

function GetAward(nBit, nExtp, nNumb)
	if (CheckCondition() == 1) then
		if (tbItem[nNumb] ~= nil) then
			SetBit2GetItem(nExtp, nBit, 1)
			
			if (nNumb == 4) then	-- add LBBH
				for i = 1, 60 do
					 AddLenhBaiBH()
				end
			elseif (nNumb ==3) then	-- add Moc Nhan
				for i = 1, 30 do
					AddMocNhan()
				end
			else
				tbAwardTemplet:GiveAwardByList(tbItem[nNumb], "Nhan thuong hoat dong Poster");
			end
		end
	end
end

function CheckCondition()
	if (CheckExtPointBit(Poster_E5_BIT_Code, ExtPointPoster5) == 0) then 
		Talk(1, "", "大侠再看一下领奖条件吧!")
		return 0
	end
	
	if (ST_GetTransLifeCount() < 1) then
		if (GetLevel() < 130) then 
			Talk(1, "", "130级以上的人物才可以领奖!")
			return 0
		end
	end
	
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "大侠的背包空间不够（至少60格）!.");
		return 0
	end
	return 1
end

function GetDialogPoster()
	if (CheckCondition() == 1) then
		ShowAwardDialog()
	end
end

function ResetExtPointBit(nExtPoint, nBit)
	local nValuePoint = GetExtPoint(nExtPoint);
	local nBit = SetBit(nValuePoint, nBit, 0);
	local nBitTemp = nValuePoint - nBit;
	PayExtPoint(nExtPoint,nBitTemp)
	Msg2Player(GetBit(GetExtPoint(nExtPoint),nBit))
end

function AddLenhBaiBH()
	local nRandomTaskID = createRandomTask();
	nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	nExpiredTime = OneDayTime * 30
	ITEM_SetExpiredTime(nRandomItemIndex, nExpiredTime);
	SetItemBindState(nRandomItemIndex, -2);
	SyncItem(nRandomItemIndex);
	local strItem = GetItemName(nRandomItemIndex)
	Msg2Player("你得到"..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".." Nhan thuong hoat dong Poster "..GetAccount().."\t"..GetName().."\t".."领奖 Poster 得到 "..strItem)
end

function AddMocNhan()
		local ndx = AddItem(6,1,1085,1,0,0)
		SetSpecItemParam(ndx, 2, 9)
		nExpiredTime = OneDayTime * 30
		ITEM_SetExpiredTime(ndx, nExpiredTime);
		SetItemBindState(ndx, -2);
		SyncItem(ndx)
		local strItem = GetItemName(ndx)
		Msg2Player("你得到"..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." Nhan thuong hoat dong Poster "..GetAccount().."\t"..GetName().."\t".."领奖Poster 得到 "..strItem)
end

function OnCancel()

end

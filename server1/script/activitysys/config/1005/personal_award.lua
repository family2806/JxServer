IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
tbPVLB_Award = {}
tbPVLB_Award.Award = {
	--未重生
	[0] = {		
		[1] = { --lv 1-9
			tbItem = {
				{szName="仙草露",tbProp={6,1,71,1,0,0},nCount=5, nBindState = -2},
				{szName="银两",nJxb=100000,nCount=1},
				{szName="神行符",tbProp={6,1,1266,1,0,0},nCount=1,nExpiredTime=43200, nBindState = -2},
			},
			tbBitTask = tbBITTASK_AWARD_0_1,
			strLog = "PhanThuongTS0_LVL1_9",
		},
		[2] = {
			nLevel = 150,
			tbItem = {
				{szName = "苍狼之宝", tbProp={6,1,30146,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=10080},
				{szName="照妖玉狮子",tbProp={0,10,5,5,0,0},nCount=1, nBindState = -2},
				{szName="120级技能秘籍",tbProp={6,1,1125,1,0,0},nCount=1, nBindState = -2},
				{szName="宋金招兵令",tbProp={6,1,30083,1,0,0},nCount=3, nBindState = -2, nExpiredTime = 10080},
				{szName = "杀手锏(90级)", tbProp = {6, 1, 400, 90,0,0}, nCount = 2, nExpiredTime = 10080, nBindState = -2, nExpiredTime = 10080},
				{szName="银两",nJxb=500000,nCount=1},
			},
			tbBitTask = tbBITTASK_AWARD_0_2,
			strLog = "PhanThuongTS0_LVL10_149",
		},		
	},
	--ts 1
	[1] = {
		[1] = {
			nLevel = 50,
			tbBitTask = tbBITTASK_AWARD_1_1,
			strLog = "PhanThuongTS1_LVL10_49",
		},
		[2] = {			
			tbItem = {
				{szName="聚力凝神散",tbProp={6,1,30142,1,0,0},nCount=1, nExpiredTime = 86400},
			},
			tbBitTask = tbBITTASK_AWARD_1_2,
			strLog = "PhanThuongTS1_LVL150_159",
		},		
	},
	--ts 2
	[2] = {
		[1] = {
			nLevel = 50,
			tbBitTask = tbBITTASK_AWARD_2_1,
			strLog = "PhanThuongTS2_LVL10_49",
		},
		[2] = {
			tbItem = {				
				{
					[1]={szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=8,nRate=12.5, nBindState = -2},
					[2]={szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=8,nRate=12.5, nBindState = -2},
					[3]={szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[4]={szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[5]={szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[6]={szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[7]={szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=8,nRate=15, nBindState = -2},
					szName = "紫莽偶然图谱(除武器和戒指)", nCount = 1,
				},
				{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1, nBindState = -2},
			},
			tbBitTask = tbBITTASK_AWARD_2_2,
			strLog = "PhanThuongTS2_LVL151_159",
		},	
		[3] = {
			tbItem = {
				{
					[1]={szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=8,nRate=12.5, nBindState = -2},
					[2]={szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=8,nRate=12.5, nBindState = -2},
					[3]={szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[4]={szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[5]={szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[6]={szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=8,nRate=15, nBindState = -2},
					[7]={szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=8,nRate=15, nBindState = -2},
					szName = "紫莽偶然图谱(除武器和戒指)", nCount = 1,
				},
				{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1, nBindState = -2},				
			},
			tbBitTask = tbBITTASK_AWARD_2_3,
			strLog = "PhanThuongTS2_LVL171",
		},
		[4] = {
			tbItem = {
				{szName = "经验值", nExp=4e9},			
			},
			tbBitTask = tbBITTASK_AWARD_2_4,
			strLog = "PhanThuongTS2_LVL175",
		},
		[5] = {
			tbItem = {
				{szName = "经验值", nExp=3e9},			
			},
			tbBitTask = tbBITTASK_AWARD_2_5,
			strLog = "PhanThuongTS2_LVL176",
		},
		[6] = {
			tbItem = {
				{szName = "经验值", nExp=2e9},			
			},
			tbBitTask = tbBITTASK_AWARD_2_6,
			strLog = "PhanThuongTS2_LVL177",
		},
		[7] = {
			tbItem = {
				{szName = "经验值", nExp=1e9},			
			},
			tbBitTask = tbBITTASK_AWARD_2_7,
			strLog = "PhanThuongTS2_LVL178",
		},
	},
	--ts 3
	[3] = {
		[1] = {
			tbItem = {
				{szName = "紫莽之宝", tbProp={6,1,30147,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=10080},
			},
			tbBitTask = tbBITTASK_AWARD_3_1,
			strLog = "PhanThuongTS3_LVL150",
		},		
	},
}
tbPVLB_Award.tbTransLog = {strFolder = "201109_EventPhongVanLenhBai/", nPromID = 11, nResult = 1}

function tbPVLB_Award:GetAwardIDx()
	local nTransLife = ST_GetTransLifeCount()
	--local nAwardIdx = 0
	if nTransLife < 0 or nTransLife >= 4 then
		return nil, nil
	end
	local nLevel = GetLevel()
	if nTransLife == 0 then
		if nLevel >= 1 and nLevel <= 9 then
			return nTransLife, 1;
		end
		if nLevel >= 10 and nLevel <= 149 then
			return nTransLife, 2;
		end		
	elseif nTransLife == 1 then
		if nLevel >= 10 and nLevel <= 49 then
			return nTransLife, 1;
		end
		if nLevel >= 150 and nLevel <= 159 then
			return nTransLife, 2;
		end
	elseif nTransLife == 2 then
		if nLevel >= 10 and nLevel <= 49 then
			return nTransLife, 1;
		end
		if nLevel >= 151 and nLevel <= 159 then
			return nTransLife, 2;
		end
		if nLevel == 171 then
			return nTransLife, 3;
		end
		if nLevel == 175 then
			return nTransLife, 4;
		end
		if nLevel == 176 then
			return nTransLife, 5;
		end
		if nLevel == 177 then
			return nTransLife, 6;
		end
		if nLevel == 178 then
			return nTransLife, 7;
		end
	elseif nTransLife == 3 then
		if nLevel == 150 then
			return nTransLife, 1;
		end	
	end
	return nil, nil;
end

function tbPVLB_Award:MainDialog()
	local strTittle = "目前奖励如下:\n\n"
	local tbOpt = {}
	local n1, n2 = self:GetAwardIDx()
--	print(n1.." "..n2)
	if not n1 or not n2 then
		strTittle = strTittle.."\t\t\t\t<color=red>没有任何奖励<color>\n"
		tinsert(tbOpt, {"сng"})
		CreateNewSayEx(strTittle, tbOpt)
		return
	end
	local tbTempAward = self.Award[n1][n2]
	if not tbTempAward then
		strTittle = strTittle.."\t\t\t\t<color=red>没有任何奖励<color>\n"
		tinsert(tbOpt, {"сng"})
		CreateNewSayEx(strTittle, tbOpt)
		return
	end
	if tbTempAward.nLevel then
		strTittle = strTittle.."\t\t\t\t<color=yellow>升级"..tbTempAward.nLevel.."<color>\n"
	end
	if tbTempAward.tbItem then
		local tb = tbTempAward.tbItem
		for i = 1, getn(tb) do
			if tb[i].szName == "银两" then
				strTittle = strTittle.."\t\t\t\t<color=yellow>"..tb[i].nJxb.." "..tb[i].szName.."<color>\n"
			elseif tb[i].szName == "经验值" then
				strTittle = strTittle.."\t\t\t\t<color=yellow>"..tb[i].nExp.." "..tb[i].szName.."<color>\n"
			else
				strTittle = strTittle.."\t\t\t\t<color=yellow>"..tb[i].nCount.." "..tb[i].szName.."<color>\n"
			end
		end
	end
	if tbVNG_BitTask_Lib:getBitTask(tbTempAward.tbBitTask) == 0 then
		tinsert(tbOpt, {"马上领取", tbPVLB_Award.GetAward, {tbPVLB_Award, tbTempAward}})
	else
		strTittle = strTittle.."\n<color=red>已领奖<color>"
	end
	tinsert(tbOpt, {"сng"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbPVLB_Award:GetAward(tbAward)
	if PlayerFunLib:VnCheckInCity () ~= 1 then		
		return
	end
	if tbAward.tbItem and CalcFreeItemCellCount() < 59 then
		Talk(1, "", "请清理装备空位领奖.")
		return
	end		
	tbVNG_BitTask_Lib:setBitTask(tbAward.tbBitTask, 1)
	if tbAward.nLevel and tbAward.nLevel > GetLevel() then
		ST_LevelUp(tbAward.nLevel - GetLevel())
		tbLog:PlayerActionLog("风云令牌", tbAward.strLog, "升级: "..GetLevel())
	end	
	if tbAward.tbItem then
		tbAwardTemplet:Give(tbAward.tbItem, 1, {"风云令牌", tbAward.strLog })
		if tbAward.strLog == "PhanThuongTS1_LVL150_159" then
			tbVngTransLog:Write("201109_风云令牌活动/", 11, "N/A", "聚力凝神散", 1)
		end
	end
	tbVngTransLog:Write("201109_风云令牌活动/", 11, tbAward.strLog, "N/A", 1)
end
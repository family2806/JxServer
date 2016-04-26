Include("\\script\\activitysys\\config\\1003\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1003\\variables.lua")

local tbUseTTHT_AdditionalAward = {
	[20] = {szName = "经验值", nExp=2000000},
	[40] = {szName = "经验值", nExp=4000000},
	[60] = {szName = "经验值", nExp=6000000},
	[80] = {szName = "经验值", nExp=8000000},
	[100] = {szName = "经验值", nExp=10000000},
	[200] = {szName = "经验值", nExp=12000000},
	[300] = {szName = "经验值", nExp=14000000},
	[400] = {szName = "经验值", nExp=16000000},
	[500] = {szName = "经验值", nExp=18000000},
	[600] = {szName = "经验值", nExp=20000000},
	[700] = {szName = "经验值", nExp=20000000},
	[800] = {szName = "经验值", nExp=20000000},
	[900] = {szName = "经验值", nExp=20000000},
	[1000] = {szName = "经验值", nExp=20000000},
	[1100] = {szName = "经验值", nExp=25000000},
	[1200] = {szName = "经验值", nExp=25000000},
	[1300] = {szName = "经验值", nExp=25000000},
}

local tbUseTTHT_ItemAward = {
	{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.35},
	{szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽上戒指图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
	{szName="紫莽下戒指图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
	{szName="紫莽器械图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
	{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
	{szName="混元灵露",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
	{szName="神行符",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="北斗传功术",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
	{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
	{szName="天精白驹丸",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
	{szName="特别白驹丸",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
	{szName="杀手锏礼盒",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="普防丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=5,nExpiredTime=43200},
	{szName="飞速丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=5,nExpiredTime=43200},
	{szName="大力丸礼包",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="炎帝令",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName = "经验值", nExp=25000000,nRate=1},
	{szName = "经验值", nExp=20000000,nRate=2},
	{szName = "经验值", nExp=15000000,nRate=3},
	{szName = "经验值", nExp=10000000,nRate=10},
	{szName = "经验值", nExp=6000000,nRate=25},
	{szName="易容秘术",tbProp={6,1,2951,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="积功助力丸",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="阴阳活血丹",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="还魂丹",tbProp={6,1,2837,1,0,0},nCount=1,nRate=5},
	{szName="逍遥散",tbProp={6,1,2831,1,0,0},nCount=1,nRate=5},
}

function pActivity:InitNpc()
	local tbNpcPos = {
		[1] = 
		{
			{176,1441,3277},			
		},		
	}
	local tbNpc = {
		[1] = {
			szName = "穆乔连", 
			nLevel = 95,
			nNpcId = 342,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},		
	}
	for i=1,getn(tbNpc) do
		for j = 1, getn(tbNpcPos[i]) do
			local nMapId, nPosX, nPosY = unpack(tbNpcPos[i][j])
			basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
		end
	end
end

function pActivity:GiveRedRoseBud(nCount)
	local tbAward = {szName="九仙御宴",tbProp={6,1,30128,1,0,0},nCount=1,nExpiredTime=%nItemExpiredTime}
	for i = 1, nCount do
		--经验奖励
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseBudLimit) ~= 1 then
			%tbVNG_BitTask_Lib:addTask(%tbGiveRedRoseBudLimit, 1)
			tbAwardTemplet:Give({szName = "经验值", nExp=1000000}, 1, {"EventVuLanBaoHieu", "DoiNuHoaHongDoNhanKinhNghiem"})
		end		
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "DoiNuHoaHongDoNhanVatPham"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "Doi1NuHoaHongDo", "1 九仙御宴", 1)
	end
end

function pActivity:CheckGiveRedRoseLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseLimit) == 1 then
		Talk(1, "", "你送我很多花了，这些花请收下.")
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveRedRoseLimit)
	if (nTaskVal + nCount) > %nRedRoseMaxCount then
		Msg2Player(format("数量超过上限，你只能送<color=yellow>%d <color>红玫瑰了.", %nRedRoseMaxCount - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:GiveRedRose(nCount)
	local tbAward = {szName = "经验值", nExp=500000}
	for i = 1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseLimit) == 1 then
			return nil
		end
		%tbVNG_BitTask_Lib:addTask(%tbGiveRedRoseLimit, 1)
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "送红玫瑰"})		
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "送红玫瑰", "500000 经验值", 1)
	end
end

function pActivity:TTHT_Limit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbUseTTHTLimit) == 1 then
		Talk(1, "", "使用该物品已到上限，不能使用了")
		return nil
	end
	return 1
end

function pActivity:Use_TTHT()
	local tbExpAward = {szName = "经验值", nExp=5000000}
	%tbVNG_BitTask_Lib:addTask(%tbUseTTHTLimit, 1)	
	tbAwardTemplet:Give(tbExpAward, 1, {"EventVuLanBaoHieu", "SuDungThuyTuuHoTienNhanKinhNghiem"})
	--奖励item
	local tbTranslog = {strFolder = %strTranLogFolder, nPromID = %nPromotionID, nResult = 1}
	tbAwardTemplet:Give(%tbUseTTHT_ItemAward, 1, {"EventVuLanBaoHieu", "SuDungThuyTuuHoTienNhanVatPham", tbTranslog})
	--使用物品达标奖励
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbUseTTHTLimit)
		if %tbUseTTHT_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbUseTTHT_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"EventVuLanBaoHieu", format("SuDung%dlanVatPhamThuyTuuHoTien", nTaskVal)})
		end
end

function pActivity:GiveCuuTienLimit(nCount)
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(%TSK_GIVE_CUU_TIEN_NGU_YEN_DAILY)
	if not nTaskVal then
		return nil
	end
	if (nTaskVal + nCount) > %nGive_Cuu_Tien_Daily_Max_Count then
		Msg2Player(format("数量超过上限，你只能送<color=yellow>%d <color>九仙御宴了.", %nGive_Cuu_Tien_Daily_Max_Count - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:GiveCuuTien(nCount)		
	local tbAward = {szName = "经验值", nExp=1000000}
	PlayerFunLib:AddTaskDaily(%TSK_GIVE_CUU_TIEN_NGU_YEN_DAILY, nCount)
	for i = 1, nCount do		
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "送九仙御宴"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "送九仙御宴", "1000000 经验值", 1)
	end
	return 1
end
Include("\\script\\activitysys\\config\\1000\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

local nYellowDaisyMaxCount = 1000

local tbGiveDaisyTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 1,
	nBitCount = 12,
	nMaxValue = 1000
}
local tbGourdUseTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 13,
	nBitCount = 12,
	nMaxValue = 1000
}
--local tbSteelHeartWineUseTaskInfo =
--{
--	nTaskID = 2712,
--	nStartBit = 25,
--	nBitCount = 6,
--	nMaxValue = 5
--}
local tbGiveDaisy_AdditionalAward = {
	[500] = {szName = "经验值", nExp=5000000},
	[1000] = {szName = "经验值", nExp=10000000},
}
local tbUseGourd_AdditionalAward = {
	[50] = {szName = "经验值", nExp=3000000},
	[100] = {szName = "经验值", nExp=6000000},
	[200] = {szName = "经验值", nExp=8000000},
	[300] = {szName = "经验值", nExp=10000000},
	[400] = {szName = "经验值", nExp=12000000},
	[500] = {szName = "经验值", nExp=14000000},
	[600] = {szName = "经验值", nExp=16000000},
	[700] = {szName = "经验值", nExp=18000000},
	[800] = {szName = "经验值", nExp=20000000},
	[900] = {szName = "经验值", nExp=25000000},
	[1000] = {szName = "经验值", nExp=30000000},
}
local tbUseWine_ExpAward = {
	[1] = {szName = "经验值", nExp=2000000},
	[2] = {szName = "经验值", nExp=3000000},
	[3] = {szName = "经验值", nExp=4000000},
	[4] = {szName = "经验值", nExp=5000000},
	[5] = {szName = "经验值", nExp=6000000},
	[6] = {szName = "经验值", nExp=6000000},
	[7] = {szName = "经验值", nExp=7000000},
	[8] = {szName = "经验值", nExp=8000000},
	[9] = {szName = "经验值", nExp=9000000},
	[10] = {szName = "经验值", nExp=10000000},
}

local tbUseWine_ItemAward = {
	{szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=1},
	{szName="紫莽上戒图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=1},
	{szName="紫莽下戒图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=1},
	{szName="紫莽器械图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.5},
	{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	{szName="飞风惊雷(及时转移)",tbProp={0,3470},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="飞风惊雷(概率化解杀枪)",tbProp={0,3471},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="飞风惊雷( 重击)",tbProp={0,3472},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="黄金印(强化)",tbProp={0,3210},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="黄金印(弱化)",tbProp={0,3220},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName = "使用铁心酒不幸运",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("此次不幸运，我要再试一次")
		end,
		nRate = 93.5,
	}
}
local tbUseGourd_ItemAward = {
	{szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.1},
	{szName="紫莽上戒图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.1},
	{szName="紫莽下戒图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.1},
	{szName="紫莽器械图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.1},
	{szName="玄猿令",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.3},
	{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
	{szName="水贼令牌",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="黄金之果",tbProp={6,1,907,1,0,0},nCount=1,nRate=1, nExpiredTime = 10080},
	{szName="杀手锏礼盒",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="漠北传送令",tbProp={6,1,1448,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="海龙珠",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="玄天锦囊",tbProp={6,1,2355,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="龙血丸",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1},
	{szName="混元灵露",tbProp={6,1,2312,1,0,0},nCount=1,nRate=1},
	{szName="呈祥红包",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
	{szName="安康红包",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
	{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=41.6},
	{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="玉重炼",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.5},
	{szName="飞风凌云",tbProp={0,3465},nCount=1,nRate=0.4,nQuality = 1,nExpiredTime=20160,},
	{szName="飞风绝世",tbProp={0,3466},nCount=1,nRate=0.3,nQuality = 1,nExpiredTime=20160,},
	{szName="飞风急破军( 及时转移)",tbProp={0,3467},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=20160,},
	{szName="飞风傲雪(及时转移)",tbProp={0,3468},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName="飞风傲雪(概率化解杀枪)",tbProp={0,3469},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName = "经验值", nExp=7000000, nRate = 25},
}

function pActivity:VngCheckWeeklyTaskCount(nTaskID, nValue, strComparison, strFailMessage)
	local nResult = dostring("return "..%VngTaskWeekly:GetWeeklyCount(nTaskID)..strComparison..nValue)
	if not nResult then
		Talk(1, "", strFailMessage)
		return nil
	end
	return 1
end

function pActivity:VngAddWeeklyTaskCount(nTaskID, nValue)
	%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
end

function pActivity:VngGiveDaisyLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveDaisyTaskInfo) == 1 then
		Talk(1, "", "你送给我很多花了，这些花请接收.")
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
	if (nTaskVal + nCount) > %nYellowDaisyMaxCount then
		Msg2Player(format("数量超过限制，你只能再送<color=yellow>%d <color>菊花了.", %nYellowDaisyMaxCount - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:VngGiveDaisy(nCount)
	local tbAward = {szName = "经验值", nExp=1000000}
	for i = 1, nCount do
		%tbVNG_BitTask_Lib:addTask(%tbGiveDaisyTaskInfo, 1)
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "NopHoaCucVang"})
		
		--当交足500, 1000菊花的再加奖励
		local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
		if %tbGiveDaisy_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbGiveDaisy_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("交%d次黄菊花物品", nTaskVal)})
		end
	end
end

function pActivity:VngGourdUseLimit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGourdUseTaskInfo) == 1 then
		Talk(1, "", "使用物品已达上限，不能再使用了")
		return nil
	end
	return 1
end

function pActivity:VngUseGourd()
	local tbAward = {szName = "经验值", nExp=7000000}
	%tbVNG_BitTask_Lib:addTask(%tbGourdUseTaskInfo, 1)	
	tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "使用风云葫芦瓶领取奖励"})
	--奖励item
	tbAwardTemplet:Give(%tbUseGourd_ItemAward, 1, {"Event_MungPBM", "使用风云葫芦瓶领取奖励"})
	--使用物品达标的奖励
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGourdUseTaskInfo)
		if %tbUseGourd_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbUseGourd_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("使用%d次风云葫芦瓶", nTaskVal)})
		end
end

function pActivity:VngUseSteelHeartWine()
	local nDailyCount = PlayerFunLib:GetTaskDailyCount(2711)	
	local tbAward = %tbUseWine_ExpAward[nDailyCount]
	if tbAward then
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "使用风云铁心酒领取奖励"})
	end
	tbAwardTemplet:Give(%tbUseWine_ItemAward, 1, {"Event_MungPBM", "使用风云铁心酒领取奖励"})	
end

function pActivity:VngCheckWeeklyFeatureMatchCount(nTaskID1, nTaskID2, nTaskID3)
	local nTongKim = %VngTaskWeekly:GetWeeklyCount(nTaskID1)
	local nVuotAi = %VngTaskWeekly:GetWeeklyCount(nTaskID2)
	local nViemDe = %VngTaskWeekly:GetWeeklyCount(nTaskID3)
	local strTittle = format("本周阁下已完成:\n<color=yellow>\t\t\t%-6d<color> 场宋金\n<color=yellow>\t\t\t%-6d<color>次闯关\n<color=yellow>\t\t\t%-6d<color> 次炎帝闯关", nTongKim, nVuotAi, nViemDe)	
	Say(strTittle, 1, "сng/OnCancel")
end

function OnCancel()
end

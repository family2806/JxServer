------------------------------------------------------------------------------------------------
--Author: NgaVN
--Des: Event Ph?N?Vi謙 Nam
--Date: 2011-10-13
------------------------------------------------------------------------------------------------
Include("\\script\\activitysys\\config\\1007\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1007\\variables.lua")

--经验奖励
local tbUseBTT_AdditionalAward = {
	[50] 		= {szName = "经验值", nExp=5000000},
	[100] 	= {szName = "经验值", nExp=5000000},
	[200] 	= {szName = "经验值", nExp=5000000},
	[300] 	= {szName = "经验值", nExp=10000000},
	[400] 	= {szName = "经验值", nExp=10000000},
	[500] 	= {szName = "经验值", nExp=10000000},
	[600] 	= {szName = "经验值", nExp=15000000},
	[700] 	= {szName = "经验值", nExp=15000000},
	[800] 	= {szName = "经验值", nExp=20000000},
	[900] 	= {szName = "经验值", nExp=25000000},
	[1000] 	= {szName = "经验值", nExp=50000000},
}

--local tbLogUseIceCrystals = {
--	[500] = "上交黄石物品500次",
--	[1000] = "上交黄石物品1000次",
--	[1500] = "上交黄石物品1500次",	
--	[1500] = "上交黄石物品2000次",		
--}

--Ph莕 thng Item
local tbUseBTT_ItemAward = {
	[1] = {szName="紫莽发冠图谱",				tbProp	= {6,1,2714,1,0,0}, nCount=1,nRate= 1},
	[2] = {szName="紫莽金盔图谱",					tbProp	= {6,1,2715,1,0,0}, nCount=1,nRate=1},
	[3] = {szName = "紫莽腰带图谱", 				tbProp = {6,1,2717,1,0,0}, nCount=1, nRate = 1},	
	[4] = {szName = "紫莽护腕图谱", 				tbProp = {6,1,2718,1,0,0}, nCount=1, nRate = 1},
	[5] = {szName = "紫莽佩图谱", 						tbProp = {6,1,2720,1,0,0}, nCount=1, nRate = 1},
	[6] = {szName = "紫莽鞋图谱", 						tbProp = {6,1,2716,1,0,0}, nCount=1, nRate = 1},		
	[7] = {szName = "紫莽项链图谱", 			tbProp = {6,1,2719,1,0,0}, nCount=1, nRate = 1},
	[8] = {szName = "紫莽上戒指图谱", 	tbProp = {6,1,2721,1,0,0}, nCount=1, nRate = 0.5},
	[9] = {szName = "紫莽下戒指图谱", 			tbProp = {6,1,2722,1,0,0}, nCount=1, nRate = 0.5},
	[10] = {szName = "紫莽器械图谱", 				tbProp = {6,1,2723,1,0,0}, nCount=1, nRate = 0.5},
	[11] = {szName="紫莽令",									tbProp = {6,1,2350,1,0,0},nCount=1, nRate=0.2},
	[12] = {szName="玄猿令",									tbProp = {6,1,2351,1,0,0},nCount=1, nRate=0.3},
	[13] = {szName="金乌令", 											tbProp = {6,1,2349,1,0,0}, nCount=1, nRate = 0.01},	
	[14] = {szName="苍狼令",								tbProp = {6,1,2352,1,0,0},nCount=1,nRate=0.5},
	[15] = {szName="云鹿令",										tbProp = {6,1,2353,1,0,0},nCount=1,nRate=1},
	[16] = {szName="青驹令",									tbProp = {6,1,2369,1,0,0},nCount=1,nRate=1},
	[17] = {szName="五行奇石",							tbProp = {6,1,2125,1,0,0},nCount=1,nRate=25},
	[18] = {szName="宋金招兵令",					tbProp = {6,1,30083,1,0,0},nCount=1,nRate=3, nExpiredTime=10080},
	[19] = {szName="宋金招兵礼包",				tbProp = {6,1,30084,1,0,0},nCount=1,nRate=1, nExpiredTime=10080},
	[20] = {szName="龙血丸",								tbProp = {6,1,2117,1,0,0},nCount=1,nRate=1},  --20111019
	[21] = {szName="杀手锏礼盒",							tbProp = {6,1,2339,1,0,0},nCount=1,nRate=2},  --20111019
	[22] = {szName="玉罐",											tbProp = {6,1,2311,1,0,0},nCount=1,nRate=1},
	[23] = {szName="山河社稷地图(1000块)", tbProp = {6,1,2514,1,0,0}, nCount=1, nRate=3},
	[24] = {szName="漠北传送令",				tbProp = {6,1,1448,1,0,0},nCount=1,nRate=2},	--20111019
	[25] = {szName="微山岛令牌礼包",			tbProp = {6,1,2525,1,1,0},nCount=1,nRate=2},		--20111019   - L謓h B礽 Vi S琻 Фo L?Bao				
	[26] = {szName="玉重炼",							tbProp = {6,1,30104,1,0,0},nCount=1,nRate=0.3},
	[27] = {szName = "金花之宝", 							tbProp = {6,1,3002,1,0,0},nCount=1,nRate=0.1},
	[28] = {szName="特别仙草露",						tbProp = {6,1,1181,1,0,0},nCount=1,nRate=6.74},  --20111019
	[29] = {szName="海龙珠",									tbProp = {6,1,2115,1,0,0},nCount=1,nRate=1},		--20111019
	[30] = {szName = "金乌盔图谱", 							tbProp = {6,1,2982,1,0,0}, nCount=1,nRate=0.05},
	[31] = {szName="金乌衣图谱",								tbProp = {6,1,2983,1,0,0},nCount=1,nRate = 0.05},
	[32] = {szName="金乌鞋图谱",								tbProp = {6,1,2984,1,0,0},nCount=1,nRate = 0.01},	
	[33] = {szName="金乌腰带图谱",						tbProp = {6,1,2985,1,0,0},nCount=1, nRate = 0.01},
	[34] = {szName="金乌护腕图谱",						tbProp = {6,1,2986,1,0,0},nCount=1, nRate = 0.01},
	[35] = {szName="金乌项链图谱",					tbProp = {6,1,2987,1,0,0},nCount=1, nRate = 0.05},
	[36] = {szName="金乌佩图谱",								tbProp = {6,1,2988,1,0,0},nCount=1, nRate = 0.05},
	[37] = {szName="金乌上戒指图谱",				tbProp = {6,1,2989,1,0,0},nCount=1, nRate = 0.04},
	[38] = {szName="金乌下戒指图谱",						tbProp = {6,1,2990,1,0,0},nCount=1, nRate = 0.04},
	[39] = {szName="金乌器械图谱",						tbProp = {6,1,2991,1,0,0},nCount=1, nRate = 0.04},
	[40] = {szName = "经验值", 							nExp=5000000, nRate = 15},
	[41] = {szName = "经验值", 							nExp=10000000, nRate = 10},
	[42] = {szName = "经验值", 							nExp=20000000, nRate = 2},
	[43] = {szName="行侠令",						        tbProp = {6,1,2566,1,0,0},nCount=1, nRate = 10},   --20111019
	[44] = {szName="辉煌果",						            tbProp={6,1,907,1,0,0},nCount=1,nRate=1, nExpiredTime=10080},            --20111019
	[45] = {szName="辉煌果盒",					    	tbProp={6,1,1075,1,0,0},nCount=1, nRate = 2, nExpiredTime=10080},       --20111019
}
	
--Function 交黄石限制
function pActivity:HandInHoangThachLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveHoangThachLimit) == 1 then
		Talk(1, "", "您送我很多黄石了，这些黄石请收下.");
		Msg2Player("您送我很多黄石了，这些黄石请收下.");
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveHoangThachLimit)
	if (nTaskVal + nCount) > %nHoangThachMaxCount then
		Msg2Player(format("数量超过限制，你只能缴<color=yellow>%d <color>黄石了.", %nHoangThachMaxCount - nTaskVal))
		return nil
	end
	return 1
end

--Function 交黄石
function pActivity:HandInHoangThach(nCount)		
	local tbAward = {szName = "经验值", nExp=1000000};
	
	for i = 1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveHoangThachLimit) == 1 then
			return nil
		end
		%tbVNG_BitTask_Lib:addTask(%tbGiveHoangThachLimit, 1)
		tbAwardTemplet:Give(tbAward, 1, {"Event_PNVN", "交黄石物品"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "交黄石物品", "1000000 exp", 1)			
	end
	--Ghi Log	
end


--Function 限制
function pActivity:UseBTT_Limit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbUseBTTLimit) == 1 then
		Talk(1, "", "使用物品已达上限，不能再使用了")
		Msg2Player("使用物品已达上限，不能再使用了");
		return nil
	end
	return 1
end

function pActivity:Use_BTT()
	local tbExpAward = {szName = "经验值", nExp=6000000}
	%tbVNG_BitTask_Lib:addTask(%tbUseBTTLimit, 1)	
	--经验奖励
	tbAwardTemplet:Give(tbExpAward, 1, {"Event_PNVN", "使用冰晶石领取物品"});
	--item奖励
	local tbTranslog = {strFolder = %strTranLogFolder, nPromID = %nPromotionID, nResult = 1}	
	tbAwardTemplet:Give(%tbUseBTT_ItemAward, 1, {"Event_PNVN", "使用冰晶石领取物品", tbTranslog});
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbUseBTTLimit);
	--超额经验奖励
	if %tbUseBTT_AdditionalAward[nTaskVal] then
		local tbTempAward = %tbUseBTT_AdditionalAward[nTaskVal]
		tbAwardTemplet:Give(tbTempAward, 1, {"Event_PNVN", format("使用%d次冰晶石", nTaskVal)})
		%tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, format("使用%d次冰晶石", nTaskVal), tbTempAward.nExp.." Exp", 1)
		Msg2Player(format("<color=green>恭喜你使用物品%s %d 次, 获得%d 经验值<color>", "冰晶石", nTaskVal, tbTempAward.nExp))
	end
end

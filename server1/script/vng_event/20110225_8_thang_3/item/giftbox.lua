Include("\\script\\vng_event\\20110225_8_thang_3\\item\\item_head.lua")
tbVNGWD2011_GiftBox = {}
tbVNGWD2011_GiftBox.nTaskLimitUse = 2748
tbVNGWD2011_GiftBox.nMaxExp = 4e9	
function main(itemidx)
	if (tbVNGWD2011_ItemHead:isExpired(itemidx) == 1) then
		Msg2Player("物品过使用期，自动消失.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNGWD2011_GiftBox:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end		
end

function tbVNGWD2011_GiftBox:UseItem()
	if tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 0, "你不足条件使用物品，要求150级以上且已充值"
	end
	
	if tbVNGWD2011_ItemHead:checkBag(10) ~= 1 then
		return 0, "为保卫财产，请留下10个装备空位才能使用该物品!"
	end		
	local nTaskVal = GetTask(self.nTaskLimitUse)
	if nTaskVal >= (self.nMaxExp/1e6) then
		return 0, "大侠已使用最多物品，不能再使用"
	end
	SetTask(self.nTaskLimitUse, nTaskVal + 10)	
	self:AddExtraAwardDialog()
	local tbExpAward =  {szName = "经验值", nExp=10000000}
	local tbItemAward = 
		{
			{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.08,nExpiredTime=43200},
			{szName="玄猿令",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.6},
			{szName="黄金之果",tbProp={6,1,907,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
			{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=5},
			{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=5},
			{szName="回城丸 (大)",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.5},
			{szName="杀手锏礼盒",tbProp={6,1,2339,1,0,0},nCount=1,nRate=4},
			{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},
			{szName="漠北传送令",tbProp={6,1,1448,1,0,0},nCount=1,nRate=4},
			{szName="海龙珠",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2},
			{szName="玄天锦囊",tbProp={6,1,2355,1,0,0},nCount=1,nRate=5},
			{szName="特效仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=5},
			{szName="千年珍露",tbProp={6,1,2267,1,0,0},nCount=1,nRate=4},
			{szName="万能珍露",tbProp={6,1,2268,1,0,0},nCount=1,nRate=6.32},
			{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
			{szName="北斗传功术",tbProp={6,1,1672,1,0,0},nCount=1,nRate=1},
			{szName="龙血丸",tbProp={6,1,2117,1,0,0},nCount=1,nRate=2},
			{szName="天晶白驹丸",tbProp={6,1,2183,1,0,0},nCount=1,nRate=3},
			{szName="特效白驹丸",tbProp={6,1,1157,1,0,0},nCount=1,nRate=5},
			{szName="回天再造锦囊",tbProp={6,1,1781,1,0,0},nCount=1,nRate=5,tbParam={60}},
			{szName="一纪乾坤符",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
			{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=10},
		}
	if tbExpAward and tbItemAward then
		tbAwardTemplet:GiveAwardByList(tbExpAward, "[VNG][8thang3][3月8日使用礼盒经验奖励]")
		tbAwardTemplet:GiveAwardByList(tbItemAward, "[VNG][8thang3][3月8日使用礼盒Ttem奖励]")
	end
	return 1
end

function tbVNGWD2011_GiftBox:AddExtraAwardDialog()
	local nItemUsed = GetTask(self.nTaskLimitUse) / 10
	local tbTSK, tbTSK_FLAG = {}
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (nItemUsed >= 100 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (nItemUsed >= 200 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (nItemUsed >= 300 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (nItemUsed >= 400 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
end

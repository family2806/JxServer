Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal5Col = {}

function main(itemidx)
	--kiem tra dieu kien su dung vat pham
	if(tbNSKT_Crystal:checkCondition() == 0)then
		Talk(1, "", "你不够条件使用物品，要求50级以上充值用户")
		return 1
	end
	-- het event, 物品使用到期

	if (tbNSKT_Crystal:isExpired(itemidx) == 1) then
		Msg2Player("物品使用过期，自动消失.")
		return 0; -- delete item
	end
	-- 使用物品成功，删除 item
	local nResult, szErrorMessage = tbNSKT_Crystal5Col:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- 不删除item	
		end
	end
end

--su dung item, gia tri tra ve:
function tbNSKT_Crystal5Col:UseItem()
	if (tbNSKT_Crystal:isMaxItemUse() == 1 ) then	
		return 0, "大侠已最大限度使用该物品了!"
	end
	if (tbNSKT_Crystal:checkBag(6) == 0)then
		return 0, "为保卫财产，请留下6个装备空位后才能使用该物品!" --装备不足空位，不能删除物品
	end
			
	--建立经验奖励榜
	local tbExp = {
							{n_Exp =25e6, n_Rate = 40},
							{n_Exp =30e6, n_Rate = 45},
							{n_Exp =40e6, n_Rate = 12},
							{n_Exp =50e6, n_Rate = 2},
							{n_Exp =100e6, n_Rate = 1}	
						};							
	local nTaskValue = GetBitTask(tbNSKT_Crystal.nTaskID, tbNSKT_Crystal.nStartBit, tbNSKT_Crystal.nEndBit)
	local nTemp = (tbNSKT_Crystal.nMaxExp  - nTaskValue) * tbNSKT_Crystal.nScaleFactor
	--neu tbExp = nil, 不发奖，返回1删除物品
	if (not tbExp) then
		return 1;
	end
	-- 经验不能超过8ti界限
	for i = 1, getn(tbExp) do
		if (nTemp < tbExp[i].n_Exp) then
			tbExp[i].n_Exp = nTemp
		end
	end		
	
	local tbAward = {}
	for i = 1, getn(tbExp) do
		tbAward[i] = 
			{
				[1] = {nExp = tbExp[i].n_Exp},					
				[2] = 
						{
							pFun = function (tbItem, nItemCount, szLogTitle)
								%tbNSKT_Crystal:addTask(%tbExp[%i].n_Exp)
							end
						},
				nRate = tbExp[i].n_Rate,
			}
	end
	--结束建立物品经验奖励榜		

	--建立物品奖励榜
	local tbItemAward = 
	{
		{szName="玄猿令",tbProp={6,1,2351,1,0,0},nRate=2,nCount=1},
		{szName="特效白驹丸",tbProp={6,1,1157,1,0,0},nRate=6,nCount=1},
		{szName="天晶白驹丸",tbProp={6,1,2183,1,0,0},nRate=8,nCount=1},
		{szName="混元灵露",tbProp={6,1,2312,1,0,0},nRate=3,nCount=5},
		{szName="富贵锦囊",tbProp={6,1,2402,1,0,0},nRate=5,nCount=5},
		{szName="万能辉煌果",tbProp={6,1,2271,1,0,0},nRate=9.3,nCount=2},
		{szName="银两",nJxb=5000000,nRate=10,nCount=1},
		{szName="银两",nJxb=10000000,nRate=2,nCount=1},
		{szName="银两",nJxb=20000000,nRate=1,nCount=1},
		{szName="银两",nJxb=50000000,nRate=0.2,nCount=1},
		{szName="海龙珠",tbProp={6,1,2115,1,0,0},nRate=2,nCount=3},
		{szName="龙血丸",tbProp={6,1,2117,1,0,0},nRate=2,nCount=3},
		{szName="神行符",tbProp={6,1,1266,1,0,0},nRate=1.5,nCount=1,nExpiredTime=14400},
		{szName="回天再造锦囊",tbProp={6,1,1781,1,0,0},nRate=5,nCount=5,tbParam={60}},
		{szName="召回令牌",tbProp={6,1,30074,1,0,0},nRate=16,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
		{szName="天龙令",tbProp={6,1,2256,1,0,0},nRate=2,nCount=5},
		{szName="四海逍遥丹礼盒",tbProp={6,1,2398,1,0,0},nRate=1,nCount=1},
		{szName="五洲凌空丹礼盒",tbProp={6,1,2399,1,0,0},nRate=1,nCount=1},
		{szName="九天云游丹礼盒",tbProp={6,1,2400,1,0,0},nRate=1,nCount=1},
		{szName="百年七星草",tbProp={6,1,1674,1,0,0},nRate=0.5,nCount=1},
		{szName="千年七星草",tbProp={6,1,1675,1,0,0},nRate=0.3,nCount=1},
		{szName="万能五彩花",tbProp={6,1,2265,1,0,0},nRate=0.2,nCount=1},
		{szName="元帅面具",tbProp={0,11,447,1,0,0},nRate=4,nCount=1},
		{szName="天山雪莲",tbProp={6,1,1431,1,0,0},nRate=1,nCount=1},
		{szName="特效仙草露",tbProp={6,1,1181,1,0,0},nRate=4,nCount=2},
		{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nRate=5,nCount=5},
		{szName="飞速丸礼包",tbProp={6,1,2520,1,0,0},nRate=5,nCount=5},
		{szName="黄金之果",tbProp={6,1,907,1,0,0},nRate=2,nCount=1,nExpiredTime=10080},
	}
	--	}
	--结束建立物品奖励榜	
	
	--物品将幸运星
	local tbStarAward =
		{
			[1] = {szName="幸运星",tbProp={6,1,30078,1,0,0},nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
			nRate = 100
		}
		
	--tang thuong
	if (tbAward)then
		tbNSKT_Crystal:giveAward(tbAward, "五色结晶经验奖励");	
	end
	if(tbStarAward)then
		tbNSKT_Crystal:giveAward(tbStarAward, "五色结晶幸运星奖励");
	end		
	if (tbItemAward)then
		tbNSKT_Crystal:giveAward(tbItemAward, "五色结晶奖励");
	end
	return 1;		
end

tbVNGForbidItem = {}
tbVNGForbidItem.CHALLENGE_OF_TIME = 1
tbVNGForbidItem.SEVEN_CITY = 2
tbVNGForbidItem.VLDNB = 3
tbVNGForbidItem.tbForbidItem = 
	{
		["神行符"] = {6, 1, 1266},
--		["心心相映符"] = {6, 1, 18}, disable trong file forbitheart.txt
--		["回城符 (小） "] = {6, 1, 1082},
--		["回城符(大) "] = {6, 1, 1083},
		["宋金诏书 "] = {6, 1, 155},
		["漠北传送令"] = {6, 1, 1448},
		["微山岛令牌"] = {6, 1, 2432},
		["微山岛令牌礼包"] = {6, 1, 2525},
	}

tbVNGForbidItem.tbMapSet = 
	{
		--Vuot ai
		[1] =
			{
				464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479,
				480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 
				957, --ai 30
			},
		--seven city
		[2] = 
			{
				926, 927, 928, 929, 930, 931, 932,
			},
		--VLDNB	
		[3] =
			{
				605, 608, 609, 606, 610, 611, 607, 612, 613,
			},
	}
	
function tbVNGForbidItem:IsForbidMap(strItemName, tbMapSet)
	local nW, _, _ = GetWorldPos()
	local tbTempMapSet = {}
	for i = 1, getn(tbMapSet) do
		tbTempMapSet = self.tbMapSet[tbMapSet[i]]
		if not tbTempMapSet then
			Msg2Player("不能确定使用物品的限制区域")
			return 1
		end
		for j = 1, getn(tbTempMapSet) do
			if nW == tbTempMapSet[j] then
				Msg2Player( format("目前区域不允许使用 <color=yellow>%s",strItemName ))
				return 1
			end
		end
	end	
	return 0	
end
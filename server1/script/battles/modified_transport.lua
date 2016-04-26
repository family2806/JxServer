tbVNG_Transport = {}
tbVNG_Transport.tbPos =
	{
		[1] = 
			{
				[380] = 
					{
						tbFixedPos = {{1401, 3439},{1384, 3367},{1344, 3345},{1377, 3319},{1417, 3402},},
						tbRandomPos = {{1426, 3370},{1387, 3317},{1318, 3371},{1376, 3379},{1403, 3349},{1365, 3482},},
					},				
				[383] = 
					{
						tbFixedPos = {{1834, 3119}, {1856, 3048}, {1781, 2964}, {1768, 2412}, {1711, 2775}, },
						tbRandomPos = {{1842, 3006}, {1776, 3104}, {1688, 2917}, {1704, 2816}, {1784, 2848}, {1854, 2940},},
					},
			},
		[2] = 
			{				
				[380] = 
					{
						tbFixedPos = {{1594, 3283}, {1486, 3333}, {1448, 3271}, {1495, 3180}, {1438, 3334}, },
						tbRandomPos = {{1478, 3213}, {1490, 3277}, {1462, 3312}, {1550, 3313}, {1616, 3249}, {1517, 3141}, },
					},
				[383] = 
					{
						tbFixedPos = {{1942, 2905},{2001, 2938},{1887, 2674},{1842, 2667},{1925, 2762},},
						tbRandomPos = {{1902, 2790},{1921, 2845},{2000, 2856},{1912, 2650},{1864, 2667},{1898, 2864},},
					},
			},
	};

function tbVNG_Transport:Dialog(nCamp)
	local tbSay = 
		{
--			format("固定位置/#tbVNG_Transport:FixedPos(%d)", nCamp),
			format("偶然位置/#tbVNG_Transport:RandomPos(%d)", nCamp),
		}
	Say("请选择位置, 我将送你到那里", getn(tbSay), tbSay)
end

function tbVNG_Transport:FixedPos(nCamp)
	local nWorld = GetWorldPos()
	if tbVNG_Transport.tbPos[nCamp] == nil then
		Msg2Player("发生错误，不能确定是宋还是金")
	end
	if tbVNG_Transport.tbPos[nCamp][nWorld] == nil then
		Msg2Player("地图错误")
	end
	local tbPos = tbVNG_Transport.tbPos[nCamp][nWorld].tbFixedPos
	if not tbPos then
		Msg2Player("不能确定坐标，请重试")
	end
	local tbDialog = {}
	for i = 1, getn(tbPos) do
		tinsert(tbDialog, format("V?tr?%d/#tbVNG_Transport:Transport(%d, %d)", i, tbPos[i][1], tbPos[i][2]))
	end
	Say("请选择位置", getn(tbDialog), tbDialog)
end

function tbVNG_Transport:RandomPos(nCamp)
	local nWorld = GetWorldPos()
	if tbVNG_Transport.tbPos[nCamp] == nil then
		Msg2Player("发生了错误，不能确定宋还是金")
	end
	if tbVNG_Transport.tbPos[nCamp][nWorld] == nil then
		Msg2Player("地图错误")
	end
	local tbPos = tbVNG_Transport.tbPos[nCamp][nWorld].tbRandomPos
	if not tbPos then
		Msg2Player("不能确定坐标，请重试")
	end
	local nIndex = random(1, getn(tbPos))
	self:Transport(tbPos[nIndex][1], tbPos[nIndex][2])
end

function tbVNG_Transport:Transport(nX, nY)
	SetPos(nX, nY)
	SetFightState(1)
end
--圣诞礼物对话脚本；
Include([[\script\missions\chrismas\ch_head.lua]]);
ITEM_DROPRATE_TABLE = {
						{	{6,1,978,1,1,1,1},0.025, "加速丸"	},
						{	{6,1,981,1,1,1,1},0.025, "眩晕陷阱"	},
						{	{6,1,983,1,1,1,1},0.025, "霜降陷阱"	},
						{	{6,1,991,1,1,1,1},0.025, "天雷玉"	},
						{	{6,1,994,1,1,1,1},0.025, "寒风玉"	},
						{	{6,1,987,1,1,1,1},0.025, "遁地符"	},
						{	{6,1,989,1,1,1,1},0.018, "经验符"	},
						{	{6,1,990,1,1,1,1},0.005, "雷速丸"	},
						{	{6,1,982,1,1,1,1},0.005, "玄天陷阱"	},
						{	{6,1,984,1,1,1,1},0.005, "B冰封陷阱"	},
						{	{6,1,993,1,1,1,1},0.005, "雷神玉"	},
						{	{6,1,992,1,1,1,1},0.005, "玄冰玉"	},
						{	{6,1,980,1,1,1,1},0.002, "暴雷号角"	},
						{	{6,1,979,1,1,1,1},0.002, "冰霜号角"	},
						{	{6,1,985,1,1,1,1},0.005, "乾坤挪移符"	},
						{	{6,1,986,1,1,1,1},0.003, "移形换影符"	},
						{	{6,1,988,1,1,1,1},0.005, "经验符（高级）"	},
						{	500,0.08},
						{	1000,0.1},
						{	3000,0.12},
						{	5000,0.18},
						{	10000,0.12},
						{	30000,0.1},
						{	50000,0.05},
						{	100000,0.024},
						{	150000,0.01},
						{	300000,0.005},
						{	{6,1,402,1,1,1,1},0.001, "神秘大红包"},
					}
					
					
function main()
	local nNpcIdx = GetLastDiagNpc();
	if (GetNpcParam(nNpcIdx, 4) == 0 ) then
		return
	end
	SetNpcParam(nNpcIdx,4,0)
	
	local nCount = GetTask(TK_COUNT_ONETIME) + 1;
	SetTask(TK_COUNT_ONETIME, nCount);
	DelNpc(nNpcIdx);
	
	add_dropitem()
	
	CastSkill(358, 1); --放一个技能；
	
	Msg2Player("你已选中"..nCount.."圣诞礼包");
end;

function add_dropitem()
	local sum = 0
	for i = 1, getn(ITEM_DROPRATE_TABLE) do
		sum = sum + ITEM_DROPRATE_TABLE[i][2] * 1000
	end
	
	local nRandNum = random(sum)
	local nSum = 0
	for i =1, getn(ITEM_DROPRATE_TABLE) do
		nSum = nSum + ITEM_DROPRATE_TABLE[i][2] * 1000
		if (nSum >= nRandNum) then
			if (type( ITEM_DROPRATE_TABLE[i][1] ) == "table") then
				AddItem(ITEM_DROPRATE_TABLE[i][1][1], ITEM_DROPRATE_TABLE[i][1][2], ITEM_DROPRATE_TABLE[i][1][3], ITEM_DROPRATE_TABLE[i][1][4], ITEM_DROPRATE_TABLE[i][1][5], ITEM_DROPRATE_TABLE[i][1][6], ITEM_DROPRATE_TABLE[i][1][7])
				Msg2Player("你得到1个<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE[i][3])
			elseif (type( ITEM_DROPRATE_TABLE[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE[i][1] * get_exptimes();
				AddOwnExp(nExp);
				Msg2Player("你得到<color=0xB5FDD7>"..nExp.."经验.")
			end
			break
		end
	end
	
	
end
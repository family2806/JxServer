Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

ITEM_DROPRATE_TABLE = {
						{	{6,1,978,1,1,1,1},0.020, "加速丸"	},
						{	{6,1,981,1,1,1,1},0.010, "眩晕陷阱"	},
						{	{6,1,982,1,1,1,1},0.005, "玄天陷阱"	},
						{	{6,1,983,1,1,1,1},0.020, "霜降陷阱"	},
						{	{6,1,984,1,1,1,1},0.010, "冰封陷阱"	},
						{	{6,1,994,1,1,1,1},0.016, "寒风玉"	},
						{	{6,1,989,1,1,1,1},0.010, "经验符 "	},
						{	{6,1,988,1,1,1,1},0.005, "经验符 (高级) "	},
						{	{6,1,985,1,1,1,1},0.005, "乾坤挪移符 "	},
						{	{6,1,986,1,1,1,1},0.005, "移形幻影符 "	},
						{	{6,1,979,1,1,1,1},0.010, "冰霜号角 "	},
						{	1000,0.15},
						{	2000,0.15},
						{	5000,0.15},
						{	10000,0.15},
						{	20000,0.1189},
						{	50000,0.015},
						{	100000,0.0001},
						{	{6,1,71,1,1,1,1},0.030, "仙草露 "},
					}


function main()
    if (GetTask(TK_GROUPID) <= SF_SMALLMAPCOUNT) then
        return
    end;
	local nNpcIdx = GetLastDiagNpc();
	if (GetNpcParam(nNpcIdx, 4) == 0 ) then
		return
	end
	SetNpcParam(nNpcIdx,4,0)
	
	local nCount = GetTask(SF_COUNT_ONETIME) + 1;
	SetTask(SF_COUNT_ONETIME, nCount);
	DelNpc(nNpcIdx);
	
	add_dropitem()
	
	CastSkill(358, 1); --放一个技能；
	
	Msg2Player(format("打中 %d %s", nCount, SF_MOUSENAME));
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
				Msg2Player(format("获得1 <color=0xB5FDD7>%s",ITEM_DROPRATE_TABLE[i][3]));
			elseif (type( ITEM_DROPRATE_TABLE[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE[i][1] * festival_get_exptimes();
				AddOwnExp(nExp);
				Msg2Player(format("你获得 <color=0xB5FDD7> 经验值.", nExp))
			end
			break
		end
	end
	
	
end
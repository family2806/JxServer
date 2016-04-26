Include([[\script\missions\tong\collectgoods\head.lua]]);

ITEM_DROPRATE_TABLE828 = {
--						{	{4,970,1,1,1,1,1},0, "����"	},
--						{	{4,971,1,1,1,1,1},0, "����"	},
--						{	{4,974,1,1,1,1,1},0, "��ͨ����"	},
--						{	{4,972,1,1,1,1,1},0, "��Ҷ"	},
--						{	{4,973,1,1,1,1,1},0, "����"	},
						{	{6,1,978,1,1,1,1},0.025, "������"	},
						{	{6,1,981,1,1,1,1},0.025, "ѣ������"	},
						{	{6,1,983,1,1,1,1},0.025, "˪������"	},
						{	{6,1,991,1,1,1,1},0.025, "������"	},
						{	{6,1,994,1,1,1,1},0.025, "������"	},
						{	{6,1,987,1,1,1,1},0.025, "�صط�"	},
						{	{6,1,1009,1,1,1,1},0.018, "����Ž�"	},
						{	{6,1,990,1,1,1,1},0.005, "������"	},
						{	{6,1,982,1,1,1,1},0.005, "��������"	},
						{	{6,1,984,1,1,1,1},0.005, "��������"	},
						{	{6,1,993,1,1,1,1},0.005, "������"	},
						{	{6,1,992,1,1,1,1},0.005, "������"	},
						{	{6,1,1010,1,1,1,1},0.005, "�����Ž�"	},
						{	{6,1,980,1,1,1,1},0.002, "���׺Ž�"	},
						{	{6,1,979,1,1,1,1},0.002, "��˪�Ž�"	},
						{	{6,1,986,1,1,1,1},0.003, "���λ�Ӱ��"	},
						{	{6,1,985,1,1,1,1},0.002, "Ǭ��Ų�Ʒ�"	},
						{	1000,0.08},
						{	2000,0.10},
						{	5000,0.10},
						{	10000,0.20},
						{	20000,0.138},
						{	50000,0.11},
						{	100000,0.06},
						{	{6,1,402,1,1,1,1},0.005, "���غ��"},
					}


function gift_true828()
	SetTask(COLLG_COUNT_ONETIME, GetTask(COLLG_COUNT_ONETIME) + 1);
	Msg2Player("���ҵ� <color=red>1<color> �����.");
	add_dropitem828()
	
	CastSkill(358, 1); --��һ�����ܣ�
	Msg2Player("���ҵ����� <color=yellow>"..GetTask(COLLG_COUNT_ONETIME).."<color> �����.");
end;

function add_dropitem828()
	local sum = 0
	for i = 1, getn(ITEM_DROPRATE_TABLE828) do
		sum = sum + ITEM_DROPRATE_TABLE828[i][2] * 1000
	end
	
	local nRandNum = random(sum)
	local nSum = 0
	for i =1, getn(ITEM_DROPRATE_TABLE828) do
		nSum = nSum + ITEM_DROPRATE_TABLE828[i][2] * 1000
		if (nSum >= nRandNum) then
			if (type( ITEM_DROPRATE_TABLE828[i][1] ) == "table") then
				AddItem(ITEM_DROPRATE_TABLE828[i][1][1], ITEM_DROPRATE_TABLE828[i][1][2], ITEM_DROPRATE_TABLE828[i][1][3], ITEM_DROPRATE_TABLE828[i][1][4], ITEM_DROPRATE_TABLE828[i][1][5], ITEM_DROPRATE_TABLE828[i][1][6], ITEM_DROPRATE_TABLE828[i][1][7])
				Msg2Player("����һ��<color=0xB5FDD7>"..ITEM_DROPRATE_TABLE828[i][3]);
			elseif (type( ITEM_DROPRATE_TABLE828[i][1] ) == "number") then
			    local nExp = ITEM_DROPRATE_TABLE828[i][1];
				AddOwnExp(nExp);
				Msg2Player("���� <color=0xB5FDD7>"..nExp.."����ֵ.");
			end
			break
		end
	end
	
	
end

function IsPickable828( nItemIndex, nPlayerIndex )
    if (0 == GetItemParam(nItemIndex, 2)) then
       return 1;
    end
    
	if (GetTask(TK_GROUPID) > COLLG_SMALLMAPCOUNT) then
        return 0;
    else
        return 1;
    end;
end

function PickUp828( nItemIndex, nPlayerIndex )
    SetSpecItemParam(nItemIndex, 2, 0);
    gift_true828(nPlayerIndex);
    return 0;
end

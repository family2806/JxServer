Include("\\script\\lib\\award.lua")
--award_give
function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70331) then
		Msg2Player("���������⣬����ʹ����.");
		return 0;
	end;
	
	local tb_goldenbox = {
						{1,	{6,1,124,1,0,0,0},	1,	23860,	"��Ե¶(��) ", 0},
						{1,	{6,1,71,1,0,0},	1,	17010,	"�ɲ�¶", 0},
						{1,	{6,1,26,1,0,0,0},	1,	100,	"�����ؼ�", 0},
						{1,	{6,1,22,1,0,0,0},	1,	100,	"ϴ�辭", 0},
						{1,	{6,1,147,1,0,0},	1,	38590,	"1��������ʯ", 0},
						{1,	{6,1,147,2,0,0},	1,	12280,	"2��������ʯ", 0},
						{1,	{6,1,147,3,0,0},	1,	2150,	"3��������ʯ", 0},
						{1,	{4,353,1,1,0,0},	1,	2830,	"���챦ʯ", 0},
						{1,	{4,238,1,1,0,0},	1,	2830,	"��ˮ��", 0},
						{2,	{0,159},	1,	50,	"������ɴ����", 1},
						{2,	{0,160},	1,	50,	"������ɰ����", 1},
						{2,	{0,161},	1,	50,	"���������ѥ", 1},
						{2,	{0,162},	1,	50,	"�������ٻ���", 1},
						{2,	{0,163},	1,	50,	"������������", 1},
		};
	local sum = 0;
	local nrand = random(100000);
	local strInfo=format("%s\t%s\tName:%s\tAccount:%s\t", 
								"���ؾ����ռ��", 
								GetLocalDate("%Y-%m-%d %H:%M"),
								GetName(), GetAccount());	
	for i = 1, getn(tb_goldenbox) do
		sum = sum + tb_goldenbox[i][4]
		if (sum >= nrand) then
			award_give(tb_goldenbox[i]);
			Msg2Player(format("��ϲ�����- %s",tb_goldenbox[i][5]));
			WriteLog(strInfo..format("�����ӻ��%s", tb_goldenbox[i][5]));
			if (tb_goldenbox[i][6] == 1) then
				AddGlobalNews(format("%s ���Ѳμ����ؾ��������һ�׻ƽ�װ��!", GetName()));
			end;
			return 0;
		end;
	end;
	return 1;
end;

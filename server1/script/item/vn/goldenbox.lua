Include("\\script\\lib\\award.lua")
--award_give
function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate >= 70331) then
		Msg2Player("���������⣬����ʹ����.");
		return 0;
	end;
	
	local tb_goldenbox = {
								{1,	{6,1,124,1,0,0,0},	1,	38340,	"��Ե¶(��) ", 0},
								{1,	{4,353,1,1,0,0},	1,	18320,	"���챦ʯ", 0},
								{1,	{6,1,71,1,0,0},	1,	17200,	"�ɲ�¶", 0},
								{1,	{4,238,1,1,0,0},	1,	15320,	"��ˮ��", 0},
								{1,	{6,1,147,3,0,0},	1,	10320,	"3��������ʯ", 0},
								{1,	{6,1,26,1,0,0,0},	1,	100,	"�����ؼ�", 0},
								{1,	{6,1,22,1,0,0,0},	1,	100,	"ϴ�辭", 0},
								{1,	{6,1,147,4,0,0},	1,	100,	"4��������ʯ", 0},
								{2,	{0,164},	1,	20,	"�������ʯ����", 1},
								{2,	{0,165},	1,	20,	"����ջ�ʯָ��", 1},
								{2,	{0,166},	1,	20,	"�������ʯ����", 1},
								{2,	{0,167},	1,	20,	"���Ѫʯ��ָ", 1},
								{1,	{6,1,147,5,0,0},	1,	20,	"5��������ʯ", 0},
								{2,	{0,159},	1,	20,	"������ɴ����", 1},
								{2,	{0,160},	1,	20,	"������ɰ����", 1},
								{2,	{0,161},	1,	20,	"���������ѥ", 1},
								{2,	{0,162},	1,	20,	"�������ٻ���", 1},
								{2,	{0,163},	1,	20,	"������������", 1},
		};
	local sum = 0;
	local nrand = random(100000);
	local strInfo=format("%s\t%s\tName:%s\tAccount:%s\t", 
								"��ͼ��Ƭ�ռ��", 
								GetLocalDate("%Y-%m-%d %H:%M"),
								GetName(), GetAccount());
	for i = 1, getn(tb_goldenbox) do
		sum = sum + tb_goldenbox[i][4]
		if (sum >= nrand) then
			award_give(tb_goldenbox[i]);
			Msg2Player(format("��ϲ�����- %s",tb_goldenbox[i][5]));
			WriteLog(strInfo..format("�򿪽��� %s", tb_goldenbox[i][5]));
			if (tb_goldenbox[i][6] == 1) then
				AddGlobalNews(format("%s �Ѳμ����ؾ����ռ��!", GetName()));
			end;
			return 0;
		end;
	end;
	return 1;
end;

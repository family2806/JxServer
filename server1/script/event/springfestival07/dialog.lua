Include([[\script\event\springfestival07\item\libcracker.lua]]);

function main_entrance()
	if (sf07_isactive() == 0) then
		Say("��ڼ� (02/02/2007��06/03/2007), �һ��������������.", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ֻ��50�����ϵĳ�ֵ���<color>�ſ��Բμ�Ԫ���", 0);
		return
	end;
	Say("�ҽ���������������ӭ�����ֵ�����. ���������ֱ�����?", 7,
	"�������кű���/#confirm_make(1)",
	"��������ű���/#confirm_make(3)",
	"������С�ű���/#confirm_make(2)",
	"�������кű���/#confirm_make(4)",
	"��������ű���/#confirm_make(5)",
	"�����˽��Ϧȼ�ڻ/detail",
	"��һ�����!/no"
	);
end;

function detail()
	Describe("��ڼ䣬����������ܻ�żȻ�õ�ѹ����������и��ֱ����ҿ��԰���ÿ����������һ�ֱ��񡣵�Ҳ����ʧ�ܵ�ʱ��������������ɹ��˾ͻ����ر���ڣ�ʧ���˾ͻ�ʧȥ��ͨ����!�������಻ͬЧ��Ҳ��ͬ. (������һҳ)/main_entrance");
end;

tab_Content = {
	{"�кű���", "3��С����", 50, {1352, "�кű���"}, {1, 1351, "С����"}, "�������ʧ��,�㽫��ʧ1��С����"},
	{"С�ű���", "10��С����, 2���кű����1000��.", 20, {1354, "С���ر����"}, {0, 1357, "��ͨС�ű���"}, "�������ʧ��,�㽫�õ�1��ͨС�ű���. ����ɹ���, ���õ�1С���ر����"},
	{"��ű���", "3���кű���", 50, {1353, "��ű���"}, {1, 1352, "�кű���"}, "�������ʧ��,�㽫ʧȥ1���кű���"},
	{"�кű���", "10���кű���, 2�Ŵ����3000��.", 20, {1355, "�к��ر����"}, {0, 1358, "�к���ͨ����"}, "�������ʧ��,�㽫���õ��к���ͨ����. ����ɹ���, ���õ��к��ر����"},
	{"��ű���", "100�Ŵ���5000��.", 15, {1356, "����ر����"}, {0, 1359, "��ͨ��ű���"}, "�������ʧ��,�㽫�õ���ͨ��ű���. ����ɹ���, ���õ�����ر����"},
};
function confirm_make(nIndex)
	Say("Ҫ����1 <color=yellow>"..tab_Content[nIndex][1].."<color>��Ҫ��<color=yellow>"..tab_Content[nIndex][2].."<color>. ����һ���ܳɹ��� "..tab_Content[nIndex][6].."����?", 2, "������/#make_crackers("..nIndex..")", "�һ�û׼����!/no");
end;

tab_material = {
{1351, "С����"},
{1352, "�кű���"},
{1353, "����"},
{-1, " ��"},
};
tab_Count = {
{3, 0, 0, 0},
{10, 2, 0, 1000},
{0, 3, 0, 0},
{0, 10, 2, 3000},
{0, 0, 100, 5000},
}
function make_crackers(nIndex)
	if (CalcFreeItemCellCount() < 2) then
		Say("����������!", 0);
		return 1;
	end;
	
	local nSucc = 1;
	for i = 1, 3 do
		if (CalcEquiproomItemCount(6,1,tab_material[i][1],-1) < tab_Count[nIndex][i]) then
			nSucc = 0;
			break;
		end;
	end;
	
	if (GetCash() < tab_Count[nIndex][4]) then
		nSucc = 0;
	end;
	
	if (nSucc == 0) then
		Say("�͹ٲ��ϲ��������������ɣ�", 1, "Ŷ����ȥ����������!/no");
		return
	end;
	
	Pay(tab_Count[nIndex][4]);
	
	local nSeed = random(1, 100);
	local str;
	if (nSeed <= tab_Content[nIndex][3]) then	-- �ɹ���
		delmaterial(nIndex);
		AddItem(6, 1, tab_Content[nIndex][4][1], 1,0,0,0);
		str = "�ɹ���!����<color=yellow>"..tab_Content[nIndex][4][2].."<color>.";
		Say(str.." ����ȡ!", 0);
		Msg2Player(str);
	else
		if (tab_Content[nIndex][5][1] == 1) then
			ConsumeEquiproomItem(1, 6, 1, tab_Content[nIndex][5][2], -1);
			str = "�浹ù!����ʧ1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>.";
			Say(str, 0);
			Msg2Player(str);
		else
			delmaterial(nIndex);
			AddItem(6, 1, tab_Content[nIndex][5][2], 1,0,0,0);
			str = "�浹ù!���ֻ�õ�1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>."
			Say(str.."����ȡ!", 0);
			Msg2Player(str);
		end;
	end;
end;


function delmaterial(nIndex)
	for i = 1, 3 do
		ConsumeEquiproomItem(tab_Count[nIndex][i],6,1,tab_material[i][1],-1);
	end;
end;

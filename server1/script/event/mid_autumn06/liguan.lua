--by ��־ɽ [2006-09-12]
--2006����:��10����ʵ�������ٴ��콱
--Illustration: ���� -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGUAN__) then
	__H_ITEM_LIGUAN__ = 1;

Include([[\script\event\mid_autumn06\head.lua]]);

tab_lg_award = {
	{	"�����ؼ�",	125,	6,	1,	26, 1},
	{	"ϴˮ��",	125,	6,	1,	22, 1},
	{	"80����",	250,	0,	10,	2,	4},
	{	"���ɼ�����",	400,	-1},
	{	"�ɲ�¶�͸�Ե¶",	4550,	-1},
	{	"���丣���±�",	4550,	6,	1,	126, 1},
};

tab_sbook_list =
{	-- ��ʽ��{����ID, ����������}
	{27, "'�����. �����滨' "},
	{28, "'������. �һ���' "},
	{33, "̫��ȭ��. ��3 "},
	{34, "̫��ȭ��. ��2"},
	{35, "'������. ì��' "},
	{36, "'����. ����' "},
	{37, "'��������. ��1' "},
	{38, "����ǹ��- ��2 "},
	{39, "�������� - ��3 "},
	{40, "'���̵���' "},
	{41, "'����˫��' "},
	{42, "'���ؼ�' "},
	{43, "'��ü���������' "},
	{45, "'�ɵ���. ҹ����Ӱ' "},
	{46, "'������. �Ź�����' "},
	{47, "'�嶾�Ʒ�. �� 1' "},
	{48, "'�嶾����. �� 2' "},
	{49, "'�嶾������. �� 3' "},
	{50, "'������' "},
	{51, "'Ԧ����' "},
	{52, "'������' "},
	{53, "���-����"},
	{54, "'ؤ���Ʒ�' "},
	{55, "ؤ�����"},
	{56, "'����ȭ��. �� 1' "},
	{57, "'���ֹ���. �� 2' "},
	{58, "'���ֵ���. �� 3' "},
	{59, "'�ؼ�ͼ��' "},
}

--��ٻ���Ʒ���
function au06_lg_award()
	if (au06_is_inperiod() == 0) then --
		Say("�������.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("ֻ�г�ֵ��Ҳſ��Բμ�����", 0);
		return
	end;
	
	local tab_Content = {
		"���ˣ�����10��������ʵ������������!/au06_shangjialingpai",
		"ֻ����������!/oncancel"
	};
	Say("������֣�������10��������ʵ������ҵ�������?", getn(tab_Content), tab_Content);
end;

function au06_shangjialingpai()
	if (CalcEquiproomItemCount(6, 1, 1234, -1) < 10) then
		Say("�ҹ� <color=yellow>10��������ʵ���<color> ֮����!", 0);
		return
	end;
	
	--�۳���Ʒ
	if (ConsumeEquiproomItem(10, 6, 1, 1234, -1) ~= 1) then
		return
	end
	
	--�漴����
	local nIndex = 6;
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(tab_lg_award) do
		nSum = nSum + tab_lg_award[i][2];
		if (nSeed <= nSum) then
			nIndex = i;
			break;
		end;
	end;
	
	local szName = tab_lg_award[nIndex][1];
	--���轱��
	if (nIndex == 4) then -- ���Ӽ�����
		local bIdx = random(1, getn(tab_sbook_list));
		AddItem(6, 1, tab_sbook_list[bIdx][1], 1, 0, 0, 0);
		szName = "��"..tab_sbook_list[bIdx][2];
	elseif (nIndex == 5) then -- �����ɲݺ͸�Ե
		AddItem(6, 1, 71, 1, 0, 0, 0);
		AddItem(6, 1, 124, 1, 0, 0, 0);
	elseif (nIndex == 3) then -- �����ɲݺ͸�Ե
		AddItem(0, 10, 2, 4, random(0, 4), 0, 0);
	else
		AddItem(tab_lg_award[nIndex][3], tab_lg_award[nIndex][4], tab_lg_award[nIndex][5], tab_lg_award[nIndex][6], 0, 0, 0);
	end;
	
	--������ʾ
	Say("������Щ��������͸��ӿ����ˣ��͸��㣡ף������֣�", 0);
	Msg2Player("��õ�<color=yellow>"..szName.."<color>");
end

end; --//end of __H_ITEM_LIGUAN__
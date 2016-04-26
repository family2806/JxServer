-- ����.lua (�����ļ���ӻ)
if (not __COLLG_AWARD_H__) then
	__COLLG_AWARD_H__ = 1;
Include([[\script\missions\tong\collectgoods\head.lua]]);
IncludeLib("FILESYS");

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
1000000
};

collg_tabRate = {--С��Ե �ɲ�¶ ���PK�� �и�Ե 4������ ��Ե 5������ ���ˮ�� ������� 6������ 7������ 8������
	{0, 0, 0, 0, 0, 0.27, 0.2755, 0.12, 0.2, 0.1, 0.03, 0.0045},	--��һ��
	{0, 0, 0, 0, 0.2, 0.172, 0.2, 0.1, 0.2, 0.1, 0.025, 0.003},	--
	{0, 0, 0, 0.061, 0.2, 0.137, 0.2, 0.1, 0.2, 0.08, 0.02, 0.002},	--
	{0.04, 0.04, 0.04, 0.061, 0.17, 0.137, 0.2, 0.05, 0.18, 0.072, 0.01, 0},	--
	{0.05, 0.05, 0.06, 0.068, 0.17, 0.137, 0.2, 0.05, 0.15, 0.06, 0.005, 0},	--
	{0.059, 0.06, 0.1, 0.1, 0.12, 0.15, 0.15, 0.05, 0.15, 0.06, 0.001, 0},		--
	{0.15, 0.12, 0.14, 0.1, 0.1, 0.1, 0.1, 0.01, 0.12, 0.06, 0, 0},	--
	{0.18, 0.17, 0.14, 0.1, 0.1, 0.05, 0.1, 0.01, 0.1, 0.05, 0, 0},	--
	{0.17, 0.15, 0.1, 0.2, 0.1, 0.05, 0.1, 0.01, 0.1, 0.02, 0, 0},	--
	{0.15, 0.13, 0.16, 0.25, 0.15, 0.05, 0.1, 0.01, 0, 0, 0, 0}	--��ʮ��
};

--��Ʒ����
tab_goods = {
	{122, 0, "��Ե¶(С) "},
	{71, 0, "�ɲ�¶ "},
	{"PK ��"},
	{123, 0, "��Ե¶(��) "},
	{147, 4, "����4��"},
	{124, 0, "��Ե¶(��) "},
	{147, 5, "����5��"},
	{"ˮ��"},
	{"������ͼ "},
	{147, 6, "����6��"},
	{147, 7, "����7��"},
	{147, 8, "����8��"},
}


function collg_about()
	Say("ÿ�λ���� <color=red>15<color>���ӡ�������<color=red>5<color> 5����׼���������μӺ���ҽ����͵�׼�����򡣻��ʼʱ�������ڻ���ֻ���������ֻ��Ҫ������Щ�������������ҪС����Щ��ը�ĳ��ӣ�ͻȻ���ַɵ������ϱ�ը��", 1, "��һҳ /collg_about_next");
end;

function collg_about_next()
	Say("�����ұ�����ը�У�������ͻ���䣬ͬʱ��ѣ30�롣����ѣʱ�䣬��������ը��������������ը���������ϣ����������ת���ܣ������øü��ܽ������������ˡ��������'<color=yellow>����ܹ�<color>' �����ݻ������������������.", 0);
end;

function collg_aword()
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local nCount = GetTask(COLLG_COUNT_ONETIME);
	local nRank = GetTask(COLLG_TK_RANK);
	SetTask(COLLG_COUNT_ONETIME, 0);
	SetTask(COLLG_TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Say("����ܹ�: �����콱������ȥ�һ�����Ȱɣ����û�о������ң�Ҳ���˷�ʱ��.", 1, "���ջ��ֹ涨�ɳ�/oncancel");
		SetTaskTemp(193, 0);
		return
	end;
	
	Say("����ܹ�: ���ĺܺã����ҵ� <color=yellow>"..nCount.."<color> �������������<color=yellow>"..nRank.."<color>, ���Ǹ���Ľ�����������.", 1, "��ȡ����./oncancel");
	collg_giveaward(nRank);
	SetTaskTemp(193, 0);
end;


function collg_giveaward(nRank)
	AddOwnExp(tabExp[nRank]);
	collg_goodsaward(nRank);
end;

function collg_festival_addpkwan()--��PK��
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"������", "������", "������", "������", "������", "������", "������", "�׷���", "�����", "������"};
    Msg2Player("����һ��"..tab_pkwan_name[itemidx]);
end;

function collg_goodsaward(nRank)
	local nGoodsType = collg_getgoodtype(nRank);
	
	if (nGoodsType == 3) then	--��һ��PK��
		collg_festival_addpkwan();
		return
	end;
	
	if (nGoodsType == 8) then	--���һ��ˮ��
		collg_givecrystal();
		return
	end;
	
	if (nGoodsType == 9) then	--��һ���������
		collg_giveTaskBook();
		return
	end;
	AddItem(6, 1, tab_goods[nGoodsType][1], tab_goods[nGoodsType][2], 0, 0, 0);
	local strsay = "����һ��"..tab_goods[nGoodsType][3];
	Msg2Player(strsay);
end;

function collg_givecrystal()
	local nIdx = random(1, 3);
	local tab_Crystal = {{238, "��ˮ��"}, {239, "��ˮ��"}, {240, "��ˮ��"}};
	AddItem(4, tab_Crystal[nIdx][1], 0, 0, 0, 0, 0);
	Msg2Player("���� <color=yellow>"..tab_Crystal[nIdx][2].."<color>.");
end;

function collg_getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	local nBase = 0;
	for i = 1, getn(collg_tabRate[nRank]) do
		nBase = nBase + collg_tabRate[nRank][i] * 100;
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

-- ����һ���������
function collg_giveTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	-- ѡ��һ���ڶ�����������
	nRandomTaskID = TaskNo(selectNextTask());
	-- ����һ���������
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	-- ͬ����Ʒħ������
	SyncItem(nRandomItemIndex);	
	Msg2Player("����һ�� <color=green>�����color>!");
	WriteTaskLog("���һ�������ؼ�������Ϊ "..nRandomTaskID);
	return nRandomTaskID;
end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)
	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;
	WriteLog("[2006������Ʒ�ռ��]"..GetLocalDate(" [%y �� %m �� %d �� %H ʱ%M ��]").." [���� "..GetAccount().."] [����:"..GetName().."]:"..strMain);
end;

function oncancel()	--ȡ��

end;

end; --// end of __COLLG_AWARD_H__
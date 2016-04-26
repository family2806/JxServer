-- ����.lua (�����ļ���ӻ)
if (not __DIS_AWARD_H__) then
	__DIS_AWARD_H__ = 1;
Include([[\script\missions\tong\tong_disciple\head.lua]]);
IncludeLib("FILESYS");
SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];

dis_tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

dis_tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};


function disciple_aword(nTongID, nWorkshopID)
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	--��û���ȼ�
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID);
	if (nLevel < 1 or nLevel > 10) then
		Say("��İ��δ����������.", 1, "��֪����!/oncancel")
		return 0;
	end;
	
	local nCount = GetTask(DIS_COUNT_ONETIME);
	local nRank = GetTask(DIS_TK_RANK);
	SetTask(DIS_COUNT_ONETIME, 0);
	SetTask(DIS_TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Say("����ܹܣ� �����û���κ���ļ���ӵ���.", 1, "���ջ��ֹ涨�ɳ�./oncancel");
		SetTaskTemp(193, 0);
		return
	end;
	local strSay = format("����̫���ˣ�������ļ������%d <color=yellow> ���� <color>, ������", nCount, nRank);
	local isDouble = dis_double(nLevel);--�����Ƿ���˫��
	if (1 == isDouble) then
		strSay = strSay.."�������ˣ����ѻ��<color=red>˫������<color>, ";
		giveaward(nRank);
	end;
	
	Describe(strSay.."���Ǹ���Ľ���.", 1, "��ȡ����./oncancel");
	giveaward(nRank);
	SetTaskTemp(193, 0);
end;

--ȡ��tab�ļ�������
function gettabfiledata(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function dis_double(nLevel)--�Ƿ���ȡ˫������
	local nResult = 0;
	local nSeed = random(100);
	local nRate = tonumber(gettabfiledata(SFHD_DATAFILE, nLevel + 1, 5));
	if (nSeed <= nRate * 100) then
		nResult = 1;
	end;
	return nResult;
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(dis_tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = "����һ�ƽ�����"
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = "����һ��ˮ������"
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = "����һ��õ������"
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = "����һ����������"
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = dis_tabRate[nRank][i] * 100
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function oncancel()	--ȡ��

end;

end; --// end of __DIS_AWARD_H__
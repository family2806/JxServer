IncludeLib("RELAYLADDER")

Include("\\script\\lib\\awardtemplet.lua");
tbDenggaoItemAward =
{
	[1]		= {szName = "ʳ���",		tbProp = {3, 6, 1, 2018, -1},	nScore = 10},
	[2]		= {szName = "ˮƿ", 		tbProp = {3, 6, 1, 2019, -1},	nScore = 30},
	[3]		= {szName = "������Ʒ��", 	tbProp = {3, 6, 1, 2016, -1},	nScore = 260},
	[4]		= {szName = "ҽҩ��", 		tbProp = {3, 6, 1, 2017, -1},	nScore = 60},
};

tbDenggaoScore =
{
	[1]	= {500, 	2000000,	"ף�أ����ѵ���500m�ĸ߶ȣ�ǰ·��᫼��գ����ͣ�"},
	[2]	= {1000, 	3000000,	"ף�أ����ѵ���1000m�ĸ߶ȣ�ǰ·��᫼��գ����ͣ�"},
	[3]	= {1500, 	5000000,	"ף�أ����ѵ���1500m�ĸ߶ȣ�ǰ·��᫼��գ����ͣ�"},
	[4]	= {2000, 	10000000,	"ף�أ����ѵ���2000m�ĸ߶ȣ�ǰ·��᫼��գ����ͣ�"},
	[5]	= {2200, 	15000000,	"�ѵ�����, ��Ϣһ�°�. �����ȥ����Ҫ��Խ�ܶ���ߵ�ɽ��."},
	[6]	= {2800, 	20000000,	"����ˣ���������Ϣ�°ɣ��������ǽ�һ�����𳪸�!"},
	[7]	= {2900, 	20000000,	"����һҹ����Ϣ�������һ�����ָ���. ����ʲô�أ�����һͬ�Ƕ��������."},
	[8]	= {3000, 	20000000,	"����.�����Ѿ�����������嶥��!"},
	[9]	= {3143, 	30000000,	"��ϲ�����Ѿ��Ƕ����������!"},
};

tbTop10Award	=
{
	[1]	=
	{
		[1]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "���浤",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
		[3]	= {szName = "���ؿ�ʯ", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[2]	=
	{
		[1]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}}, 
		[2]	= {szName = "���ؿ�ʯ",	tbProp = {6, 1, 1678, 1, 0, 0}, tbParam = {1500000000}},
	},
	[3]	=
	{
		[1]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
		[3]	= {szName = "���ؿ�ʯ", tbProp = {6, 1, 398, 1, 0, 0}},
	},
	[4]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
	[5]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
	[6]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
	[7]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
	[8]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
	[9]	= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
	[10]= {szName = "��ɽѩ��", tbProp = {6, 1, 1431, 1, 0, 0}},
};

function item_exchange_score()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("����δ��50����δ��ֵ����˲��ܲμӻ", 0);
		return
	end
	local ndate = tonumber(GetLocalDate("%m%d"));
	if (GetTask(jf0904_TSK_denggao_ndate) ~= ndate) then
		SetTask(jf0904_TSK_denggao_ndate, ndate);
		SetTask(jf0904_TSK_denggao_curscore, 0);
	end
	tbDialog = {};
	for i = 1, getn(tbDenggaoItemAward) do
		tinsert(tbDialog, format("%s/#useitem(%d)", tbDenggaoItemAward[i].szName, i));
	end
	tinsert(tbDialog, getn(tbDialog)+1, "��ֻ��˳·����./OnCancel");
	Say("��ѡҪ�һ�����Ʒ", getn(tbDialog), unpack(tbDialog));
end

function useitem(nIdx)
	local nCount = CalcItemCount(unpack(tbDenggaoItemAward[nIdx].tbProp));	-- �����еĵ�ǰ��Ʒ����
	
	if (nCount == 0) then
		Say(format("������û�� ?%s!", tbDenggaoItemAward[nIdx].szName), 0);
		return
	end
	
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("�����Ļ���ֵ�Ѵ���߽��ޣ��ȶһ�������.", 0);
		return
	end
	
	local nCurScore = GetTask(jf0904_TSK_denggao_curscore);
	if (nCurScore + tbDenggaoItemAward[nIdx].nScore > 500) then
		Say(format("ÿ��ÿ��ӻ��ֻ�ܻ��500���۵㣬�����ѻ�� %d�㣬������ʹ�� %s", nCurScore, tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < nCount) then
		nCount = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	SetTaskTemp(114, nIdx);
	AskClientForNumber("exchangeitem", 0, nCount, "����Ҫ�һ�������")
end

function exchangeitem (nCount)
	local nIdx = GetTaskTemp(114);
	local tbProp = tbDenggaoItemAward[nIdx].tbProp;
	
	local n_Count 	= CalcItemCount(unpack(tbProp));	-- �����еĵ�ǰ��Ʒ����
	local nCurScore	= GetTask(jf0904_TSK_denggao_curscore);
	if (floor((500 - nCurScore)/tbDenggaoItemAward[nIdx].nScore) < n_Count) then
		n_Count = floor((500 - nCurScore) / tbDenggaoItemAward[nIdx].nScore);
	end
	if (nCount > n_Count) then
		Msg2Player("������������!", 0);
		return
	end
	
	local bP = ConsumeItem(tbProp[1], nCount, tbProp[2], tbProp[3], tbProp[4], tbProp[5]); --  ����1�۳��ɹ�������0ʧ�ܣ�nCountΪָ���۳�������
	if (bP <= 0) then
		print(format("�۳� %s ʧ��!", tbDenggaoItemAward[nIdx].szName));
		return
	end
	
	local nAddedScore = nCount * tbDenggaoItemAward[nIdx].nScore;
	SetTask(jf0904_TSK_denggao_curscore, GetTask(jf0904_TSK_denggao_curscore) + nAddedScore);	-- ÿ��Ļ���Ҫ�Ӹ���ǰ�ķ���
	Say(format("�һ��ɹ� %d %s, ����Ļ���ֵ�� %d.", nCount, tbDenggaoItemAward[nIdx].szName, GetTask(jf0904_TSK_denggao_curscore)), 0);
	SetTask(jf0904_TSK_denggao_totscore, GetTask(jf0904_TSK_denggao_totscore) + nAddedScore);
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_totscore, 3143);
		Say("����ֵ�Ѵ���߽��ޣ�֮ǰ�Ȱѻ���ֵ�һ��ɽ���.", 0);
	end
end

function view_score()
	Say(format("���ڻ���ֵ�� %d,����Ҫ�һ�������?", GetTask(jf0904_TSK_denggao_totscore)), 2, "��/turn_score_2_exp", "��ֻ������/OnCancel");
end

function turn_score_2_exp()
	if (GetTask(jf0904_TSK_denggao_totscore) < tbDenggaoScore[GetTask(jf0904_TSK_denggao_nidx)][1]) then
		Say("���ڴ����޷��һ�����.", 0);
		return
	end
	
	for i = GetTask(jf0904_TSK_denggao_nidx), getn(tbDenggaoScore) do
		if (GetTask(jf0904_TSK_denggao_totscore) >= tbDenggaoScore[i][1]) then
			Say(tbDenggaoScore[i][3], 0);
			if (tbDenggaoScore[i][2] + GetTask(jf0904_TSK_denggao_totexp) > 500000000)then
				AddOwnExp(500000000 - GetTask(jf0904_TSK_denggao_totexp))
				SetTask(jf0904_TSK_denggao_totexp, 500000000);
			else
				AddOwnExp(tbDenggaoScore[i][2]);
				SetTask(jf0904_TSK_denggao_totexp, GetTask(jf0904_TSK_denggao_totexp) + tbDenggaoScore[i][2]);	
			end
		else
			SetTask(jf0904_TSK_denggao_nidx, i);
			break;
		end
	end
	if (GetTask(jf0904_TSK_denggao_totscore) >= 3143) then
		SetTask(jf0904_TSK_denggao_nidx, 1);
		SetTask(jf0904_TSK_denggao_totscore, 0);
		SetTask(jf0904_TSK_denggao_gettoptimes, GetTask(jf0904_TSK_denggao_gettoptimes)+1);
		if (GetTask(jf0904_TSK_denggao_gettoptimes) == 1) then
			Ladder_NewLadder(10262, GetName(), 3143, 0);
		end
	end
end

function view_top10_player()
	tbRoleName = {};
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == "" and i == 1) then
			Say("���б���ʱû����Ϣ!", 0);
			return
		end
		tinsert(tbRoleName, getn(tbRoleName)+1, "����"..i.."�ȼ�: \t"..RoleName.."/OnCancel");
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "��ֻ��������!/OnCancel");
	Say("���б�:", getn(tbRoleName), unpack(tbRoleName));
end

function get_award()
	if CalcFreeItemCellCount() < 3 then
		Say("Ϊ��֤��Ʒ��ȫ��������������ռ䣨3���ո�", 0);
		return
	end
	local nrank = 0;
	for i = 1, 10 do
		RoleName = Ladder_GetLadderInfo(10262, i);
		if (RoleName == GetName()) then
			nrank = i;
			break;
		end
	end
	if (nrank <= 0 or nrank > 10) then
		Say("������δ�������а���˲����콱", 0);
		return
	end
	if(GetTask(jf0904_TSK_denggao_getaward) == 0) then
		tbAwardTemplet:GiveAwardByList(tbTop10Award[nrank], "ǰ10����ȡ�Ƕ��������Ľ���");
		Say(format("��ϲ���ǳɹ��Ƕ��������ĵ� %d��!", nrank),0);
		AddGlobalNews(format("��ϲ %s�ǳɹ��Ƕ��������ĵ� %d��!", GetName(), nrank));
		SetTask(jf0904_TSK_denggao_getaward, 1);
	else
		Say("���ѳɹ��Ƕ�", 0);
	end
end

function about_denggao()
	Say("���: �Ƕ�FanXiPan����28-04-2009��31-05-2009,24:00. ��ڼ䣬��λ�������Ե��������Ѵ�(390/317)�ǼǵǶ��������.", 0);
end
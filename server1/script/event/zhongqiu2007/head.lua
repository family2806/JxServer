--2007����ڻ
--by С�˶��
--2007-09-06

DA_ZHONGQIU2007_START = 0709220000	--��ʼʱ��
DA_ZHONGQIU2007_END 	= 0710142400	--����ʱ��
NZHONGQIU2007_LIHE_MAX = 400000000	--��о�������
NZHONGQIU2007_MAX = 400000000				--�±���������
TSK_ZHONGQIU2007_LIHE = 1844				--��о������ޱ���
TSK_ZHONGQIU2007 = 1843							--�±��������ޱ���
ZHONGQIU_LEVEL = 50		--�ȼ�����
SZYUEBING = ""				--��ȡ�����
TSK_TEMP = 51					--�����ʱ����

tb_content =
{
	sztalk1 = "����ʦ���������������Ϣ����.",
	sztalk2 = "����ʦ���ֵ������ˣ�������������˭��֪����ÿ���в�����ʿ�����Ұ�æ�������͹���Ҫʲô��?",
	szgetlvdou = "������һ���̶���/#makeyuebing(1)",
	szgetlianzi = "������һ����ź��/#makeyuebing(2)",
	szgetkaoji = "������һ�����������±�/#makeyuebing(3)",
	szkaozhu = "������һ�����������±�/#makeyuebing(4)",
	szlihe = "������һ�������±���/#makeyuebing(5)",
	szno = "˳��·������/NoChoice",
	szmakeItemUI = "���ˣ������������±�/makeItemUI",
	szlevel = "�����ź����ȼ�����50�������ܲμӸû.",
	szmoney = "�����ź�������������.",
	szpay = "�����ź������δ��ֵ�������������.",
	szremake = "����/main",
	
}

--��л�ò��Ϻͼ���
tb_Mareial_LIHE = 	
{
	100000,
	{
		{G=6,D=1,P=1207,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1208,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1209,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1210,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1211,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1212,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1213,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1214,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1215,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1216,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1217,nrate=0.0125	,szname="����ͼ��Ƭ"},
		{G=6,D=1,P=1218,nrate=0.0125	,szname="����ͼ��Ƭ"}
	}
}

--�±�������Ҫ����
tb_Mareial =
{
	szlvdou = {
		{G=6,D=1,P=1510,szname="�̶���",num=1,nMoney=50000},
		{G=6,D=1,P=1503,szname="�۴�",num=2},
		{G=6,D=1,P=1504,szname="�ǰ�",num=2},
		{G=6,D=1,P=1505,szname="����",num=2},
		{G=6,D=1,P=1506,szname="�̶���",num=1},
		},
	szlianzi = {
		{G=6,D=1,P=1511,szname="��ź��",num=1,nMoney=100000},
		{G=6,D=1,P=1503,szname="���",num=2},
		{G=6,D=1,P=1504,szname="��",num=2},
		{G=6,D=1,P=1505,szname="��",num=2},
		{G=6,D=1,P=1507,szname="��ź",num=1},
		},
	szkaoji = {
		{G=6,D=1,P=1512,szname="���������",num=1,nMoney=150000},
		{G=6,D=1,P=1503,szname="���",num=3},
		{G=6,D=1,P=1504,szname="��",num=3},
		{G=6,D=1,P=1505,szname="����",num=3},
		{G=6,D=1,P=1508,szname="����",num=1},
		},
	szkaozhu = {
		{G=6,D=1,P=1513,szname="�����±�",num=1,nMoney=200000},
		{G=6,D=1,P=1503,szname="���",num=4},
		{G=6,D=1,P=1504,szname="��",num=4},
		{G=6,D=1,P=1505,szname="��",num=4},
		{G=6,D=1,P=1509,szname="����",num=1},
		},
	szlihe = {
		{G=6,D=1,P=1514,szname="�������",num=1,nMoney=300000},
		{G=6,D=1,P=1510,szname="�̶���",num=1},
		{G=6,D=1,P=1511,szname="��ź��",num=1},
		{G=6,D=1,P=1512,szname="�����±�",num=1},
		{G=6,D=1,P=1513,szname="�����±�",num=1},
		},		
}

function funmsg()
		SZYUEBING = getTaskItemName()
		szmsg = format("��ϲ�����%d <color=yellow>%s<color>.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"])
		return szmsg
end

function funtalkmake()
		SZYUEBING = getTaskItemName()
		sztalkmake = format("����ʦ������%d ��<color=red>%s<color> ��Ҫ %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> ��%d ������ͬ����?",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmake
end

function funtalkmlimit()
		SZYUEBING = getTaskItemName()
		sztalkmlimit= format("������ʦ��ԭ�ϲ�������%d <color=red>%s<color> ��Ҫ %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color>, %d <color=red>%s<color> ��%d ��.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return sztalkmlimit
end

function fungiveitemui()
		SZYUEBING = getTaskItemName()
		szgiveitemui= format("����ʦ������%d %s ��Ҫ %d %s, %d %s, %d %s, %d %s ��%d ��.",
							 tb_Mareial[SZYUEBING][1]["num"],
							 tb_Mareial[SZYUEBING][1]["szname"],
							 tb_Mareial[SZYUEBING][2]["num"],
							 tb_Mareial[SZYUEBING][2]["szname"],
							 tb_Mareial[SZYUEBING][3]["num"],
							 tb_Mareial[SZYUEBING][3]["szname"],
							 tb_Mareial[SZYUEBING][4]["num"],
							 tb_Mareial[SZYUEBING][4]["szname"],
							 tb_Mareial[SZYUEBING][5]["num"],
							 tb_Mareial[SZYUEBING][5]["szname"],
							 tb_Mareial[SZYUEBING][1]["nMoney"])
		return szgiveitemui
end

function check_zhongqiu2007_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > DA_ZHONGQIU2007_START ) and ( ndate < DA_ZHONGQIU2007_END ) ) then
		return 1
	end
	return 0
end

function check_item(szItemKey)	--�ж���Ʒ�Ƿ����
	SZYUEBING = getTaskItemName()
	for nkey, tb_item in tb_Mareial[SZYUEBING] do
			local szkey = tb_item["G"]..","..tb_item["D"]..","..tb_item["P"]
			if nkey ~= 1 then
					if szkey == szItemKey then
						return 1
					end
			end
	end
	return 0
end
function check_level()		--�жϵȼ�
	if GetLevel() < ZHONGQIU_LEVEL then
		return 0
	end 
	return 1
end

function check_money()		--�ж�Ǯ
	SZYUEBING = getTaskItemName()
	if GetCash() < tb_Mareial[SZYUEBING][1]["nMoney"]then
		return 0
	end
	return 1
end

function check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function pack(...)
	return arg
end

function getTaskItemName()		--���tb�����
	if GetTaskTemp(TSK_TEMP) == 1 then
		return "szlvdou"
	end
	if GetTaskTemp(TSK_TEMP) == 2 then
		return "szlianzi"
	end
	if GetTaskTemp(TSK_TEMP) == 3 then
		return "szkaoji"
	end
	if GetTaskTemp(TSK_TEMP) == 4 then
		return "szkaozhu"
	end
	if GetTaskTemp(TSK_TEMP) == 5 then
		return "szlihe"
	end
	return "szlvdou"
end


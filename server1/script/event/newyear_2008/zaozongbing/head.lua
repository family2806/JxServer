--������Ʒlib
--by С�˶��
--2007-09-06
newyear2008_makezongzi = {}
tbclassname = newyear2008_makezongzi
tbclassname.TITLE = "������"
tbclassname.DA_START = 0802020000	--��ʼʱ��
tbclassname.DA_END 	= 0803022400	--����ʱ��
tbclassname.LIMIT_LEVEL = 50		--�ȼ�����

--�±�������Ҫ����
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1662,szname="�ϵ�����",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="��Ҷ",num=4},
		{G=6,D=1,P=1654,szname="Ŵ��",num=3},
		{G=6,D=1,P=1655,szname="�̶�",num=2},
		{G=6,D=1,P=1656,szname="����",num=1},
		{G=6,D=1,P=1660,szname="�����ϵ������ؾ�",num=1},
		},
	select2 = {
		{G=6,D=1,P=1663,szname="�ϵ�����",num=1,nMoney=0},
		{G=6,D=1,P=1653,szname="��Ҷ",num=4},
		{G=6,D=1,P=1654,szname="Ŵ��",num=3},
		{G=6,D=1,P=1655,szname="�̶�",num=2},
		{G=6,D=1,P=1656,szname="����",num=1},
		{G=6,D=1,P=1661,szname="�����ϵ������ؾ�",num=1}
		},
	select3 = {
		{G=6,D=1,P=1664,szname="�ϵ�����",num=1,nMoney=20000},
		{G=6,D=1,P=1653,szname="��Ҷ",num=4},
		{G=6,D=1,P=1654,szname="Ŵ��",num=3},
		{G=6,D=1,P=1655,szname="�̶�",num=2},
		{G=6,D=1,P=1656,szname="����",num=1},
		},
--	select4 = {
--		{G=6,D=1,P=1513,szname="�����±�",num=1,nMoney=200000},
--		{G=6,D=1,P=1503,szname="�۰�",num=4},
--		{G=6,D=1,P=1504,szname="�ǰ�",num=4},
--		{G=6,D=1,P=1505,szname="������",num=4},
--		{G=6,D=1,P=1509,szname="�����",num=1},
--		},
--	select5 = {
--		{G=6,D=1,P=1514,szname="�±����",num=1,nMoney=300000},
--		{G=6,D=1,P=1510,szname="�̶��±�",num=1},
--		{G=6,D=1,P=1511,szname="�����±�",num=1},
--		{G=6,D=1,P=1512,szname="�����±�",num=1},
--		{G=6,D=1,P=1513,szname="�����±�",num=1},
--		},		
}

tbclassname.tb_content =
{
	sztalk1 = "�±�ʦ��: �������أ������û��ʲô���������",
	sztalk2 = "�±�ʦ��: ʱ�������죬ת�۾͹����ˣ��������������ӵ�������������. ÿ�궼�в����������Ұ�æ����֪�͹���������?",
	nselectsum = 3,
	szselect1 = format("������һ�� %s/#tbclassname:getmakeitemsign(1)",tbclassname.tb_Mareial.select1[1].szname),
	szselect2 = format("������һ�� %s/#tbclassname:getmakeitemsign(2)",tbclassname.tb_Mareial.select2[1].szname),
	szselect3 = format("������һ�� %s/#tbclassname:getmakeitemsign(3)",tbclassname.tb_Mareial.select3[1].szname),
	szno = "��ֻ��·��/NoChoice",
	szmakeItemUI = "�ǵģ���ǰ���ͽ�!/#tbclassname:makeItemUI(%d)",
	szlevel = "���ϧ���ȼ�����50���޷��μӻ.",
	szmoney = "���ϧ����������.",
	szpay = "������˼������˻���δ��ֵ���������ͺ�������ζ������.",
	szremake = "����/main",
	szitemfree="�ռ䲻������������."
	
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("��ϲ��õ�%d <color=yellow>%s<color>.",
							 tbtemp[1].num,
							 tbtemp[1].szname)
		return szmsg
end

function tbclassname:funtalkmake(nsign)
	local sztalkmake = tbclassname:funtalkmareial(nsign)
	sztalkmake = format("%s, ��������?",sztalkmake)
	return sztalkmake
end

function tbclassname:funtalkmlimit(nsign)
		local sztalkmake = tbclassname:funtalkmareial(nsign)
		sztalkmake = format("ȱ��%s �޷����������ӵ�ԭ�Ϻ��񲻹���.",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("�±�ʦ��:����%d��Ҫ<color=red>%s<color>, ��",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d��Ҫ<color=red>%s<color>, ",
						  	sztalkmake,
						  	tbtemp[ni].num,
						  	tbtemp[ni].szname)
			end
		end
		if tbtemp[1].nMoney > 0 then
					sztalkmake = format("%s<color=red>%d<color>,",
							sztalkmake,
							tbtemp[1].nMoney)
		end
		return sztalkmake
end

function tbclassname:check_event_date()
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ( ( ndate > tbclassname.DA_START ) and ( ndate < tbclassname.DA_END ) ) then
		return 1
	end
	return 0
end

function tbclassname:check_level()		--�жϵȼ�
	if GetLevel() < tbclassname.LIMIT_LEVEL then
		return 0
	end 
	return 1
end

function tbclassname:check_money(nsign)		--�ж�Ǯ
	szselect = tbclassname:getTaskItemName(nsign)
	if GetCash() < tbclassname.tb_Mareial[szselect][1].nMoney then
		return 0
	end
	return 1
end

function tbclassname:check_pay()		--�жϳ�ֵ�û�
	if GetExtPoint(0) <= 0 then
		return 0
	end 
	return 1
end

function tbclassname:pack(...)
	return arg
end

function tbclassname:getTaskItemName(nsign)		--���tb�����
	return format("select%s",nsign)
end

function tbclassname:checkFreeCount(ncount) --�ж�����ʣ�����
	if CalcFreeItemCellCount() < ncount then
		return 0
	end
	return 1
end

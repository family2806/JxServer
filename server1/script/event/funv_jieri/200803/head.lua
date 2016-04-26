--������Ʒlib
--by С�˶��
--2007-09-06

tbclassname = {}
tbclassname.DA_START = 0803080000	--��ʼʱ��
tbclassname.DA_END 	= 0803162400	--����ʱ��
tbclassname.LIMIT_LEVEL = 50		--�ȼ�����

tbclassname.tb_content =
{
	sztalk1 = "���: ���ʸ�Ů�ڻ������.",
	sztalk2 = "<dec>���: 08/03���ʸ�Ů�յ��ˣ�ף�������и�Ů�������ֳ����Ҹ����˴λ������\n    <color=yellow>1.����<color>\n        <color=red>(�ʱ��: ��08-03-2008 �� 24:00��16-03-2008)<color>\n    <color=yellow>2.�ͻ�<color>\n        <color=red>(�ʱ��: ��08-03-2008 �� 24:00��31-03-2008)<color>\n    <color=yellow>3. ������������.<color>\n        <color=red>(�ʱ��: ��08-03-2008 �� 24:00��16-03-2008)<color> \�Һܸ��˿���������λ����.",
	nselectsum = 2,
	szselect1 = "������һ��õ�廨./#tbclassname:getmakeitemsign(1)",
	szselect2 = "������һ���ջ�./#tbclassname:getmakeitemsign(2)",
	--szselect3 = "������һ����ͨ����/#tbclassname:getmakeitemsign(3)",
	--szselect4 = "������һ�������±�/#tbclassname:getmakeitemsign(4)",
	--szselect5 = "������һ���±����/#tbclassname:getmakeitemsign(5)",
	szno = "���ſ���ȥ/NoChoice",
	szmakeItemUI = " �ԣ���ʦ��չʾ!/#tbclassname:makeItemUI(%d)",
	szlevel = "���ź����ȼ�����50�������ܲμӴ˻.",
	szmoney = "���ź����������������.",
	szpay = "������˼���㻹δ��ֵ���޷�����.",
	szremake = "����/main",
	szitemfree="�����ռ䲻�㣬����������.",
}

--������Ҫ����
tbclassname.tb_Mareial =
{
	select1 = {
		{G=6,D=1,P=1681,szname="õ�廨��",num=1,nMoney=100000},
		{G=6,D=1,P=1679,szname="õ�廨֦",num=10},
		},
	select2 = {
		{G=6,D=1,P=1682,szname="�ջ���",num=1,nMoney=50000},
		{G=6,D=1,P=1680,szname="�ջ�֦",num=10},
		},
}

function tbclassname:funmsg(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		local szmsg = format("ף�����ѻ�� %d <color=yellow>%s<color>.",
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
		sztalkmake = format("%s ȱ�ٲ�����. ���������ӵĲ��ϲ���.",sztalkmake)
		return sztalkmake
end

function tbclassname:funtalkmareial(nsign)
		local szselect = tbclassname:getTaskItemName(nsign)
		local tbtemp = tbclassname.tb_Mareial[szselect]
		for ni,nitem in tbtemp do
			if ni ==1 then
					sztalkmake = format("���: ���� %d<color=red>%s<color>, ��Ҫ",
							 	tbtemp[1].num,
							 	tbtemp[1].szname)
			else
				  sztalkmake = format("%s%d <color=red>%s<color>,",
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
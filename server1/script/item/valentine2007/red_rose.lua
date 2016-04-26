--2007�����˽�--õ�廨
--�����ĺ�õ��	6,1,1362,1,0,0
--��ͨ�ĺ�õ��	6,1,1363,1,0,0
--��õ�廨��	6,1,1364,1,0,0

Include("\\script\\event\\valentine2007\\head.lua");

function main(nItemIdx)
	if (checkValentine2007Date(20070306) ~= 1) then
		Say("���õ�廨���ʱ��̫�����Ѿ���ή�ˡ�", 0);
		return 0;
	end;
	
	if (checkValentine2007Limit() ~= 1) then
		Say("������˼��ֻ�еȼ��ﵽ<color=yellow>80��<color>���ϵ��û�������ʹ��õ�廨��", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1362) then
		nexp = 1500000;
	elseif (np == 1363) then
		nexp = 1000000;
	elseif (np == 1364) then
		nexp = 500000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_VALENTINE_ROSE_ADDEXP);
	if (ncurexp >= 100000000) then
		Say("��ʹ���˺ܶ�õ�壬���õ������Ѿ�û��Ч����", 0);
		Msg2Player("ÿ����ͨ��ʹ��õ�������һ�ھ���");
		return 1;
	elseif ((ncurexp + nexp) > 100000000) then
		nexp = 100000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_VALENTINE_ROSE_ADDEXP, ncurexp + nexp)
	Msg2Player(format("������%d����ֵ", nexp));
	local szlog = format("[2007���˽�]\t%s\tName:%s\tAccount:%s\tʹ��%s�����%d����ֵ",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;
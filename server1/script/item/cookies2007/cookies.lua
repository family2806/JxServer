--2007���³���--�ձ�
--�������ձ�	6,1,1395,1,0,0
--��ͨ���ձ�	6,1,1396,1,0,0
--δ����ձ�	6,1,1397,1,0,0

Include("\\script\\event\\cookies2007\\head.lua");

function main(nItemIdx)
	if (checkcookies2007Date(20070506) ~= 1) then
		Say("�ñ��ѹ�ʹ���ڣ�����ӵ�", 0);
		return 0;
	end;
	
	if (checkcookies2007Limit() ~= 1) then
		Say("���ǲ�����˼��ֻ�����<color=yellow>50�������ҳ�ֵ<color> ���ܳԱ�.", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1395) then
		nexp = 800000;
	elseif (np == 1396) then
		nexp = 500000;
	elseif (np == 1397) then
		nexp = 300000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_33_COOKIES_ADDEXP);
	if (ncurexp >= 300000000) then
		Say("���ѳԺܶ���ˣ������ٳ���.", 0);
		Msg2Player("�Ա�ʱ��ÿ��ֻ���3�ھ���ֵ.");
		return 1;
	elseif ((ncurexp + nexp) > 300000000) then
		nexp = 300000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_33_COOKIES_ADDEXP, ncurexp + nexp)
	Msg2Player(format("�����%d ����ֵ", nexp));
	local szlog = format("[2007 3��3]\t%s\tName:%s\tAccount:%s\t ʹ��%s ���%d ����ֵ",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;
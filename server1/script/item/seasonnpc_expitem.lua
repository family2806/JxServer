
Include("\\script\\task\\task_addplayerexp.lua");

function main(nItemIdx)
	--ƣ��״̬
	local nDate = (GetItemParam(nItemIdx, 2)+2000) * 10000 + GetItemParam(nItemIdx, 3);
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nCurDate > nDate) then
		Say("����Ʒ�ѹ�ʹ����!", 0);
		return 0;
	else
		if (GetTiredDegree() == 2) then
			Say("������ƣ��״̬������ʹ�ø���Ʒ.", 0);
			return 1;
		else
			local nExp= GetItemParam(nItemIdx, 1) * 1000;
			tl_addPlayerExp(nExp);
			Msg2Player(format("�����%d����ֵ", nExp));
			WriteLog(format("[�ۼ�Ұ��]\t%s\tName:%s\tAccount:%s\t ���%d ����ֵ.",
					GetLocalDate("%Y%m%d %X"),
					GetName(),
					GetAccount(),
					nExp));
			return 0;
		end;
	end;
	return 1;
end;

function GetDesc(nItemIdx)
	local nExp= GetItemParam(nItemIdx, 1) * 1000;
	local nYear = (GetItemParam(nItemIdx, 2)+2000)
	local nMMDD = GetItemParam(nItemIdx, 3)
	local nMonth = floor(nMMDD / 100);
	local nDate = mod(nMMDD , 100);
	
	return format("�i����ֵ: %d<enter>ʹ��ʱ��: %d-%d-%d", nExp, nYear, nMonth,nDate);
end;
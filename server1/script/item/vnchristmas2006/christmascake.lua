Include([[\script\item\vnchristmas2006\xmas_head.lua]])
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2007013124) then
		Say("�ñ��ѹ��ڣ�����ʹ����!", 0);
		return 0;
	end;
	if (isAddExp_Xmasgift(500000) == 1) then
		Msg2Player("���ѳ���һ������");
	else
		Msg2Player("�ܾ��鲻�ܳ���3�ڣ������ܼ���ʹ��.");
		return 1;
	end;
end;

function GetDesc(nItemIdx)
	local szDesc = "\nʹ��ʱ��: <color=blue>2007��1��31��0ʱ<color>"
	return szDesc;
end
Include([[\script\item\vnchristmas2006\xmas_head.lua]])

function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2007011524) then
		Say("�������ȣ�ѩ���Ѿ���Ϊˮ��.", 0);
		return 0;
	end;
	
	local nG, nD, nP = GetItemProp(nItemIdx);
	if (not TB_SNOWMAN_ID[nP]) then
		return 1;
	end;
	dostring(TB_SNOWMAN_ID[nP].."()");
end;

function GetDesc(nItemIdx)
	local szDesc = "\nʹ��ʱ��: <color=blue>2007��1��31��0ʱ<color>"
	return szDesc;
end
Include([[\script\item\vnchristmas2006\xmas_head.lua]])

function main(nItemIdx)
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2007011524) then
		Say("天气炎热，雪人已经化为水了.", 0);
		return 0;
	end;
	
	local nG, nD, nP = GetItemProp(nItemIdx);
	if (not TB_SNOWMAN_ID[nP]) then
		return 1;
	end;
	dostring(TB_SNOWMAN_ID[nP].."()");
end;

function GetDesc(nItemIdx)
	local szDesc = "\n使用时限: <color=blue>2007年1月31日0时<color>"
	return szDesc;
end
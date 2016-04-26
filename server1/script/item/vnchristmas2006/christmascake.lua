Include([[\script\item\vnchristmas2006\xmas_head.lua]])
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2007013124) then
		Say("该饼已过期，不能使用了!", 0);
		return 0;
	end;
	if (isAddExp_Xmasgift(500000) == 1) then
		Msg2Player("您已吃了一个蛋糕");
	else
		Msg2Player("总经验不能超过3亿，您不能继续使用.");
		return 1;
	end;
end;

function GetDesc(nItemIdx)
	local szDesc = "\n使用时限: <color=blue>2007年1月31日0时<color>"
	return szDesc;
end
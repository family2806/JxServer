Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (TAB_ACTION[tabidx][7][1] ~= 0 and TAB_ACTION[tabidx][7][2] ~= 0) then
		SetTask(TAB_ACTION[tabidx][7][1], 2)
		SetTask(TAB_ACTION[tabidx][7][2], GetCurServerTime() + 30)
	end;
	Msg2Player("<#>你使用了一个<color=0xB5FDD7>经验令牌<color>，30秒内获得经验为原来的2倍。")
end;

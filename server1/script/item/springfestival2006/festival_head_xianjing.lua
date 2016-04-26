--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL
--SKILLNAME
Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (0 == itemuseplacecheck(ITEMTYPE)) then --公共道具
		return 1;
	end;
	CastSkill(SKILLTYPE, SKILLLEVEL)
	Msg2Player("<#>你布置了一个<color=0xB5FDD7>"..SKILLNAME.."<color>");
end;

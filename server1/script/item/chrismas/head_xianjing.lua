--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL
--SKILLNAME

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx and race_ItemMapCheck() == 0) then
		Talk(1, "", "此地图不能使用.");
		return 1;
	end;
	CastSkill(SKILLTYPE, SKILLLEVEL)
	Msg2Player("<#>你布置了一个<color=0xB5FDD7>"..SKILLNAME.."<color>");
end;

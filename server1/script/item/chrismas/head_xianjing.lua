--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL
--SKILLNAME

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx and race_ItemMapCheck() == 0) then
		Talk(1, "", "�˵�ͼ����ʹ��.");
		return 1;
	end;
	CastSkill(SKILLTYPE, SKILLLEVEL)
	Msg2Player("<#>�㲼����һ��<color=0xB5FDD7>"..SKILLNAME.."<color>");
end;

--SKILLTYPE
--SKILLLEVEL
--SKILLNAME
--SKILLDESCRIBE

Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (0 == itemuseplacecheck(1)) then
		return 1;
	end;
	CastSkill(SKILLTYPE, SKILLLEVEL);
	Msg2Player("你使用了一个<color=0xB5FDD7>"..SKILLNAME.."<color>，"..SKILLDESCRIBE);
	local nGroupId = GetTask(TK_GROUPID);
	nGroupId = festival_getgroupid(nGroupId)
	Msg2MSGroup(SF_MISSIONID, "<color=0xB5FDD7>"..GetName().."<color>使用了一个<color=0xB5FDD7>"..SKILLNAME.."<color>"..SKILLDESCRIBE, nGroupId);
end;

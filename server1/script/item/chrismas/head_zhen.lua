--SKILLTYPE
--SKILLLEVEL
--SKILLNAME
--SKILLDESCRIBE

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 ~= tabidx) then
		CastSkill(SKILLTYPE, SKILLLEVEL);
		Msg2Player("您已经使用 <color=0xB5FDD7>"..SKILLNAME.."<color>?"..SKILLDESCRIBE);
		local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
		Msg2MSGroup(TAB_ACTION[tabidx][2], "<color=0xB5FDD7>"..GetName().."<color> 使用<color=0xB5FDD7>"..SKILLNAME.."<color>"..SKILLDESCRIBE, nGroupId);
		return 0;
	end;
	------查询新表
	tabidx = race_ItemMapCheck()
	
	if tabidx ~= 0 then --新表里有定义
		local tbRace = RACE_TAB_ACTION[tabidx]
		CastSkill(SKILLTYPE, SKILLLEVEL);
		Msg2Player("您已经使用<color=0xB5FDD7>"..SKILLNAME.."<color>?"..SKILLDESCRIBE);
		local nGroupId = 0
		if type(tbRace.GetGroupId) == "function" then
			nGroupId = tbRace:GetGroupId()
		end
		Msg2MSGroup(tbRace.nMissionId, "<color=0xB5FDD7>"..GetName().."<color> 使用 <color=0xB5FDD7>"..SKILLNAME.."<color>"..SKILLDESCRIBE, nGroupId);
		return 0;
	end
	Talk(1, "", "该道具在此区域用不了.");
	return 1
end;

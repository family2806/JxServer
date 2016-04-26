--ITEMTYPE
--SKILLTYPE
--SKILLLEVEL2
--SKILLLEVEL3
--SKILLLEVEL41
--SKILLLEVEL42
--ITEMNAME
--ITEMDFFECT

Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 ~= tabidx) then
		local i;
		local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
		if (TAB_ACTION[tabidx][5][1] == 1) then
			nGroupId = getgroupid(nGroupId, TAB_ACTION[tabidx][5][2])
		end;
		
		local OldPlayer = PlayerIndex;
		local OldName = GetName();
		local idx = 0;
		local pidx;
		for i = 1, TAB_ACTION[tabidx][4] + 5 do
			idx, pidx = GetNextPlayer(TAB_ACTION[tabidx][2], idx, nGroupId);
			
			if (pidx > 0 and pidx ~= OldPlayer) then	--选择除玩家外的所有对手；
				PlayerIndex = pidx;
				AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, SKILLLEVEL41 * SKILLLEVEL42);
			Msg2Player("<#><color=0xB5FDD7>"..OldName.."<color>使用了一个<color=0xB5FDD7>"..ITEMNAME.."<color>，"..ITEMDFFECT)
			end;
			
			if (0 == idx) then
				break;
			end;
		end;
		PlayerIndex = OldPlayer;
	Msg2Player("<#>你使用了一个<color=0xB5FDD7>"..ITEMNAME.."<color>，"..ITEMDFFECT);
		return 0;
	end;
	------查询新表
	tabidx = race_ItemMapCheck()
	
	if tabidx ~= 0 then --新表里有定义
		local tbRace = RACE_TAB_ACTION[tabidx]
		local nGroupId = 0
		if type(tbRace.GetGroupId) == "function" then
			nGroupId = tbRace:GetGroupId()
		end
		local idx, pidx = 0, 0;
		local nPlayerCount = GetMSPlayerCount(tbRace.nMissionId, nGroupId)
		for i = 1, nPlayerCount do
			idx, pidx = GetNextPlayer(tbRace.nMissionId, idx, nGroupId);
			if (pidx > 0 and pidx ~= PlayerIndex) then
				doFunByPlayer(pidx , AddSkillState, SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, SKILLLEVEL41 * SKILLLEVEL42);
				doFunByPlayer(pidx, Msg2Player, "<#><color=0xB5FDD7>"..GetName().."<color> 使用<color=0xB5FDD7>"..ITEMNAME.."<color>?"..ITEMDFFECT)
			end;
			
			if (idx == 0) then
				break;
			end;
		end
	Msg2Player("<#>你使用了一个<color=0xB5FDD7>"..ITEMNAME.."<color>，"..ITEMDFFECT);
		return 0;
	end
	
	--最后都不能使用
	Talk(1, "", "此地图不能使用.");
	return 1
end;
--这个脚本是针对性道具使用；
--szItem
--szEffect
--nSkillId
--nSkillLevel
--nTime;
-- LLG_ALLINONE_TODO_20070802

Include([[\script\item\springfestival2006\itemhead.lua]]);
tabidx = 0;
function main(itemIdx)
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	local i;
	local nGroupId = GetTask(TAB_ACTION[tabidx][3]);
	if (TAB_ACTION[tabidx][5][1] == 1) then
		nGroupId = getgroupid(nGroupId, TAB_ACTION[tabidx][5][2]);
	end;
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	
	local szName;
	local idx = 0;
	local pidx;
	local j = 1;
	for i = 1, TAB_ACTION[tabidx][4] do
		idx, pidx = GetNextPlayer(TAB_ACTION[tabidx][2], idx, nGroupId);
		if (pidx > 0 and pidx ~= OldPlayer) then	--选择除玩家外的所有对手；
			PlayerIndex = pidx;
			tabPlayer[j] = make_option("useyu");
			j = j + 1;
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	PlayerIndex = OldPlayer;
	tabPlayer[ getn(tabPlayer) + 1 ] = "取消/giveback_yu"
	Say("你要对哪个对手使用道具<color=0xB5FDD7>"..szItem.."<color>？", getn(tabPlayer), tabPlayer);
end;

function useyu(szName)
	local pidx = check_pl(szName, TAB_ACTION[tabidx][2]);
	if (not pidx) then
		giveback_yu()
		return
	end
	
	local OldName = GetName()
	local OldPlayer = PlayerIndex;
	PlayerIndex = pidx;
	AddSkillState(nSkillId, nSkillLevel, 0, nTime * 18)
	Msg2Player("<#><color=0xB5FDD7>"..OldName.."<color>对你使用了一个<color=0xB5FDD7>"..szItem.."<color>，"..szEffect);
	
	PlayerIndex = OldPlayer;
	Msg2Player("<#>你对<color=0xB5FDD7>"..szName.."<color>使用了一个<color=0xB5FDD7>"..szItem.."<color>，令对手"..szEffect);
end;


function giveback_yu()
	AddItem(6,1,nDetail,1,1,1)
end
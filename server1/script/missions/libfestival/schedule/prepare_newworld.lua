Include([[\script\missions\libfestival\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_CO_PHASE) ~= 1) then	--时间已过
		Say(CO_SIGNNPCNAME.."对不起，你来晚了，活动刚刚开始. ", 0)
		NewWorld(GetTask(TK_CO_LEAVERMAPID), GetTask(TK_CO_LEAVERPOSX), GetTask(TK_CO_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(CO_PREPAREMISSIONID, 0);
	if (nPlayerCount >= CO_ALL_MAXPLAYERCOUNT) then
		Say(CO_SIGNNPCNAME.."参加活动的人已够了，请等下一轮参加吧!", 0);
		NewWorld(GetTask(TK_CO_LEAVERMAPID), GetTask(TK_CO_LEAVERPOSX), GetTask(TK_CO_LEAVERPOSY));
		return
	end;
	
	newworld_in_add();
	playergetinprepare();	--设置玩家进入游戏的状态
	AddMSPlayer(CO_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	newworld_out_add();
	playerleave();
	OnLeaveWorldDefault(szParam)
end

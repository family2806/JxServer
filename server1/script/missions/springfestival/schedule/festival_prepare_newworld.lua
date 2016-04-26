Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_FE_PHASE) ~= 1) then	--时间已过
		Say(FE_SIGNNPCNAME.."对不起，你来晚了。活动刚刚开始. ", 0)
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(FE_PREPAREMISSIONID, 0);
	if (nPlayerCount >= FE_ALL_MAXPLAYERCOUNT) then
		Say(FE_SIGNNPCNAME.."参加活动的人已够了，你参加下次的吧!", 0);
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end;
	
	festival_setplayertoprepare();	--设置玩家进入游戏的状态
	
	AddMSPlayer(FE_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end

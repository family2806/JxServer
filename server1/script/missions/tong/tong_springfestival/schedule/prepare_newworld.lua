Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_SF_PHASE) ~= 1) then	--时间已过
		Say("活动坊总管".."真是遗憾，你来晚了，等下一次活动吧!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(SF_PREPAREMISSIONID, 0);
	if (nPlayerCount >= SF_ALL_MAXPLAYERCOUNT) then
		Say("活动坊总管".."参加活动的人数已够了，等下次参加吧!", 0);
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		return
	end;
	
	festival_setplayertoprepare();	--设置玩家进入游戏的状态
	
	AddMSPlayer(SF_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end

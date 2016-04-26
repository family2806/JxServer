Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_DIS_PHASE) ~= 1) then	--时间已过
		Say("<color=yellow>活动坊总管<color>: 真是遗憾，你来晚了，等下次活动再来吧!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(DIS_PREPAREMISSIONID, 0);
	if (nPlayerCount >= DIS_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>活动坊总管<color>: 已够活动差价人数了，你等下次吧!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--设置玩家进入游戏的状态
	
	AddMSPlayer(DIS_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end

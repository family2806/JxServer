Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_CH_PHASE) ~= 1) then	--时间已过
		Say("<color=yellow>圣诞老人<color>: 不好意思，你来晚了，活动刚刚刚开始、我送你回去", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(CH_PREPAREMISSIONID, 0);
	if (nPlayerCount >= CH_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>圣诞老人<color>:参加活动的人太多了，请等下次!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--设置玩家进入游戏的状态
	
	AddMSPlayer(CH_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end

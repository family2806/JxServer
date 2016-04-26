Include([[\script\missions\tong\collectgoods\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_COLLG_PHASE) ~= 1) then	--时间已过
		Say("<color=yellow>活动坊总管<color>: 真是不好意思，引路人已经带一些侠客走了，稍候才回来，请等下一次吧.", 0)
		Msg2Player("活动正在进行，请等下一次吧.");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(COLLG_PREPAREMISSIONID, 0);
	if (nPlayerCount >= COLLG_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>活动坊总管<color>:已够刺激活动的人数了，你等下一次吧!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	collg_setplayerreadystate();	--设置玩家进入游戏的状态
	AddMSPlayer(COLLG_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	collg_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end

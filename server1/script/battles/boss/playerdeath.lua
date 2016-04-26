--玩家死亡脚本

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")

function OnDeath(Launcher)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	if (bt_CheckDeathValid() == 0) then
		return
	end
	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = BT_GetData(PL_CURRANK)

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		launchrank = BT_GetData(PL_CURRANK)
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			--更新杀Npc数目和排行榜
			BT_SetData(PL_KILLPLAYER, BT_GetData(PL_KILLPLAYER) + 1); --记录玩家杀其它玩家的总数
			serieskill = BT_GetData(PL_SERIESKILL) + 1;
			BT_SetData(PL_SERIESKILL, serieskill); --记录玩家当前的连斩数
			
		if (TAB_SERIESKILL[launchrank][currank] == 1) then
			serieskill_r = GetTask(TV_SERIESKILL_REALY) 
			serieskill_r = serieskill_r + 1
			SetTask(TV_SERIESKILL_REALY,serieskill_r)

			if (mod(serieskill_r, 3) == 0) then
				if (deathcamp == 1) then
					local npoint = bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
					mar_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
					Msg2Player("<color=yellow> 您收到连斩积分"..npoint)
				else
					local npoint = bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
					mar_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
					Msg2Player("<color=yellow> 您收到连斩积分"..npoint)
				end
			end
		end
			if (BT_GetData(PL_MAXSERIESKILL) < serieskill) then 
				BT_SetData(PL_MAXSERIESKILL, serieskill) -- 统计玩家的最大连斩数
			end
			
			local rankradio = 1;
			
			if ( RANK_PKBONUS[launchrank] == nil or RANK_PKBONUS[launchrank][currank] == nil) then
				rankradio = 1
				print("battle rank tab error!!!please check it !")
			else
				rankradio = RANK_PKBONUS[launchrank][currank]
			end
			local earnbonus = 0
			if (deathcamp == 1) then
				earnbonus = floor(BT_GetTypeBonus(PL_KILLPLAYER, 2) * rankradio)
			else
				earnbonus = floor(BT_GetTypeBonus(PL_KILLPLAYER, 1) * rankradio)
			end
			bt_addtotalpoint(earnbonus)
			mar_addmissionpoint(earnbonus)
			
			local rankname = "";
			rankname = tbRANKNAME[currank]
			launchrank = BT_GetData(PL_CURRANK);
			launrankname = tbRANKNAME[launchrank]
			
			BT_SortLadder();
			BT_BroadSelf();
		
			if (GetCurCamp()  == 1) then
				str  = "宋方"..launrankname..LaunName.." 下金方重伤人"..rankname..DeathName..", 总 PK 为"..BT_GetData(PL_KILLPLAYER);
			else
				str  = "金方"..launrankname..LaunName.." 下宋方重伤人"..rankname..DeathName..", 总 PK 为"..BT_GetData(PL_KILLPLAYER);
			end
			Msg2Player("<color=pink> 恭喜！您已经下得:"..rankname..DeathName..", 总 PK 为"..BT_GetData(PL_KILLPLAYER));
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;

	BT_SetData(PL_BEKILLED, BT_GetData(PL_BEKILLED) + 1)
	BT_SetData(PL_SERIESKILL, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	
	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave()
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

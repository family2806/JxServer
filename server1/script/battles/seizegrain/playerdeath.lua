--玩家死亡脚本

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function OnDeath(Launcher)

	local State = GetMissionV(MS_STATE);
	if (State ~= 2) then
		return
	end;
	
	if (bt_CheckDeathValid() == 0) then
		return
	end
	
	local PlayerIndex1 = NpcIdx2PIdx(Launcher);
	local OrgPlayer  = PlayerIndex;
	local DeathName = GetName();
	local deathcamp = GetCurCamp();
	local currank = BT_GetData(PL_CURRANK)
	
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		local launchrank = BT_GetData(PL_CURRANK);
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			--更新杀Npc数目和排行榜
			BT_SetData(PL_KILLPLAYER, BT_GetData(PL_KILLPLAYER) + 1); --记录玩家杀其它玩家的总数
			local serieskill = BT_GetData(PL_SERIESKILL) + 1;
			BT_SetData(PL_SERIESKILL, serieskill); --记录玩家当前的连斩数
	
			if (TAB_SERIESKILL[launchrank][currank] == 1) then
				serieskill_r = GetTask(TV_SERIESKILL_REALY) 
				serieskill_r = serieskill_r + 1
				SetTask(TV_SERIESKILL_REALY,serieskill_r)
				if (mod(serieskill_r, 3) == 0) then
					if (deathcamp == 1) then
							bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
							Msg2Player("<color=yellow> 您获得连斩积分"..BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
					else
							bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
							Msg2Player("<color=yellow> 您获得连斩积分"..BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
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
				
				local rankname = "";
				rankname = tbRANKNAME[currank]
				launchrank = BT_GetData(PL_CURRANK);
				launrankname = tbRANKNAME[launchrank]
			
			BT_SortLadder();
			BT_BroadSelf();
			
			if (GetCurCamp()  == 1) then
				str  = "宋方"..launrankname..LaunName.." 下金方重伤人"..rankname..DeathName..", 总PK 为"..BT_GetData(PL_KILLPLAYER);
			else
				str  = "金方"..launrankname..LaunName.." 下宋方重伤人"..rankname..DeathName..", 总PK 为"..BT_GetData(PL_KILLPLAYER);
			end
			
			Msg2Player("<color=pink> 恭喜你已下得:"..rankname..DeathName..", 总PK 为"..BT_GetData(PL_KILLPLAYER));
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;
	
	BT_SetData(PL_BEKILLED, BT_GetData(PL_BEKILLED) + 1);
	bt_addtotalpoint(BT_GetTypeBonus(PL_BEKILLED, deathcamp))
	BT_SetData(PL_SERIESKILL, 0);
	SetTask(TV_SERIESKILL_REALY,0)
	
	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave();--拿旗的玩家死亡或断线时，需要将旗掉在地上
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

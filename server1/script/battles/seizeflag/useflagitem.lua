IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

InDist=4;--达到目的地范围

function main()
--看玩家当前位置是否处在夺旗地图上
	W,X,Y=GetWorldPos();
	X = floor(X / 8);
	Y = floor(Y / 16);

	X1 = floor(BT_GetData(PL_PARAM1) / (32*8))
	Y1 = floor(BT_GetData(PL_PARAM2) /(32*16))

	if (X1 == 0 or Y1 == 0) then
		Msg2Player("你目前没有夺到旗，所以无法使用旗标！")--??没有使用旗标的提示信息
		return 1
	end
	strmsg = "你需要将帅旗运送到<color=yellow>"..X1.."，"..Y1.."<color>";
	Dist=floor(sqrt((X-X1)*(X-X1)+(Y-Y1)*(Y-Y1)));
	
	if(Dist>=InDist) then
				Msg2Player(strmsg)
				return 1
	else
		BT_SetData(PL_SNAPFLAG, BT_GetData(PL_SNAPFLAG) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_SNAPFLAG, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		
		if (GetCurCamp() == 1) then
			sf_setflagposinfo(1, 0, 0)
			BT_SetGameData(GAME_CAMP1, BT_GetGameData(GAME_CAMP1) + 1)
		elseif(GetCurCamp() == 2) then
			sf_setflagposinfo(2, 0, 0)
			BT_SetGameData(GAME_CAMP2, BT_GetGameData(GAME_CAMP2) + 1)
		end;
		BT_BroadGameDataToAll();
		
		if (GetCurCamp() == 1) then
			SetMissionV(MS_TOTALFLAG_S, GetMissionV(MS_TOTALFLAG_S) + 1)
		else
			SetMissionV(MS_TOTALFLAG_J, GetMissionV(MS_TOTALFLAG_J) + 1)
		end
		--如果是固定模式时，将自动生成下一个旗
		if (GetMissionV(MS_FLAGMODE) == 1) then
			if (GetCurCamp() == 1 and  GetMissionV(MS_TOTALFLAG_S) < TOTALFLAG_FIX) then
				sf_createflag(GetCurCamp(), BT_GetGameData(GAME_CAMP1AREA), BT_GetGameData(GAME_CAMP2AREA))
			elseif(GetCurCamp() == 2 and  GetMissionV(MS_TOTALFLAG_J) < TOTALFLAG_FIX) then
				sf_createflag(GetCurCamp(), BT_GetGameData(GAME_CAMP2AREA), BT_GetGameData(GAME_CAMP1AREA))
			end
			BT_BroadGameDataToAll()
		end;


		RestoreOwnFeature();
		AddSkillState(460, 1, 0, 0 ) --颜色光环，分辩敌我
		AddSkillState(656, 30, 0, 0) --降玩家的速度
		AddSkillState(461, 1, 0, 0) --颜色光环，分辩敌我
		
		OldPlayer = PlayerIndex
		
		local award_snapflag = 50 * bt_getgn_awardtimes()
		
		if (GetCurCamp()==1) then
			sf_setflagplayer(1, 0)
			Msg2MSAll(MISSIONID, "宋方<color=yellow>"..GetName().."<color>成功送回一面帅旗");--左下角的即时战况："GetCamp方玩家GetName()成功运送帅旗到达目的地！"
			Msg2MSAll(MISSIONID, "宋方每人获得额外的<color=yellow>"..award_snapflag.."<color>点积分奖励");
			local idx = 0;
			for i = 1 , 500 do 
				idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
				if (pidx > 0) then
					PlayerIndex = pidx
					bt_addtotalpoint(award_snapflag)
				end
				
				if (idx <= 0) then 
			 		break
			 	end;
			end 
		else
			sf_setflagplayer(2, 0)
			Msg2MSAll(MISSIONID, "金方<color=yellow>"..GetName().."<color>成功送回一面帅旗");--左下角的即时战况："GetCamp方玩家GetName()成功运送帅旗到达目的地！"
			Msg2MSAll(MISSIONID, "金方每人获得额外的<color=yellow>"..award_snapflag.."<color>点积分奖励");
			local idx = 0;
			for i = 1 , 500 do 
				idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
				if (pidx > 0) then
					PlayerIndex = pidx
					bt_addtotalpoint(award_snapflag)
				end
				
				if (idx <= 0) then 
			 		break
			 	end;
			end 
		end
		
		PlayerIndex = OldPlayer
		
		BT_SetData(PL_PARAM1 ,0)
		BT_SetData(PL_PARAM2, 0)
		ST_SyncMiniMapObj(-1, -1);
		--系统通告：X方（该玩家所在方）XX（玩家名）成功运送帅旗到达目的地，目前X（该玩家所在方）方夺得的帅旗数量为：XX。
		return 0
	end
end
	
	
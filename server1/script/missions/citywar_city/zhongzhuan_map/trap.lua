--攻城战 中转地图to城战地图（攻城方）
--Trap ID：攻城战
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_city\\head.lua");
Include("\\script\\missions\\citywar_city\\camper.lua");

function main()
	SubWorldOld = SubWorld-- 记录原始的SubWorld
	WorldID = SubWorldIdx2ID(SubWorld); --获得当前地图的ID号
	
	idx = SubWorldID2Idx(221); --获得主战场的是否在本服务器中
	
	if (idx < 0) then 
		return --不存在则返回
	end;
	
	SubWorld = idx;
	if (GetMissionV(MS_STATE) == 0) then 
		Say("我方现在正准备上战场! 请大家养精蓄锐、稍安勿躁!", 0);
		SubWorld = SubWorldOld;
		return
	end
	
	
	if (WorldID == 222) then  --如果当前位置是在守方的后方，则表示加入后方
		CheckAndJoin(1)
		SubWorld = SubWorldOld;
	else					--如果当前位置是在攻方的后方，则表示要加入攻方
		--T = GetMissionV(MS_NEWSVALUE);
	
		--守方先攻方5分钟入场
		--if (T < 5) then 
		--	Say("目前我方军队正在聚集，即刻可以进入战场，请大家养精蓄锐、稍安勿躁！",0)
		--	return
		--end;
	
		CheckAndJoin(2)
		SubWorld = SubWorldOld;
	end;
end;

function CheckAndJoin(Camp)
	if (GetTongName() == GetMissionS(Camp)) then  --属于该帮会则表示玩家为正规军，允许进入
		if (GetJoinTongTime() >= 7200) then
			if (GetTask(TV_TASKKEY) ~= GetMissionV(MS_KEY)) then
				BT_SetData(PL_KEYNUMBER, 0)
				BT_SetData(PL_TOTALPOINT, 0)
				SetTask(1017, 0)
				SetTask(TV_SERIESKILL_REALY,0)
				BT_SetData(PL_BATTLECAMP, 0)
				SetTask(TV_TASKKEY , GetMissionV(MS_KEY));
				BT_LeaveBattle()
				BT_ClearPlayerData()
			end;
			JoinCamp(Camp, 1);
		else
			if (JoinWithCard(Camp, 0) == 0) then 
				Say("你加入帮会的时间太短，不能参加战斗!", 0);
			end;
		end;
	else
		JoinWithCard(Camp, 1)
	end;
end;

--return 0 表示卡都没有， 1表示有卡
function JoinWithCard(Camp, UI)
	CityID = GetWarOfCity();
	--如果已使用过票入场过，则直接放行
	if (GetTask(TV_TASKKEY) == GetMissionV(MS_KEY) and GetTask(TV_TASKVALUE) == Camp) then
		JoinCamp(Camp,2)
	else
		if (CityID == 0) then 
			print("Error! CityID == 0");
			return 0
		end;
	
		--如果没有票则不让进
		CardItemID = 0;
		Camp = 1;
		if (GetItemCountEx(CardTab[CityID * 2 - 1]) >= 1) then 
			CardItemID = CardTab[CityID * 2 - 1];
			Camp = 2;
		elseif (GetItemCountEx(CardTab[CityID * 2]) >= 1) then
			CardItemID = CardTab[CityID * 2];
			Camp = 1;
		else
			if (UI == 1) then
				Say("你没有令牌怎么能进去呢!走走!", 0);
			end

			SetPos(OuterPos[1][2], OuterPos[1][3])
			return 0
		end;

		life = GetItemLife(CardItemID);
		life = floor(life / 1440);
		if (life > 5) then
			DelItemEx(CardItemID);
			Say(format("这个令牌从 %d日起失效, 不能使用", life), 0);
			SetPos(OuterPos[1][2], OuterPos[1][3])
		else
			DelItemEx(CardItemID);
			BT_SetData(PL_KEYNUMBER, 0)
			BT_SetData(PL_TOTALPOINT, 0)
			SetTask(1017, 0)
			SetTask(TV_SERIESKILL_REALY,0)
			SetTask(TV_TASKID, MISSIONID)
			SetTask(TV_TASKKEY , GetMissionV(MS_KEY));
			SetTask(TV_TASKVALUE, Camp)
			SetTask(TV_CITYID, CityID)
			BT_LeaveBattle()
			BT_ClearPlayerData()
			JoinCamp(Camp,2)
		end
	end;
	return 1
end;

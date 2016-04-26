--宋方后营外Trap点触发的脚本
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

function main()
	--如果处于报名阶段时,玩家不能走到对方的领地中去，所以会将玩家扔到大营内
		if(GetCurCamp() == 2) then
			if (BT_GetData(PL_PARAM1) > 0 and BT_GetData(PL_PARAM2) > 0) then
				Msg2Player("你现在是旗手，不能进入后营！")--??没有这项信息
			else
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
				BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			end
		elseif (GetCurCamp() == 1) then
			Msg2Player("前面枪戟林列，戒备森严，想来是有重兵屯守，你还是不要硬闯为妙！")
			SetFightState(1)
		end;
end;



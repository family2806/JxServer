--金方后营Trap点触发的脚本
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\butcher\\head.lua")

function main()
	--如果处于报名阶段时,玩家不能走到对方的领地中去，所以会将玩家扔到大营内
		if(GetCurCamp() == 2) then
			if( GetFightState() == 1) then
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
			else
				RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
				if ( RestTime < TIME_PLAYER_REV) then
					Say((TIME_PLAYER_REV - RestTime) .. "秒之后，您才能离开后营进入战场，将士请稍等！", 0)
				else
					file = GetMissionS(2)
					x,y = bt_getadata(file)
					SetPos(floor(x/32), floor(y/32))
					bt_RankEffect(BT_GetData(PL_CURRANK))
					SetFightState(1)
					SetPKFlag(1)
				end
			end;
		elseif (GetCurCamp() == 1) then
				file = GetMissionS(2)
				x,y = bt_getadata(file)
				SetPos(floor(x/32), floor(y/32))
			Msg2Player("前面枪戟林列，戒备森严，想来是有重兵屯守，你还是不要硬闯为妙！")
		end;
end;



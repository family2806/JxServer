Include("\\script\\missions\\tongwar\\match\\head.lua")

function main()
	--如果处于报名阶段时,玩家不能走到对方的领地中去，所以会将玩家扔到大营内
		if(GetCurCamp() == 1) then
			if (tongwar_check_outmatch()) then
				return
			end
			if( GetFightState() == 1) then
				SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
				tongwar_setdata(TONGWAR_RLTASK_LASTDTIME, GetGameTime())
				SetFightState(0)
			else
					file = GetMissionS(1)
					x,y = bt_getadata(file)
					SetPos(floor(x/32), floor(y/32))
					bt_RankEffect(tongwar_getdata(TONGWAR_RLTASK_CURRANK))
					SetFightState(1)
					SetPKFlag(1)
			end;
		elseif (GetCurCamp() == 2) then
			file = GetMissionS(1)
			x,y = bt_getadata(file)
			SetPos(floor(x/32), floor(y/32))
			Msg2Player("前方山峦重叠，一定有伏兵，你不能自行冲入!")
			SetFightState(1)
		end;
end;



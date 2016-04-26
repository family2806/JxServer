--宋方后营外Trap点触发的脚本
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	--如果处于报名阶段时,玩家不能走到对方的领地中去，所以会将玩家扔到大营内
	if(GetCurCamp() == 2) then
		if (BT_GetData(PL_PARAM3) > 0) then
			Msg2Player("你正在运粮食包,不能返回后营?")
			file = GetMissionS(2)
			x,y = bt_getadata(file)
			SetPos(floor(x/32), floor(y/32))
		else
			SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
			SetFightState(0)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		end
	elseif (GetCurCamp() == 1) then
		Msg2Player("前方山峦重叠,恐有伏兵埋伏！您不应该冒然进入!")
		SetFightState(1)
	end;
end;



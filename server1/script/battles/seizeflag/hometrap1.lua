--�η���ӪTrap�㴥���Ľű�
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")


function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 1) then
			if( GetFightState() == 1) then
				SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
				SetFightState(0)
			else
				RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
				if ( RestTime < TIME_PLAYER_REV) then
					Say((TIME_PLAYER_REV - RestTime) .. "��֮���������뿪��Ӫ����ս������ʿ���Եȣ�", 0)
				else
					file = GetMissionS(1)
					x,y = bt_getadata(file)
					SetPos(floor(x/32), floor(y/32))
					bt_RankEffect(BT_GetData(PL_CURRANK))
					SetFightState(1)
					SetPKFlag(1)
				end
			end;
		elseif (GetCurCamp() == 2) then
			file = GetMissionS(1)
			x,y = bt_getadata(file)
			SetPos(floor(x/32), floor(y/32))
		--	SetPos(GetMissionV(MS_HOMEOUT_X1), GetMissionV(MS_HOMEOUT_Y1))
			Msg2Player("ǰ��ǹ����У��䱸ɭ�ϣ����������ر����أ��㻹�ǲ�ҪӲ��Ϊ�")
			SetFightState(1)
		end;
end;



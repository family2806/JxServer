--�η���Ӫ��Trap�㴥���Ľű�
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\marshal\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 2) then
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
				BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		elseif (GetCurCamp() == 1) then
			Msg2Player("ǰ��ǹ����У��䱸ɭ�ϣ����������ر����أ��㻹�ǲ�ҪӲ��Ϊ�")
			SetFightState(1)
		end;
end;



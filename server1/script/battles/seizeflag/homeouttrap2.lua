--�η���Ӫ��Trap�㴥���Ľű�
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 2) then
			if (BT_GetData(PL_PARAM1) > 0 and BT_GetData(PL_PARAM2) > 0) then
				Msg2Player("�����������֣����ܽ����Ӫ��")--??û��������Ϣ
			else
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
				BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
			end
		elseif (GetCurCamp() == 1) then
			Msg2Player("ǰ��ǹ����У��䱸ɭ�ϣ����������ر����أ��㻹�ǲ�ҪӲ��Ϊ�")
			SetFightState(1)
		end;
end;



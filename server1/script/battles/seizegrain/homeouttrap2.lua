--�η���Ӫ��Trap�㴥���Ľű�
IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
	if(GetCurCamp() == 2) then
		if (BT_GetData(PL_PARAM3) > 0) then
			Msg2Player("����������ʳ��,���ܷ��غ�Ӫ?")
			file = GetMissionS(2)
			x,y = bt_getadata(file)
			SetPos(floor(x/32), floor(y/32))
		else
			SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
			SetFightState(0)
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
		end
	elseif (GetCurCamp() == 1) then
		Msg2Player("ǰ��ɽ���ص�,���з������������Ӧ��ðȻ����!")
		SetFightState(1)
	end;
end;



Include("\\script\\missions\\tongwar\\match\\head.lua")


function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 2) then
				SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
				SetFightState(0)
				tongwar_setdata( TONGWAR_RLTASK_LASTDTIME, GetGameTime() )
		elseif (GetCurCamp() == 1) then
			Msg2Player("ǰ��ɽ���ص���һ���з������㲻�����г���!")
			SetFightState(1)
		end;
end;



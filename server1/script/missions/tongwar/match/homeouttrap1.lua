Include("\\script\\missions\\tongwar\\match\\head.lua")

function main()
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
		if(GetCurCamp() == 1) then
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			tongwar_setdata( TONGWAR_RLTASK_LASTDTIME, GetGameTime() )
		elseif (GetCurCamp() == 2) then
			Msg2Player("ǰ��ɽ���ص���һ���з������㲻�����г���!")
			SetFightState(1)
		end;
end;



IncludeLib("BATTLE");
Include("\\script\\battles\\seizeflag\\head.lua")
function main()
	
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
	if(GetMissionV(MS_STATE) == 1) then
		if(GetCurCamp() == 1) then
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			Say("δ��ս֮ǰ�����н�ʿһ�Ų�׼�����뿪��Ӫ���㻹�ǵ��ſ�ս֮����ȥ����ɱ�аɣ�", 0)
		elseif (GetCurCamp() == 2) then
			SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
			SetFightState(0)
			Say("δ��ս֮ǰ�����н�ʿһ�Ų�׼�����뿪��Ӫ���㻹�ǵ��ſ�ս֮����ȥ����ɱ�аɣ�", 0)
		end;
	else
		SetFightState(1)
	end;
end;


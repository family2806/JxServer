IncludeLib("BATTLE");
Include("\\script\\battles\\seizegrain\\head.lua")
function main()
	
	--������ڱ����׶�ʱ,��Ҳ����ߵ��Է��������ȥ�����ԻὫ����ӵ���Ӫ��
	if(GetMissionV(MS_STATE) == 1) then
		if(GetCurCamp() == 1) then
			SetPos(GetMissionV(MS_HOMEIN_X1), GetMissionV(MS_HOMEIN_Y1))
			SetFightState(0)
			Say("���ڻ�δ��ս, �����뿪��Ӫ! ", 0)
		elseif (GetCurCamp() == 2) then
			SetPos(GetMissionV(MS_HOMEIN_X2), GetMissionV(MS_HOMEIN_Y2))
			SetFightState(0)
			Say("���ڻ�δ��ս, �����뿪��Ӫ! ", 0)
		end;
	else
		SetFightState(1)
		if (GetCurCamp() == 1 and BT_GetData(PL_PARAM3) == 1) then
			sf_addgrain_point(1)			-- �����ͬ����Ӫ�ģ������Ƿ�������ɫ�����뽱��
		end
	end;
end;


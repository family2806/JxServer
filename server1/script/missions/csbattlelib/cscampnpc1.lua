--CheckCondition() ��Ҫ�ú������ڼ���Ƿ���ϼ�������
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");

function main()

	if (GetMissionV(1) == 1) then 
			--δ����ս���Թ�
			if (GetTaskTemp(JOINSTATE) == 0) then
				Say("�������Ʒ������Ϸ�?", 4, "�������Ʒ� /ChooseCamp", "��������Ϸ� /ChooseCamp", "�����ȹ۲�, ֮����˵! /ChooseCamp", "�����뿴/OnCancel");
				return
			--�����Թ�
			else
				if (GetCurCamp() == 0) then 
					Say("�������Ʒ������Ϸ�?", 4, "�������Ʒ� /ChooseCamp", "��������Ϸ� /ChooseCamp", "����һ�� /OnCancel", "�����뿪ս��. /ChooseLeave");
					return
				else
					Say("�����뿪ս����?", 2, "��, �ǵ�/ChooseLeave", "�һ�û���꣬�������뿪. /OnCancel");	
					return
				end
			end
	else
		Say("��û�е�ս��ʱ��!",0);
		return
	end;
end;

function ChooseCamp(nSel)
	
	if (CheckCondition() == 0) then
		return 
	end;
	
	if (nSel == 0) then
		JoinCamp(1)	
	elseif (nSel == 1) then
		JoinCamp(2)
	else 
		SetTaskTemp(JOINSTATE, 1);
		SetPos(CS_CampPos0[2], CS_CampPos0[3]);
	end;
end;

function OnCancel()

end;

function ChooseLeave()
	LeaveGame(0)	
end;


-- Խ������Ƭ���ջ
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function guoguan_xunbao()
	Say("��߱��: ��19/06/2009 ��ʱ24:00 19/07/2009 �����Դ������������Ѱ��������.��������֮��, �����μӸ߼���ս������ȡ�����������Ľ�, ��ȡ�����Ľ������������Ǹ���������15, 20, 25����29�ض�����.", 3,
		"��ȡ����Ѱ������/gettask_chuangguan",
		"����������Ѱ��������/fullfilltask_chuangguan",
		"��ֻ��������./OnCancel");
end

function gettask_chuangguan()
	if (GetLevel() < 90) then
		Say("��߱��: �������Ͻ������������.", 0);
		return
	end
	
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 1) then
		Say("��߱��: ���ѽ���������.", 0);
		return
	end
	
	Say("��߱��: ̫����, ף�����سɹ�.", 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 1);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
end

function fullfilltask_chuangguan()
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 0) then
		Say("��߱��: ����δ��������\"����Ѱ��\".", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("��߱��: Ϊ�˱�֤��Ʒ�İ�ȫ, ����������ı����Է��Ų���(10����).", 0);
		return
	end
	
	local nToll = GetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount);
	if (nToll < 15) then
		Say("��߱��: ��û�����������?", 0);
		return
	end
	
	local nAwardCount = 0;
	if (nToll >= 29) then
		nAwardCount = 5;
	elseif (nToll >= 25) then
		nAwardCount = 3;
	elseif (nToll >= 20) then
		nAwardCount = 2;
	else
		nAwardCount = 1;
	end
	Say("��߱��: ̫����, ��������Ӧ�õĽ���!", 0);
	Msg2Player(format("�õ� %d ���Ľ�.", nAwardCount));
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
	for i = 1, nAwardCount do
		AddItem(6, 1, 2070, 1, 0, 0);
	end
end

function OnCancel()

end
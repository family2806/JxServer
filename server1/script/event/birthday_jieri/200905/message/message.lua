-- Խ������Ƭ���ջ
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")
tbBirthday0905_msg_award =
{
	[1]	= {szName="����ǹ", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 2},
	[2]	= {szName="����ǹ", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[3]	= {szName="����ǹ", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[4]	= {szName="��е�", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 1},
	[5]	= {szName="��е�", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 2},
	[6]	= {szName="��е�", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 3},
	[7]	= {szName="���չ�", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1 },
	[8]	= {szName="���չ�", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1},
};
tbBirthday0905_msg_tskgoal =
{
	500, 6,100,100,1,1,2,100,
};

function birthday0905_settask_message(nIdx)
	if (nIdx == 0) then
		return
	end
	
	if (GetLevel() < 120) then
		Say("���: ����δ�ﵽ��ȡ���������", 0);
		return
	end
	
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	if (ntskid == 0) then
		if (ntskdate ~= ndate) then
			Say("���: ��ҪŬ��ͨ������!", 0);
			SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, nIdx);
		else
			Say("���: �����յ��������������. ����������.", 0);
		end
	else
		if (ntskid == nIdx) then
			Say("���: ���Ѿ���ȡ�˴�����.", 0);
		else
			Say("���: һ��ֻ����ȡһ����ʹ����.", 0);
		end
	end
end

function birthday0905_gettask_message(nIdx)
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	local ntskcount	= GetTask(tbBirthday0905.tbTask.tsk_msg_needcount);
	if (ntskid ~= nIdx) then
		Say("���: ����δ�ﵽ��ȡ���������.", 0);
		return
	end
	
	if (ntskcount < tbBirthday0905_msg_tskgoal[nIdx]) then
		Say("���: ����û��������������ͨ����ο�����?", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("���: Ϊ�˱�֤��Ʒ�İ�ȫ, ����������ı����Է��Ų���(10����).", 0);
		return
	end
	
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0);
	SetTask(tbBirthday0905.tbTask.tsk_msg_date + nIdx, ndate);
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("���: ���ú�, ������Ӧ�õĽ���!", 0);
	tbAwardTemplet:GiveAwardByList(tbBirthday0905_msg_award[nIdx], "Hoat dong SNVLTK_Phan thuong nhiem vu tin su")
end

function birthday0905_cancel_message()
	local ntsk 	= tbBirthday0905.tbTask.tsk_msg_curtsk;
	if (GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk) == 0) then
		Say("���: ����δ����������!", 0);
		return
	end
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0)
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("���: �������ѳɹ�ȡ������!", 0);
end
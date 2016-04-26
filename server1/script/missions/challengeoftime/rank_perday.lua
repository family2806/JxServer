Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\awardtemplet.lua")

tsk_rank_lastdate	= 2636	-- ������һ�βμӸ߼����ص�ʱ��
tsk_rank_lastscore 	= 2637	-- ������һ�βμӸ߼����صĳɼ�
tsk_rank_2thdate 	= 2638	-- �������ڶ��βμӸ߼����ص�ʱ��
tsk_rank_2thscore 	= 2639	-- �������ڶ��βμӸ߼����صĳɼ�

DailyRankLadderId	= 10235

nTIMERANK = "challengeoftime_ranklist";	-- ʱ����սÿ�������

tbQiannianlingyao = {szName = "ǧ����ҩ", tbProp = {6, 1, 2116, 1, 1, 0}, nExpiredTime = 24 * 60};

function rank_award()
	ntime = tonumber(GetLocalDate("%H%M"))
	if (ntime < 4 or ntime > 2300) then
		Say("��s��: ��ָ��ʱ������", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("��s��: Ϊ�˴����ĲƲ���ȫ����ճ������ռ䣨����1��", 0);
		return
	end
	
	update_gbtask(9999999);
	update_playertask();
end

function update_gbtask(nTime)
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (gb_GetTask(nTIMERANK, 1) ~= ndate) then
		if (gb_GetTask(nTIMERANK, 1) ~= nlastday) then
			gb_SetTask(nTIMERANK, 3, nlastday);
			gb_SetTask(nTIMERANK, 4, 0);
			
		else
			gb_SetTask(nTIMERANK, 3, gb_GetTask(nTIMERANK, 1));
			gb_SetTask(nTIMERANK, 4, gb_GetTask(nTIMERANK, 2));
		end
		gb_SetTask(nTIMERANK, 1, ndate);
		gb_SetTask(nTIMERANK, 2, nTime)
	else
		if (gb_GetTask(nTIMERANK, 2) > nTime) then
			gb_SetTask(nTIMERANK, 2, nTime);
		end
	end	
end

function update_playertask()
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (GetTask(tsk_rank_lastdate) ~= nlastday and GetTask(tsk_rank_2thdate) ~= nlastday) then
		Say("��s��: �����������ʸ��콱", 0);
		return
	end
	
	local nlastday = floor(FormatTime2Number(GetCurServerTime() - 24 * 60 * 60) / 10000);
	if (GetTask(tsk_rank_lastdate) == nlastday) then
		if (GetTask(tsk_rank_lastscore) == 0) then
			Say("��s��: ��������Ѿ���ȡ�˽���.", 0);
		else
			SetTask(tsk_rank_lastscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "ǧ����ҩ");
		end
	else
		if (GetTask(tsk_rank_2thscore) == 0) then
			Say("��s��:��������Ѿ���ȡ�˽���.", 0);
		else
			SetTask(tsk_rank_2thscore, 0);
			tbAwardTemplet:GiveAwardByList(tbQiannianlingyao, "ǧ����ҩ");
		end
	end
end

function get_top5team()
	tbRoleName = {};
	for i = 1, 5 do
		RoleName, value = Ladder_GetLadderInfo(DailyRankLadderId, i);
		value = value * (-1);
		if (RoleName == "" and i == 1) then
			Say("���а�������Ϣ!", 0);
			return
		end
--		if (RoleName == "") then
--			break
--		end
		local szTime	= format("%s �� %s ��", floor(value/60), floor(mod(value, 60)));
		tinsert(tbRoleName, getn(tbRoleName)+1, format("�ŵ� %d: %s\�ɼ�: %s\n", i, RoleName, szTime));
	end
	tinsert(tbRoleName, getn(tbRoleName)+1, "��ֻ�ǿ���!/OnCancel");
	Say("���а�:", getn(tbRoleName), unpack(tbRoleName));
end

if (not __TONGRANDOMTASK_H__) then
	__TONGRANDOMTASK_H__ = 1;

Include([[\script\tong\tong_statistics.lua]]);

tab_Workshop = {[1] = "����", [2] = "�칤", [3] = "���", [4] = "����", [5] = "����", [6] = "����", [7] = "�"};

TASK_LP_ITEMID = 1744;			--��ʱ��¼���Ƶ���ƷID��
TASK_LP_COUNT = 1745;			--��¼��Ҫ�����������
TASK_LP_ZONGGUANIDX = 1746;		--��¼���Ǹ��ܹܡ�
TASK_LP_ZONGGUANLEVEL = 1756;	--��¼д�����ܹ���Ҫ�ļ���
TASK_LP_TIMESLIMIT = 2566--ÿ�����100�����ޣ�byte1��������byte2�����ڣ�byte3���·�
--�i�u ch�nh nhi�m v? r�a pk - Modified by DinhHQ - 20110810
--DAILY_MAX_TIMES = 2  -- ����ÿ��������������Ϊ2��   by wangjingjun IB shop ����
DAILY_MAX_TIMES = 100
PER_ASSIGNMENT_PK = 1 -- ÿ���������pkֵ1�� by wangjingjun IB shop ����

TASK_LP_IDX = {1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755};--��¼д�����ܹܵİ�ᡣ

--����Ƿ�����Ӧ�ܹܵĶԻ�
function rwlp_taskcheck(nTongID, nWorkshopID)
	local nWKSPType = TWS_GetType(nTongID, nWorkshopID);
	if (nWKSPType ~= GetTask(TASK_LP_ZONGGUANIDX)) then --�ܹܲ���
		return 2;
	end
	if (0 == rwlp_mapcheck()) then --�ڹ�������ͼ
		return 0;
	end;
	return 1;
end;

--�͸����ܹܵĶԻ�
function rwlp_dedaojianshu(nTongID, nWorkshopID)
	local nCount = rwlp_getjuanshucount();
	local szLevel = "<color=yellow>"..GetTask(TASK_LP_ZONGGUANLEVEL).."��<color>";
	local szZGName = "<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."���ܹ�<color>";
	if (nCount >= GetTask(TASK_LP_COUNT)) then	-- ��������Ѿ���ɣ�ֱ�ӷ���
		Say("����Ѿ��ռ���<color=yellow>"..nCount.."<color>�����飬�Ѿ��㹻�ˡ��Ͻ���ȥ����������ⷻ�ܹܰɡ�", 0)
		return
	end;
	if (rwlp_tongcheck() == 0) then
		Say("���ﳤ���Ѿ�����д�������ˣ����ٵ�������԰ɡ�", 0);
		Msg2Player("�ð�᳤���Ѿ����������ˡ��㹲�����<color=yellow>"..nCount.."��<color>���飬���ܹ�Ҫ�ռ�<color=yellow>"..GetTask(TASK_LP_COUNT).."��<color>����");
		return
	end;
	
	if (rwlp_workshopcheck() == 0) then
		Say("�Ϸ�͹��"..szZGName.."���н��飬ֻ�Ǳ��ܹܹ�Ͻ����������"..szLevel.."���㵽�������ȥ�����ɡ��㹲Ҫ�ռ���<color=yellow>"..GetTask(TASK_LP_COUNT).."��<color>���飬Ŀǰ���Ѿ��ռ���<color=yellow>"..rwlp_getjuanshucount().."<color>�⡣", 0);
		Msg2Player("�ð���"..szZGName.."����"..szLevel.."�����ܸ�����顣");
		return 0;
	end;
	
	add_a_juanshu();
	Say("���Ź��<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."<color>�ܹ�����Ϊ�Ͽ�ȱ�ټ�������ǣ��Ϸ�����ǵĹ�Ա��һЩ�����������<color=yellow>����<color>����ȥ���Ż���һЩ������", 0);
	Msg2Player("�����˵�<color=yellow>"..(nCount + 1).."��<color>���飬���ܹ�Ҫ�ռ�<color=yellow>"..GetTask(TASK_LP_COUNT).."��<color>����");
end;

tab_MapforAll = {586, 587, 688, 589, 590, 591, 592, 593, 594, 595, 596, 597};
--����Ƿ��ڹ�������ͼ
function rwlp_mapcheck()
	local ww = GetWorldPos();
	if (ww <= 597) then
		return 0
	end;
	return 1;
end;

--�����Ƿ�Ϊ�Ѿ�����İ��
function rwlp_tongcheck()
	if (0 == rwlp_mapcheck()) then
		return 0;
	end;
	ww = GetWorldPos()
	for i = 1, getn(TASK_LP_IDX) do
		if (ww == GetTask(TASK_LP_IDX[i]) ) then
			return 0
		end;
	end;
	return 1;
end;

--��������ĵȼ��Ƿ�ϸ�
function rwlp_workshopcheck()
	local ww = GetWorldPos();
	local tab_work = {};	--���ϵȼ��������������ڵ�ͼ
	tab_work = get_tongmap_list(GetTask(TASK_LP_ZONGGUANIDX), GetTask(TASK_LP_ZONGGUANLEVEL));
	for i = 1, getn(tab_work) do
		if (ww == tab_work[i]) then
			return 1;
		end;
	end;
	return 0;
end;

function add_a_juanshu()
	local nCount = rwlp_getjuanshucount();
	if (nCount == 9) then
		Say("���Ѿ��ҵ�9������ˡ����Ի�ȥ�������ˡ�", 0);
		return 0;
	end;
	ww = GetWorldPos();
	nt_SetTask(TASK_LP_IDX[nCount + 1], ww);
	return 1;
end;

function rwlp_getjuanshucount()
	for i = 1, getn(TASK_LP_IDX) do
		if (0 == GetTask(TASK_LP_IDX[i]) ) then
			return i - 1;
		end;
	end;
	return 9;
end;

function rwlp_cleartask()
	for i = 1, getn(TASK_LP_IDX) do
		nt_SetTask(TASK_LP_IDX[i], 0);
	end;
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, 0);
	nt_SetTask(TASK_LP_COUNT, 0);
	nt_SetTask(TASK_LP_ZONGGUANIDX, 0);
end;

function nt_SetTask(nTaskID, nTaskValue)
	if (nTaskID <= 0) then
		return
	end;
	SetTask(nTaskID, nTaskValue);
	SyncTaskValue(nTaskID);
end;

function OnCancel()
	
end;

end; --// end of __TONGRANDOMTASK_H__
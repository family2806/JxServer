--�������������ļ�
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main(nItem)
	_, nTongID = GetTongName();
	if (nTongID <= 0) then
		Say("��Ŀǰ����<color=yellow>���<color>�У��޷�ʹ�ð�������������ơ�", 0);
		Msg2Player("��Ŀǰ����<color=yellow>���<color>�У��޷�ʹ�ð�������������ơ�");
		return 1;
	end;
	local nCount = GetTask(TASK_LP_COUNT);
	SetTask(TASK_LP_ITEMID, nItem); --��ȡ���Ƶȼ�
	
	if (nCount > 0) then
		Say("<color=green>��������<color>������ǰ�л�δ��ɵ����������ȷ��Ҫ�����µ�������", 2,
			"�ǵģ���Ҫ����֮ǰ���������/cancelformertask",
			"���ˣ����ǵȵȰ�/OnCancel");
		return 1;
	else
		wanttask()
		return 1;
	end;
end;

--ȡ��һ��������������
function cancelformertask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		rwlp_cleartask();
		Say("���Ѿ�ȡ����<color=yellow>������������<color>����", 0);
		Msg2Player("���Ѿ�ȡ����<color=yellow>������������<color>����");
	end;
end;

-- ������������
function wanttask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		Say("���Ѿ���һ�������������������ˣ����ܽ��������ˡ�", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nItem, nResult;
	
	nItem = GetTask(TASK_LP_ITEMID);
	nLevel = GetItemParam(nItem, 3);
	nWorkshopIdx = GetItemParam(nItem, 4);
	nCount = GetItemParam(nItem, 5);
	if (not nCount or nCount == 0) then
		nResult = init_task()
		nLevel = GetItemParam(nItem, 3);
		nWorkshopIdx = GetItemParam(nItem, 4);
		nCount = GetItemParam(nItem, 5);
	end;
	
	local szContent = "<color=yellow>"..nLevel.."<color>�����ϲ�ͬ����<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>��";
	if (nResult == 0) then
		Say("������Ҫ��ȥ��ü�λ"..szContent.."���Ǻܿ�ϧĿǰ���а���<color=yellow>"..tab_Workshop[nWorkshopIdx].."��<color>�ȼ������㣬���Ի��������´������԰ɡ�", 0);
		Msg2Player("��ʱû���㹻���"..szContent.."���´��ٳ��ԡ�");
		return
	end;
	
	szContent = "<color=yellow>"..nCount.."<color>λ"..szContent;
	Say("�����<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>����������ѣ�ԭ�������Ͼ��Ͽ�����ȡһ��������û���뾩��Ҫ�󣬳��˾�����Ҫ�е�����ʿ�ļ��顣Խ����������ʦ֮�ˣ���ȡ�����Ļ����Խ���鷳��Ϊ��ȥ��"..szContent.."������ǵļ��顣", 2,
	"�ã���һ��������Ϊ/#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 1)",
	"�������̫���ˣ��Ҳ�����/#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 0)");
end;

--��ʼ��һ������
function init_task()
	local nLPLvl = GetItemParam(GetTask(TASK_LP_ITEMID), 1); -- ���Ƶĵȼ�
	
	local nLevel, nWorkshopIdx, nCount;
	nLevel = 1;
	nWorkshopIdx = random(1, 7); -- ���һ������
	
	if (nLPLvl == 1) then
		nLevel = random(1, 3);
	elseif (nLPLvl == 2) then
		nLevel = random(4, 6);
	elseif (nLPLvl == 3) then
		nLevel = random(7, 8);
	end;
	
	nCount = random(1, 9);
	local nMax = get_workshop_count(nWorkshopIdx, nLevel);
	if (not nMax) then
		nMax = 0;
	end;
	if (nCount > nMax) then
		nCount = nMax;
	end;
	
	local nItem = GetTask(TASK_LP_ITEMID);
	SetSpecItemParam(nItem, 3, nLevel);
	SetSpecItemParam(nItem, 4, nWorkshopIdx);
	SetSpecItemParam(nItem, 5, nCount);
	SyncItem(nItem);
	if (nCount > 0) then
		return 1;
	end;
	return 0;
end;

function lp_confirm(nLevel, nWorkshopIdx, nCount, bOK)
	local szContent = "<color=yellow>"..nCount.."<color>λ<color=yellow>"..nLevel.."<color>�����ϲ�ͬ����<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>";
	
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	
	if (bOK == 1) then
		Say("�����<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>����������ѣ�ԭ�������Ͼ��Ͽ�����ȡһ��������û���뾩��Ҫ�󣬳��˾�����Ҫ�е�����ʿ�ļ��顣Խ����������ʦ֮�ˣ���ȡ�����Ļ����Խ���鷳��Ϊ��ȥ��"..szContent.."������ǵļ��顣", 1, "��֪����/lp_confirmtwo");
	else
		Say("�����<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>ϣ����Ϊ��ȥ��"..szContent.."������ǵļ��顣�����û��ʱ����",2 ,"�һ��ǽ�����������/lp_confirmtwo", "��ȷʵ��Ҫ�����������/OnCancel");
	end;
end;

function lp_confirmtwo()
	local nItem = GetTask(TASK_LP_ITEMID);

	local nCount = GetItemParam(nItem, 5);
	local nWorkshopIdx = GetTask(TASK_LP_ZONGGUANIDX);
	local nLevel = GetTask(TASK_LP_ZONGGUANLEVEL);
	
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) ~= 1) then
			return
		end;
	end;

	nt_SetTask(TASK_LP_COUNT, nCount);
	Msg2Player("�������ȥ��<color=yellow>"..nCount.."<color>��<color=yellow>"..tab_Workshop[nWorkshopIdx].."���ܹ�<color>�Ի�����ü��������<color=yellow>"..tab_Workshop[nWorkshopIdx].."��<color>�ĵȼ�����Ϊ<color=yellow>"..nLevel.."<color>����");
end;

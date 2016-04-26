Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
function main()
	local arytalk = 
	{
		[1]="<dec><npc>ʥ�����֣�����ʥ����Ů����������ǰ���ڷ�ʥ�������ʱ�򣬺���һ����������ö������׶���ѩ��ʧ�١�������������ҵ����ǣ���һ�����������͡�",
		[2]="������ʥ����Ů/xmas2007_binger_join",
		[3]="�˽�ʥ����Ů�/xmas2007_binger_about",
		[4]="ȥ������/autumn_enter",
		[5]="�˳�/NoChoice",
	}
	CreateTaskSay(arytalk)
	
	
end
function xmas2007_binger_about()
local arytalk = 
	{
		[1]="<dec><npc>ʥ����Ů<color=red>08-12-2007 �� 13-01-2008<color>, ÿ����<color=red>8:00-9:00, 15:00-16:00, 22:00-23:00<color>, ʥ����ŮͻȻ������ <color=yellow>�ߴ���л��߳���ɽ�ϣ�����ɽ��<color>. ��ϵͳ������������ʿ����ȥ��<color=yellow>����<color>�����μӣ�������ʥ����Ů<color=yellow>�������׶���ѩ��<color>. ���������ҵ����ǿ��Ե� <color=yellow>ѩ����<color> �콱.",
		[2]="��������������/main"
	}	
	CreateTaskSay(arytalk)
end
function xmas2007_binger_join()
	if xmas2007_findgirl_checktime() == 0 or GetGlbValue(xmas2007_findgirl_gblvalue_taskID)~=1 then
		CreateTaskSay({"<dec><npc>���δ��ʼ���Ժ�����!","�˳�/NoChoice"})
		return
	end
	
	local ntaskdate = GetTask(xmas2007_findgirl_limit_taskID)
	local ndate = xmas2007_findgirl_returndate()
	if ntaskdate ~= ndate then
		SetTask(xmas2007_findgirl_limit_taskID,ndate)
		SetTask(xmas2007_findgirl_taskID,0)
	end
	if GetTask(xmas2007_findgirl_taskID) == 4 then
		CreateTaskSay({"<dec><npc>лл�������Ѿ��������ˣ��´��ټ�","�˳�/NoChoice"})
		return		
	end
	if GetTask(xmas2007_findgirl_taskID) ~= 0 then
		CreateTaskSay({"<dec><npc>��ȥ��������Ů","�˳�/NoChoice"})
		return
	end
		SetTask(xmas2007_findgirl_taskID,1)
		CreateTaskSay({"<dec><npc>������Ҷ�������!","�˳�/NoChoice"})
end

function xmas2007_findgirl_checktime()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate < 07120800 or ndate > 08011324 then
		return 0
	end	
	
	local nhm = tonumber(GetLocalDate("%H%M"))
	if nhm >= 800 and nhm < 920 then
		return 1
	elseif nhm >= 1500 and nhm < 1620 then
		return 1
	elseif nhm >= 2200 and nhm < 2320 then
		return 1
	else
		return 0
	end
end

--������
--By С��
--2007-03-29
Include( "\\script\\event\\wulinling\\head.lua" )

function wulinling_main()
	local aryTalk = {}
	tinsert(aryTalk,"<dec><npc>�������<color=yellow>���ִ���2����֮��<color> (11/06/2005 - 11/06/2007), ��ӭ������μ����������ռ��!");
	tinsert(aryTalk,"�����˽�û/wulinling_about");
	
	if wulinling_date() == 1  then
		tinsert(aryTalk,"����������!/wulinling_give");
	end
	tinsert(aryTalk,"���뿴������ѽ�����������/wulinling_query");
	tinsert(aryTalk,"���Ժ����!/OnCancel");
	
	CreateTaskSay(aryTalk);
end

function wulinling_query()
	local szary = "<dec><npc>00:00 �����µ���ÿ������ѽ������������Լ�ͳ������. \n\n";
	local nDate = tonumber(WULINLING_DATE[2]..date("%M"))
	if tonumber(GetLocalDate("%Y%m%d%H%M")) > (nDate + 5) then --�Ƴ�10����.��ֹRelay�ӳ�����
		checkwulinlingPh();
		if WULINLING_PHTB[1][1] ~= nil then
			szary = format("�%s �ѽ�������ϲ���<color=red>%s<color> ��òμӱ������ʸ�<color=yellow> ���µ�һ��<color> ��5��. \n",szary,WULINLING_PHTB[1][1][1]);
		end
	end
	CreateTaskSay({ szary,
			 "���뿴����ռ���������������/wulinling_queryMy",
			 "���뿴10�����������һ��������������/wulinling_queryFirst",
			 "�����Ի�/OnCancel"
		 });
end

function wulinling_queryFirst()
	if tonumber(GetLocalDate("%Y%m%d%H")) < ( tonumber(WULINLING_DATE[1]) + 100 ) then
		CreateTaskSay({"<dec><npc>Ŀǰû�й���10�����������һ��������������","�����Ի�/OnCancel"});
		return 0;
	end
	checkwulinlingPh();
	local szary = "<dec><npc>����ռ�����������\n";
	for szkey,szName in WULINLING_PHTB[1] do
		szary = format("%s �� <color=yellow>%2s<color>: <color=red>%-25s<color> <color=yellow>%d<color><enter>",
							szary, tostring(szkey),szName[1],szName[2]);
	end
	CreateTaskSay({szary,"�����Ի�/OnCancel"});
end

function wulinling_queryMy()
	
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({" �Բ��𣬴���δ�����κΰ��", "�����Ի�/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****�ж��Ƿ񴴽��˸�����
	checkCreatLG(szlgname);
	
	--**�ж��Ƿ�����˸�����
	checkJoinLG(szlgname);
	
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	local nLgTaskPh = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH) --����
	--local nLgMemberTaskSum = LG_GetMemberTask(WULINLING_LGTYPE, szlgname,GetName(), WULINLING_LGMEMTASK); --��Ա�ύ��
	local szPh = "";
	if nLgTaskPh == 0 or nLgTaskPh == nil then
		szPh = "<color=yellow>Ŀǰ��δ<color>";
	else
		szPh = format("<color=yellow>%d<color>", nLgTaskPh);
	end
	CreateTaskSay({format("<dec><npc> �μ��ռ����<enter>�ð�����: %s<enter>�������: <color=yellow>%d<color><enter> ", szPh, nLgTaskSum),"�����Ի�/OnCancel"});
	
end


function wulinling_give()
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({"�Բ��𣬴���δ�����κΰ��", "�����Ի�/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****�ж��Ƿ񴴽��˸�����
	checkCreatLG(szlgname);
	
	--**�ж��Ƿ�����˸�����
	checkJoinLG(szlgname);
	
	--**�ύ������
	wulinling_process(szlgname);
	
end

function wulinling_process(szlgname)
	local nSumCount = CalcEquiproomItemCount(6,1,WULINLING_ITEM,-1);
	--print(nSumCount);
	if nSumCount == 0 then
		CreateTaskSay({"<dec><npc>��������û���κ�����!","�����Ի�/OnCancel"});
		return 0;
	end
	--ɾ��Ʒ
	if ConsumeEquiproomItem(nSumCount,6,1,WULINLING_ITEM,-1) ~= 1 then
		WriteLog(format("[������]\t%s\tAccount:%s\tName:%s\ɾ����Ʒʧ�ܣ�������",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName() ));
		CreateTaskSay({"<dec><npc>���ܽ�������!","�����Ի�/OnCancel"});
		return 0;
	end
	--���ñ���
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	if nLgTaskSum == nil then
		LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, 0 , "", "");
	end
	LG_ApplyAppendLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, nSumCount, "", "")
	LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKDATA, date("%m%d%H%M%S") , "", "");

	--LG_ApplyAppendMemberTask(WULINLING_LGTYPE, szlgname, GetName(), WULINLING_LGMEMTASK, nSumCount, "","");
	
	--LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH, 1 , "", "");
	WriteLog(format("[��������]\t%s\tAccount:%s\tName:%s\t ��������ɹ������� %d",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(), nSumCount));
	CreateTaskSay({"<dec><npc>���ѳɹ���" .. nSumCount .. " ������", "�����Ի�/OnCancel"});
end

function wulinling_about()
	CreateTaskSay({"<dec><npc>��<color=yellow>4��6��<color> ��<color=yellow>4��6��24ʱ<color>, ���������򣬴�50�����ϵĹ��ｫͻȻ����������ĸ�����ռ��ͽ������ִ��˵���࣬����òμӱ������ʸ�  <color=yellow>���µ�һ��<color> (����ҳ��ϸ��Ϣ!","�����Ի�/OnCancel"});
end


function OnCancel()
	
end

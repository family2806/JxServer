--zero 20070712 ��������

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\pay.lua");

function main()
	if(tonumber(GetLocalDate("%Y%m%d"))>=20070728 and tonumber(GetLocalDate("%Y%m%d"))<=20070813) then
		CreateTaskSay({"<dec><npc>��ӭ�μ�28-07-2007��24:00��13-08-2007���е�'�ٻ��ͽ����. ��ڼ䣬90�����ϣ���90�����ĳ�ֵ��ҿ��Բμ��������. ����ҳ������ϸ��",
			"��������ľ��/#lingpaizhizao_do(1)",
			"��������ͭ��/#lingpaizhizao_do(2)",
			"������������/#lingpaizhizao_do(3)",
			"�����������/#lingpaizhizao_do(4)",
			"������������/#lingpaizhizao_do(5)",
			"�������Ƶķ���/lingbaizhizao_content",
			"ȡ��/OnCancel"});	
	else
		Say("'�ٻ��ͽ������28-07-2007��24:00��13-08-2007����. 90�����ϣ���90�����ĳ�ֵ��ҿ��Բμ��������.",0)
	end
	
end


lingpai_id={1477,1478,1479,1480,1481}
lingpai_success_rate={30,25,50,90,100};
lingpai_pay={5000,10000,20000,30000,1000000};
lingpai_name={"ľ��","ͭ��","����","����","����"};
function lingpaizhizao_do(lingpai_level)
	if( IsCharged() == 0) then --��ֵ
		Say("ֻ��90�����ϣ���90�����ĳ�ֵ��Ҳſ��Բμ��������.",0);
		return 
	end
	if( GetLevel() <90) then --�ȼ�
		Say("�㻹̫С�����������μ���ôΣ�յ�����. �ȵ�90����������!",0);
		return 
	end
	
	if( CalcFreeItemCellCount() < 1) then -- �ռ�
		Say("����������������������.",0);
		return 
	end
	
	if( CalcEquiproomItemCount(6,1,lingpai_id[lingpai_level],-1) < 5) then --����
		Say("����ԭ�ϲ���!",0);
		return 
	end
		
	if( Pay(lingpai_pay[lingpai_level]) == 0) then  -- ȥ��Ǯ
			Say("���ϧ��������������!",0);
		return 
	end
	
	for i=1,4 do ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1);	end --ȥ��4������
	if(random(1,100)<=lingpai_success_rate[lingpai_level]) then --�ɹ��Ļ�
		ConsumeEquiproomItem(1,6,1,lingpai_id[lingpai_level],-1); --ȥ��һ������
		AddItem(6,1,lingpai_id[lingpai_level]+1,1,0,0);
		Say(format("��ϲ��õ�1 %s.",lingpai_name[lingpai_level]),0);
		WriteLog(format("[�ٻ��ͽ�]\t%s\tAccount:%s\tName:%s\t ���� %s �ɹ�",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			lingpai_name[lingpai_level]));
	else
		Say("���ϧ������ʧ�ܣ��ķ���ԭ�Ϻ�����!",0);
	end
end

function lingbaizhizao_content()
	CreateTaskSay({"<dec><npc><enter>����ľ����Ҫ5�������ܼ���5000�����������ʧ�ܽ����4�������ܼ���5000��.<enter><enter>����ͭ��Ҫ5��ľ�ƺ�1�������������ʧ�ܽ���ʧ4��ľ�ƺ�1����.<enter><enter>��������Ҫ5��ͭ�ƺ�2�������������ʧ�ܽ�����ʧ4��ͭ�ƺ�2����.<enter><enter>�������Ҫ5�����ƺ�3���������ʧ�ܵĻ�����ʧ4�����ƺ�3����.<enter><enter>��������Ҫ5�����ƺ�100����. �������Ƶĳɹ�����100%.",
		"����/main",
		"֪����/OnCancel"
		});
end
function OnCancel()
end
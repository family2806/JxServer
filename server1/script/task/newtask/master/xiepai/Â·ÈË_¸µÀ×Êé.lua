
-- ��Ȫ�帵����ű�
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");
Include("\\script\\task\\random\\treasure_head.lua");  -- �ر�ͼ���͹���

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==140) then
		task_level30_09();
		return
	elseif (myTaskValue==150) then
		Say("�����飺ī��������������ɣ�飬�嶾�̾�����Ȫ��Ķ��ϳ�����˵�Ŀ��ǹ������˰ɣ�",0);
		return
	elseif (myTaskValue==151) then
		task_level30_10();
		return
	elseif (myTaskValue==160) then -- ����ɣ���ص���Ȫ���븵����ĶԻ�
		task_level30_16();
		return
	elseif (myTaskValue==230) then
		task_level50_01(); -- �õ�����ڤ֮����ص���Ȫ���븵����ĶԻ�
		return
	end
	
	local tbOpp = {
		--"��������������һ�²ر�ͼ��/CheckTreasureMap_Say",
		"�����Ի�/OnExit"
		};
	
	
	Say("�����飺�š��ȿȡ���������Ѩ�Բء���������������־�⡭��������������ͷ����ʲô���鰡��",
				getn(tbOpp),
				tbOpp	);

end;


function CheckTreasureMap_Say()
	Say("�����飺�š�������ر�ͼ���������˾������ص����ڵص㣬����һ�����ܿ��ö��ģ������Դ����˽���֮��Ͳ������ʴ����ˣ������������<color=yellow>��ʮ��������<color>�Ļ�����",2,
		"���У��Ҿ͸����ʮ����/CheckMoney",
		"�ҿ�û��ô��Ǯ/OnExit");
	return 1;
end;


function CheckMoney()

	-- �������һ���жϽ�Ǯ��׼������ʱ���ж�һ��
	if GetCash()>=300000 then
		-- �����������
		GiveItemUI("�ر�ͼ����","�뽫��Ĳر�ͼ�Ž�ȥ��","CheckTreasureMap","OnExit");
		return
	else
		Say("�����飺�������������ˣ�Ǯû������Ҫ�����ɲ�����������ͷ�Ӱ���������䱦���ܾʹ�������Ե��Ŷ��",0);
		return
	end;

end;


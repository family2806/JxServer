--������ ������ ��վ����Ի�  ��������
-- Update: Dan_Deng(2003-09-16)��ʱ���������Ժ���д�ؿ��ţ�

CurStation = 11;
Include("\\script\\global\\station.lua")
--Include("\\script\\global\\skills_table.lua")

function main(sel)
--	check_update()					-- ���ܸ��¡����ɼӱ�ʶ��2004-05-31��
--	UTask_world15 = GetTask(15)
--	if (UTask_world15 < 255) then	
--		Say("���򣺰������ڵ�����Խ��Խ�����ˣ�ԭ�����в��ٸ��̴�үȥ��ũ���Ƕ����棬���������֪���Ķ��ܳ�һȺ��Ҷ���·��ٿ��ˣ�������������Ӱ�죬��������ܸ�����Щ��Ҷ��ͺ��ˡ�����Ҹ���ʮֻ���ӣ��Ϳ��������������ʹ��һ�γ�����Ҫ������", 2, "��æ/yes", "����æ/no")
--		SetTask(15, 1)
--	else
		Say("�������ǳ���������������Ե������෹�������İ��һ�°ɣ�", 4, "·���ĵص�/WayPointFun", "�������/StationFun", "���صĵص�/TownPortalFun", "������/OnCancel");
--	end
end;

function yes()
	Task0013 = GetTaskTemp(13);
	if (Task0013 < 10) then			--û��ɱ��ʮֻ��Ҷ��
		Say("��������������ģ���ʱ�������඼�Ȳ���!", 4, "·���ص�/WayPointFun", "·������/StationFun", "���صĵص�/TownPortalFun", "������/OnCancel");
	else
		SetTaskTemp(13, 0)
		Say("лл����Ҹ����˺�Ҷ����������!", 4, "·�𾭵ĵص�/WayPointFun", "�������/StationFun", "���صĵص�/TownPortalFun", "������/OnCancel")
	end
end;

function  OnCancel()
   Say("��������Ǯ���������ɡ�",0)
end;

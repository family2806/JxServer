QY_GOLDBOSS_APOS_INFO = {
					{"����", 739, 95, 0, {"���궴","ܽ�ض�","city"}}, -- ����,����,�ȼ�,����,{���ܳ��ֵĵ�ͼ}
					{"���Ѵ�ʦ", 1365, 95, 0, {"����ɱ�","��ȶ�","city"}},
					{"�Ʋ�Ⱦ", 741, 95, 1, {"����ɽ��","��ȶ�","city"}},
					{"��ӯӯ", 742, 95, 1, {"��Ϫ��","ɳĮ�ر�","city"}},
					{"���ʦ̫", 743, 95, 2, {"��ɽ��","���ж�","city"}},
					{"������", 567, 95, 2, {"���춴","������","city"}},
					{"������", 745, 95, 3, {"��ʯ��","��ˮ��","city"}},
					{"��ľ��", 565, 95, 3, {"�������","ɽ����","city"}},
					{"�ȴ���", 1367, 95, 4, {"Į����ԭ","���궴","city"}},
					{"������", 1368, 95, 4, {"����ɽ��","ɳĮ 3","city"}},
					
				--{"����ѩ��", 564, 95, 3, 227, 1504, 3144, "��˵����߹�������ѩ��׷���ľ�ȥ�����Ĺ��ػ�ɳĮ�Թ���"},
}



if (GetProductRegion() == "cn_ib") then
	QY_GOLDBOSS_DPOS_INFO = {
					--{"��˼��", 746, 95, 341, 4, "������������߳����Ƶ� ��˼�� ��Į����ԭ����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					{"��ӯӯ", 742, 95, 336, 1, "�������Ű�ӯӯ�������𽭺��������ڷ���ɱ�! �Ʊ�����һ���ȷ�Ѫ��!", "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
					--{"����", 748, 95, 342, 1, "������������߳����Ƶ� ���� ����ɽ�����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"}
	}
else
	QY_GOLDBOSS_DPOS_INFO = {
--					{"��˼��", 746, 95, 341, 4, "������������߳����Ƶ� ��˼�� ��Į����ԭ����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					{"��ӯӯ", 742, 95, 336, 1, "�������Ű�ӯӯ�������𽭺��������ڷ���ɱ�! �Ʊ�����һ���ȷ�Ѫ��!", "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
--					{"����", 748, 95, 342, 1, "������������߳����Ƶ� ���� ����ɽ�����!�Ʊ�����һ���ȷ�Ѫ�꣡", "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"}
					{"����", 739, 95, 341, 0, "������������߳����Ƶ����������Į����ԭ! �Ʊ�����һ���ȷ�Ѫ��!", "\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"},
					{"��ľ��", 565, 95, 227, 3,"���˿�����ľ�������ɳĮ�Թ��ػ�.", "\\settings\\maps\\��������\\ɳĮ�Թ�\\duanmuruiboss.txt"},
					{"������", 582, 95, 181, 1, "�����ɾ���Ů������������ˮ������.", "\\settings\\maps\\������\\��ˮ���Թ�\\lanyiyiboss.txt"},
					{"�Ʒ���", 1366, 95, 342, 1, "�����Ʒ��������΢ɽ�����Ʊ�����һ���ȷ�Ѫ�� ", "\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
	}
end

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
function TaskShedule()
	-- ���÷�������
	TaskName( "MAKE GOLDBOSS 23:00" );
	TaskInterval( 1440 );
	TaskTime( 23, 0 );
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  23:00" );
end

function TaskContent()
TAB_CITY_EMPTY = {}
	qy_makeboss_onlyone_pos()
	--qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end

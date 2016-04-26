Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\task\\system\\task_string.lua");

VALENTINE2009_START					= 20090213	-- ���ʼ����
VALENTINE2009_END					= 20090215	-- ���������
VALENTINE2009_ITEM_END				= 20090216	-- ��Ʒ��Ч��
VALENTINE2009_MAX_DRAW_NUM			= 9			-- �����ȡ����
VALENTINE2009_MAX_USE_NUM			= 9			-- ���ʹ������
VALENTINE2009_START_TIME			= 200000	-- ���ʼʱ��
VALENTINE2009_END_TIME				= 210000	-- �����ʱ��
VALENTINE2009_LEVEL_LIMIT			= 50		-- �ȼ�����
VALENTINE2009_AWARD_ROSENUM			= 9			-- ������õ����
VALENTINE2009_AWARD_EXP				= 2000000	-- �����ľ���ֵ
VALENTINE2009_AWARD_EXP_LIMIT		= 54000000	-- ���Ľ�������

VALENTINE2009_TIME_GROW_B			= 20*18		-- ��һ�γɳ�ʱ��			
VALENTINE2009_TIME_WATER_START		= 40*18		-- ��ʼ��ˮʱ��
VALENTINE2009_TIME_WATER_END		= 50*18		-- ������ˮʱ��
VALENTINE2009_TIME_GROW_C			= 70*18		-- �ڶ��γɳ�ʱ��
VALENTINE2009_TIME_GROW_D			= 90*18		-- ����ʱ��
VALENTINE2009_TIME_DISAPPEAR		= 120*18	-- ��ʧʱ��

VALENTINE2009_EDITION				= 1552		-- ��汾��
VALENTINE2009_DATE					= 1553		-- �����
VALENTINE2009_DRAW_NUM				= 1560		-- ������ȡ����Ŀ
VALENTINE2009_USE_NUM				= 1561		-- ����ʹ�õ���Ŀ
VALENTINE2009_EXPERIENCE			= 1562		-- �ܹ���õľ���

VALENTINE2009_NPC_NAME_BOY			= 1			-- �к���
VALENTINE2009_NPC_NAME_GIRL			= 2			-- Ů����
VALENTINE2009_NPC_HAS_WATER			= 3			-- �Ƿ��Ѿ���ˮ
VALENTINE2009_NPC_STEP				= 4			-- Ŀǰ���ڵĲ���
VALENTINE2009_NPC_NAME_BOY2			= 5		-- �к���2
VALENTINE2009_NPC_NAME_GIRL2		= 6			-- Ů����2
VALENTINE2009_NPC_STEP_A			= 1			-- ��̬A
VALENTINE2009_NPC_STEP_B			= 2			-- ��̬B
VALENTINE2009_NPC_STEP_WATER_START	= 3			-- ��ʼ��ˮ
VALENTINE2009_NPC_STEP_WATER_END	= 4			-- ������ˮ
VALENTINE2009_NPC_STEP_C			= 5			-- ��̬C
VALENTINE2009_NPC_STEP_D			= 6			-- ��̬D

VALENTINE2009_ITEM_ZHONGZI		= {6, 1, 1927, 1, 0, 0}		-- ��������
VALENTINE2009_ITEM_TIANXIAN		= {6, 1, 1928, 1, 0, 0}		-- ����ˮ
VALENTINE2009_ITEM_ROSE			= {6, 0, 20  , 1, 0, 0}		-- õ�廨
VALENTINE2009_NPC_ID 			= {1252, 1253, 1254, 1255} 	-- NPC��ID
VALENTINE2009_AREA 				= {11,1,37,176,162,78,80,174,121,153,101,99,100,20,53,54,175,55} -- ����ŵĵ�ͼ

VALENTINE2009_TALK_MAIN = 
{
	"<color=green>20:00��21:00<color> ��13-02-2009 ��15-02-2009, ��λ������ʿÿ��������ȡ<color=green>9<color> �������ӻ�����ˮ����λҪ��ȡ��?",
	"��Ҫ����������.",
	"��Ҫ������ˮ.",
	"��ֻ��·��.",
}

VALENTINE2009_TALK_GOODS = 
{
	"��������",
	"����ˮ",
	"õ�廨",
}

VALENTINE2009_TALK_TREENAME			= "��������"
VALENTINE2009_TALK_PLANT			= "�ֳ�1��������"
VALENTINE2009_TALK_WATER			= "��ˮ�ɹ�"

VALENTINE2009_TALK_ERROR_ANSWER 	= "֪����. "
VALENTINE2009_TALK_ERROR_SEX		= "����ֻ�����������ӣ�Ů��ֻ��������ˮ����Ҫ����ˣ�"
VALENTINE2009_TALK_ERROR_LEVEL		= "ֻ��50�����ϵ���Ҳſ��Բμӻ���ټӰѾ�!"
VALENTINE2009_TALK_ERROR_PAY		= "ֻ�г�ֵ��Ҳſ��Բμӻ."
VALENTINE2009_TALK_ERROR_MAXNUM		= "ÿ�����ֻ����ȡ9�Σ�������������콱."
VALENTINE2009_TALK_ERROR_DATE		= "ֻ����13-02-2009��15-02-2009���ʱ��ſ�����ȡ����."
VALENTINE2009_TALK_ERROR_TIME		= "ֻ��20:00��21:00�ſ�����ȡ"
VALENTINE2009_TALK_ERROR_NOTMAN		= "ֻ�������ſ���ʹ����������!"
VALENTINE2009_TALK_ERROR_DIE		= "��������ή��."
VALENTINE2009_TALK_ERROR_MAXUSE		= "ÿ��ֻ��ʹ��9�Σ������ټ�����."
VALENTINE2009_TALK_ERROR_TEAM		= "ֻ����Ů��ӵĲſ���ʹ��!"
VALENTINE2009_TALK_ERROR_AREA 		= "ֻ���ڴ���ͳ���������"
VALENTINE2009_TALK_ERROR_FIGHT		= "ս��״̬�²�������!"
VALENTINE2009_TALK_ERROR_ARID		= "����ˮƿû��ˮ��!"
VALENTINE2009_TALK_ERROR_NOWATER	= "��ı����ﻹû������ˮ�����鱳����"

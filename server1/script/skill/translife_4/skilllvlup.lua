-- �ļ�������skilllvlup.lua
-- �����ߡ���wangjingjun
-- ���ݡ�������ת��ؼ��ܵ� 8 �����ܵ�����
-- ����ʱ�䣺2011-07-30 17:50:05

Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")

tbZhuansheng_4_Skill = {}

function tbZhuansheng_4_Skill.skilllvelup(nSkillId)
	local mlvl = HaveMagic(nSkillId)
	local nMaxLevel = GetSkillMaxLevel(nSkillId)
	local szSkillName = GetSkillName(nSkillId)
	if mlvl > nMaxLevel then
		Msg2Player(format(" ���[%s]�Ѵ����ֵ�����ܼ���������!", szSkillName))
		return 0
	end 
	
	updataSkillPoint_4()		-- ����ʣ����õļ��ܵ�
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	if nLeaveSkillPoint < 1 then
		Msg2Player("��û������4���ܵ㣬���ܲ�������.")
		return 0
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint - 1
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint) -- ���ٿ�ʹ�õļ��ܵ���
	SetTask(TSK_USED_SKILL_POINT_4, (GetTask(TSK_USED_SKILL_POINT_4) + 1))	-- ������ʹ�õļ��ܵ�ֵ
	AddMagic(nSkillId, mlvl + 1)
	Msg2Player(format("����<color=green>%s<color> �Ѿ���������Ȼ����ʹ������4���ܵ�%d.", szSkillName, nLeaveSkillPoint))
	return 1
end

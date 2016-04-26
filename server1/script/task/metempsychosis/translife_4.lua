-- �ļ�������translife_4.lua
-- �����ߡ���wangjingjun
-- ���ݡ�����4ת��ضԻ��ͺ���
-- ����ʱ�䣺2011-08-01 14:15:10

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\lib\\log.lua")

function calSkillPoint(nCurLevel)
	local nResult = 0
	if nCurLevel < NSTARTLEVEL_4 then
		nResult = 0
	else
		nResult = floor((nCurLevel - NSTARTLEVEL_4) / NPERPOINTNEEDLEVEL) + 1
	end
	return nResult
end

function updataSkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	-- ������ڲ���4ת��������򲻽��д���
	if ntranscount ~= 4 then
		return
	end
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nLastUpLevel = GetTask(TSK_LAST_UP_LEVEL_4)
	local nCurLevel = GetLevel()
	-- ��ǰ�ȼ����Ի�õĵȼ�����
	local nAddPoint = calSkillPoint(nCurLevel) - calSkillPoint(nLastUpLevel)
	
	SetTask(TSK_LAST_UP_LEVEL_4, nCurLevel)
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint + nAddPoint)
end

function sureGetTranslifeTask_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount ~= 3 then
		CreateTaskSay({"<dec><npc>".."Ŀǰ�㲻��3ת�����ܼ�������", "֪����/OnCancel"})
		return 
	end
	
	local nCurLevel = GetLevel()
	if nCurLevel < 200 then
		CreateTaskSay({"<dec><npc>".."��ĵȼ�δ��200��!", "֪����/OnCancel"})
		return 
	end
	
	SetTask(TSK_TRANSLIFE_4, 1)
	Msg2Player("���ѽ�������ɹ�����ȥ�ռ���������")
end

function wantGetTranslifeTask_4()
	CreateTaskSay({"<dec><npc>ֻ��ת��3�εĸ��֣��ȼ��ﵽ200�����ܽ�������ȷ�������",
		"ȷ��/sureGetTranslifeTask_4",
		"��������/OnCancel"})
end

function querySkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>�㻹δ4ת��û�м��ܵ�Ҫ���!", "֪����/OnCancel"})
		return 
	end
	updataSkillPoint_4()		-- ����ʣ����õļ��ܵ�
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	CreateTaskSay({format("<dec><npc>Ŀǰ�����ʹ�õ�ʣ���4ת���ܵ�Ϊ %d, ��ʹ�� %d ��", nLeaveSkillPoint, nUsedSkillPoint),
		 "֪����/OnCancel"})
	return 
end

function wantClearSkillPoint_4()
	--�i������ϴTS4���ܵ�۸� - Modified by DinhHQ - 20110813
	CreateTaskSay({format("<dec><npc>��ϴ4ת���ܵ㣬��Ҫ%d ����1<color=red>[����ϴ�赤]<color>, ��ȷ��Ҫϴ��?",CLEAR_SKILL_4_PRICE ),
		"ȷ��/sureClearSkillPoint_4",
		"��������/OnCancel"})
end

function sureClearSkillPoint_4()
	-- δ4ת
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>�㻹δ4ת������ϴ���ܵ�!", "֪����/OnCancel"})
		return 
	end
	-- Ǯ����	
	--�i����4ת���ܵ����ϴ�۸�- Modified by DinhHQ - 20110813
	if GetCash() < CLEAR_SKILL_4_PRICE or CalcItemCount(3, 6, 1, 30127, -1) <= 0 then
		CreateTaskSay({format("<dec><npc>��ϴ4ת���ܵ���Ҫ<color=yellow> %d <color> ����1 <color=yellow>[����ϴ�赤]<color>, ׼���ú���������",CLEAR_SKILL_4_PRICE), "֪����/OnCancel"})
		return 
	end
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	-- û��ʹ�ü��ܵ�
	if nUsedSkillPoint <= 0 then
		CreateTaskSay({"<dec><npc>���ѷ����4ת���ܵ�Ϊ0������ϴ!", "֪����/OnCancel"})
		return 
	end
	
	--�i����4ת���ܵ����ϴ�۸�- Modified by DinhHQ - 20110813
	if ConsumeItem(3, 1, 6, 1, 30127, -1) ~= 1 then
		CreateTaskSay({"<dec><npc>��˵�б���ϴ�赤��Ϊʲôû��?", "��ȥ��/OnCancel"})
		return 
	end
	Pay(CLEAR_SKILL_4_PRICE)
	for i=1,getn(TB_SKILL_4) do
		if HaveMagic(TB_SKILL_4[i][1]) > 0 then
			SetSkillLevel(TB_SKILL_4[i][1],TB_SKILL_4[i][2])		-- �����ܵȼ������0
		end
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint + nUsedSkillPoint
	nUsedSkillPoint = 0
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint)
	SetTask(TSK_USED_SKILL_POINT_4, nUsedSkillPoint)
	CreateTaskSay({format("<dec><npc>������ϴ�ɹ�4ת���ܵ㣬Ŀǰ�����ʹ��4ת���ܵ�Ϊ%d, ��ʹ��%d ��", nLeaveSkillPoint, nUsedSkillPoint),
		 "֪����/OnCancel"})
	tbLog:PlayerActionLog("clear_4_turn_skill_point")
end
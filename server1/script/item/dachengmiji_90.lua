-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ 90������ؼ�
-- �Ҽ����ʹ�ã�������90�������ȼ��ܵ�20����
-- 6	1	2424
-- Edited by �ӷ��~
-- 2010/06/29 15:21

-- ======================================================

Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "�����Ȿ���������Ǹ����ɵĸ߼��书���㲻�˽����ǵ�����");
		return 1;
	end
	
	local tb_90skill = {
		[0] = {318, 319, 321},
		[1] = {322, 325, 323},
		[2] = {339, 302, 342},
		[3] = {353, 355},
		[4] = {380, 328},
		[5] = {336, 337},
		[6] = {357, 359},
		[7] = {361, 362},
		[8] = {365, 368},
		[9] = {372, 375},
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_90skill[n_fac]) do
		local skill = HaveMagic(tb_90skill[n_fac][i]);
		if (skill ~= -1 and skill ~= 20) then
			tinsert(tb_Desc, format("����".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "���ܴﵽ��߼����߻�δѧ.");
		return 1;
	end
	
	tinsert(tb_Desc, 1, "ѡ����Ҫ�����ļ���:");
	tinsert(tb_Desc, "�����Ի�/OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	if (HaveMagic(n_skillid) == -1 or HaveMagic(n_skillid) >= 20) then
		return	
	end
	
	if (ConsumeItem(3, 1, 6, 1, 2424, -1) == 1) then
		AddMagic(n_skillid, 20);
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d", 
				"����ؼ�90", 
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end
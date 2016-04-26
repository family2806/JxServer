IncludeLib("SETTING")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\lib\\log.lua")
TSK_WEEKLY_SJ = 2716 --�����ν���
TSK_WEEKLY_COT = 2717 --���ܴ��س���
WEEKLY_SJ_REQUIRE = 10
WEEKLY_COT_REQUIRE = 6
function main(nItemIdx)
	if ST_GetTransLifeCount() ~= 4 then
		Talk(1, "", "ֻ������4���˲���ʹ�ø���Ʒ!")
		return 1
	end
	local nSJ_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_SJ)
	local nCOT_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_COT)
	if nSJ_count < WEEKLY_SJ_REQUIRE or nCOT_count < WEEKLY_COT_REQUIRE then
		Talk(1, "", format("һ��������Ҫ�μ�10���ν��6�δ��ز���ʹ����Ʒ����ĲμӴ���Ϊ:�ν� <color=yellow>%d<color> - ����: <color=yellow>%d<color>", nSJ_count, nCOT_count))
		return 1
	end
	if tbVnTL4Skill:GetSkill() == 1 then
		return 0
	else
		return 1
	end
end

tbVnTL4Skill = {}
tbVnTL4Skill.tbSkill = {{1123, 10, "������"},{1124, 10, "��ˮ��"},{1125, 10, "������"},{1126, 10, "������"},{1127, 0, "������"},{1128, 20, "������"},{1129, 20, "�����"},{1130, 20, "׷Ӱ��"}}
function tbVnTL4Skill:GetSkill()
	local nRand = tbVnTL4Skill:RandomSkill()
	if nRand <= 0 or nRand > 8 then
		return 0
	end
	local tbSkill = self.tbSkill[nRand]
	if HaveMagic(tbSkill[1]) < 0 then
		local nUsedSkillPoint = GetTask(2899)
		if nUsedSkillPoint > 0 then
			Talk(1, "", "��Ҫ����ϴ������4�ļ���ֵ����ѧ�µļ��ܡ��뵽������������������.")
			return 0
		end
		--remove skill c?
		for i = 1, getn(self.tbSkill) do
			if HaveMagic(self.tbSkill[i][1]) >= 0 then
				DelMagic(self.tbSkill[i][1])
			end
		end
		AddMagic(tbSkill[1], 0)
		if HaveMagic(tbSkill[1]) < 0 then
			return 0
		end
	end
	Msg2Player(format("��ϲ��������书 <color=green>%s<color>", tbSkill[3]))
	tbLog:PlayerActionLog("ʹ�ð����澭", tbSkill[3])
	return 1
end

function tbVnTL4Skill:RandomSkill()
	local nTotal = 10000000
	local nCur = random(1, nTotal)
	local nStep = 0
	for i = 1, getn(self.tbSkill) do
		nStep = nStep + floor(self.tbSkill[i][2]*nTotal/100)
		if nCur < nStep then
			return i
		end
	end
end
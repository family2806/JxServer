IncludeLib("SETTING")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\lib\\log.lua")
TSK_WEEKLY_SJ = 2716 --本周宋金场数
TSK_WEEKLY_COT = 2717 --本周闯关场数
WEEKLY_SJ_REQUIRE = 10
WEEKLY_COT_REQUIRE = 6
function main(nItemIdx)
	if ST_GetTransLifeCount() ~= 4 then
		Talk(1, "", "只有重生4的人才能使用该物品!")
		return 1
	end
	local nSJ_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_SJ)
	local nCOT_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_COT)
	if nSJ_count < WEEKLY_SJ_REQUIRE or nCOT_count < WEEKLY_COT_REQUIRE then
		Talk(1, "", format("一周最少需要参加10场宋金和6次闯关才能使用物品。你的参加次数为:宋金： <color=yellow>%d<color> - 闯关: <color=yellow>%d<color>", nSJ_count, nCOT_count))
		return 1
	end
	if tbVnTL4Skill:GetSkill() == 1 then
		return 0
	else
		return 1
	end
end

tbVnTL4Skill = {}
tbVnTL4Skill.tbSkill = {{1123, 10, "武威术"},{1124, 10, "若水术"},{1125, 10, "镇岳术"},{1126, 10, "安波术"},{1127, 0, "长生术"},{1128, 20, "渤海术"},{1129, 20, "神慧术"},{1130, 20, "追影术"}}
function tbVnTL4Skill:GetSkill()
	local nRand = tbVnTL4Skill:RandomSkill()
	if nRand <= 0 or nRand > 8 then
		return 0
	end
	local tbSkill = self.tbSkill[nRand]
	if HaveMagic(tbSkill[1]) < 0 then
		local nUsedSkillPoint = GetTask(2899)
		if nUsedSkillPoint > 0 then
			Talk(1, "", "需要先清洗掉重生4的技能值才能学新的技能。请到北斗老人那里求助.")
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
	Msg2Player(format("恭喜你已领会武功 <color=green>%s<color>", tbSkill[3]))
	tbLog:PlayerActionLog("使用巴蜀真经", tbSkill[3])
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
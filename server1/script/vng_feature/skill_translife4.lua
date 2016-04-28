IncludeLib("SETTING")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\lib\\log.lua")
TSK_WEEKLY_SJ = 2716 --±¾ÖÜËÎ½ð³¡Êý
TSK_WEEKLY_COT = 2717 --±¾ÖÜ´³¹Ø³¡Êý
WEEKLY_SJ_REQUIRE = 10
WEEKLY_COT_REQUIRE = 6
function main(nItemIdx)
	if ST_GetTransLifeCount() ~= 4 then
		Talk(1, "", "ChØ nh÷ng nh©n vËt trïng sinh 4 míi sö dông ®­îc vËt phÈm nµy!")
		return 1
	end
	local nSJ_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_SJ)
	local nCOT_count = VngTaskWeekly:GetWeeklyCount(TSK_WEEKLY_COT)
	if nSJ_count < WEEKLY_SJ_REQUIRE or nCOT_count < WEEKLY_COT_REQUIRE then
		Talk(1, "", format("Mçi tuÇn ph¶i tham gia Ýt nhÊt 10 trËn Tèng Kim vµ 6 lÇn V­ît ¶i míi ®­îc sö dông vËt phÈm nµy. Sè lÇn tham gia cña c¸c h¹: Tèng Kim: <color=yellow>%d<color> - V­ît ¶i: <color=yellow>%d<color>", nSJ_count, nCOT_count))
		return 1
	end
	if tbVnTL4Skill:GetSkill() == 1 then
		return 0
	else
		return 1
	end
end

tbVnTL4Skill = {}
tbVnTL4Skill.tbSkill = {{1123, 10, "Vò Uy ThuËt"},{1124, 10, "Nh­îc Thñy ThuËt"},{1125, 10, "TrÊn Nh¹c ThuËt"},{1126, 10, "Yªn Ba ThuËt"},{1127, 0, "Tr­êng Sinh ThuËt"},{1128, 20, "Bét H¶i ThuËt"},{1129, 20, "ThÇn TuÖ ThuËt"},{1130, 20, "Truy ¶nh ThuËt"}}
function tbVnTL4Skill:GetSkill()
	local nRand = tbVnTL4Skill:RandomSkill()
	if nRand <= 0 or nRand > 8 then
		return 0
	end
	local tbSkill = self.tbSkill[nRand]
	if HaveMagic(tbSkill[1]) < 0 then
		local nUsedSkillPoint = GetTask(2899)
		if nUsedSkillPoint > 0 then
			Talk(1, "", "CÇn ph¶i tÈy ®iÓm kü n¨ng trïng sinh 4 tr­íc råi míi häc kü n¨ng míi! H·y ®Õn gÆp B¾c §Èu L·o Nh©n ®Ó ®­îc gióp ®ì.")
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
	Msg2Player(format("Chóc mõng b¹n ®· lÜnh héi ®­îc vâ c«ng <color=green>%s<color>", tbSkill[3]))
	tbLog:PlayerActionLog("SuDungBatThuatChanKinh", tbSkill[3])
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
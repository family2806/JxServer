-- 技能
IncludeLib("SETTING");
Include("\\script\\global\\login_head.lua")
-- ItemParticular={MagicID,IniLevel, NeedFaction, BookName, SkillName}
local faction_skill_list = {
	[0] = {[90] = {318, 319, 321}, [120] = {709}, [150] = {1055, 1056, 1057},},
	[1] = {[90] = {322, 325, 323}, [120] = {708}, [150] = {1058, 1059, 1060},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710}, [150] = {1069, 1070, 1071, 1110},},
	[3] = {[90] = {353, 355, 390}, [120] = {711}, [150] = {1066, 1067},},
	[4] = {[90] = {380, 328, 332}, [120] = {712}, [150] = {1061, 1062, 1114},},
	[5] = {[90] = {336, 337}, [120] = {713}, [150] = {1063, 1065},},
	[6] = {[90] = {357, 359}, [120] = {714}, [150] = {1073, 1074}},
	[7] = {[90] = {361, 362, 391}, [120] = {715}, [150] = {1075, 1076},},
	[8] = {[90] = {365, 368}, [120] = {716}, [150] = {1078, 1079},},
	[9] = {[90] = {372, 375, 394}, [120] = {717}, [150] = {1080, 1081},},
}

sbook_list =
{	-- 格式：{技能ID, 技能等级, 帮派ID, 所需级别, 技能书名称, 技能名称}
	[27] = {302, 1, 2, 80, "'袖箭术.暴雨梨花' ",	"暴雨梨花"},
	[28] = {351, 0, 2, 80, "'陷静术.乱还击' ",	"乱还击"},
	[33] = {365, 1, 8, 80, "太极拳谱-卷3 ",	"天地无极"},
	[34] = {368, 1, 8, 80, "'太极拳谱-卷 2' ",	"人剑合一"},
	[35] = {361, 1, 7, 80, "'云龙击.矛法' ",		"云龙击"},
	[36] = {362, 1, 7, 80, "'刘晶.刀法' ",		"天外刘晶"},
	[37] = {325, 1, 1, 80, "'天王锤法.卷 1' ",	"追风诀 "},
	[38] = {323, 1, 1, 80, "天王商法-卷 2 ", 	"追星逐月"},
	[39] = {322, 1, 1, 80, "天王刀法-卷3 ",	"破天斩"},
	[40] = {336, 1, 5, 80, "'翠烟刀法' ",			"冰松无影"},
	[41] = {337, 1, 5, 80, "'翠烟双刀' ",			"冰心仙子 "},
	[42] = {328, 1, 4, 80, "'灭剑秘籍",			"三峨齐雪"},
	[43] = {380, 1, 4, 80, "'峨眉佛光掌秘籍' ",	"风霜碎影"},
	[45] = {339, 1, 2, 80, "'飞刀术.摄魂月影' ",	"摄魂月影"},
	[46] = {342, 1, 2, 80, "'飞镖术.九宫飞晶' ",	"九宫飞晶"},
	[47] = {353, 1, 3, 80, "'五毒掌法.卷1' ",	" 阴阳蚀骨"},
	[48] = {355, 1, 3, 80, "'五毒刀法.卷2' ",	"玄阴斩 "},
	[49] = {390, 0, 3, 80, "'五毒摄心术.卷3' ",	"断筋腐骨"},
	[50] = {372, 1, 9, 80, "'御风术' ",			"傲雪萧峰"},
	[51] = {375, 1, 9, 80, "'御雷术' ",			"雷动九天"},
	[52] = {394, 0, 9, 80, "'御心术' ",			"醉仙打骨"},
	[53] = {391, 0, 7, 80, "摄魂-诅咒",		"摄魂乱心"},
	[54] = {357, 1, 6, 80, "'丐帮掌法' ",			"飞龙在天"},
	[55] = {359, 1, 6, 80, "丐帮棍法 ",			"天下无狗"},
	[56] = {318, 1, 0, 80, "'少林拳法.卷 1' ",	"达摩渡江"},
	[57] = {319, 1, 0, 80, "'少林棍法.卷2' ",	"横扫千军"},
	[58] = {321, 1, 0, 80, "'少林刀法.卷3' ",	"无相斩 "},
	[59] = {332, 0, 4, 80, "'普渡秘籍' ",			"普度众生"},
}

function CheckIsCanGet150SkillTask()
		--打开任务接150技能- Modified By NgaVN - 20121207
	local nValue = GetTask(2885)
	if nValue > 0 then
		return
	end
	--修整获得150技能任务需要重生2次以上- Modified By NgaVN - 20121207
	local nTransLife = ST_GetTransLifeCount()
	local nHaveTSFlag = 0;
	if(nTransLife > 1 ) then
		nHaveTSFlag = 1
	end
	
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or  nFact > 9 then
		return
	end
	local tb90Skill = %faction_skill_list[nFact][90]
	local nHave90SkillFlag = 0
	for i = 1, getn(tb90Skill) do
		if HaveMagic(tb90Skill[i]) >= 0 then
			nHave90SkillFlag = 1 
			break
		end
	end
	local tb120Skill = %faction_skill_list[nFact][120]
	local nHave120SkillFlag = 0
	for i = 1, getn(tb120Skill) do
		if HaveMagic(tb120Skill[i]) >= 0 then
			nHave120SkillFlag = 1 
			break
		end
	end
	local tb150Skill = %faction_skill_list[nFact][150]
	local nHave150SkillFlag = 0
	for i = 1, getn(tb150Skill) do
		if HaveMagic(tb150Skill[i]) >= 0 then
			nHave150SkillFlag = 1 
			break
		end
	end 
	if nHave150SkillFlag == 0 then
		if nHaveTSFlag ==1 and nHave90SkillFlag == 1 and nHave120SkillFlag == 1 and GetLevel() >= 150 then
			Msg2Player("<color=yellow>现在你可以接150级技能任务<enter>")
		else
			local szMsg = "你想接150级技能任务需要"
			local nFlag = 0
			
			if nHave90SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s 学到90技能", szMsg) 
				nFlag = 1
			end
			if nHave120SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s 学到120级技能", szMsg) 
				nFlag = 1
			end
			
			---修整获得150技能任务需要重生2次以上- Modified By NgaVN - 20121207
			if nHaveTSFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s 重生2次以上", szMsg) 
				nFlag = 1
			end
			
			if GetLevel() < 150 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s 达到150级", szMsg) 
				nFlag = 1
			end
			szMsg = format("<color=yellow>%s<color>", szMsg)
			Msg2Player(szMsg)
		end
	end
end

function LearnSkillByBook(index, list)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- 不是指定门派
		Msg2Player("你拿着"..list[index][5].."研究半天了，结果还是什么也没领悟")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- 但未到指定级别
		Msg2Player("你拿着"..list[index][5].."研究半天了，结果领会很少. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- 已学过该技能
		Msg2Player("你已拿 "..list[index][5].."思来想去，但是也没有学到什么 ")
		return 1
	end

	AddMagic(list[index][1], list[index][2])										-- 学会技能
	
	CheckIsCanGet150SkillTask()

	WriteLog(date("%H%M%S")..": 账号:"..GetAccount()..", 任务:"..GetName()..", 使用: "..list[index][5].."已学到: "..list[index][6]);
	Msg2Player("已学到技能"..list[index][6].."'. ")
	return 0

end

function main(sel)
	Genre, DetailType, Particular=GetItemProp(sel)
	return LearnSkillByBook(Particular, sbook_list);
end

--打开任务接150级技能 - Modified By NgaVN - 20121207
if login_add then login_add(CheckIsCanGet150SkillTask, 2) end
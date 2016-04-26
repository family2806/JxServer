-- 文件名　：jinengmiji_90.lua
-- 创建者　：wangjingjun
-- 内容　　：各门派的秘籍， 可以学习90级技能
-- 创建时间：2011-07-12 15:59:01

Include("\\script\\dailogsys\\dailogsay.lua")
--（少林0 天王1  唐门2  五毒3   峨眉4  翠烟5   丐帮6   天忍7   武当8   昆仑9）
sbook_list =
{	-- 格式：{技能ID, 技能等级, 帮派ID, 所需级别, 技能书名称, 技能名称}
	[2959] = {	
		{318, 1, 0, 90, "少林秘籍", "少林掌法-达摩渡江"},
		{319, 1, 0, 90, "少林秘籍", "少林棍法-横扫千军"},
		{321, 1, 0, 90, "少林秘籍", "少林刀法-无相斩"},
	},
	[2960] = {	
		{322, 1, 1, 90, "天王秘籍", "天王刀法-破天斩"},
		{323, 1, 1, 90, "天王秘籍", "天王枪法-追星逐月"},
		{325, 1, 1, 90, "天王秘籍", "天王锤法-追风诀"},
	},
	[2961] = {	 
		{339, 1, 2, 90, "唐门秘籍 ", "唐门飞刀-摄魂月影"},
		{302, 1, 2, 90, "唐门秘籍 ", "唐门袖箭-暴雨梨花"},
		{342, 1, 2, 90, "唐门秘籍 ", "唐门飞镖-九宫飞星"},
		{351, 1, 2, 90, "唐门秘籍 ", "唐门含静-乱还击"},
	},
	[2962] = {	 
		{353, 1, 3, 90, "五毒秘籍", "五毒掌法-阴风蚀骨"},
		{355, 1, 3, 90, "五毒秘籍", "五毒刀法-玄阴斩"},
		{390, 1, 3, 90, "五毒秘籍", "五毒摄心术-断筋腐骨"},
	},
	[2963] = {	 
		{328, 1, 4, 90, "峨眉秘籍", "峨眉剑法-三峨齐雪"},
		{380, 1, 4, 90, "峨眉秘籍", "峨眉掌法-风霜碎影"},
		{332, 1, 4, 90, "峨眉秘籍h", "峨眉普渡-普渡众生"},
	},
	[2964] = {	 
		{336, 1, 5, 90, "翠烟秘籍", "翠烟刀法-冰松无影"},
		{337, 1, 5, 90, "翠烟秘籍", "翠烟双刀-冰心仙子"},
	},
	[2965] = {	 
		{357, 1, 6, 90, "丐帮秘籍", "丐帮掌法-飞龙在天"},
		{359, 1, 6, 90, "丐帮秘籍", "丐帮棍法-天下无狗"},
	},
	[2966] = {	 
		{361, 1, 7, 90, "天忍秘籍", "天忍矛法-云龙击"},
		{362, 1, 7, 90, "天忍秘籍", "天忍刀法-天外流星"},
		{391, 1, 7, 90, "天忍秘籍", "天忍咒术-摄魂乱心"},
	},
	[2967] = {	 
		{365, 1, 8, 90, "武当秘籍", "武当掌法-傲雪萧峰"},
		{368, 1, 8, 90, "武当秘籍", "武当剑法-人剑合一"},
	},
	[2968] = {	 
		{372, 1, 9, 90, "昆仑秘籍", "昆仑御风-傲雪萧峰"},
		{375, 1, 9, 90, "昆仑秘籍", "昆仑御龙-雷动九天"},
		{394, 1, 9, 90, "昆仑秘籍", "昆仑御心-醉仙打骨"},
	},
}

function LearnSkillByBook(index, list, nItemIndex, nPlayerIndex)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- 不是指定门派
		Msg2Player("您拿着"..list[index][5].."研究半天，结果也领会不到什么")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- 但未到指定级别
		Msg2Player("您拿着"..list[index][5].."研究半天，结果领会一点. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- 已学过该技能
		Msg2Player("您已拿"..list[index][5].."研究来研究去，但是也没学到什么 ")
		return 1
	end
	
	-- 判断当前的物品是否为少林秘籍，是则先删除，后增加技能
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("放弃少林秘籍失败")
		return 
	end
	
	AddMagic(list[index][1], list[index][2])										-- 学会技能

	WriteLog(date("%H%M%S")..": 账号:"..GetAccount()..", 人物:"..GetName()..", 使用: "..list[index][5].."已学到: "..list[index][6]);
	Msg2Player("已学到技能"..list[index][6].."'. ")
	return 0
end

function selectskill(list, nItemIndex, nPlayerIndex)
	local szTitle = "大侠想学哪种技能"
	local tbOpt = {}
	for index,v in list do
		tinsert(tbOpt, {v[6], LearnSkillByBook, {index, list, nItemIndex, PlayerIndex}})
	end
	tinsert(tbOpt, {"任务好好想想", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function main(nItemIndex)
	Genre, DetailType, Particular=GetItemProp(nItemIndex)
	selectskill(sbook_list[Particular], nItemIndex, PlayerIndex)
	return 1
end

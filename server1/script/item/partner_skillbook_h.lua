--partner_skillbook.lua (技能书脚本)
--create by luobaohang @20050802
--last edit by luobaohang @20050816

IncludeLib("FILESYS");
IncludeLib("PARTNER");

Include("\\script\\lib\\string.lua");

TabFile_Load("\\settings\\partner\\skill_requirement.txt", "skill_require")
--randomseed(GetCurrentTime())

function SkillBookScript(iItem, nType)
	local partner_index = PARTNER_GetCurPartner()
	if (partner_index == nil or partner_index <= 0) then
		Msg2Player("<#>您还没有选择同伴！")
		return 1 
	end
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
		--判断五行属性
	if (series_limit ~= -1) then
		--Msg2Player(series_limit); 调试
		--Msg2Player(PARTNER_GetSeries(partner_index));
		if (series_limit ~= PARTNER_GetSeries(partner_index)) then
			Msg2Player("<#>您的同伴五行不适合参悟该书，未能领悟其中的奥秘");
			return 1
		end
	end
		--判断同伴需求等级
	local level_require = base_level + (item_level - 1) * level_increment;
	local partner_level = PARTNER_GetLevel(partner_index);
	if (level_require > partner_level) then
		Msg2Player("<#>您的同伴等级不适合参悟该书，未能领悟其中的奥秘");
		return 1
	end
		--判断是否高于同伴当前技能等级
	local skill_level, skill_exp = PARTNER_GetSkillInfo(partner_index, skill_id);
	if (skill_level >= item_level) then
		Msg2Player("<#>您的同伴早已领悟了该层技能，觉得再也学不到什么新东西");
		return 1
	elseif (skill_level ~= item_level-1) then --不能跳级
		Msg2Player("<#>您的同伴该技能的基础还没打好，不能急于求成啊");
		return 1
	elseif (skill_level == 0) then	--当前技能未学习过
		if (nType == 2) then
			--判断是否有技能空位
			local skill_can_learn = {1, 2, 3, 5, 7, 9, 11, 13, 15, 16} --可学习技能数等级需求
			local skills_learn = PARTNER_GetAllSkill(partner_index, 2);
			local nIndexTmp = floor(partner_level/10) + 1;
			if (nIndexTmp < 0) then 
				nIndexTmp = 0;
			elseif (nIndexTmp > 10) then 
				nIndexTmp = 10;
			end
			local nSkillsLearn;
			if (skills_learn == nil) then
				nSkillsLearn = 0;
			else
				nSkillsLearn = getn(skills_learn);
			end
			if (nSkillsLearn >= skill_can_learn[nIndexTmp]) then
				Msg2Player("<#>您的同伴在当前等级还不能再学习新的附加技能，想学习更多的附加技能需要更高的等级");
				return 1
			end
		elseif (nType == 3)	then
			local skills_learn = PARTNER_GetAllSkill(partner_index, 3);
			if (skills_learn ~= nil and getn(skills_learn) > 0) then--已学过绝技
			 	Msg2Player("<#>您的同伴已掌握一门绝技，不能再学习新的了");
			 	return 1
			 end
		else	--不是附加技能或绝技不能学习
			Msg2Player("<#>您的同伴对着秘籍参详了半天，未能领悟其中的奥秘");
		end
	end
	if (nType == 0) then
		local nTaskValue = PARTNER_GetTaskValue(partner_index, 11)
		if (nTaskValue >= 20) then
			Msg2Player("<#>您的同伴不能再学习此类技能了！")
			return 1
		end
		PARTNER_SetTaskValue(partner_index, 11, nTaskValue + 1)
	end
	--学习技能书
	--local skills_add = random(skill_level + 1, item_level)
	PARTNER_AddSkill(partner_index, nType, skill_id, item_level)
	Msg2Player("<#>您的同伴从秘籍中领会了"..tostring(item_level).."级技能： "..GetSkillName(skill_id))
	return 0
end

function GetDesc(iItem)
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
	--同伴需求等级
	local skill_name = GetSkillName(skill_id);
	local level_require = base_level + (item_level - 1) * level_increment
	local level_skillrequire = item_level - 1;
	local strDesc = format("<color=yellow>第%d卷", item_level)
	strDesc = strDesc.."\n同伴等级需求："..level_require;
	if (series_limit >= 0) then
		strDesc = strDesc.."\n同伴五行需求："..toSeries(series_limit);
	end
	if(level_skillrequire > 0) then
		strDesc= strDesc.."\n需要<"..skill_name..">"..level_skillrequire.."级";
	end
	return strDesc;
end
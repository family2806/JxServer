-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一 120级大乘秘籍
-- 右键点击使用，可提升120级熟练度技能到20级。

-- Edited by 子非魚
-- 2010/06/29 15:21

-- ======================================================


Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "好像这本书描述的是各门派的高级武功，你不了解它们的玄机");
		return 1;
	end
	
	local tb_90skill = {
		[0] = {709},
		[1] = {708},
		[2] = {710},
		[3] = {711},
		[4] = {712},
		[5] = {713},
		[6] = {714},
		[7] = {715},
		[8] = {716},
		[9] = {717},
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_90skill[n_fac]) do
		local skill = HaveMagic(tb_90skill[n_fac][i]);
		if (skill ~= -1 and skill ~= 20) then
			tinsert(tb_Desc, format("升级".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "技能达到最高级或者还未学.");
		return 1;
	end
	
	tinsert(tb_Desc, 1, "选择需要升级的技能:");
	tinsert(tb_Desc, "结束对话/OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	if (HaveMagic(n_skillid) == -1 or HaveMagic(n_skillid) >= 20) then
		return	
	end
	
	if (ConsumeItem(3, 1, 6, 1, 2425, -1) == 1) then
		AddMagic(n_skillid, 20);
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d", 
				"大成秘籍120", 
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end

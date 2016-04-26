-- 文件名　：translife_4_ex.lua
-- 创建者　：wangjingjun
-- 内容　　：转生4补充设计 若玩家已转生4次，且每次都在200级转生，则可以获得特殊技能，战意千秋	
-- 创建时间：2011-09-14 16:20:38

Include("\\script\\task\\metempsychosis\\task_head.lua")

TRANSLIFE_TIME = 4
TRANSLIFE_LEVEL = 200
SKILL_NAME = "战意千秋"
SKILL_ID = 1171 -- 战意千秋 id
SKILL_LEVEL = 1 -- 战意千秋 等级

function beidou_learn_specialskill()
	local szTitle = format("只有坚持的大侠<color=yellow>%d<color> 重生等级 <color=yellow>%d<color> 次才能学到我的秘传武功! ",TRANSLIFE_LEVEL,TRANSLIFE_TIME)
	local tbOpt = {}
	
	tinsert(tbOpt, {"确定要学吗",sureLearnSpecialSkill,{PlayerIndex}})
	tinsert(tbOpt, {"结束对话"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function checkTranslifetime()
	local n_transcount = ST_GetTransLifeCount()
	if n_transcount ~= TRANSLIFE_TIME then
		Talk(1,"","没有达到坚持200级重生到4次的要求，不能获得该技能")	
		return 0
	end
	return 1
end

function checkTranslifeLevel()
	local n_taskid = 0
	local n_taskbyte = 0
	local bRet = 1
	
	for n_transcount=1, TRANSLIFE_TIME do
		local n_id = floor(n_transcount / 2) + mod(n_transcount, 2)
		n_taskid = TSK_ZHUANSHENG_GRE[n_id]
		
		if (mod(n_transcount, 2) == 0) then
			n_taskbyte = 3
		else
			n_taskbyte = 1
		end
		local n_taskvalue = GetTask(n_taskid)
		n_taskvalue = GetByte(n_taskvalue, n_taskbyte, n_level)
	
--		print(format("第%d次转生的等级为%d",n_transcount, n_taskvalue))
	
		if n_taskvalue ~= TRANSLIFE_LEVEL then
			bRet = 0
			break
		end
	end
	
	if bRet ~= 1 then
		Talk(1,"","没有达到坚持200级重生到4次的要求，不能获得该技能")	
	end
	
	return bRet
end

function checkIsLearned()
	if HaveMagic(SKILL_ID) == -1 then
		return 1
	end
	Talk(1,"",format("大侠学到 <color=yellow>%s<color>, 不能再学了",SKILL_NAME))
	return 0
end

function sureLearnSpecialSkill(nPlayerIndex)
	
	if checkIsLearned() ~= 1 then
		return 
	end
	
	if checkTranslifetime() ~= 1 then
		return 
	end
	
	if checkTranslifeLevel() ~= 1 then
		return 
	end
	
	-- 学习技能
	
	AddMagic(SKILL_ID, SKILL_LEVEL)
	Talk(1,"",format("恭喜大侠学到<color=yellow>%s<color>",SKILL_NAME))
end


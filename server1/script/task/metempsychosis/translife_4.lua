-- 文件名　：translife_4.lua
-- 创建者　：wangjingjun
-- 内容　　：4转相关对话和函数
-- 创建时间：2011-08-01 14:15:10

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
	-- 如果现在不是4转的情况，则不进行处理
	if ntranscount ~= 4 then
		return
	end
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nLastUpLevel = GetTask(TSK_LAST_UP_LEVEL_4)
	local nCurLevel = GetLevel()
	-- 当前等级可以获得的等级奖励
	local nAddPoint = calSkillPoint(nCurLevel) - calSkillPoint(nLastUpLevel)
	
	SetTask(TSK_LAST_UP_LEVEL_4, nCurLevel)
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint + nAddPoint)
end

function sureGetTranslifeTask_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount ~= 3 then
		CreateTaskSay({"<dec><npc>".."目前你不是3转，不能继续任务", "知道了/OnCancel"})
		return 
	end
	
	local nCurLevel = GetLevel()
	if nCurLevel < 200 then
		CreateTaskSay({"<dec><npc>".."你的等级未到200级!", "知道了/OnCancel"})
		return 
	end
	
	SetTask(TSK_TRANSLIFE_4, 1)
	Msg2Player("你已接受任务成功，快去收集霹雳丹吧")
end

function wantGetTranslifeTask_4()
	CreateTaskSay({"<dec><npc>只有转生3次的高手，等级达到200级才能接任务，你确定相接吗？",
		"确定/sureGetTranslifeTask_4",
		"让我想想/OnCancel"})
end

function querySkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>你还未4转，没有技能点要检查!", "知道了/OnCancel"})
		return 
	end
	updataSkillPoint_4()		-- 更新剩余可用的技能点
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	CreateTaskSay({format("<dec><npc>目前你可以使用的剩余的4转技能点为 %d, 已使用 %d 点", nLeaveSkillPoint, nUsedSkillPoint),
		 "知道了/OnCancel"})
	return 
end

function wantClearSkillPoint_4()
	--调整清洗TS4技能点价格 - Modified by DinhHQ - 20110813
	CreateTaskSay({format("<dec><npc>清洗4转技能点，需要%d 两和1<color=red>[北斗洗髓丹]<color>, 你确定要洗吗?",CLEAR_SKILL_4_PRICE ),
		"确定/sureClearSkillPoint_4",
		"让我想想/OnCancel"})
end

function sureClearSkillPoint_4()
	-- 未4转
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>你还未4转，不能洗技能点!", "知道了/OnCancel"})
		return 
	end
	-- 钱不够	
	--调整4转技能点的清洗价格- Modified by DinhHQ - 20110813
	if GetCash() < CLEAR_SKILL_4_PRICE or CalcItemCount(3, 6, 1, 30127, -1) <= 0 then
		CreateTaskSay({format("<dec><npc>清洗4转技能点需要<color=yellow> %d <color> 两和1 <color=yellow>[北斗洗髓丹]<color>, 准备好后再来见我",CLEAR_SKILL_4_PRICE), "知道了/OnCancel"})
		return 
	end
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	-- 没有使用技能点
	if nUsedSkillPoint <= 0 then
		CreateTaskSay({"<dec><npc>你已分配的4转技能点为0，不能洗!", "知道了/OnCancel"})
		return 
	end
	
	--调整4转技能点的清洗价格- Modified by DinhHQ - 20110813
	if ConsumeItem(3, 1, 6, 1, 30127, -1) ~= 1 then
		CreateTaskSay({"<dec><npc>你说有北斗洗髓丹，为什么没见?", "我去找/OnCancel"})
		return 
	end
	Pay(CLEAR_SKILL_4_PRICE)
	for i=1,getn(TB_SKILL_4) do
		if HaveMagic(TB_SKILL_4[i][1]) > 0 then
			SetSkillLevel(TB_SKILL_4[i][1],TB_SKILL_4[i][2])		-- 将技能等级都变成0
		end
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint + nUsedSkillPoint
	nUsedSkillPoint = 0
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint)
	SetTask(TSK_USED_SKILL_POINT_4, nUsedSkillPoint)
	CreateTaskSay({format("<dec><npc>你已清洗成功4转技能点，目前你可以使用4转技能点为%d, 已使用%d 点", nLeaveSkillPoint, nUsedSkillPoint),
		 "知道了/OnCancel"})
	tbLog:PlayerActionLog("clear_4_turn_skill_point")
end
-- 文件名　：skilllvlup.lua
-- 创建者　：wangjingjun
-- 内容　　：四转相关技能的 8 个技能的升级
-- 创建时间：2011-07-30 17:50:05

Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")

tbZhuansheng_4_Skill = {}

function tbZhuansheng_4_Skill.skilllvelup(nSkillId)
	local mlvl = HaveMagic(nSkillId)
	local nMaxLevel = GetSkillMaxLevel(nSkillId)
	local szSkillName = GetSkillName(nSkillId)
	if mlvl > nMaxLevel then
		Msg2Player(format(" 你的[%s]已达最大值，不能继续升级了!", szSkillName))
		return 0
	end 
	
	updataSkillPoint_4()		-- 更新剩余可用的技能点
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	if nLeaveSkillPoint < 1 then
		Msg2Player("你没有重生4技能点，技能不能升级.")
		return 0
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint - 1
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint) -- 减少可使用的技能点量
	SetTask(TSK_USED_SKILL_POINT_4, (GetTask(TSK_USED_SKILL_POINT_4) + 1))	-- 增加已使用的技能点值
	AddMagic(nSkillId, mlvl + 1)
	Msg2Player(format("修炼<color=green>%s<color> 已经升级，依然可以使用重生4技能点%d.", szSkillName, nLeaveSkillPoint))
	return 1
end

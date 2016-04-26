Include("\\script\\vng_event\\20110225_8_thang_3\\item\\colortree_head.lua")
Include("\\script\\activitysys\\config\\19\\config.lua")
Include("\\script\\activitysys\\config\\19\\head.lua")

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _OnBreak = function()
	Msg2Player("收集间断")
end

local _GetAward = function(nNpcIdx, dwNpcId)
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"装备不足") ~= 1 then
		return 0
	end
	
	local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
	SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
	Msg2Player("收集结束!")
	if nTreePickStep == 1 then
		local tbAward =  {{szName="3月8日礼盒",tbProp={6,1,30103,1,0,0},nCount=1,nExpiredTime=20110321},}
		tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][3月8日][收获有色树]")
		AddNpcSkillState(nNpcIdx, 662,1, 1, 0)	-- 关闭感叹号
	end
end 

function main()
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local nTreeType = GetNpcParam(nNpcIdx, TREE_TYPE)
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nTreeGrowStep == 4 then
		
		if CheckGetAwardBelong(nNpcIdx) ~= 1 then
				return
		end
			
		local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
		if nTreePickStep == 0 then -- 还没开始
			Msg2Player("有色树成长30分钟后将枯竭，30分钟内请采摘礼盒.")
			SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
			nTreePickStep = 1
		end
		
		if nTreePickStep == 1 then -- 开始采摘
			Msg2Player("开始采摘")
			tbProgressBar:OpenByConfig(1, %_GetAward, {nNpcIdx, dwNpcId}, %_OnBreak)
			return 
		end
		
		if nTreePickStep == 2 then
			Msg2Player("已采摘")
			return
		end
		
		return
	end
	
	lib:ShowMessage("有色树正在成长")
	
end

function CheckGetAwardBelong(nNpcIdx)
	if CheckPlayerCondition() ~= 1 then
		return 0
	end
	
	local szBelongPlayerIdx = COLOR_TREE_NPC_DATA[nNpcIdx]
	if szBelongPlayerIdx ~= GetName() then
		Msg2Player("这不是你的树")
		return 0
	end
	return 1
end
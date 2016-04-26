IncludeLib("SETTING")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
--Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\global\\特殊用地\\梦境\\npc\\路人_叛僧.lua")
Include("\\script\\lib\\log.lua")

function ExpRecall_Input()
	AskClientForString("ExpRecall_Main", "", 1, 20, "经验值");
end

function ExpRecall_Main(nVal)
	local nExpToRecall = tonumber(nVal)
	if not nExpToRecall then
		Talk(1, "ExpRecall_Input", "只能输入号码?")
		return
	end

	local nLevel, nExp, nRemainExp = GetNextLevelExp(nExpToRecall)
	local nRecalledExp = nExpToRecall - nRemainExp
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDialog  = DailogClass:new(szNpcName)
	local strTittle  = format("实施操作后:\n\tLevel: <color=yellow>%d<color>\n\tExp: <color=yellow>"..nExp,nLevel).."/"..tl_getUpLevelExp(nLevel+1, ST_GetTransLifeCount()).."<color>"
	strTittle = strTittle.."\n\t数量Exp 需要收回: <color=yellow>"..nExpToRecall.."<color>\n\tS?Exp 可以收回: <color=yellow>"..nRecalledExp.."<color>\n\t数量 Exp 还不能收回: <color=yellow>"..nRemainExp.."<color>"
	tbDialog.szTitleMsg = strTittle	
	tbDialog:AddOptEntry("实施", ApplyRecall, {nLevel, nExp, nRecalledExp, nExpToRecall})	
	tbDialog:Show()
	--ApplyRecall()
end

function GetNextLevelExp(nExpToRecall)
	local nNextLevel = GetLevel()
	local nNextExp	= 0
	local nCurExp = GetExp()
	local nRemainExp = nExpToRecall
	if nCurExp >= nExpToRecall then
		nNextExp = nCurExp - nExpToRecall
		nRemainExp = 0 
	else
		nRemainExp = nRemainExp - nCurExp
		if nNextLevel > 10 then
			repeat			
				nNextLevel = nNextLevel - 1
				nRemainExp = nRemainExp - tl_getUpLevelExp(nNextLevel+1, ST_GetTransLifeCount())
			until (nNextLevel <= 10 or nRemainExp <= 0)
		end
		if (nNextLevel <= 10 and nRemainExp > 0) then
			nNextExp = 0
--			Msg2Player( format("Level 已达上限。数量Exp 未能收回: <color=green>%d", nRemainExp))			
		else
			if nRemainExp == 0 then
				nNextExp = 0
			else	
				nNextExp = nRemainExp * (-1)
			end
			nRemainExp = 0
		end
	end
	return nNextLevel, nNextExp, nRemainExp
end
function ApplyRecall(nLevel, nExp, nRecalledExp, nExpToRecall)		
	if nRecalledExp <= 0 then
		return 
	end	
	tbLog:PlayerActionLog("GMTool_收回Exp", "收回之前", ST_GetTransLifeCount(),GetExp(), nRecalledExp)
	if nLevel == GetLevel() then
		ReduceOwnExp(nRecalledExp)
		Msg2Player("已扣除成功 "..nRecalledExp.." 经验值")
		tbLog:PlayerActionLog("GMTool_收回Exp", "收回成功", ST_GetTransLifeCount(),GetExp(), nRecalledExp)
	else
		--zhuansheng_clear_prop(GetLevel(), 0)
		DoClearPropCore()
		DoClearSkillCore()
		ST_LevelUp(nLevel-GetLevel());
		AddOwnExp(nExp)
		Msg2Player("去除成功 "..nRecalledExp.." 经验值")
		tbLog:PlayerActionLog("GMTool_ThuHoiExp", "ThuHoiThanhCong", ST_GetTransLifeCount(),GetExp(), nRecalledExp)
		if nRecalledExp < nExpToRecall then
			tbLog:PlayerActionLog("GMTool_ThuHoiExp", "ExpChuaThuHoiDuoc", ST_GetTransLifeCount(),GetExp(), nExpToRecall - nRecalledExp)
			Talk(1, "", "Level 已达上限。数量Exp 未能收回: "..(nExpToRecall - nRecalledExp))
		end
		--KickOutSelf()	
	end	
end
function OnCancel()
end
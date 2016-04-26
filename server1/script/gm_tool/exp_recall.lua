IncludeLib("SETTING")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
--Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\global\\�����õ�\\�ξ�\\npc\\·��_��ɮ.lua")
Include("\\script\\lib\\log.lua")

function ExpRecall_Input()
	AskClientForString("ExpRecall_Main", "", 1, 20, "�i����ֵ");
end

function ExpRecall_Main(nVal)
	local nExpToRecall = tonumber(nVal)
	if not nExpToRecall then
		Talk(1, "ExpRecall_Input", "ֻ���������?")
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
	local strTittle  = format("ʵʩ������:\n\tLevel: <color=yellow>%d<color>\n\tExp: <color=yellow>"..nExp,nLevel).."/"..tl_getUpLevelExp(nLevel+1, ST_GetTransLifeCount()).."<color>"
	strTittle = strTittle.."\n\t����Exp ��Ҫ�ջ�: <color=yellow>"..nExpToRecall.."<color>\n\tS?Exp �����ջ�: <color=yellow>"..nRecalledExp.."<color>\n\t���� Exp �������ջ�: <color=yellow>"..nRemainExp.."<color>"
	tbDialog.szTitleMsg = strTittle	
	tbDialog:AddOptEntry("ʵʩ", ApplyRecall, {nLevel, nExp, nRecalledExp, nExpToRecall})	
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
--			Msg2Player( format("Level �Ѵ����ޡ�����Exp δ���ջ�: <color=green>%d", nRemainExp))			
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
	tbLog:PlayerActionLog("GMTool_�ջ�Exp", "�ջ�֮ǰ", ST_GetTransLifeCount(),GetExp(), nRecalledExp)
	if nLevel == GetLevel() then
		ReduceOwnExp(nRecalledExp)
		Msg2Player("�ѿ۳��ɹ� "..nRecalledExp.." ����ֵ")
		tbLog:PlayerActionLog("GMTool_�ջ�Exp", "�ջسɹ�", ST_GetTransLifeCount(),GetExp(), nRecalledExp)
	else
		--zhuansheng_clear_prop(GetLevel(), 0)
		DoClearPropCore()
		DoClearSkillCore()
		ST_LevelUp(nLevel-GetLevel());
		AddOwnExp(nExp)
		Msg2Player("ȥ���ɹ� "..nRecalledExp.." ����ֵ")
		tbLog:PlayerActionLog("GMTool_ThuHoiExp", "ThuHoiThanhCong", ST_GetTransLifeCount(),GetExp(), nRecalledExp)
		if nRecalledExp < nExpToRecall then
			tbLog:PlayerActionLog("GMTool_ThuHoiExp", "ExpChuaThuHoiDuoc", ST_GetTransLifeCount(),GetExp(), nExpToRecall - nRecalledExp)
			Talk(1, "", "Level �Ѵ����ޡ�����Exp δ���ջ�: "..(nExpToRecall - nRecalledExp))
		end
		--KickOutSelf()	
	end	
end
function OnCancel()
end
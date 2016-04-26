-- 120级技能任务，120级技能书

Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\item\\skillbook.lua")

function main(idxItem)
	
	if GetLastFactionNumber()==-1 then	
		Msg2Player("<color=yellow>您还没有进入任何门派，不能学习此技能！<color>");
		return 1;
	end;
	
	if GetLevel()<120 then
		Msg2Player("<color=yellow>您的等级小于 120，不能学习此技能！<color>");
		return 1;
	end;
	
	if GetTask(LV120_SKILL_ID)>0 then
		Msg2Player("<color=yellow>您已经领悟了本门派的 120 级技能，不能再从此书中参透什么。<color>");
		return 1;
	end;
	
	if (LearnSkillByBook(GetLastFactionNumber(), LV120SKILL_LIST) == 0) then
		SetTask(LV120_SKILL_ID, LV120SKILL_LIST[GetLastFactionNumber()][1])
		WriteLog("[120技能学习记录]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."] 使用了 120 级技能书，学到了技能："..GetLastFactionNumber());
		return 0
	end
	return 1
end

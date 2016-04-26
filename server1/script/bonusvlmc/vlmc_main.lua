Include("\\script\\bonusvlmc\\func_check.lua");

function AcceptEXPBonusTK()
	SetGlbValue(GlbVar1, 1)
	SetTask(TSK_Active_TK, 1)
	AddGlobalNews("V?L﹎ Minh Ch?<color=yellow> "..VLMC_Name.." <color> 号召天下英雄豪杰站起来共同抵御外敌. 谁有爱国精神的，赶紧到纪念台报名获取参战双倍积分奖励 !")
	Msg2Player("武林盟主<color=yellow> "..VLMC_Name.." <color> 颁发参战双倍积分奖励!")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC激活宋金双倍EXP")
end

function AcceptActiveX2EXP()
	SetGlbValue(GlbVar2, 1)
	SetTask(TSK_Active_x2EXP, 1)
	AddGlobalNews("武林盟主<color=yellow> "..VLMC_Name.." <color> 颁发打怪双倍积分奖励，请各位英雄豪杰赶紧到纪念台报名领奖")
	Msg2Player("V?L﹎ Minh Ch?<color=yellow> "..VLMC_Name.." <color> 颁发打怪双倍积分奖励")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."VLMC 激活打怪领取双倍积分")
end

function GetEXPBonus()
	SetTask(TSK_GetBonusEXP, 1)
	AddSkillState(451, 20, 1, 18*60*180);
	Say("恭喜大侠收到双倍积分效果!");
	Msg2Player("您已获得60分钟内双倍积分效果.");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."领取双倍积分")
end

function Get2xExpTK()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	SetTask(TSK_Get2ExpTK, nDate)
	Say("恭喜大侠获得宋金战场双倍积分!");
	Msg2Player("您获得宋金战场第21h00战双倍积分效果");
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VLMC"..GetAccount().."\t"..GetName().."\t".."领取21h00宋金双倍积分")
end

function ResetGlbValue()
	SetGlbValue(1252,0)
	SetGlbValue(1253,0)
end
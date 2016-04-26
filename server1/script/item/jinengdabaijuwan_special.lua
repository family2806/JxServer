--使用技能大白驹丸脚本
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>1 颗特别技能大白驹丸，使用后将获得<color=red>8小时<color> 委托。是一般技能白驹丸的两倍效果.",
		"<#>使用特别技能白驹丸 /use",
		"<#> 让我想想!/cancel",
		"<#> 看看我剩余的挂机时间/get_left_time",
		"<#> 选择离线挂机技能/#selectofflineskill('cancel')",
		"<#> 介绍挂机玩法的细节/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--选择使用技能大白驹丸
function use()
	local sparetime = GetTask(AEXP_SPECIAL_SKILL_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	if ((sparetime + AEXP_SPECIALSKILLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("您的离线挂机剩余时间为<color=red>"..hours.."<color>gi?color=red>"..minutes.."<color> 分钟。技能委托累计时间不能超过<color=red>10000 小时color>.", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SPECIALSKILLCHANGE;
			SetTask(AEXP_SPECIAL_SKILL_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("使用成功，您的离线挂机时间为<color=red>"..hours.."<color>小时<color=red>"..minutes.."<color> 分钟",0);
			writeUseBaiJulog("skillofflineitem_special", hours, minutes);
		else
			Say("没有特别技能白驹丸，可以使用", 0);	
		end
	end
end

--选择再考虑考虑
function cancel()
	return 0
end
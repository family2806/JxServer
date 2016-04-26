--使用技能大白驹丸脚本
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>一颗技能大白驹丸，使用后可获得<color=red>8小时<color>的离线托管时间。",
		"<#>使用技能大白驹丸/use",
		"<#>我再考虑考虑/cancel",
		"<#>查询我剩余的离线托管时间/get_left_time",
		"<#>选择离线托管技能/#selectofflineskill('cancel')",
		"<#>关于离线托管的详细介绍/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--选择使用技能大白驹丸
function use()
	local sparetime = GetTask(AEXP_SKILL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	if ((sparetime + AEXP_SKILLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("你目前的离线技能托管剩余时间为 <color=red>"..hours.."<color>小时<color=red>"..minutes.."<color>分钟，而你的离线技能托管时间累计不可以超过<color=red>10000小时<color>，请你过一段时间再使用技能大白驹丸。", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SKILLCHANGE;
			SetTask(AEXP_SKILL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("使用成功，你剩余的离线技能托管时间为 <color=red>"..hours.."<color>小时<color=red>"..minutes.."<color>分钟",0);
			writeUseBaiJulog("skillofflineitem_normal", hours, minutes);
		else
			Say("没有技能大白驹丸可以使用", 0);	
		end
	end
end

--选择再考虑考虑
function cancel()
	return 0
end
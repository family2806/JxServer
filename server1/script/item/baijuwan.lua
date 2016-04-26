--使用白驹丸脚本
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>一颗白驹丸，使用后可获得<color=red>1小时<color>的离线托管时间。",
		"<#>使用白驹丸/confirmlevel",
		"<#>我再考虑考虑/cancel",
		"<#>查询我剩余的离线托管时间/get_left_time",
		"<#>关于离线托管的详细介绍/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--判断等级再次确认
function confirmlevel()
	str=
	{	"<#>因为你的等级低于<color=red>50级<color>，所以在离线托管状态内，你可以进行摆摊交易，并且获得福缘，但不会获得<color=red>经验值<color>。你确定要使用白驹丸吗？",
		"<#>确定/use",
		"<#>我再考虑考虑/cancel",
		"<#>因为你不是充值用户，所以不能使用离线托管功能。请你充值后再使用该物品。"
	};

    -- 充卡用户才能使用白驹丸
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end
	
	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--选择使用白驹丸
function use()
	sparetime = GetTask(AEXP_SMALL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;
	end

	--showtime = floor(sparetime /(FRAME2TIME * 60));		--给用户提示显示到分钟
	if ((sparetime + AEXP_SMALLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("你目前的离线经验托管剩余时间为 <color=red>"..hours.."<color>小时<color=red>"..minutes.."<color>分钟，而你的离线经验托管时间累计不可以超过<color=red>10000小时<color>，请你过一段时间再使用白驹丸。", 0);
	else
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		smallgeneraltype,smalldetailtype,smallpartype = GetItemProp(itemindex);
		if ( smallgeneraltype ~= AEXP_SMALL_NGENTYPE
			or smalldetailtype ~= AEXP_SMALL_DETAILTYPE
			or smallpartype ~= AEXP_SMALL_PARTYPE) then
			return 
		end 
		
		nresult = RemoveItemByIndex(itemindex);
		
		if (nresult > 0) then 
			ntotaltime=sparetime + AEXP_SMALLCHANGE;
			SetTask(AEXP_SMALL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("使用成功，你目前的离线托管剩余时间为 <color=red>"..hours.."<color>小时<color=red>"..minutes.."<color>分钟",0);
			writeUseBaiJulog("offlineitem_small", hours, minutes);
		else
			Say("没有白驹丸可以使用", 0);	
		end
	end
end

--选择再考虑考虑
function cancel()
	return 0
end
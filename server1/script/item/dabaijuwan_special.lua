--使用特效大白驹丸脚本
--2006.08.29
--80小时离线托管时间
--经验为原白驹的2倍

Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>一颗特效大白驹丸，使用后可获得<color=red>80小时<color>的离线托管时间。在此期间获得的托管经验是普通白驹丸效果的2倍。",
		"<#>使用特效大白驹丸/confirmlevel",
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
	{	"<#>因为你的等级低于<color=red>50级<color>，所以在离线托管状态内，你可以进行摆摊交易，但不会获得<color=red>经验值<color>。你确定要使用特效大白驹丸吗？",
		"<#>确定/use",
		"<#>我再考虑考虑/cancel",
		"<#>因为你不是充值用户，所以不能使用离线托管功能。请你充值后再使用该物品。"
	};

    -- 充卡用户才能使用大白驹丸
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

--选择使用特效大白驹丸
function use()
	local sparetime = GetTask(AEXP_SPECIAL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--给用户提示显示到分钟
	if ((sparetime + AEXP_SPECIALCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("你目前的特效大白驹丸离线经验托管剩余时间为 <color=red>"..hours.."<color>小时<color=red>"..minutes.."<color>分钟，而你的离线经验托管时间累计不可以超过<color=red>10000小时<color>，请你过一段时间再使用特效大白驹丸。", 0);
	else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		local g, d, p = GetItemProp(itemindex);
		
		if ( g ~= 6
			or d ~= 1
			or p ~= 1157) then
			return --不是特效大白驹
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SPECIALCHANGE;
			SetTask(AEXP_SPECIAL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("使用成功，你剩余的特效大白驹丸离线托管时间为 <color=red>"..hours.."<color>小时<color=red>"..minutes.."<color>分钟",0);
			writeUseBaiJulog("offlineitem_special", hours, minutes);
		else
			Say("没有特效大白驹丸可以使用", 0);	
		end
	end
end

--选择再考虑考虑
function cancel()
	return 0
end
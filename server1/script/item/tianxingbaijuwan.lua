--使用特效大白驹丸脚本
--2006.08.29
--80小时离线托管时间
--经验为原白驹的2倍

Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>天星白驹丸，使用后获得<color=red>8 小时<color> 委托离线.获得经验是平常白驹丸的5倍",
		"<#>使用天星白驹丸/confirmlevel",
		"<#> 让我再想想!/cancel",
		"<#> 查看我的挂机剩余时间/get_left_time",
		"<#> 结束挂机玩法的细节/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--判断等级再次确认
function confirmlevel()
	str=
	{	"<#>你的等级低于 <color=red>50<color>. 所以，在在线委托状态下，你可以进行买卖交易以及领取福缘点，但是不能获得<color=red>经验值<color>. 你真的要使用特别白驹丸吗？#?",
		"<#> 使用/use",
		"<#> 让我想想!/cancel",
		"<#> 因为你不是充值客户，所以不能使用离线功能。请充值后使用该物品!",
		"<#>玩家需要50级以上以及已经转生才能使用该物品."
	};

    -- 充卡用户才能使用大白驹丸
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end

	nLevel = GetLevel();

	if (nLevel < AEXP_NEEDLEVEL or ST_IsTransLife() ~= 1) then
		Talk(1, "", str[5]);
		return 
	end
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--选择使用天星白驹丸
function use()
	local sparetime = GetTask(AEXP_TIANXING_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--给用户提示显示到分钟
	if ((sparetime + AEXP_BIGCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("天星白驹丸委托剩余时间为 <color=red>"..hours.."<color>小时<color=red>"..minutes.."<color> 分钟. 经验积累的委托时间不能超过<color=red>10000 小时<color>.", 0);
	else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		local g, d, p = GetItemProp(itemindex);
		
		if ( g ~= 6
			or d ~= 1
			or p ~= 2183) then
			return --不是特效大白驹
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_BIGCHANGE;
			SetTask(AEXP_TIANXING_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("成功使用，天星白驹丸的委托时间为<color=red>"..hours.."<color>小时<color=red>"..minutes.."<color> 分钟",0);
			writeUseBaiJulog("offlineitem_special", hours, minutes);
		else
			Say("没有天星白驹丸可以使用", 0);	
		end
	end
end

--选择再考虑考虑
function cancel()
	return 0
end
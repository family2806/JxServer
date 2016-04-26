--武林大会侍卫

Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function main()
	Say("武林新秀联赛官员: 从2005年6月1日到2005年6月10日, 每天20:到 23:00将举行<color=yellow>武林新秀联赛联赛<color>. 本场比赛目的是给新手（50级到89级）创造与同门交流的机会，提高新手的武艺，快去参加吧!", 1, "同意 /want_bid_option")
end

function want_enrol_option()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"参加武林新秀联赛 /want_enrol",
				"武林新秀联赛成绩!/look_sort",
				"武林新秀联赛帮助/help_freshmanmatch",
				"我稍候再来!/OnCancel"
				}
		Say("想参加武林新秀联赛吗?", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		Say("武林新秀联赛已结束，排名前五的可以到临安见武林新秀联赛官员(182, 202) 领取称号.", 0)
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say( "武林新秀联赛将开始从"..date( "%Y" ).."年"..nMonth.."月 "..nDay.."日 "..nHour.."正式开始，请继续关注!", 0 )
	end
end

function want_enrol()
	if ( nt_gettask( CP_TASKID_REGIST ) ~= CP_UPTO_TRYOUT ) then
	
		if (GetLevel() >= 90  ) then
			Say("90级以上不能参加比赛.", 0)
			return
		end
		
		if ( GetLevel() < 50 ) then
			Say( "你的等级不够50级要求，不能报名比赛!", 0 )
			return
		end
		
	end
	local nHour = mod( CP_UPTO_TRYOUT, 100 )
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV( MS_STATE ) == 0) then
		local talkstr = "武林新秀联赛每天从"..nHour..":00 时"..opentime..", 现在是"..date( "%H:%M" )..", 稍候回来吧!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "武林新秀联赛正在进行，请等下一场!"
		Say(talkstr, 0)
		return
	end
		
	Say("武林新秀联赛每天从"..nHour..":00 时"..opentime..", 报名时间为5分钟，比赛时间为15分钟，大家都可以参加."..CP_MAXROUND.."比赛。报名进入准备比赛区域后，你可以离开或者等到比赛时间。.", 2, "我想参加比赛!/sure_enrol_1", "让我看看/OnCancel")
end

function sure_enrol_1()
	Say("根据武林盟主的号令，在比赛中严禁使用PK药，你要看看你身上有没有这个药，否则将会被停赛。我将删除你的异常PK状态。 <color=red>进入赛场时，你需要看装备的消耗度。进入斗场后，严禁移动物品。你检查一下看看装备够了吗?",2, "我已准备好了!/sure_enrol_2", "我稍候回来!/OnCancel")
end

function sure_enrol_2()
	Say("会场官员:<color=red>进入准备区域和比赛区域，玩家不能移动装备里的物品，但是，可以使用物品。你快检查一下道具栏上的物品够了吗?",2,"确认/sure_enrol", "我还未准备好!/OnCancel")
end

function sure_enrol()
	local forbiditem_con = 0
	local forbiditem_key = 0
	local keyitem = {}
	local keyitem_g = {}
	local keyitem_d = {}
	local keyitem_p = {}
	for i = 1, 3 do
		keyitem[i] = ITEM_GetImmediaItemIndex (i)
		if (keyitem[i] ~= 0) then
			keyitem_g[i], keyitem_d[i], keyitem_p[i] = GetItemProp(keyitem[i])
		else
			keyitem_g[i] = 0
			keyitem_d[i] = 0
			keyitem_p[i] = 0
		end
	end
	for i = 1, getn(CP_FORBID_ITEM) do
		forbiditem_con = CalcEquiproomItemCount( CP_FORBID_ITEM[i][2][1], CP_FORBID_ITEM[i][2][2], CP_FORBID_ITEM[i][2][3], CP_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		for j = 1, 3 do 
			if (keyitem_g[j] == CP_FORBID_ITEM[i][2][1] and keyitem_d[j] == CP_FORBID_ITEM[i][2][2] and keyitem_p[j] == CP_FORBID_ITEM[i][2][3]) then
				forbiditem_key = 1
				break
			end
		end
	end
	if(forbiditem_con > 0 or forbiditem_key > 0) then
		Say("你真是胆大，敢不听从武林盟主的命令，擅自带禁药进入，快离开这里!", 0)
		return
	end
	
	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
		Say("目前你的工具栏上海没有物品，请选择物品放入正确位置!<color=red> 进入赛场后，尽在移动物品，请确认工具栏上的物品都整理好了吗?", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "你才是第一次参加啊？想参加吗?"
		Say(talkstr, 2, "我想参加!/pay_enrol_money", "让我看看/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("进入比赛区域后，不能移动装备里的物品，但是可以使用物品");
end

function pay_enrol_money()

		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
		join_tryout()
end

function look_sort()
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		for i = 1096 , 1105 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
	end
	
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("目前你还未有任何场次的比赛!", 0)
	else
		Say("武林新秀联赛允许每个人最多参加"..CP_MAXROUND.."次，现在你已参加了<color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> 次，奖励为"..nt_gettask(CP_TASKID_POINT)..", 胜"..nt_gettask(CP_TASKID_WIN).."t场, 输"..nt_gettask(CP_TASKID_LOSE).."场, 和"..nt_gettask(CP_TASKID_TIE).."场.", 0)
	end
end


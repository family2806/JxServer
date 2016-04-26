--武林大会侍卫
Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\missions\\championship\\tryout\\head.lua")
function main()
	Say("赛场官员: 这次比赛将从天下英雄和武林豪杰中选出90位武林高手代表参加全区武林大会！请你去参加盛大的武林大会!", 1, "同意/want_enrol_option")
end

function want_enrol_option()
	cp_syntaskround()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"参加门派预选赛/want_enrol",
				"查看我现在的预选赛的成绩/look_sort",
				"门派预选赛帮助/help_tryout",
				"我一会回来!/OnCancel"
				}
		Say("想去武林大会", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) > CP_END_TRYOUT) then
		Say("武林大会预选赛结束了，你可以到临安见武林大会官员看中选名单.", 0)		
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say("武林大会预选赛将组织于"..date("%Y").."年"..nMonth.."月"..nDay.."日"..nHour.."正式开始，请继续关注!",0)
	end
end

function want_enrol()
	--if 本账号的其他角色已报名 then
	--	Say("本帐号在本服已有角色参加门派预选赛，则其他角色在本服不能参赛。请在放弃参赛角色资格后，再用本角色报名参赛！", 0)
	--	return 
	--end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then	--已经取消了报名资格
		Say("你已经放弃了参加门派预选赛的资格，不能继续报名参加比赛.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--已经取得决赛圈资格
		Say("你已取得选手资格，不要到这再抢位了!", 0)
		return
	end
	local nHour = mod(CP_UPTO_TRYOUT, 100)
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV(MS_STATE) == 0) then
		local talkstr = "门派预选赛开始于每天"..nHour..":00点"..opentime..", 现在是"..date("%H:%M")..", 待会再来吧!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "这个比赛区正在进行比赛，请等下一场!"
		Say(talkstr, 0)
		return
	end
		
	Say("门派预选赛开始于每天"..nHour..":00点"..opentime.." 时，报名时间是5分钟，比赛时间是10分钟，每个人只能参加"..CP_MAXROUND.."局比赛. 在准备区报名之后，你可以选择离开或是等待。根据比赛成绩选出5个人代表门派参加区域总决赛", 2, "我想参加预选!/sure_enrol_1", "让我看看/OnCancel")
end

function sure_enrol_1()
	Say("盟主有令，在武林新秀联赛中严禁使用<color=red>PK药品<color>, 参加之前你要看在身上是否有此类药品，如果不检查则将会被停赛. 我将会清除你的异常PK状态. <color=red>进入赛场时，你要看装备的消耗点。进入赛场后，严禁转移物品。你要再检查工具箱中的物品充足吗？",2, "我准备好了!/sure_enrol_2", "我一会回来!/OnCancel")
end

function sure_enrol_2()
	Say("会场官员:<color=red>进入准备区和比赛区，玩家不能转移背包里的物品，但是还可以使用工具箱和背包里的物品。你检查一下工具箱中的物品够吗?",2,"确定/sure_enrol", "我还没有准备!/OnCancel")
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
		Say("你真大胆！竟敢不遵守武林盟主的命令，擅自带禁药进入，赶快离开!", 0)
		return
	end
	
	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
		Say("你的工具栏里没有药品，把药品放进工具栏！<color=red>进入赛场后禁止转移物品，请确定工具栏是否是满的?<color>", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "你第一次参加预选要交10万两的报名费."
		Say(talkstr, 2, "这是10万两./pay_enrol_money", "等我看看/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("进入比赛区之后，不能转移背包中的物品，但是依旧可以使用背包和工具箱中的物品。");
end

function pay_enrol_money()
	if (GetCash() >= CP_CASH) then
		Pay(CP_CASH)
		
		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end

		join_tryout()
		return
	end
	Say("你的报名费不够，够10万两再来!", 0)
end

function look_sort()
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("你现在还没有参加任何比赛!", 0)
	else
		Say("武林大会门派预选赛每个人最多参加"..CP_MAXROUND.."次. 你现在已经参加了<color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> 局比赛, 得到总分是："..nt_gettask(CP_TASKID_POINT)..", 胜"..nt_gettask(CP_TASKID_WIN).."场, 败"..nt_gettask(CP_TASKID_LOSE).."场, 和"..nt_gettask(CP_TASKID_TIE).."场.", 0)
	end
end


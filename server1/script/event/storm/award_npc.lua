Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--名次的文字描述
TB_STORM_LADDERNAME = {"冠军", "亚军", "第3名", " 第4名", " 第5名",
	"第6名", " 第7名", " 第8名", " 第9名", " 第10名", "不在排名榜上", "没有排名"}

--武林盟传人	
STORM_WLMCR = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>武林传人<link>"

--检查指定的awardtype
--awardid == nil	返回：积分+/-排行	可以领取的所有奖励
--awardid > 0		返回：nil不可以领取	否则返回积分+/-排行
function storm_checkaward(awardtype, awardid)
	storm_anotherday()
	
	if (awardtype == nil or TB_STORM_AWARD[awardtype] == nil) then
		return nil
	end
	
	if (GetTask(TB_STORM_AWARD[awardtype][3]) > 0) then
		Say("不好意思! "..TB_STORM_AWARD[awardtype][1].."你的奖励已经领取过了!", 0)
		return nil
	end
	
	local awardvalue = 0
	if (TB_STORM_AWARD[awardtype][2] == 1) then
		awardvalue = -storm_getrank(awardtype)	--用负数作比较更方便
	else
		awardvalue = GetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if (awardid == nil) then
		local tb_award = {}
		local awardlevel = awardvalue
		for i = 1, getn(TB_STORM_AWARD[awardtype][5]) do
			if (awardvalue >= TB_STORM_AWARD[awardtype][5][i][1]) then
				if (awardlevel == TB_STORM_AWARD[awardtype][5][i][1] or getn(tb_award) == 0) then	--不能领低级奖励
					awardlevel = TB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1] = i
				end
			end
		end
		return awardvalue, tb_award
	else
		if (awardvalue < TB_STORM_AWARD[awardtype][5][awardid][1]) then
			Say("武林传人：你好像没有领此奖品!", 0)
			return nil
		else
			return awardvalue
		end
	end
end

--主对话
function storm_main()
	if (GetTask(STORM_TASKID_LETTER) ~= 2) then
		Describe(STORM_WLMCR.."<#> 江湖豪杰四海为家！ 举头望月, 低头望水！突然想到一句话：假使人生永平坦, 英雄豪杰更比谁!", 1, "拜师9月风暴活动/storm_main")
		Msg2Player("你得到沈少远的神秘手稿")
		AddItem(6, 1, 898, 1, 0 ,0)
		SetTask(STORM_TASKID_LETTER, 2)
	else
		local tb_option = {}
		tb_option[getn(tb_option)+1] = "我想领取今日奖励/#storm_award(1)"
		if (GetTask(STORM_TASKID_DAY_LASTAWARD) == 0) then
			tb_option[getn(tb_option)+1] = "我想领取昨日奖励/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1] = "我想领取上周奖励/#storm_award(2)"
		tb_option[getn(tb_option)+1] = "我想领取上月奖励/#storm_award(3)"
		tb_option[getn(tb_option)+1] = "了解我的积累点/#storm_query(0)"
		tb_option[getn(tb_option)+1] = "了解风暴活动/storm_help"
		tb_option[getn(tb_option)+1] = "不需要!/OnCancel"
		Describe(STORM_WLMCR.."<#> 请在活动主页增加活动详情", getn(tb_option), tb_option)
	end
	storm_anotherday()
end

--领取奖励（查看奖励）
function storm_award(awardtype)
	local awardvalue, tb_award = storm_checkaward(awardtype)
	if (awardvalue == nil) then
		return
	end
	
	local str = ""
	if (awardvalue >= 0) then
		str = "你"..TB_STORM_AWARD[awardtype][1].."风暴积分是:"..storm_point2str(awardvalue)
	elseif (awardvalue == -12) then
		str = TB_STORM_AWARD[awardtype][1].."排行榜上没有"
	elseif (awardvalue == -11) then
		str = "你"..TB_STORM_AWARD[awardtype][1].."排行榜上没有"
	elseif (awardvalue >= -3) then
		str = "你"..TB_STORM_AWARD[awardtype][1].."9月风暴活动中"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str = "你"..TB_STORM_AWARD[awardtype][1].."9月风暴活动中排名"..storm_point2str(-awardvalue).."名 "
	end
	
	local awardcount = getn(tb_award)
	if (awardcount > 0) then
		local tb_option = {}
		if (awardcount == 1) then
			str = str..", 你可以领取奖品: <enter>"
			str = str.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str = str.."<enter>, 现在领取吗?"
			Say("武林传人:"..str, 2, "我要领奖/#storm_getaward("..awardtype..","..tb_award[1]..",0)", "我想一想/OnCancel")
		else
			str = str..", 你可以在以下奖品中任选一个: <enter>"
			for i = 1, getn(tb_award) do
				if (i >= 2) then
					str = str.."或"
				end
				local awardname = TB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str = str.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1] = "领"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str = str.."<enter> 确定了吗?"
			tb_option[getn(tb_option)+1] = "不需要!/OnCancel"
			Say("武林传人:"..str, getn(tb_option), tb_option)
		end
	else
		Say("武林传人:"..str..", 你无法领奖", 0)
		return
	end
end

--领取指定奖品
function storm_getaward(awardtype, awardid, sure)
	local awardvalue = storm_checkaward(awardtype, awardid)
	if (not storm_checkaward(awardtype, awardid)) then
		return
	end

	if (sure == 1) then
		Say("领奖前整理背包!", 2, "我已经准备好了!/#storm_getaward("..awardtype..","..awardid..",2)", "我还要再整理下背包/OnCancel")
	elseif (sure == 2) then
		if (CalcFreeItemCellCount() < storm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])) then
			Say("你的背包没有空间，整理一下!", 0)
		else
			if (awardtype == 1 or awardtype == 4) then
				local mapid = tostring(SubWorldIdx2ID(SubWorld))
				local plcount = GetGlbValue(46) + 1
				SetGlbValue(46, plcount)
				Ladder_NewLadder(10195, mapid, plcount, 1)
			end
			local str = "得到"..TB_STORM_AWARD[awardtype][1].."风暴积分奖励"..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3], 1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if (awardvalue >= 0) then
				str = awardvalue.."风暴积分"
			else
				str = "排第"..(-awardvalue).."名"
			end
			if (awardtype == 2 or awardtype == 3 or awardid <= 2) then	--大奖发布公告
				AddGlobalNews(GetName().."在"..TB_STORM_AWARD[awardtype][1].."风暴活动中得到"..TB_STORM_AWARD[awardtype][5][awardid][2].." ")
			end
		end
	else
		Say("你确定领取<color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color> 是吗? 领完之后不能领了"..TB_STORM_AWARD[awardtype][1].."别的奖励!", 2, "知道了! 我只领这个算了！/#storm_getaward("..awardtype..","..awardid..",1)", "不需要!/OnCancel")
	end
end

--查询个人风暴积分情况
function storm_query(querytype)
	storm_anotherday()
	
	local str = ""
	local tb_sheet = {}
	local var_width, var_align
	if (querytype == 1) then
		if (GetTask(STORM_TASKID_DAY) <= STORM_END_DAY) then
			str = "你今日的风暴积分如下: <enter>%今日总积分是:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width = {12,8,8,10}
			var_align = 2
			tb_sheet[getn(tb_sheet)+1] = {"活动名", "次数", "状态", "最高积分"}
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local trycount = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local state = ""
					if storm_valid_game(i) then
						state = "<color=red>正在进行<color>"
					elseif (trycount <= 0) then
						state = "<color=blue>还未进行<color>"
					elseif (trycount < TB_STORM_TRYTIMES[i]) then
						state = "<color=green>已经进行了<color>"
					else
						state = "<color=8947848>已结束了<color>"
					end
					tb_sheet[getn(tb_sheet)+1] = {
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str = "活动<color=red>9月风暴<color>已结束!"
		end
	elseif (querytype == 2) then
		str = "  你最近的风暴积分是:<enter>%s"
		var_width = {8,10,6,8,10}
		var_align = 2
		tb_sheet[getn(tb_sheet)+1] = {
			"今天的积分是", storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), "",
			"昨天的积分", storm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"这周的积分", storm_point2str(GetTask(STORM_TASKID_WEEK_POINT)), "",
			"上周的积分", storm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"这个月的积分", storm_point2str(GetTask(STORM_TASKID_MONTH_POINT)), "",
			"上个月的积分", storm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"上周排名", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>", "",
			"上月排名", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("你想了解什么问题?", 3, "我今天的风暴积分/#storm_query(1)", "我最近的风暴积分/#storm_query(2)", "没有什么!/OnCancel")
		return
	end
	str = format(str, maketable(tb_sheet, var_width, var_align))
	Say(str, 2, "继续了解/#storm_query(0)", "没什么，谢谢!/OnCancel")
end

--活动说明——总
function storm_help()
	local tb_option = {}
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			tb_option[getn(tb_option)+1] = "与风暴活动有关的-"..TB_STORM_DESCRIBE[i].."帮助/#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "与风暴活动有关的/#storm_help_award(0)"
	tb_option[getn(tb_option)+1] = "知道了!/OnCancel"
	Say("  风暴活动从8/9/到2/10, 包括宋金战场, 野叟任务链, 杀手试炼任务. 每天将会根据系统中的成绩给出<color=yellow>风暴积分<color> (参加条件: 50级以上玩家) .每日几分将在<color=red>24:00之后清零<color>, 请在24:00前领奖.<enter>. 每天 <color=red>23:30<color> 宋金战场开始, 成绩不记录进风暴积分.", getn(tb_option), tb_option)
end

--活动说明——挑战
function storm_help_game(gameid)
	local str = TB_STORM_HELP[gameid]
	if (gameid == 1) then	--宋金需要补充说明分数上限
		str = format(str, "高级宋金战场, 每人每天最多只能领取的风暴积分是<color=yellow>100<color> 点. 初中级宋金战场最多分别得到<color=yellow>80<color>, <color=yellow>90<color> 点.")
	end
	Say(str, 2, "要了解别的/storm_help", "知道了!/OnCancel")
end

--活动说明——奖励
function storm_help_award(awardtype,start)
	if (awardtype == 0) then
		Say("  每天玩家可以到武林传人处, 根据<color=red>风暴积分<color> 可以领取相应的奖励, 同时，每周，每月都有相应的风暴积分排行<color=red>排名前十<color>可以在当月的第二个星期到武林传人处领奖", 4,
			"看日奖励/#storm_help_award(1)",
			"看周奖励/#storm_help_award(2)",
			"看月奖励/#storm_help_award(3)",
			"知道了!/OnCancel")
		return
	end
	
	local tb_awardstr = {"日", "周", "月"}
	local str = "风暴积分"..tb_awardstr[awardtype].."奖品如下:"
	if (not start) then
		start = 1
	end
	local lastvalue = nil
	local count = 0
	local PERPAGE = 4
	for i = start, getn(TB_STORM_AWARD[awardtype][5]) do
		if (count > PERPAGE) then	--PERPAGE项一页
			break
		end
		count = count + 1
		
		local awardvalue = TB_STORM_AWARD[awardtype][5][i][1]
		if (lastvalue ~= awardvalue) then
			if (awardvalue >= 0) then
				str = str.."<enter>".."积累"..storm_point2str(awardvalue,3).."分"
			else
				if (lastvalue) then
					str = str.."<enter>"..tb_awardstr[awardtype].."排在第"..storm_point2str(1-lastvalue).."到"..storm_point2str(-awardvalue).."几"
				else
					str = str.."<enter>"..tb_awardstr[awardtype].."排在第"..storm_point2str(-awardvalue).."几"
				end
			end
			lastvalue = awardvalue
		else
			str = str.."或"
		end
		str = str.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local tb_option = {}
	if (start > 1) then
		tb_option[getn(tb_option)+1] = "上一页/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if (start + count < getn(TB_STORM_AWARD[awardtype][5])) then
		tb_option[getn(tb_option)+1] = "下一页/#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1] = "想要了解别的/storm_help"
	tb_option[getn(tb_option)+1] = "我知道了!/OnCancel"
	Say(str, getn(tb_option), tb_option)
end

--得到该玩家在指定排行中的名次
function storm_getrank(laddertype)
	local ladderid = nil
	if (laddertype == 1) then	--日排行，暂无
		return 12
	elseif (laddertype == 2) then	--周排行
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 1 and weekid <= 4) then 	--只有2、3、4、5周有上周
			ladderid = STORM_LADDERID_WEEK1 + weekid - 1
		end
	elseif (laddertype == 3) then	--月排行
		if (GetTask(STORM_TASKID_MONTH) == 10) then	--只有10月有上周
			ladderid = STORM_LADDERID_MONTH
		end
	else
		return 12
	end
	
	if (ladderid == nil) then
		return 12
	end
	
	local playername = GetName()
	for i = 1, 10 do
		if (playername == Ladder_GetLadderInfo(ladderid, i)) then
			return i
		end
	end
	return 11
end

--可升级的加经验
function storm_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end

--给与全部奖励
function storm_giveallaward(tb_awards)
	for i = 1, getn(tb_awards) do
		storm_giveoneaward(tb_awards[i])
	end
end

--给与一个奖励
function storm_giveoneaward(tb_award)
	local awardtype = tb_award[1]
	local awardcount = tb_award[3]
	if (awardtype == 1) then	--普通物品
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 2) then	--黄金物品
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 3) then	--非物品
		if (tb_award[2] == 1) then	--经验
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--留作扩展
			WriteLog("storm_giveoneaward : error tb_award[2]")
		end
	elseif (awardtype == 4) then	--随机物品
		while (awardcount > 0) do
			local giveindex = random(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount = awardcount - 1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward : error awardtype")
	end
end

--估算全部奖励物品数量
function storm_countallaward(tb_awards)
	local count = 0
	for i = 1, getn(tb_awards) do
		if (tb_awards[i][1] == 1) then	--普通物品
			count = count + tb_awards[i][3]
		elseif (tb_awards[i][1] == 2) then	--黄金物品
			count = count + tb_awards[i][3]*2
		elseif (tb_awards[i][1] == 4) then	--随机物品
			count = count + tb_awards[i][3]*2
		end
	end
	return count
end

--将数组拆开
function storm_splittb(tb, n)
	if (n == nil) then
		n = 1
	end
	if (n == getn(tb)) then
		return tb[n]
	end
	return tb[n], storm_splittb(tb,n+1)
end

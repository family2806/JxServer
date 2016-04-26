if not GREATNIGHT_HUANGZHIZHANG  then
GREATNIGHT_HUANGZHIZHANG = 1

Include("\\script\\lib\\gb_taskfuncs.lua")
GN_EVENTNAME = "煌之章活动"
TB_HUANGZHIZHANG_EVENT = {
		"宋金战场",
		"信使任务",
		"挑战时间",
		"野叟任务",
		--"同伴剧情任务修炼篇，同伴修炼任务",
	}
GN_HUANG_EVENTID = 1
GN_HUANG_SWITH = 2
GN_HUANG_DATE = 3
function greatnight_huang_event(event)
	--活动还没开始
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == 0) then
		return 1
	end
	local award_times = gn_getaward_times()	--当天活动奖励翻倍倍数
	--礼官查询当晚活动
	if (event == nil) then
		--非1表示返回3个参数： 0，活动ID，奖励翻倍倍数
		return 0, gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID), award_times
	end
--	--还不是活动时间
--	if (tonumber(GetLocalDate("%H%M")) < 2055 or tonumber(GetLocalDate("%H%M")) > 2255) then
--		return 1
--	end
	--活动还未开始
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_SWITH) == 0) then
		return 1
	end
	
	if (gb_GetTask(GN_EVENTNAME, GN_HUANG_EVENTID) == event) then
		return award_times
	end
	
	return 1
end

function gn_getaward_times()
--	local nWeek = tonumber(GetLocalDate("%w"))
--	if (nWeek == 6 or nWeek == 0) then
--		return 3	--周末3倍
--	else
		return 2	--平时2倍
--	end
end

function huang_event_hint()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return format("%s%s%s%s%s",
				"煌之章活动从 <color=yellow>21h00 到23h00<color> 每晚. 在此时间段参加一个要求活动, 大侠可领取双倍奖励 <enter>今日的要求活动是<enter>",
				"宋金大战 <enter>",
				"挑战时间 gian <enter>",
				"野叟任务 <enter>",
				"每晚<color=yellow>8点<color>,玩家可以到礼官处了解活动细节. 不要错失领取独孤盟主礼物的机会")
		
	else
		return format("‘煌之章’活动的时间是<color=yellow>21h00到23h00<color> 每晚. 今晚活动是： <enter><color=yellow>%s<color><enter><enter>各位大侠赶快报名参加.",
					TB_HUANGZHIZHANG_EVENT[eventid])
	end
end

function huang_event_name()
	local swith, eventid, awardtimes = greatnight_huang_event()
	if (swith == 1) then
		return "还不知道"
	else
		return TB_HUANGZHIZHANG_EVENT[eventid]
	end
end

function huang_event_msg()
	local name = huang_event_name()
	return format("今晚的‘煌之章活动’将于21h00开始,领取双倍奖励的相关活动是：<color=yellow>%s<color>",name)
end

function seed_birth_city()
	local MapStr = "扬州东门";
	if (1 == gb_GetTask("辉煌种子", 1)) then
		MapStr = "大理北门";
	end;
	return format("今天中午12h00将开始辉之章的活动, 黄金之果将出现在<color=yellow>%s<color>",MapStr)
end

if EVENTS_TB then 
EVENTS_TB[getn(EVENTS_TB)+1] = {	--辉之章
			name = "辉煌",
			describe = seed_birth_city
		}
EVENTS_TB[getn(EVENTS_TB)+1] = {	--煌之章
			name = "煌之章",
			describe = huang_event_msg
		}
end
end

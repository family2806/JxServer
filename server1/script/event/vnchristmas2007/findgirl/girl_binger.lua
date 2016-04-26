Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\mid_autumn\\autumn_portal.lua")
function main()
	local arytalk = 
	{
		[1]="<dec><npc>圣诞快乐！我是圣诞少女冰儿，几天前，在发圣诞礼物的时候，和我一起的三个姐妹冬儿，白儿，雪儿失踪。如果大侠可以找到她们，我一定有礼物相送。",
		[2]="我想找圣诞少女/xmas2007_binger_join",
		[3]="了解圣诞少女活动/xmas2007_binger_about",
		[4]="去明月镇/autumn_enter",
		[5]="退出/NoChoice",
	}
	CreateTaskSay(arytalk)
	
	
end
function xmas2007_binger_about()
local arytalk = 
	{
		[1]="<dec><npc>圣诞少女<color=red>08-12-2007 到 13-01-2008<color>, 每天在<color=red>8:00-9:00, 15:00-16:00, 22:00-23:00<color>, 圣诞少女突然出现在 <color=yellow>七大城市或者长白山南，长白山北<color>. 在系统公布后，武林人士可以去见<color=yellow>冰儿<color>报名参加，依次找圣诞少女<color=yellow>冬儿，白儿，雪儿<color>. 大侠首先找到她们可以到 <color=yellow>雪儿处<color> 领奖.",
		[2]="哈哈，我明白了/main"
	}	
	CreateTaskSay(arytalk)
end
function xmas2007_binger_join()
	if xmas2007_findgirl_checktime() == 0 or GetGlbValue(xmas2007_findgirl_gblvalue_taskID)~=1 then
		CreateTaskSay({"<dec><npc>活动还未开始，稍候再来!","退出/NoChoice"})
		return
	end
	
	local ntaskdate = GetTask(xmas2007_findgirl_limit_taskID)
	local ndate = xmas2007_findgirl_returndate()
	if ntaskdate ~= ndate then
		SetTask(xmas2007_findgirl_limit_taskID,ndate)
		SetTask(xmas2007_findgirl_taskID,0)
	end
	if GetTask(xmas2007_findgirl_taskID) == 4 then
		CreateTaskSay({"<dec><npc>谢谢，姐妹已经都在这了，下次再见","退出/NoChoice"})
		return		
	end
	if GetTask(xmas2007_findgirl_taskID) ~= 0 then
		CreateTaskSay({"<dec><npc>快去找神秘少女","退出/NoChoice"})
		return
	end
		SetTask(xmas2007_findgirl_taskID,1)
		CreateTaskSay({"<dec><npc>快帮我找冬儿回来!","退出/NoChoice"})
end

function xmas2007_findgirl_checktime()
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate < 07120800 or ndate > 08011324 then
		return 0
	end	
	
	local nhm = tonumber(GetLocalDate("%H%M"))
	if nhm >= 800 and nhm < 920 then
		return 1
	elseif nhm >= 1500 and nhm < 1620 then
		return 1
	elseif nhm >= 2200 and nhm < 2320 then
		return 1
	else
		return 0
	end
end

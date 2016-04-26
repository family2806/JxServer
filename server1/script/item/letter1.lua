--包袱内的信件（新任务系统龙五的包袱）中立
--by xiaoyang(2004\12\25)

Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
local curCamp = nt_getCamp()
	Uworld1001 = nt_getTask(1001)  --正派
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	local name = GetName()
	if ( Uworld186 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj090.spr>龙五的信<link><enter>龙五："..name.."，你年纪虽轻，于江湖一脉却看得通透。这世界本就正邪不分，善恶莫辩。离开这里后，为人处事都靠你审时度势，会很苦，路会很难，你需要做的很多，又不多。龙某也不知该如何助你一臂之力，只能将江湖里中立一阵的一个秘密透露给你，在中立阵营的背后有一个强大的杀手组织，这个组织有多少高手，实力有多大从来没人清楚。只知道这十多年来宋朝通敌的大将，金国征伐的能手，武林成名的大侠屡屡被杀，都和这个组织相关。这个组织的名字叫——临渊崖。你去汴京持我的信找一个叫傅南冰的男人，他自会安排。言止于此，希望你好自为之，珍重。龙五。",1,"收起信函/no")
		nt_setTask(186,30)
		if ( Uworld1002 < 10 ) then
			nt_setTask(1002,10) --中立任务开始
		end
	end
	return 0
end
	

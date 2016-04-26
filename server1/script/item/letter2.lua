--包袱内的信件（新任务系统龙五的包袱）邪派
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
	if ( Uworld189 == 20 )  then
		Describe("<link=image:\\spr\\item\\questkey\\taskobj091.spr>龙五的信<link><enter>"..name..",去朱仙镇找云儿，关于她的一切你都会慢慢知晓，可我不愿多提一字，望你珍重自己。龙五。",1,"收起信函/no")
		nt_setTask(189,30)
		if ( Uworld1003 < 10 ) then 
			nt_setTask(1003,10) --邪派任务开始
		end
	end
	return 0
end
	

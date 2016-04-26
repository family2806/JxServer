--传家之书
Include("\\script\\event\\teacher_day_200711\\head.lua");

-- 每个角色只能通过家传之书道具获得5亿经验值得上限 。
--

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local nExpLimit = GetTask(TSK_TeacherDay200711_UseExpLimit); 
	if ( nExpLimit >= TeacherDay200711_UseExpLimit) then
		Say("使用家传秘籍已达经验值上限，不能再使用了.",0)
		return 1;
	end
	if (GetLevel() < 50) then
		Say("真是遗憾，只有玩家<color=yellow>50级以上<color> 才能使用该秘籍.",0)
		return 1;
	end
	if (nDate < TeacherDay200711_START_TIME or nDate > TeacherDay200711_UseLimitTime) then
		Say("活动已结束，不能使用!",0);
		return 0;
	end
	--2.000.000 经验值
	--1,5% 概率获得1颗猩红宝石
	AddOwnExp(2000000);
	SetTask(TSK_TeacherDay200711_UseExpLimit,nExpLimit+2000000);
	if (random(1,10000) <= 150) then
		AddItem(4,353,1,1,0,0)
		Msg2Player(format("获得%d %s",1,"晶红宝石"))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s2007年越南教师节活动",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,"晶红宝石"));			
	end
	return 0;
end
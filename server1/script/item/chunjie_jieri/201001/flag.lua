Include("\\script\\item\\activityitem.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")

tbFlag_Level10 = {};

function tbFlag_Level10:Award()
	 
	 local bTop10 = 0;
	 local nCount = gb_GetTask("SpringFestival_Flag_Level10", 1);
	 
	 if nCount < 10 then
	 	bTop10 = 1;
	 end
	 
	 if bTop10 == 1 then
	 	tbAwardTemplet:GiveAwardByList({
	 		tbProp={6,1,2127,1,0,0},
	 		nExpiredTime=43200,
	 		},"使用旗杆(10级)得北斗炼金术(卷1)");
	 	gb_AppendTask("SpringFestival_Flag_Level10", 1, 1);
	 	
	 else
	 	tbAwardTemplet:GiveAwardByList({
	 		tbProp={6,1,2126,1,0,0},
	 		nExpiredTime=43200,
	 		},"使用旗杆(10级)得一纪乾坤符");
	 	gb_AppendTask("SpringFestival_Flag_Level10", 1, 1);	 		
	 end
	 
end




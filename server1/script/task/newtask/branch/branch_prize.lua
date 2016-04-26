-- 正派支线任务脚本
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include([[\script\task\newtask\branch\extent_prize.lua]]);


--正派：1    中立：2     邪派：3

saying = "辛苦了，请看看哪一样东西是你最想要的呢？";
ItemText = {
				{"黄金装备/15/2/get_golditem1","黄金装备/15/2/get_golditem2","黄金装备/15/2/get_golditem3"},
				{"黄金装备/15/3/get_golditem1","黄金装备/15/3/get_golditem2","黄金装备/15/3/get_golditem3"},
				{"黄金装备/15/4/get_golditem1","黄金装备/15/4/get_golditem2","黄金装备/15/4,3/get_golditem3"},
				{"黄金装备/15/5/get_golditem1","黄金装备/15/5/get_golditem2","黄金装备/15/5/get_golditem3"},
				{"紫色装备/3/2/get_qualityitem1","紫色装备/3/2/get_qualityitem2","紫色装备/3/2/get_qualityitem3"},
				{"紫色装备/3/5/get_qualityitem1","紫色装备/3/5/get_qualityitem2","紫色装备/3/5/get_qualityitem3"},
				{"矿石/4/2/get_oreitem1","矿石/4/2/get_oreitem2","矿石/4/2/get_oreitem3"},
				{"矿石/4/3/get_oreitem1","矿石/4/3/get_oreitem2","矿石/4/3/get_oreitem3"},
				{"矿石/4/4/get_oreitem1","矿石/4/4/get_oreitem2","矿石/4/4/get_oreitem3"},
				{"矿石/4/5/get_oreitem1","矿石/4/5/get_oreitem2","矿石/4/5/get_oreitem3"},
				{"道具/14/3/get_propitem1","道具/14/3/get_propitem2","道具/14/3/get_propitem3"},
				{"道具/14/4/get_propitem1","道具/14/4/get_propitem2","道具/14/4/get_propitem3"},
			}

function branchprize()
	Uworld1050 = nt_getTask(1050)
	Uworld1051 = nt_getTask(1051)
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Uworld1054 = nt_getTask(1054)
	Uworld1055 = nt_getTask(1055)
	Uworld1056 = nt_getTask(1056)
	Uworld1057 = nt_getTask(1057)
	Uworld1058 = nt_getTask(1058)
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1061 = nt_getTask(1061)
	Uworld192 = nt_getTask(192) --正派支线奖励变量，各字位意义：
								--1-20~30级正派一；2-20~30级正派二；3-20~30级正派三； 4-30~40级正派一； 5-30~40级正派二； 6-30~40级正派三；
								--7-40~50级正派一； 8-40~50级正派二； 9-40~50级正派三； 10-50~60级正派一； 11-50~60级正派二； 12-50~60级正派三；
	Uworld193 = nt_getTask(193) --中立支线奖励变量，各字位意义：
								--1-20~30级中立一；2-20~30级中立二；3-20~30级中立三； 4-30~40级中立一； 5-30~40级中立二； 6-30~40级中立三；
								--7-40~50级中立一； 8-40~50级中立二； 9-40~50级中立三； 10-50~60级中立一； 11-50~60级中立二； 12-50~60级中立三；
	Uworld194 = nt_getTask(194) --邪派支线奖励变量，各字位意义：
								--1-20~30级邪派一；2-20~30级邪派二；3-20~30级邪派三； 4-30~40级邪派一； 5-30~40级邪派二； 6-30~40级邪派三；
								--7-40~50级邪派一； 8-40~50级邪派二； 9-40~50级邪派三； 10-50~60级邪派一； 11-50~60级邪派二； 12-50~60级邪派三；
	Uworld195 = nt_getTask(195)	--确定要发奖/发过奖，开关

	if ( nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) then 						--缺少奖励变量设置  正派支线20-30任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])

	elseif ( nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1 ) then  				--正派支线20-30任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])
		
	elseif ( nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1 ) then	 			--正派支线20-30任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][1],ItemText[5][1],ItemText[7][1])	
	
	elseif ( nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1 ) then   				--正派支线30-40任务一
		--AddItem() --奖励一件一孔的紫色装备
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])
		
	elseif ( nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1 ) then	 			--正派支线30-40任务二
		--AddItem() --奖励一颗概率宝石
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])	
	
	elseif ( nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1 ) then	 			--正派支线30-40任务三
		--AddItem() --奖励一颗金系的暗属性宝石
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][1],ItemText[11][1],ItemText[8][1])	
	
	elseif ( nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1 ) then				--正派支线40-50任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])
		
	elseif ( nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1 ) then  				--正派支线40-50任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])	
	
	elseif ( nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1 ) then 				--正派支线40-50任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][1],ItemText[12][1],ItemText[9][1])
		
	elseif ( nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1 ) then 				--正派支线50-60任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])	
	
	elseif ( nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1 ) then 				--正派支线50-60任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])	
	
	elseif ( nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1 ) then 				--正派支线50-60任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][1],ItemText[6][1],ItemText[10][1])		

	elseif ( nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1 ) then 				--中立支线20-30任务一
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])
		nt_setTask(195, 1)
		
	elseif ( nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1 ) then 				--中立支线20-30任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])	
	
	elseif ( nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1 ) then 				--中立支线20-30任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][2],ItemText[5][2],ItemText[7][2])	

	elseif ( nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1 ) then 				--中立支线30-40任务一
		--AddItem() --奖励一件一孔的紫色装备
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])	
	
	elseif ( nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1 ) then 				--中立支线30-40任务二
		--AddItem() --奖励一颗概率宝石
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])

	elseif ( nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) then 				--中立支线30-40任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][2],ItemText[11][2],ItemText[8][2])

	elseif ( nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1 ) then 				--中立支线40-50任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1 ) then 				--中立支线40-50任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1 ) then 				--中立支线40-50任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][2],ItemText[12][2],ItemText[9][2])

	elseif ( nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1 ) then				--中立支线50-60任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1 ) then					--中立支线50-60任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1 ) then					--中立支线50-60任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][2],ItemText[6][2],ItemText[10][2])

	elseif ( nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1 ) then 				--邪派支线20-30任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1 ) then 				--邪派支线20-30任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1 ) then 				--邪派支线20-30任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[1][3],ItemText[5][3],ItemText[7][3])

	elseif ( nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1 ) then 				--邪派支线30-40任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])

	elseif ( nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1 ) then 				--邪派支线30-40任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])
		
	elseif ( nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1 ) then 				--邪派支线30-40任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[2][3],ItemText[11][3],ItemText[8][3])

	elseif ( nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1 ) then 				--邪派支线40-50任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1 ) then 				--邪派支线40-50任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1 ) then 				--邪派支线40-50任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[3][3],ItemText[12][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1 ) then 				--邪派支线50-60任务一
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1 ) then 				--邪派支线50-60任务二
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	elseif ( nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1 ) then 				--邪派支线50-60任务三
		nt_setTask(195, 1)
		Prise(saying,ItemText[4][3],ItemText[5][3],ItemText[9][3])

	end
end


function get_golditem1(lel)		--正派	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--判断属于哪个等级任务
			AddGoldItem(0, 184)
			Msg2Player("您得到一件黄金装备")
			zhengpai_lel2()
	elseif((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then	
			AddGoldItem(0, 178)
			Msg2Player("您得到一件黄金装备")
			nt_setTask(195, 0)
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("您得到一件黄金装备")		
			nt_setTask(195, 0)
			zhengpai_lel4()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])
			Msg2Player("您得到一件黄金装备")
			nt_setTask(195, 0)
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


function get_golditem2(lel)		--中立	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--判断属于哪个等级任务
			AddGoldItem(0, 184)		
			Msg2Player("您得到一件黄金装备")
			zhongli_lel2()
	elseif((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then	
			AddGoldItem(0, 178)
			Msg2Player("您得到一件黄金装备")		
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("您得到一件黄金装备")		
			zhongli_lel4()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("您得到一件黄金装备")		
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


function get_golditem3(lel)		--邪派	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) ==1  or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--判断属于哪个等级任务
			AddGoldItem(0, 184)
			Msg2Player("您得到一件黄金装备")		
			xiepai_lel2()
	elseif((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then	
			AddGoldItem(0, 178)
			Msg2Player("您得到一件黄金装备")
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then	
			local array4 = {181, 182, 183}
			local i= random(1, 3)
			AddGoldItem(0, array4[i])			--AddGoldItem(0,181or182or183)
			Msg2Player("您得到一件黄金装备")
			xiepai_lel4()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			local array5 = {179, 180, 185}
			local i = random(1, 3)
			AddGoldItem(0, array5[i])			
			Msg2Player("您得到一件黄金装备")
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end

-- 加金钱
function get_qualityitem1(lel)		--正派	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--判断属于哪个等级任务
			Earn(20000);
			zhengpai_lel2()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			Earn(20000);
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


-- 加金钱
function get_qualityitem2(lel)		--中立	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--判断属于哪个等级任务
			Earn(20000);
			zhongli_lel2()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			Earn(20000);
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


-- 加金钱
function get_qualityitem3(lel)	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) == 1 or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--判断属于哪个等级任务
			Earn(20000);
			xiepai_lel2()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			Earn(20000);
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


-- 经验
function get_oreitem1(lel)		--正派	
	if ((nt_getTask(1050) == 50 and GetBit(GetTask(192), 1) ~= 1) ==1 or (nt_getTask(1050) == 110 and GetBit(GetTask(192), 2) ~= 1) == 1 or (nt_getTask(1050) == 140 and GetBit(GetTask(192), 3) ~= 1) ==1) then			--判断属于哪个等级任务
			AddOwnExp(20000);
			zhengpai_lel2()
	elseif((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then		
			AddOwnExp(20000);
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then	
			AddOwnExp(20000);
			zhengpai_lel4()
	elseif((nt_getTask(1053) == 25 and GetBit(GetTask(192), 10) ~= 1) == 1 or (nt_getTask(1053) == 50 and GetBit(GetTask(192), 11) ~= 1) == 1 or (nt_getTask(1053) == 80 and GetBit(GetTask(192), 12) ~= 1) == 1) then
			AddOwnExp(20000);
			zhengpai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


-- 经验
function get_oreitem2(lel)	
	if((nt_getTask(1054) == 30 and GetBit(GetTask(193), 1) ~= 1) == 1 or (nt_getTask(1054) == 100 and GetBit(GetTask(193), 2) ~= 1) == 1 or (nt_getTask(1054) == 150 and GetBit(GetTask(193), 3) ~= 1) == 1) then			--判断属于哪个等级任务
			AddOwnExp(20000);
			zhongli_lel2()
	elseif((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then	
			AddOwnExp(20000);
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then	
			AddOwnExp(20000);
			zhongli_lel4()
	elseif((nt_getTask(1057) == 30 and GetBit(GetTask(193), 10) ~= 1) == 1 or (nt_getTask(1057) == 70 and GetBit(GetTask(193), 11) ~= 1) == 1 or (nt_getTask(1057) == 100 and GetBit(GetTask(193), 12) ~= 1) == 1 ) then
			AddOwnExp(20000);
			zhongli_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


-- 经验
function get_oreitem3(lel)	
	if((nt_getTask(1058) == 30 and GetBit(GetTask(194), 1) ~= 1) == 1 or (nt_getTask(1058) == 50 and GetBit(GetTask(194), 2) ~= 1) == 1 or (nt_getTask(1058) == 100 and GetBit(GetTask(194), 3) ~= 1) == 1) then			--判断属于哪个等级任务
			AddOwnExp(20000);
			xiepai_lel2()
	elseif((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then		
			AddOwnExp(20000);
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then		
			AddOwnExp(20000);
			xiepai_lel4()
	elseif((nt_getTask(1061) == 30 and GetBit(GetTask(194), 10) ~= 1) == 1 or (nt_getTask(1061) == 70 and GetBit(GetTask(194), 11) ~= 1) == 1 or (nt_getTask(1061) == 120 and GetBit(GetTask(194), 12) ~= 1) == 1) then
			AddOwnExp(20000);
			xiepai_lel5()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


function get_propitem1(lel)	
	if((nt_getTask(1051) == 30 and GetBit(GetTask(192), 4) ~= 1) == 1 or (nt_getTask(1051) == 90 and GetBit(GetTask(192), 5) ~= 1) == 1 or (nt_getTask(1051) == 180 and GetBit(GetTask(192), 6) ~= 1) == 1) then				--判断属于哪个等级任务
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("您得到一件道具")
			zhengpai_lel3()
	elseif((nt_getTask(1052) == 30 and GetBit(GetTask(192), 7) ~= 1) == 1 or (nt_getTask(1052) == 70 and GetBit(GetTask(192), 8) ~= 1) == 1 or (nt_getTask(1052) == 120 and GetBit(GetTask(192), 9) ~= 1) == 1) then
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("您得到一件道具")
			zhengpai_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候再试或者向GM反映！！")
		return
	end
end


function get_propitem2(lel)	
	if((nt_getTask(1055) == 50 and GetBit(GetTask(193), 4) ~= 1) == 1 or (nt_getTask(1055) == 90 and GetBit(GetTask(193), 5) ~= 1) == 1 or (nt_getTask(1055) == 140 and GetBit(GetTask(193), 6) ~= 1 ) == 1 ) then			--判断属于哪个等级任务
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("您得到一件道具")
			zhongli_lel3()
	elseif((nt_getTask(1056) == 25 and GetBit(GetTask(193), 7) ~= 1) == 1 or (nt_getTask(1056) == 50 and GetBit(GetTask(193), 8) ~= 1) == 1 or (nt_getTask(1056) == 80 and GetBit(GetTask(193), 9) ~= 1) == 1 ) then
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("您得到一件道具")
			zhongli_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end


function get_propitem3(lel)	
	if((nt_getTask(1059) == 30 and GetBit(GetTask(194), 4) ~= 1) == 1 or (nt_getTask(1059) == 50 and GetBit(GetTask(194), 5) ~= 1) == 1 or (nt_getTask(1059) == 120 and GetBit(GetTask(194), 6) ~= 1) == 1) then				--判断属于哪个等级任务
			AddItem(6, 1, 72, 1, 0, 0, 0)
			Msg2Player("您得到一件道具")
			xiepai_lel3()
	elseif((nt_getTask(1060) == 50 and GetBit(GetTask(194), 7) ~= 1) == 1 or (nt_getTask(1060) == 90 and GetBit(GetTask(194), 8) ~= 1) == 1 or (nt_getTask(1060) == 120 and GetBit(GetTask(194), 9) ~= 1) == 1) then	
			AddItem(6, 1, 73, 1, 0, 0, 0)
			Msg2Player("您得到一件道具")
			xiepai_lel4()
	else
		print("error:transfors parameter was wrong!!")
		Talk(1,"","对不起，无法领取任务奖品，请稍候在试或者向GM反映！！")
		return
	end
end

function zhengpai_lel2()
	if (nt_getTask(1050) == 50) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 1, 1))
		nt_setTask(1050, 60)
		Msg2Player("任务结束！原来此人是痴僧假扮的，看来你只能先回去找傲云宗了。")
		Msg2Player("你得到20000经验")
		for i=1,5 do
			DelItem(504)
		end
		AddOwnExp(20000)
	elseif (nt_getTask(1050) == 110) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 2, 1))
		nt_setTask(1050, 120)
		Msg2Player("找到了岑雄，任务结束！岑雄说当年行刺岳将军的杀手现就在城外。")				
		Msg2Player("你得到20000经验")
		AddOwnExp(20000)
	elseif (nt_getTask(1050) == 140) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 3, 1))
		nt_setTask(1050, 1000)
		Msg2Player("任务完成！你可以再次与傲云宗对话，领取该阶段任务全完成的大奖了。")
	end
end

function zhengpai_lel3()
	if (nt_getTask(1051) == 30) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 4, 1))
		nt_setTask(1051, 40)
		Msg2Player("任务结束，贺兰芝说宝石可能被她遗弃在家乡了。你可以去找吴老太太了。她给了你一件奇怪的铠甲，留下来也许会有作用。")
		Msg2Player("你获得了一件带孔的装备，甲面上隐隐泛起幽冷的光芒。")
		Msg2Player("你获得50000经验")
		if ( GetSex() == 0 ) then
			AddGoldItem(0, 178); -- 增加一件金枫衣服
		else
			AddGoldItem(0, 178);
		end
		AddOwnExp(50000)
	elseif (nt_getTask(1051) == 90) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 5, 1))
		nt_setTask(1051, 100)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011,0)
--		Msg2Player("你成功获得了足够的狼骨，任务完成！傲云宗给了你奇怪的一颗概率宝石，留下它也许有大用。你可以去襄阳找龚阿牛制作药材了。")
--		AddItem(6,1,147,1,1,1)
	elseif (nt_getTask(1051) == 180) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 6, 1))
		nt_setTask(1051, 1000)
--		Msg2Player("你完成了任务，傲云宗将吴老太太赠送的，多余的一颗矿石送给了你。并告诉你，带着你得到的带孔铠甲，概率宝石，和这颗属性矿石，去找神秘铁匠，有可能合出一件好的装备。你可以再次与他对话，领取该阶段任务全完成的大奖了。")
--		Msg2Player("你得到一颗矿石")
		Msg2Player("你获得120000经验")
--		AddItem(6,1,149,1,0,0,0) --加明一矿石
		AddOwnExp(120000)
	end
end

function zhengpai_lel4()
	if (nt_getTask(1052) == 30) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 7, 1))
		nt_setTask(1052, 40)
		Uworld1011 = nt_getTask(1011) --正派支线杀怪变量，设置为0，清空
		nt_setTask(1011,0)
		Msg2Player("任务完成！傲云宗让你去扬州演武场外找一个混混，通过他打入到杀手组织临渊崖内部，查出当年刺杀岳元帅的主使人。")
		Msg2Player("你获得100000经验")
		AddOwnExp(100000)
	elseif (nt_getTask(1052) == 70) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 8, 1))
		nt_setTask(1052, 80)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011, 0) --杀怪变量置为0
		Msg2Player("任务完成！混混让你去杀掉一个叫渝湘津的男人，他曾经在演武场上百场不败。你决定先回去问一问傲云宗。")
		Msg2Player("你获得100000")
		AddOwnExp(100000)
	elseif (nt_getTask(1052) == 120) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 9, 1))
		nt_setTask(1052, 1000)
		Msg2Player("任务完成！你可以再次与傲云宗对话，领取该阶段任务全完成的大奖了。")
	end
end

function zhengpai_lel5()
	if (nt_getTask(1053) == 25) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 10, 1))
		nt_setTask(1053, 27)
		Uworld1011 = nt_getTask(1011)
		nt_setTask(1011, 0)
		Msg2Player("任务完成！混混夸奖你做得漂亮，不过似乎还有什么话没有说完。")
		Msg2Player("你获得200000")
		AddOwnExp(200000)
	elseif (nt_getTask(1053) == 50) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 11, 1))
		nt_setTask(1053, 60)
		Msg2Player("任务完成！混混终于告诉了你当年刺杀岳元帅的带头人，他名叫齐即风，在临安城外。")
		Msg2Player("你获得200000经验")
		AddOwnExp(200000)
	elseif (nt_getTask(1053) == 80) then
		Uworld192 = nt_getTask(192)
		nt_setTask(192, SetBit(Uworld192, 12, 1))
		nt_setTask(1053, 1000)
		Msg2Player("傲云宗告诉你，这恐怕是个天大的秘密。这背后，一定有股不为人知的势力在暗中作祟。看来他要自己亲自去查探了。再次与傲云宗对话可以领取任务全完成的大奖。")

	end
end

function zhongli_lel2()
	if (nt_getTask(1054) == 30) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 1, 1))
		nt_setTask(1054, 40)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("任务完成！江一萧让你去城里找一个叫乐清秋的书生，他曾是品剑行的名家。")
		Msg2Player("你获得20000经验")
		AddOwnExp(20000)
	elseif(nt_getTask(1054) == 100) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 2, 1))
		nt_setTask(1054, 110) 
		Msg2Player("任务完成！赌棍被你吓坏了，他说免除乐清秋的所有赌债。")
		Msg2Player("你获得20000经验")
		AddOwnExp(20000)
	elseif(nt_getTask(1054) == 150) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 3, 1))
		nt_setTask(1054, 1000)
		Msg2Player("乐清秋告诉你，自信才是最有力的武器。任务完成。你可以回去与柳南云对话，领取该阶段任务全完成的大奖了。")
		Msg2Player("你获得50000经验")
		AddOwnExp(50000)
	end
end

function zhongli_lel3()
	if (nt_getTask(1055) == 50) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 4, 1))
		nt_setTask(1055, 60)
		Msg2Player("任务完成！这件铠甲的甲片上刻有一只长枪，这是成都冷枪镖局的印章，你决定去那里走一趟。")
		Msg2Player("你得到了一件带孔的装备，甲面上隐隐泛起幽冷的光芒。")
		Msg2Player("你获得50000经验")
		if ( GetSex() == 0 ) then
			AddGoldItem(0, 178); -- 增加一件金枫衣服
		else
			AddGoldItem(0, 178); -- 增加一件金枫衣服
		end
		AddOwnExp(50000)
	elseif (nt_getTask(1055) == 90) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 5, 1))
		nt_setTask(1055, 100)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
--		Msg2Player("冷枪镖局主人让你不要对荷花盗赶尽杀绝，他送给了你一颗概率宝石。")
--		Msg2Player("你得到一颗概率宝石")
		Msg2Player("你获得50000经验")
--		AddItem(6, 1, 147, 1, 1, 1)
		AddOwnExp(50000)
	elseif (nt_getTask(1055) == 140) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 6, 1))
		nt_setTask(1055, 1000)
--		Msg2Player("任务完成！柳南云给了你一颗属性矿石，至于这颗属性矿石有什么用处，那就得以后你遇见高人时才能得以解答的了。")
--		Msg2Player("你得到一颗属性矿石")
		Msg2Player("你获得120000经验")
--		AddItem(6,1,149,1,0,0,0)
		AddOwnExp(120000)
	end
end

function zhongli_lel4()
	if (nt_getTask(1056) == 25) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 7, 1))
		nt_setTask(1056, 27)
		Msg2Player("任务完成！但柳南云似乎还有点犹豫，好像还有什么话没说。")--柳南云让你去演武场打胜一场比赛，看来有重要的事即将发生了")
		Msg2Player("你获得100000经验")
		AddOwnExp(100000)
	elseif (nt_getTask(1056) == 50) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 8, 1))
		nt_setTask(1056, 60)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("任务完成！柳南云让你去杀掉曾雄霸比武场上百场的渝湘津。")
		Msg2Player("你获得100000经验")
		AddOwnExp(100000)
	elseif (nt_getTask(1056) == 80) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 9, 1))
		nt_setTask(1056, 1000)
		Msg2Player("任务完成！组织对你非常满意。你可以再次与柳南云对话，领取该阶段任务全完成的大奖了。") 
		Msg2Player("你获得260000经验")
		AddOwnExp(260000)
	end
end

function zhongli_lel5()
	if (nt_getTask(1057) == 30) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 10, 1))
		nt_setTask(1057, 40)
		Uworld1012 = nt_getTask(1012)
		nt_setTask(1012, 0)
		Msg2Player("任务完成！下面你可以回答宋金问题了。")
		Msg2Player("你获得200000经验")
		AddOwnExp(200000)
	elseif (nt_getTask(1057) == 70) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 11, 1))
		nt_setTask(1057, 80)
		Msg2Player("任务完成！柳南云告诉了你一个令人震惊的消息。")
		Msg2Player("你获得200000经验")
		AddOwnExp(200000)
	elseif (nt_getTask(1057) == 100) then
		Uworld193 = nt_getTask(193)
		nt_setTask(193, SetBit(Uworld193, 12, 1))
		nt_setTask(1057, 1000)
		Msg2Player("任务完成！柳南云喜极而泣。你可以再次与柳南云对话，领取该阶段任务全完成的大奖了。")

	end
end

function xiepai_lel2()
	if (nt_getTask(1058) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 1, 1))
		nt_setTask(1058, 40)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("任务完成！拓跋怀川让你去成都找一个叫邹长久的细作。")
		Msg2Player("你获得20000经验")
		AddOwnExp(20000)
	elseif (nt_getTask(1058) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 2, 1))
		nt_setTask(1058, 60)
		Msg2Player("任务完成！邹长久让你拿着一些卷轴去扬州找一个叫沈风的男子。")
		Msg2Player("你获得20000经验")
		AddOwnExp(20000)
	elseif (nt_getTask(1058) == 100) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 3, 1))
		nt_setTask(1058, 1000)
		Msg2Player("任务完成！你可以再次与拓跋怀川对话，领取该阶段任务全完成的大奖了。")
		Msg2Player("你获得50000经验")
		AddOwnExp(50000)
	end
end
function xiepai_lel3()
	if (nt_getTask(1059) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 4, 1))
		nt_setTask(1059, 40) 
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("任务完成！拓跋怀川让你速去襄阳寻找大金在南宋的细作首领刘蕴古。")
		Msg2Player("你获得50000经验")
		AddOwnExp(50000)
	elseif (nt_getTask(1059) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 5, 1))
		nt_setTask(1059, 60)
		Msg2Player("刘蕴古告诉你施宜生确实有叛国倾向，你决定马上回去通知拓跋怀川。")
		Msg2Player("你获得50000经验")
		AddOwnExp(50000)
	elseif (nt_getTask(1059) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 6, 1))
		nt_setTask(1059, 1000)
		Msg2Player("任务完成！你可以再次与拓跋怀川对话，领取该阶段任务全完成的大奖了。")
		Msg2Player("你获得120000经验")
		AddOwnExp(120000)
	end
end

function xiepai_lel4()
if (nt_getTask(1060) == 50) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 7, 1))
		nt_setTask(1060, 60)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("任务完成！刘蕴古让你马上回去，告诉拓跋怀川比赛的详细情况。")
		Msg2Player("你获得100000经验")
		AddOwnExp(100000)
	elseif (nt_getTask(1060) == 90) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 8, 1))
		nt_setTask(1060, 100)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("任务完成！拓跋怀川让你去杀掉推广擂台赛的官员，襄阳大豪阮明远。")
		Msg2Player("你获得100000经验")
		AddOwnExp(100000)
	elseif (nt_getTask(1060) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 9, 1))
		nt_setTask(1060, 1000)
		Msg2Player("任务完成！你可以再次与拓跋怀川对话，领取该阶段任务全完成的大奖了。")
		Msg2Player("你获得260000经验")
		AddOwnExp(260000)
	end
end

function xiepai_lel5()
	if (nt_getTask(1061) == 30) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 10, 1))
		nt_setTask(1061, 40)
		Uworld1013 = nt_getTask(1013)
		nt_setTask(1013, 0)
		Msg2Player("任务完成！拓跋怀川对你大加赞赏，他说皇上准备召见你，所以预先问问你宋金战场的一些题目。")
		Msg2Player("你获得200000经验")
		AddOwnExp(200000)
	elseif (nt_getTask(1061) == 70) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 11, 1))
		nt_setTask(1061, 80)
		Msg2Player("任务完成！拓跋怀川对你大加赞赏。不过他似乎脸色不太好，发生了一些什么困难呢。")
		Msg2Player("你获得200000经验")
		AddOwnExp(200000)
	elseif (nt_getTask(1061) == 120) then
		Uworld194 = nt_getTask(194)
		nt_setTask(194, SetBit(Uworld194, 12, 1))
		nt_setTask(1061, 1000)
		Msg2Player("任务完成！你可以再次与拓跋怀川对话，领取该阶段任务全完成的大奖了。")

	end
end
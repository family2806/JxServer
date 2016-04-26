-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-04 15:30:14
-- Desc			:	送信任务驿官脚本
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --调用计时器
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --取消任务
Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--开宝箱工具函数
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\lib\\awardtemplet.lua")--给奖励接口

IncludeLib("RELAYLADDER");	--排行榜


--构造各城市去其他城市的任务变量对应表        60-89级，90-119级，120以上三种
--citygo 的构造方式
--到各城市的任务变量，对应值，当前城市名字，去到城市名字，相对任务id，当前城市id，去到城市地图id，x，y
--1201	送信任务风之骑任务变量
--1202	送信任务山神庙任务变量
--1203	送信任务千宝库任务变量

citygo = {
----扬州去其他城市(mapid:80)
--{1204,1,"扬州","汴京",1201,80,37,1601,3001},
--{1204,2,"扬州","凤翔",1201,80,1,1561,3114},
--{1204,3,"扬州","临安",1201,80,176,1592,2925},
--{1204,4,"扬州","成都",1201,80,11,3021,5090},
--{1204,5,"扬州","襄阳",1201,80,78,1596,3379},
--{1204,6,"扬州","大理",1201,80,162,1674,3132},
--
----汴京去其他城市(mapid:37)
--{1204,7,"汴京","扬州",1201,37,80,1676,3000},
--{1204,8,"汴京","凤翔",1201,37,1,1561,3114},
--{1204,9,"汴京","临安",1201,37,176,1592,2925},
--{1204,10,"汴京","成都",1201,37,11,3021,5090},
--{1204,11,"汴京","襄阳",1201,37,78,1596,3379},
--{1204,12,"汴京","大理",1201,37,162,1674,3132},
--
----凤翔去其他城市(mapid:1)
--{1204,13,"凤翔","扬州",1202,1,80,1676,3000},
--{1204,14,"凤翔","汴京",1202,1,37,1601,3001},
--{1204,15,"凤翔","临安",1202,1,176,1592,2925},
--{1204,16,"凤翔","成都",1202,1,11,3021,5090},
--{1204,17,"凤翔","襄阳",1202,1,78,1596,3379},
--{1204,18,"凤翔","大理",1202,1,162,1674,3132},
--
----临安去其他城市(mapid:176)
--{1204,19,"临安","扬州",1202,176,80,1676,3000},
--{1204,20,"临安","凤翔",1202,176,1,1561,3114},
--{1204,21,"临安","汴京",1202,176,37,1601,3001},
--{1204,22,"临安","成都",1202,176,11,3021,5090},
--{1204,23,"临安","襄阳",1202,176,78,1596,3379},
--{1204,24,"临安","大理",1202,176,162,1674,3132},
--
----成都去其他城市(mapid:11)
--{1204,25,"成都","扬州",1203,11,80,1676,3000},
--{1204,26,"成都","凤翔",1203,11,1,1561,3114},
--{1204,27,"成都","汴京",1203,11,37,1601,3001},
--{1204,28,"成都","临安",1203,11,176,1592,2925},
--{1204,29,"成都","襄阳",1203,11,78,1596,3379},
--{1204,30,"成都","大理",1203,11,162,1674,3132},
--
----襄阳去其他城市(mapid:78)
--{1204,31,"襄阳","扬州",1203,78,80,1676,3000},
--{1204,32,"襄阳","凤翔",1203,78,1,1561,3114},
--{1204,33,"襄阳","汴京",1203,78,37,1601,3001},
--{1204,34,"襄阳","临安",1203,78,176,1592,2925},
--{1204,35,"襄阳","成都",1203,78,11,3021,5090},
--{1204,36,"襄阳","大理",1203,78,162,1674,3132},
--
----大理去其他城市(mapid:162)
--{1204,37,"大理","扬州",1201,162,80,1676,3000},
--{1204,38,"大理","凤翔",1201,162,1,1561,3114},
--{1204,39,"大理","汴京",1202,162,37,1601,3001},
--{1204,40,"大理","临安",1202,162,176,1592,2925},
--{1204,41,"大理","襄阳",1203,162,78,1596,3379},
--{1204,42,"大理","成都",1203,162,11,3021,5090},

--成都去其他城市(mapid:11)
{1204,1,"成都","大理",1203,11,162,1674,3132},

--大理去其他城市(mapid:162)
{1204,2,"大理","成都",1203,162,11,3021,5090},

}

-------------------------------------------特殊信使任务的主界面-------------------------------------------------
function especiallymessenger()
--	if ( nt_getTask(1270) == 0 ) then
--		nt_setTask(1270,1)
--		nt_setTask(1205,0)
--		Msg2Player("您的信使积分已被清空，从现在开始正常计算积分。请加油。")
--	end

	--七大主城驿官只有成都和大理有任务
	local _, _, nMapIndex = GetPos()
	local MapId = SubWorldIdx2ID( nMapIndex )
	if MapId ~= 11 and MapId ~= 162 then
		Talk(1,"","参加信使任务，请去找驿官<color=red>成都<color> 或者 <color=red> 大理<color>!")
		return
	end
	
	nt_setTask(1211,0)
--	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);--积分排名
	Describe(DescLink_YiGuan..": 朝廷军机最近总被金贼先知道, 我怀疑有内奸. 但是，在发现这些败类之前，我想让世人都知道，你想为国家尽一份力吗?",7,
	"我愿意!/messenger_ido",
	"我来交信使任务 /messenger_finishtask",
	"我想删除信使任务 /messenger_losemytask",
	--"我要求升级我的信使称号/messenger_getlevel",
	--"我要用积分兑换信使的奖励/messenger_duihuanprize",
	"我想了解信使任务/messenger_what",
	"最近我有很多事要做!/no")
end


-------------------------------------------接受特殊信使任务的主界面-----------------------------------------------


function messenger_ido()
	local _, _, nMapIndex = GetPos()
	
	local Uworld1204 = nt_getTask(1204)  --记录玩家的任务变量，每次任务结束时清空
	local Uworld1028 = nt_getTask(1028)  --任务链任务变量
	local MapId = SubWorldIdx2ID( nMapIndex )
	if ( GetLevel() < 120 ) then
		Describe(DescLink_YiGuan..": 对不起，目前你的等级不够120级. 继续练习然后来见我.",1,"结束对话/no")	
	elseif ( Uworld1204 ~= 0 )  then
		Describe(DescLink_YiGuan..":对不起!你的信使任务未完成，不能接相同的任务，请先完成该任务，谢谢!",1,"结束对话/no")
--	elseif (  messenger_givetime() == 10 ) then  --查看今日是否还有关卡时间
--		Describe(DescLink_YiGuan.."：对不起，您今天在信使任务中的时间已耗尽，请明日再来,谢谢。",1,"结束对话/no")
	else
    	local nTaskFlag = check_daily_task_count()--检查还有没有任务机会
    	if nTaskFlag == 0 then
    		Describe(DescLink_YiGuan..":对不起，今天你已经很累了，明天再来吧",1,"结束对话/no")
    		return
    	elseif nTaskFlag == -1 then
    		Describe(DescLink_YiGuan..": 今天你已很累了。如果你有<color=yellow>千宝库令<color>, 我将破例给你再参加一次.",1,"结束对话/no")
    		return
    	elseif nTaskFlag == 2 then
    		Msg2Player("你只管拿着千宝库令参加任务<color=yellow>任务完成<color>我将收回令牌")
    	end
    	
    	WriteLog(format("Account:%s[Name:%s] 接信使任务， 今天已完成[%d] 次.",
				GetAccount(),
				GetName(),
				nTaskFlag
				)
			);
	if nTaskFlag == 2 then
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSuSuDungThienBaoKhoLenh")		
	else
		tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuTinSu")
	end
		
-- 根据玩家所在地图随机出一个到达城市，并将该两城市之间的对应变量和对应关卡设置数值
--		if ( MapId == 80 ) then
--			local CityId = random(1,6)
--			for i=1,6 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
--		elseif ( MapId == 37 ) then
--			local CityId = random(7,12)
--			for i=7,12 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
--		elseif ( MapId == 1 ) then
--			local CityId = random(13,18)
--			for i=13,18 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end	
--		elseif ( MapId == 176 ) then
--			local CityId = random(19,24)
--			for i=19,24 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end		
		if ( MapId == 11 ) then
			if ( messenger_choice(1,1) ~= 10 ) then
					print("messenger_choice error:1")
			end
--			local CityId = random(25,30)
--			for i=25,30 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end		
--		elseif ( MapId == 78 ) then
--			local CityId = random(31,36)
--			for i=31,36 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
		elseif ( MapId == 162 ) then
			if ( messenger_choice(2,2) ~= 10 ) then
					print("messenger_choice error:2")
			end
--			local CityId = random(37,42)
--			for i=37,42 do
--				if ( messenger_choice(CityId,i) == 10 ) then
--					break
--				end
--			end
		else
			Msg2Player("对不起! 不懂为什么你不能接信使任务，请联系GM!")
		end
	end
end

--前往千宝库
function messenger_storewagoner()
	SetRevPos(11,10)
	
	NewWorld(395,1417,3207)
end

-----------------------------------------------给符合要求的玩家一个特殊信使任务，并改变其信使任务变量和到达关卡变量------------------------
function messenger_choice(CityIdTwo,j)
	if ( CityIdTwo == citygo[j][2] ) then	
		--设置由此地去彼地的任务变量	
		nt_setTask( 1204,citygo[j][2] )
		--设置去到哪个关卡的任务变量   
		nt_setTask( citygo[j][5],10) --设置信使任务的步骤
		local name = GetName()
		Talk(1,"","你获得从"..citygo[j][3].."到"..citygo[j][4].."特别信使任务的,"..citygo[j][3].."驿站驿官的恭送"..name.."大人!")		
		return 10
	end
end


---------------------------------------------------升级信使称号----------------------------------------------------------------------
--function messenger_getlevel()
--	local Uworld1205 = nt_getTask(1205)
--	local Uworld1206 = nt_getTask(1206)
--	local messenger_reallevelname = ""
--	if ( Uworld1206 == 1 ) then
--		messenger_reallevelname = "木牌信使"
--	elseif ( Uworld1206 == 2 ) then
--		messenger_reallevelname = "铜牌信使"
--	elseif ( Uworld1206 == 3 ) then
--		messenger_reallevelname = "银牌信使"
--	elseif ( Uworld1206 == 4 ) then
--		messenger_reallevelname = "金牌信使"
--	elseif ( Uworld1206 == 5 ) then
--		messenger_reallevelname = "御赐金牌信使"
--	else	
--		messenger_reallevelname = "没有任何称呼的信使"
--	end 
--	Describe(DescLink_YiGuan.."：您目前是"..messenger_reallevelname.."，您的信使积分为"..Uworld1205.."点，您想要升级为哪种信使呢？",6,
--		"木牌信使[50点]/messenger_levelmu",
--		"铜牌信使[150点]/messenger_leveltong",
--		"银牌信使[450点]/messenger_levelyin",
--		"金牌信使[800点]/messenger_leveljin",
--		"御赐金牌信使[1500点]/messenger_levelyuci",
--		"我只是随便看看/no")
--end

function messenger_levelmu()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 50 ) then
		if ( Uworld1206 < 1 ) then
			nt_setTask(1206,1)
			nt_setTask(1205,Uworld1205-50)
			Describe(DescLink_YiGuan..": 恭喜"..name.."大人成为信使-木!",1,"结束对话/no")
		elseif ( Uworld1206 == 1 ) then
			Describe(DescLink_YiGuan..":"..name.."! 你已是信使- 木, 不用升级, 请努力!",1,"结束对话/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! 你的等级超过信使- 木, 请选择其他信使.",2,"返回/messenger_getlevel","结束对话/no")				
		end
	else
		Describe(DescLink_YiGuan..":对不起!  你不符合升级信使- 木的条件, 请努力，谢谢!",2,"返回/messenger_getlevel","结束对话/no")
	end
end

function messenger_leveltong()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 150 )  then
		if ( Uworld1206 < 2 ) then
			nt_setTask(1206,2)
			nt_setTask(1205,Uworld1205-150)
			Describe(DescLink_YiGuan..": 恭喜"..name.."大人已是信使- 铜!",1,"结束对话/no")
		elseif ( Uworld1206 == 2 ) then
			Describe(DescLink_YiGuan..":"..name.."! 你已是信使- 铜,不用升级了,请继续努力 !",1,"结束对话/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! 你的等级超过信使-铜, 请选择其他信使.",2,"返回/messenger_getlevel","结束对话/no")				
		end
	else
		Describe(DescLink_YiGuan..":对不起!  你不符合升级信使- 铜的条件,请继续努力 , c竚 琻!",2,"返回/messenger_getlevel","结束对话/no")
	end
end

function messenger_levelyin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 450 ) then
		if ( Uworld1206 < 3 ) then
			nt_setTask(1206,3)
			nt_setTask(1205,Uworld1205-450)
			Describe(DescLink_YiGuan..": 恭喜"..name.."的人升级为银信使!",1,"结束对话/no")
		elseif ( Uworld1206 == 3 ) then
			Describe(DescLink_YiGuan..":"..name.."! 你已是银信使，不需要升级，请继续努力!",1,"结束对话/no")				
		else
			Describe(DescLink_YiGuan..":"..name.."! 你的等级已过银信使，请选择其他信使!",2,"返回/messenger_getlevel","结束对话/no")				
		end
	else
		Describe(DescLink_YiGuan..":对不起!  你不符合银信使的升级条件，请继续努力，谢谢!",2,"返回/messenger_getlevel","结束对话/no")
	end
end

function messenger_leveljin()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 800 ) then
		if ( Uworld1206 < 4 ) then
			nt_setTask(1206,4)
			nt_setTask(1205,Uworld1205-800)
			Describe(DescLink_YiGuan..": 恭喜"..name.."大人已是信使- 金!",1,"结束对话/no")
		elseif ( Uworld1206 == 4 ) then
			Describe(DescLink_YiGuan..":"..name.."! 你已是信使- 金,不用升级了,请继续努力!",1,"结束对话/no")		
		else
			Describe(DescLink_YiGuan..":"..name.."! 你的等级超过信使- 金, 请选择其他信使!",2,"返回/messenger_getlevel","结束对话/no")				
		end
	else
		Describe(DescLink_YiGuan..":对不起!  对不起，你不符合升级信使- 金的条件, 请继续努力，谢谢!",2,"返回/messenger_getlevel","结束对话/no")
	end
end

function messenger_levelyuci()
	local Uworld1205 = nt_getTask(1205)
	local Uworld1206 = nt_getTask(1206)
	local name = GetName()
	if ( Uworld1205 >= 1500 ) then
		if ( Uworld1206 < 5 ) then
			nt_setTask(1206,5)
			nt_setTask(1205,Uworld1205-1500)
			Describe(DescLink_YiGuan..": 恭喜"..name.."大人升级为御赐信使妖牌!",1,"结束对话/no")
		elseif ( Uworld1206 == 5 ) then
			Describe(DescLink_YiGuan..":"..name.."你已是金御赐信使，不需要升级了，请继续努力!",1,"结束对话/no")				
		end
	else
		Describe(DescLink_YiGuan..":对不起! 你不符合金御赐信使的升级条件，请继续努力!",2,"返回/messenger_getlevel","结束对话/no")
	end
end

--------------------------------------------交信使任务------------------------------------------------------
function messenger_finishtask()
	local Uworld1201= nt_getTask(1201)	--送信任务风之骑任务变量
	local Uworld1202= nt_getTask(1202)	--送信任务山神庙任务变量
	local Uworld1203= nt_getTask(1203)	--送信任务千宝库任务变量
	local Uworld1204= nt_getTask(1204)	--送信任务所到地点任务变量
--	local Uworld1205= nt_getTask(1205)	--信使积分
--	local Uworld1206= nt_getTask(1206)	--信使称号
--	local Uworld1208= nt_getTask(1208)	--风之骑杀怪记数器
--	local Uworld1209= nt_getTask(1209)	--山神庙杀怪记数器
--	local Uworld1210= nt_getTask(1210)	--千宝库杀怪记数器
	local Uworld1218= nt_getTask(1218)  --信使任务完成次数记数器

--	if ( Uworld1201 == 30 ) then
--		if ( messenger_gettime() == 10 ) then
--			Describe(DescLink_YiGuan.."：对不起，你没有在完成的当天来领取奖励，这个任务被看做失败了！",1,"结束对话/no")
--		else
--			nt_setTask(1218,Uworld1218+1)
--			Describe(DescLink_YiGuan.."：恭喜您已经完成了当前任务！",1,"领取奖励/messenger_flyprize")
--		end
--	elseif ( Uworld1202 == 30 ) then
--		if ( messenger_gettime() == 10 ) then
--			Describe(DescLink_YiGuan.."：对不起，你没有在完成的当天来领取奖励，这个任务被看做失败了！",1,"结束对话/no")
--		else
--			nt_setTask(1218,Uworld1218+1)
--			Describe(DescLink_YiGuan.."：恭喜您已经完成了当前任务！",1,"领取奖励/messenger_templeprize")
--		end
	if ( Uworld1203 == 30 or Uworld1203 == 25 ) then
		if ( messenger_gettime() == 10 ) then
			Describe(DescLink_YiGuan..":对不起!  你还未完成昨日来领奖的任务，该任务算是失败了!",1,"结束对话/no")
		else
			nt_setTask(1218,Uworld1218+1)
			Describe(DescLink_YiGuan..":  恭喜你已完成任务",1,"领奖/messenger_treasureprize")
		end
--	elseif ( Uworld1201 == 25 ) or ( Uworld1202 == 25 ) or ( Uworld1203 == 25 ) then   --完成了简单信使任务
--		if ( messenger_gettime() == 10 ) then
--			Describe(DescLink_YiGuan.."：对不起，你没有在完成的当天来领取奖励，这个任务被看做失败了！",1,"结束对话/no")
--		else
--			nt_setTask(1218,Uworld1218+1)
--			Describe(DescLink_YiGuan.."：恭喜您已经完成了当前任务！",1,"领取奖励/messenger_simpleprize")	
--		end
--	elseif ( Uworld1201 ~= 0 or Uworld1202 ~= 0 or Uworld1203 ~= 0 ) then
--		Describe(DescLink_YiGuan.."：您的信使任务还没有完成，请继续努力！",1,"结束对话/no")
	elseif Uworld1203 ~= 0 then
		Describe(DescLink_YiGuan..": 对不起，你还未完成任务。我旁边的老车夫可以帮你到任务地图!",1,"结束对话/no")
	else
		Describe(DescLink_YiGuan..": 未接任务，你还来交任务！来人，把这家伙给我做成人肉包子!",1,"结束对话/no")
	end
end

function messenger_flyprize()
--	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
--	local Uworld1207 = nt_getTask(1207)
--	local i = random(1,5)
--	AddRepute(i)
--	Msg2Player("恭喜你获得了"..i.."点声望。")
--	if ( nt_getTask(1224) ~= 1 ) then
--		if ( GetLevel()>=60 and GetLevel()<=89 ) then
--			if ( nt_getTask(1223) >= 150 ) then
--				messenger_giveplayerexp(1500000)
--			end
--		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
--			if ( nt_getTask(1223) >= 200 ) then
--				messenger_giveplayerexp(2000000)
--			end			
--		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
--			if ( nt_getTask(1223) >= 300 ) then
--				messenger_giveplayerexp(3000000)
--			end		
--		elseif ( GetLevel()>=130 ) then
--			if ( nt_getTask(1223) >= 600 ) then
--				messenger_giveplayerexp(6000000)
--			end		
--		end
--	end
--	
--	nt_setTask(1201,0)	--送信任务风之骑任务变量
--	nt_setTask(1204,0)	--送信任务所到地点任务变量
--	nt_setTask(1207,0)	--送信任务当前杀怪记数
--	nt_setTask(1211,0)
end

function messenger_templeprize()
-- 	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
--	local Uworld1207 = nt_getTask(1207)
--	local i = random(1,5)
--	AddRepute(i)
--	Msg2Player("恭喜你获得了"..i.."点声望。")
--	if ( nt_getTask(1224) ~= 1 ) then
--		if ( GetLevel()>=60 and GetLevel()<=89 ) then
--			if ( nt_getTask(1223) >= 150 ) then
--				messenger_giveplayerexp(1500000)
--			end
--		elseif ( GetLevel()>=90 and GetLevel()<=119 ) then
--			if ( nt_getTask(1223) >= 200 ) then
--				messenger_giveplayerexp(2000000)
--			end			
--		elseif ( GetLevel()>=120 and GetLevel()<=129 ) then
--			if ( nt_getTask(1223) >= 300 ) then
--				messenger_giveplayerexp(3000000)
--			end		
--		elseif ( GetLevel()>=130 ) then
--			if ( nt_getTask(1223) >= 600 ) then
--				messenger_giveplayerexp(6000000)
--			end		
--		end
--	end
--	
--	nt_setTask(1202,0)	--送信任务山神庙任务变量
--	nt_setTask(1204,0)	--送信任务所到地点任务变量
--	nt_setTask(1207,0)	--送信任务当前杀怪记数
--	nt_setTask(1211,0)
end

function messenger_treasureprize()
  local nTaskFlag = check_daily_task_count()--检查还有没有任务机会
  if nTaskFlag == 0 then
  	Describe(DescLink_YiGuan..": 对不起，今天你已很累了。明天再来换任务吧",1,"结束对话/no")
  	return
  elseif nTaskFlag == -1 then
  	Describe(DescLink_YiGuan..": 你是不是拿了<color=yellow> 千宝库令<color> 丢失了？找回令牌才能给你奖励.",1,"结束对话/no")
  	return
  end
  
  --检查背包空间
  local nTodayTaskCount = %get_task_daily(1205)
  local nBagCellNeed = 1
  if nTodayTaskCount == 0 then
  	nBagCellNeed = 2
  end
  if (CalcFreeItemCellCount() < nBagCellNeed) then
		Talk(1, "", format("<#>你的装备不足空位, 请整理装备留下%d 空位，然后来领奖",nBagCellNeed))
		return
	end
	local n_level = GetLevel();
	G_ACTIVITY:OnMessage("FinishMail", 1, n_level);	
	--扣除千宝库令
	if nTaskFlag == 2 then
	--Fix bug 不能在帮会箱子内扣除千宝库令- Modifiec by DinhHQ - 20110502
	    	if ConsumeEquiproomItem(1, 6, 1, 2813, -1) == 1 then--扣除千宝库令
	    		Msg2Player("你已交了一个千宝库令")
	    	else
	    		Talk(1, "", "你的千宝库令去哪里了，怎么我没见?")
	    		return
	    	end
    end
    
   	%add_task_daily(1205, 1)
	nt_setTask(1201,0)	--
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	
	nTodayTaskCount = %get_task_daily(1205)--获取交任务后的计数值
	WriteLog(format("Account:%s[Name:%s] 领取信使任务奖励， 今天已完成[%d] 次.",
			GetAccount(),
			GetName(),
			nTodayTaskCount
			)
		);
		
	--每天第一次完成任务奖励3个行侠令
	if nTodayTaskCount == 1 then
		for i = 1, 3 do
			--Fix bug sai level 行侠令- Modified by DinhHQ - 20110921
			AddItem(6,1,2566,1,0,0)--获取的行侠令为不绑定状态
		end;
		Msg2Player("你获得3个行侠令")
	end
	
	--每次交任务奖励2个信使宝箱
	for i = 1, 2 do
		AddItem(6,1,2812,0,0,0)
	end;
	Msg2Player("你获得2个信使宝箱")
end

function messenger_simpleprize()

--	Ladder_NewLadder(10187, GetName(),nt_getTask(1205),1);
--	local i = random(1,5)
--	AddRepute(i)
--	Msg2Player("恭喜你获得了"..i.."点声望。")
--	nt_setTask(1201,0)	
--	nt_setTask(1202,0)	
--	nt_setTask(1203,0)	
--	nt_setTask(1204,0)
--	nt_setTask(1207,0)
--	nt_setTask(1211,0)
		
end

--------------------------------------------积分换奖励-----------------------------------------------------
function messenger_duihuanprize()
	Describe(DescLink_YiGuan..": 奖品包括：信使妖牌和黄金装备. 妖牌可以增加人物的抗性, 黄金装备可以增加经验. 你想选哪种?",3,
		"信使妖牌 /messenger_prize_yaopai",
		"黄金装备/messenger_prize_huangjin",
--		"同伴相关/messenger_prize_partner",
--		"其他物品/messenger_prize_other",
		"稍候再说!/no")
end

function messenger_prize_partner()
	Describe(DescLink_YiGuan..": 龙五首领刚刚带回一些 <color=red>神秘的同行面具 <color>, 你想试用吗?",5,
		"同行技能/no",
		"同行面具/messenger_prize_mianju",
		"同行物品/no",
		"返回/messenger_duihuanprize",
		"稍候再说!/no")
end

function messenger_prize_mianju()
	Describe(DescLink_YiGuan..": 同行面具分成2类: 1次使用和10次使用.  想换哪个?",4,
	"换面具1 次/prize_mianju_dan",
	"换面具10 次/prize_mianju_shi",
	"返回/messenger_prize_partner",
	"暂时不能换 !/no")
end

function prize_mianju_shi()
	Describe(DescLink_YiGuan..": 你想换面具(10 次) 少年武士雷剑还是青年武士雷剑? 看清楚了吗?",4,
	"换面具少年武士 /prize_mianju_shi_shaonian",
	"换面具青年武/prize_mianju_shi_qingnian",
	"返回/messenger_prize_mianju",
	"暂时不能换 !/no")
end

function prize_mianju_shi_shaonian()
	Describe(DescLink_YiGuan..": 开始换!",7,
	"面具(10 次) - 少年雷剑[40000 分钟]/prize_mianju_shi_shaolin_leijian",
	"面具(10 次) - 少年笑霜 [40000 分钟]/prize_mianju_shi_shaolin_xiaoshuang",
	"面具(10 次) - 千年火忍[40000 分钟]/prize_mianju_shi_shaolin_huoren",
	"面具(10 次) - 少年海棠[40000 分钟]/prize_mianju_shi_shaolin_haitang",
	"面具(10 次) - 少年金丰 [40000 分钟]/prize_mianju_shi_shaolin_jinfeng",
	"返回/prize_mianju_shi",
	"暂时不能换 !/no")
end

function prize_mianju_shi_qingnian()
	Describe(DescLink_YiGuan..": 开始换!",7,
	"面具(10 次) - 青年雷剑[40000 分钟]/prize_mianju_shi_qinglin_leijian",
	"面具(10 次) - 青年笑霜 [40000 分钟]/prize_mianju_shi_qinglin_xiaoshuang",
	"面具(10 次) - 青年火忍[40000 分钟]/prize_mianju_shi_qinglin_huoren",
	"面具(10 次) - 青年海棠[40000 分钟]/prize_mianju_shi_qinglin_haitang",
	"面具(10 次) - 青年金丰 [40000 分钟]/prize_mianju_shi_qinglin_jinfeng",
	"返回/prize_mianju_shi",
	"暂时不能换 !/no")
end

function prize_mianju_shi_qinglin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,112,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,113,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_qinglin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,114,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_qinglin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,115,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,116,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_shaolin_leijian()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,102,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,103,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_shaolin_huoren()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,104,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_shaolin_haitang()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,105,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_shi_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 40000 ) then
		AddItem(0,11,106,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 40000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan()
	Describe(DescLink_YiGuan..": 你想换面具(1 次) 少年武士雷剑还是青年 武士雷剑? 看清楚了吗?",4,
	"换面具少年武士/prize_mianju_dan_shaonian",
	"换面具青年 V?/prize_mianju_dan_qingnian",
	"返回/messenger_prize_mianju",
	"暂时不能换 !/no")
end

function prize_mianju_dan_qingnian()
	Describe(DescLink_YiGuan..": 开始换.",7,
	"面具(1 次) - 青年 雷剑[10000 分钟]/prize_mianju_dan_qinglin_leijian",
	"面具(1 次) - 青年 笑霜 [10000 分钟]/prize_mianju_dan_qinglin_xiaoshuang",
	"面具(1 次) - 青年火忍[10000 分钟]/prize_mianju_dan_qinglin_huoren",
	"面具(1 次) - 青年 海棠[10000 分钟]/prize_mianju_dan_qinglin_haitang",
	"面具(1 次) - 青年 金丰 [10000 分钟]/prize_mianju_dan_qinglin_jinfeng",
	"返回/prize_mianju_dan",
	"暂时不能换 !/no")
end

function prize_mianju_dan_shaonian()
	Describe(DescLink_YiGuan..": 开始换.",7,
	"面具(1 次) - 少年雷剑[10000 分钟]/prize_mianju_dan_shaolin_leijian",
	"面具 (1 次) - 少年笑霜 [10000 分钟]/prize_mianju_dan_shaolin_xiaoshuang",
	"面具(1 次) - 千年火忍[10000 分钟]/prize_mianju_dan_shaolin_huoren",
	"面具(1 次) - 千年海棠[10000 分钟]/prize_mianju_dan_shaolin_haitang",
	"面具(1 次) - 千年金丰 [10000 分钟]/prize_mianju_dan_shaolin_jinfeng",
	"返回/prize_mianju_dan",
	"暂时不能换 !/no")
end

function prize_mianju_dan_shaolin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,97,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_shaolin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,98,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_shaolin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,99,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_shaolin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,100,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_shaolin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,101,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_qinglin_leijian()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,107,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_qinglin_xiaoshuang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,108,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_qinglin_huoren()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,109,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_qinglin_haitang()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,110,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_mianju_dan_qinglin_jinfeng()
	if ( nt_getTask(1205) >= 10000 ) then
		AddItem(0,11,111,0,0,0,0)
		local Uworld1205 = nt_getTask(1205) - 10000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 同行面具")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end


function messenger_prize_yaopai()
	Describe(DescLink_YiGuan..": 信使妖牌与你达到的信使称号相对应。比如你是金信使，将可以换任何信使，如果你是木信使，就不能换金信使。懂了吗？开始换吧。.",7,
	"信使令- 木 [50点]/prize_yaopai_mu",
	"信使令- 铜[150点]/prize_yaopai_tong",
	"信使令- 银 [450点]/prize_yaopai_yin",
	"换信使令牌[800点]/prize_yaopai_jin",
	"御赐令牌 - 金 [1500点]/prize_yaopai_yuci",
	"返回/messenger_duihuanprize",
	"暂时不能换 !/no")
end

function prize_yaopai_mu()
	if ( nt_getTask(1205) >= 50 ) then
		AddItem(6,1,885,1,0,0)
		local Uworld1205 = nt_getTask(1205) - 50
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得块信使令 -木.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_yaopai_tong()
	if ( nt_getTask(1205) >= 150 ) then
		AddItem(6,1,886,2,0,0)
		local Uworld1205 = nt_getTask(1205) - 150
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得块信使令-铜.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_yaopai_yin()
	if ( nt_getTask(1205) >= 450 ) then
		AddItem(6,1,887,3,0,0)
		local Uworld1205 = nt_getTask(1205) - 450
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得信使令-银.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end
end

function prize_yaopai_jin()
	if ( nt_getTask(1205) >= 800 ) then
		AddItem(6,1,888,4,0,0)
		local Uworld1205 = nt_getTask(1205) - 800
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 块信使令 -金.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_yaopai_yuci()
	if ( nt_getTask(1205) >= 1500 ) then
		AddItem(6,1,889,5,0,0)
		local Uworld1205 = nt_getTask(1205) - 1500
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1御赐信使妖牌")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function messenger_prize_huangjin()
	Describe(DescLink_YiGuan..": 朝廷想奖励你，所以给你准备了一套黄金装备，当你杀敌时将获得双倍经验. 你想换哪个?",6,
		"鸿影沈园晚醉[100000点]/prize_huangjin_shenyuan",
		"鸿影剑挂西方[70000点]/prize_huangjin_guajian",
		"鸿影苜蓿相忘[70000点]/prize_huangjin_muxu",
		"鸿影红袖招[50000点]/prize_huangjin_hongxiu",
		"返回/messenger_duihuanprize",
		"暂时不换/no")
end

function messenger_prize_other()
	Describe(DescLink_YiGuan..": 朝廷有很多奖励，目前你的物品可以换:",3,
		"神秘大红包[2000 分钟]/prize_other_hongbao",
		"返回/messenger_duihuanprize",
		"暂时不换/no")
end

function prize_other_hongbao()
	if ( nt_getTask(1205) >= 2000 ) then
		local Uworld1205 = nt_getTask(1205) - 2000 
		nt_setTask(1205,Uworld1205)
		AddItem(6,1,402,0,0,0)
		Msg2Player("你获得1神秘大红包.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_huangjin_shenyuan()
	if ( nt_getTask(1205) >= 100000 ) then
		AddGoldItem(0,204)
		local Uworld1205 = nt_getTask(1205) - 100000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 套鸿影黄金装备.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_huangjin_guajian()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,205)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 套鸿影黄金装备.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_huangjin_muxu()
	if ( nt_getTask(1205) >= 70000 ) then
		AddGoldItem(0,206)
		local Uworld1205 = nt_getTask(1205) - 70000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 套鸿影黄金装备.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end

function prize_huangjin_hongxiu()
	if ( nt_getTask(1205) >= 50000 ) then
		AddGoldItem(0,207)
		local Uworld1205 = nt_getTask(1205) - 50000
		nt_setTask(1205,Uworld1205)
		Msg2Player("你获得1 套鸿影黄金装备.")
	else
		Describe(DescLink_YiGuan..": 对不起! 你的积分不够.",1,"结束! /no")
	end 
end
-------------------------------------------取消信使任务----------------------------------------------------
function messenger_losemytask()
	if ( GetTask(1204) == 0 ) then
		Describe(DescLink_YiGuan..": 你未接信使任务，不能删除",1,"结束对话/no")
	else
		Describe(DescLink_YiGuan..": 你确定想删除 ",2,"对!/messenger_lostall","让我想想!/no")
	end
end
--------------------------------------------解释什么是信使任务----------------------------------------------
function messenger_what()
	Describe(DescLink_YiGuan..": 信使任务是帮助朝廷送信给各城市的驿官任务，因为最近在朝廷出现反贼，所以，在送信的时候遇到不少危险。没有智勇双全的人以及团结合作精神的人将很难完成任务。只有达到 <color=red> 120级以上<color> 才能参加.目前你将遇到如下关口的阻碍: <color=red> 千宝库 <color>. 在这些关内，有无数相同的敌人和奇怪的机关，你需要用聪明和智慧去正确选择。我只能祝你成功，努力，战友！!",4,
	"介绍地图等级/messenger_levelmap",
	--"风之骑关卡介绍/messenger_flyhorse",
	--"山神庙关卡介绍/messenger_mountaindeity",
	"介绍千宝库 /messenger_storehouse",
	--"信使腰牌介绍/messenger_orderlevel",
	--"任务限时介绍/messenger_limittotask",
	"结束对话/no")
end

function messenger_levelmap()
	--Describe(DescLink_YiGuan.."：按照玩家的不同等级，我们划分了三种不同强度的地图给您。级别区分是<color=red>60-89级，90-119级，120<color>以上三种。",2,"回上一层/messenger_what","结束对话/no")
	Describe(DescLink_YiGuan..": 目前只有<color=red> 120级以上<color> 任务程度",2,"返回/messenger_what","结束对话/no")
end

function messenger_flyhorse()
	Describe(DescLink_YiGuan..": 在风骑关内，你可以下载到出口，这样算是完成任务，但是，只奖励名望值。在关内，我们有一些简单的任务：一路上，你将看到很多我军留下的记号，同时有很多金国间谍。你只需要接触5个坐标就可以到出口找白翼将军过关。但是你的表现都在我们派去的侦查员眼里。对你的妖牌升级很有利。.",2,"返回/messenger_what","结束对话/no")
end

function messenger_mountaindeity()
	Describe(DescLink_YiGuan..": 在山神庙关内，你可以下载直接到大门，这样算完成任务，但是，只奖励名望值。在关内，我们有一些简单的任务：在山里出现神刀营京师叛徒他们在山里阻挠信使。他们的头领叫做刀妖。你只需要打败2个刀妖就能到大门找那狼倾城过关。如果完成任务，对你升级很有帮助.",2,"返回/messenger_what","结束对话/no")
end

function messenger_storehouse()
	Describe(DescLink_YiGuan..": 你活着你的队长接千宝库闯关任务时，系统将随机分配，获得5个号数，根据<color-red> 按照号数秩序<color> 打开<color=red> 宝箱<color> 就可以闯关。当然，需要打开宝箱，你要打败 <color=red> 宝箱旁边的千宝库守护者boss<color> . <color=red>五行符<color> 在奇珍阁有卖，打开可以获得撤金符，撤木符，撤水符，撤火符，撤土符，使用后可以帮你轻易打败千宝库守护者boss",2,"返回/messenger_what","结束对话/no")
end

function messenger_orderlevel()
	Describe(DescLink_YiGuan..":根据你在关内的表现，我们将封给你一些官衔，你将获得很多奖励。目前，妖牌分为信使 - 木, 信使- 铜, 信使- 银, 信使- 金以及御赐信使- 金. 同时,你按 <color=red>F12<color>, 看榜内<color=red>积分<color> 信使任务，知道自己的职能位置。你可以用积分换取信使称号。然后，可以用信使积分换取妖牌。这些妖牌将增加能力<color=red>恢复<color>你的, 它的作用为<color=red>1 小时<color>, 使用次数为<color=red>5 次<color>.",2,"返回/messenger_what","结束对话/no")
end

function messenger_limittotask()
	Describe(DescLink_YiGuan..": 接信使任务后，你有时间 <color=red>2小时<color> 来完成.每天做任务的时间为<color=red>2小时<color>. 注意，当在关内时，你被杀或者丧门算是<color=red>任务失败<color>!",2,"返回/messenger_what","结束对话/no")
end

function messenger_giveplayerexp(playerexp)

	local j =random(1,3)

	if ( j == 1 ) then
		tl_addPlayerExp(playerexp-500000)
	elseif ( j == 2 ) then
		tl_addPlayerExp(playerexp)
	elseif ( j == 3 ) then
		tl_addPlayerExp(playerexp+500000)
	end
	Msg2Player("由于你做信使任务表现好，驿站给你一个经验奖励!")
	nt_setTask(1224,1)  --设置当天奖励开关为开  
	nt_setTask(1223,0)
end

function messenger_lostall()
	nt_setTask(1201,0)
	nt_setTask(1202,0)
	nt_setTask(1203,0)
	nt_setTask(1204,0)
	nt_setTask(1207,0)
	nt_setTask(1212,0)
	nt_setTask(1213,0)
	nt_setTask(1214,0)
	nt_setTask(1215,0)
	Msg2Player("你成功放弃信使任务 ")
	WriteLog(format("Account:%s[Name:%s] 放弃信使任务",
			GetAccount(),
			GetName()
			)
		);
end

function no()
end

function check_daily_task_count()
	local nNormalTaskLimit = 2--一天最多只允许两次普通任务
	local nIBTaskLimit = 1--一天最多只允许1次IB任务
	local nTodayCnt = %get_task_daily(1205)
	if nTodayCnt < nNormalTaskLimit then
		return 1--还有普通任务机会
	elseif  nTodayCnt < (nNormalTaskLimit + nIBTaskLimit) then
		local nCountIb = CalcItemCount(-1, 6, 1, 2813, -1)
		if nCountIb >= 1 then
			return 2--可以使用道具报名
		else
			return -1--可以使用道具但是身上没有
		end
	end
	return 0--没有任务机会了
end

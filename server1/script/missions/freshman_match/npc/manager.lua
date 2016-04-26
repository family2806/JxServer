Include("\\script\\missions\\freshman_match\\head.lua")

--武林新秀赛官员
function main()
	Say("武林新秀联赛官员: 从2005年6月1日到2005年6月10日, 每天20:到 23:00将举行<color=yellow>武林新秀联赛<color>. 本场比赛目的是给新手（50级到89级）创造与同门交流的机会，提高新手的武艺，快去参加吧!", 1, "同意 /want_bid_option")
end

function str__findicon(string)
	len = strlen(string)
	for i = 1, len do 
		if (strbyte(string, i) == 93) then
			return 1
		end
	end
	return 0
end

function want_bid_option()
	local optiontab = {}
	if ( validateDate( CP_UPTO_TRYOUT, CP_END_TRYOUT ) ) then	--在新秀赛的时间时
		talkstr = "武林新秀联赛官员: 想报名参加武林新秀联赛?"	--已经决出总领队
		optiontab = {
						"报名参加武林新秀联赛'/regist_freshman",
						"我想进入武林新秀联赛'/transtoplace",
						"武林新秀联赛帮助/help_freshmanmatch",
						"我稍候再来!/OnCancel"
			}
	elseif(tonumber( date( "%y%m%d%H" ) ) >= CP_END_TRYOUT ) then
		talkstr = "武林新秀联赛官员:武林新秀联赛已结束，你可以检查各门派前五名."	--已经决出总领队
		optiontab = {
						"检查各新秀联赛/look_freshman",
						"领取新秀联赛称号/catch_title",
						"武林新秀联赛帮助/help_freshmanmatch",
						"我稍候再来!/OnCancel"
			}
	else
		Say("武林新秀联赛官员: 武林新秀联赛还未开始，请稍等!", 0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end




function catch_title()	--10大门派前五领取称号
	local factionnumber = GetLastFactionNumber()
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("武林新秀联赛官员: 你不是十大门派的人吗?", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("武林新秀联赛官员: 武林新秀联赛未结束，还未选出前五名，不能颁发称号.", 0)
		return
	end
	biwu_loadfile( FactionData[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(FactionData[factionnumber+1][1], FactionData[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 20, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 20);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]达到"..FactionTitle[factionnumber+1].."称号");
			Msg2Player("你获得"..FactionTitle[factionnumber+1].."称号");
			return 1
		end
	end
	Say("武林新秀联赛官员: 你不够资格领取武林新秀联赛称号.",0);
	return
end


function look_freshman()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say("武林新秀联赛官员: 武林新秀联赛还未结束，还没有决赛的门派名单.", 0)
		return
	end
local factab = {"少林 /#look_list_fac(1)", "天王/#look_list_fac(2)", "唐门/#look_list_fac(3)", "五毒/#look_list_fac(4)", "峨眉/#look_list_fac(5)", "翠烟/#look_list_fac(6)", "丐帮/#look_list_fac(7)", "天忍/#look_list_fac(8)", "武当/#look_list_fac(9)", "昆仑/#look_list_fac(10)" , "不看了!/OnCancel"}
	Say("武林新秀联赛官员: 想看门派新秀名单啊?", getn(factab), factab)
end

function look_list_fac(nfact)
	local ncount = 0
	biwu_loadfile( FactionData[nfact][1] );
	local topfac_mem = {}
	for i = 1, 5 do
		name = biwu_getdata(FactionData[nfact][1], FactionData[nfact][2], "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topfac_mem[ncount] = name.."/OnCancel"
		 end
	end
	if (ncount > 0) then
		Say("武林新秀联赛官员:"..FactionData[nfact][3].."中选门派名单:", getn(topfac_mem), topfac_mem);
	else
		Say("武林新秀联赛官员:"..FactionData[nfact][3].."中选名单还没有", 0)
	end
end


function regist_freshman()

	if (GetLevel() >= 90  ) then
		Say("武林新秀联赛官员: 90级或者更高级别的将不能参加武林新秀联赛，你可以进入看!", 0)
		return
	end
	
	if ( GetLevel() < 50 ) then
		Say( "武林新秀联赛官员: 你的等级不够50级要求，不能报名比赛，但是你可以进入看.", 0 )
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("武林新秀联赛官员: 你不是十大门派的人，不能参加比赛。加入十大门派后，才能参加比赛!", 0)
		return
	end
	
	if ( nt_gettask( CP_TASKID_REGIST ) == CP_UPTO_TRYOUT ) then
		Msg2Player( "你已经报名了，直接去见武林新秀联赛官员就能进入了." )
		transtoplace()
	else
		local talkstr = "武林新秀联赛官员: 你第一次参武林新秀联赛吗?想参加吗？"
		Say( talkstr, 2, "我想报名/sure_regist", "让我看看/OnCancel" )
		return
	end
end

function sure_regist()

		nt_settask( CP_TASKID_REGIST, CP_UPTO_TRYOUT )
		for i = 1096 , 1105 do
			nt_settask( i, 0 )
		end
		nt_settask( CP_TASKID_LOGOUT, 0 )
		
		transtoplace()

end



function look_the_time( THETIME )
	local the_year = floor(THETIME / 1000000)
	local the_month = mod(floor(THETIME / 10000), 100)
	local the_date = mod(floor(THETIME / 100), 100)
	local the_hour = mod(THETIME,100)
	return	the_month, the_date, the_hour
end


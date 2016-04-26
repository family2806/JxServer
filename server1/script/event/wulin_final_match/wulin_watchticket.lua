TV_LASTTIME_BUY = 1600
TV_TICKET1 = 1601
TV_TICKET2 = 1602
IncludeLib("FILESYS")
IncludeLib("ITEM")



function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end

--物品	概率	magicscriptID
TAB_LOTTERY_BONUS = 
{
{"武林观众令", 0, 443,1},
{"福缘露 (大) ",0.05,124,1},
{"福缘露 (中) ",0.05,123,1},
{"福缘露 (小) ",0.05,122,1},
{"仙草露",0.1,71,1},
{"天山宝露",0.1,72,1},
{"百果露",0.1,73,1},
{"烟花",0.15,11,0},
{"玫瑰花雨",0.2,20,0},
{"心心相印符",0.2,18,1},
};

TAB_TICKETBUY =
{
	{0712,20, 20},
	{0713,20,20},
 	{0714,30,30},
 	{0715,30, 30},
 	{0716,25,25},
 	
 	
 	{0717,35,35},
 	{0718,7,8},
 	{0719,7,8},
 	{0720,7,8},
 	{0721,7,8},
	{0722,5,5},
 	{0723,5,5},
};

function wulin_watchticketmain()
	local nowdate = tonumber(date ("%m%d%H") )
	local today = tonumber(date("%m%d"))
	local bCheckTicket1 = 0
	local bCheckTicket2 = 0
	local matchday = 0
	
	local nowhour = tonumber(date("%H")) 
	--如果现在还没有到当日的买票时间，则目前兑的奖为昨天的奖
	print("sadbeginf")
	if ( nowhour < 20) then
		local yesterday = today - 1
		local idx = wulin_day2buytabidx(yesterday)

		--如果昨天没有卖过票，则不兑奖了，目前的票也自然是过期的。
		if (idx == 0) then
			bCheckTicket1 = 0
			bCheckTicket2 = 0
			wulin_clearticket()
		else
			--上次买的票已经过期则清除，
			print("now match1")
			if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= yesterday) then
				wulin_clearticket()
			else
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end
			end
		end
	else
		--如果现在到了当日的买奖或开奖时间，则如果现在是21：00 > and  < 23，则目前兑的奖是本日第一期，如果> 23则兑的是本日第一、第二期的
		
		--如果上次买的票不是今天的票，则过期了，清除
		if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= today) then
			wulin_clearticket()
		else
			if (nowhour == 21) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
			elseif(nowhour == 23) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end	
			end
		end
	end
	
	if (bCheckTicket1 == 1 or bCheckTicket2 == 1) then
		local checktab = {};
		if (bCheckTicket1 == 1) then
			checktab[getn(checktab) + 1] = "21:00 开武林观众令奖品/#wulin_checkticket(1)";
		end
		if (bCheckTicket2 == 1) then
			checktab[getn(checktab) + 1] = "23:00 开武林观众令奖品/#wulin_checkticket(2)";
		end
		checktab[getn(checktab) + 1] = "不需要!/OnCancel"
		Say("您现在未领取武林观众令奖励，您想领吗?", getn(checktab), checktab)
		return
	end
	
	--如果现在是买票时间
	if (nowhour == 20 or nowhour == 22) then
		
		if (IsCharged() == 0) then
			Say("对不起，想参加该活动需要充值。您还未充值。快点吧！不要失去机会!", 0)
			return 
		end
		
		local buyidx = wulin_day2buytabidx(today)
		if (buyidx == 0) then
			Say("对不起，目前不销售武林观众令票，请稍候再来",0)
			return 
		end
		if (GetTask(TV_LASTTIME_BUY) >= tonumber(nowdate)) then
			Say("您已买一张武林观众令的票了，请等开奖哦", 0)
			return 0
		end
		
		--如果玩家当前的票已经是过期的了，那么清除这些票
		if (wulin_TicketIsTimeout() == 1) then
			SetTask(TV_TICKET1, 0)
			SetTask(TV_TICKET2, 0)
			SetTask(TV_LASTTIME_BUY,0)
		end
		
		local phase = 0
		if (nowhour == 20 ) then
			phase = 1
		else
			phase = 2
		end

		Say("只需用10两买一张票（每个阶段只能买一张）。每天从20:00-21:00 一次以及22:00-23:00 一次",2, "可以!/#wulin_payfor_ticket("..phase..")", "不需要/OnCancel")
		return
	else
		Say("对不起，早点的票从20:00-21:00 及22:00-23:00 才卖! 现在客官有什么需要帮助的吗?",2,"我想了解武林观众令活动/wulin_OnHelp", "不需要/OnCancel")
		return
	end

end
function wulin_OnHelp()
	Say("每天从20:00-21:00 v?22:00-23:00, 所有充值玩家都可以到临安见武林官员：充10万两就可以参加选举",2,"下一页/wulin_OnHelp1","关闭/OnCancel")
end

function wulin_OnHelp1()
	Say("每天21:00 及23:00, 系统将赠送给玩家获得其中一个中奖：仙草露，天山宝露，百果露，福缘露，烟花，玫瑰花雨，心心相印符",2,"下一页/wulin_OnHelp2","关闭/OnCancel")
end

function wulin_OnHelp2()
	Say("中奖玩家，在下一日20:00 前需到临安见武林官员领取武林观众令，过期将不能领。在第二天的24h:00 需要确认观众令资格才能登陆比赛服务器!",2,"下一页/wulin_OnHelp3","关闭/OnCancel")
end



function wulin_OnHelp3()
	Say("登陆比赛服务器后，可以到7大城市见武林官员确认资格。然后进入斗场看比赛!",0)
end;

function OnCancel()
end

function wulin_getnowstate()
	local today = tonumber(date("%m%d"))
	local nowhour = tonumber(date("%H"))
	local bCheckTicket1 = 0
	local bCheckTicket2 = 0
	local ticketday = today
	
	if ( nowhour < 20) then
		local yesterday = today - 1
		ticketday = yesterday
		local idx = wulin_day2buytabidx(yesterday)
		
		--如果昨天没有卖过票，则不兑奖了，目前的票也自然是过期的。
		if (idx == 0) then
			bCheckTicket1 = 0
			bCheckTicket2 = 0
			wulin_clearticket()
		else
			--上次买的票已经过期则清除，
			if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= yesterday) then
				wulin_clearticket()
			else
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end
			end
		end
	else
		--如果现在到了当日的买奖或开奖时间，则如果现在是21：00 > and  < 23，则目前兑的奖是本日第一期，如果> 23则兑的是本日第一、第二期的
		
		--如果上次买的票不是今天的票，则过期了，清除
		if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= today) then
			wulin_clearticket()
		else
			if (nowhour == 21) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
			elseif(nowhour == 23) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end	
			end
		end
	end
	print(ticketday..","..bCheckTicket1..","..bCheckTicket2)
	return ticketday, bCheckTicket1, bCheckTicket2

end	
	
	
	
function wulin_checkticket(phase)	
	local ticketday , bCheckTicket1, bCheckTicket2 = wulin_getnowstate()
	if (phase == 1 ) then
		if (bCheckTicket1 == 0) then
			return
		end
	end
	
	if (phase == 2 ) then
		if (bCheckTicket2 == 0) then
			return
		end
	end
	
	local file = wulin_getcurticketfile(ticketday, phase)
	if (file == "") then
		return
	end
	
	wulin_loadfile(file)
	local bticketstart = tonumber(wulin_getdata(file, "TICKET", "IsBonusCreate"))
	if (bticketstart == 0) then
		Say("对不起，还未到开奖时间，请稍等一下哦", 0) 
		wulin_start_lottery(phase)
		return 
	end
	local ticketid = 0
	if (phase == 1) then
		ticketid = GetTask(TV_TICKET1)
		SetTask(TV_TICKET1,0)
	elseif (phase == 2) then
		ticketid = GetTask(TV_TICKET2)
		SetTask(TV_TICKET2,0)
	end
	
	if (ticketid == 0) then
		return
	end
	
	if (GetName() ~= wulin_getdata(file, "TICKET", "Ticket"..ticketid)) then
		return
	end
	
	local bonusid = tonumber(wulin_getdata(file, "TICKET", "Bonus"..ticketid))
	if ( bonusid == 1) then
		local itemidx = AddItem(6,1,TAB_LOTTERY_BONUS[1][3],1,0,0,0)
		Msg2Player("恭喜您获得1 "..TAB_LOTTERY_BONUS[1][1].." ");
		Say("恭喜您获得 1 "..TAB_LOTTERY_BONUS[1][1].." ",0)
		local ticket_mon = floor(tonumber(ticketday) / 100)
		local ticket_day = mod(tonumber(ticketday), 100)

		SetSpecItemParam(itemidx, 1, ticket_mon)
		SetSpecItemParam(itemidx, 2, ticket_day+1)
		
		local str = "恭喜玩家获得"..GetName().." 获得"..TAB_LOTTERY_BONUS[1][1].." "
		AddGlobalNews(str)
		wulin_setdata(file, "TICKET", "Ticket"..ticketid, GetName().."_END")
		wulin_save(file)
		WriteLog(str)
	elseif (bonusid == 0) then
			local randbonus = random(1,100) 
			local curbonus = 0
			local bonus_data = 0
			for i = 2, getn(TAB_LOTTERY_BONUS) do 
				bonus_data = bonus_data + TAB_LOTTERY_BONUS[i][2]*100
				if (bonus_data >= randbonus) then
					curbonus = i
					break;
				end
			end
			if (curbonus == 0) then
				local msgstr = "对不起，您不能获得此次奖励。但是，依然还有很多机会。继续参加哦"
				Say(msgstr,0)
				Msg2Player(msgstr)
				return
			end
			
			AddItem(6,TAB_LOTTERY_BONUS[curbonus][4],TAB_LOTTERY_BONUS[curbonus][3],1,0,0,0)
			local msgmsg = "恭喜您获得 1 "..TAB_LOTTERY_BONUS[curbonus][1].." "
			Msg2Player(msgmsg);
			local str = "恭喜"..GetName().."获得1 "..TAB_LOTTERY_BONUS[curbonus][1].." "
			Say(msgmsg, 0)
			wulin_setdata(file, "TICKET", "Ticket"..ticketid, GetName().."_END")
			wulin_setdata(file, "TICKET", "Bonus"..ticketid, curbonus)
			wulin_save(file)
			WriteLog(str)
	end
end

function wulin_payfor_ticket(phase)
	if (phase ~= 1 and phase ~= 2) then
		print("Error!!!pay for errror phase ticket ,wulin")
		return
	end
	if (GetCash() < 100000) then
		Say("您的银两不够，请稍候再来。但是要抓紧时间哦!", 0) 
		return
	end
	Pay(100000);
	wulin_sure_buyticket(phase)
end
 
function wulin_day2buytabidx(day)
	for i = 1, getn(TAB_TICKETBUY) do
		if (tonumber(day) == TAB_TICKETBUY[i][1]) then
			return i
		end
	end
	return 0
end

function wulin_canbuyticket()
	local nowdate = date("%m%d%H")
	local nowhour = date("%H")
	if (nowhour == 20 or nowhour == 22) then
		if (GetTask(TV_LASTTIME_BUY) >= tonumber(nowdate)) then
			return 0
		end
	else
		return 1
	end
end

--获得当前操作的票，相应的数据文件
function wulin_getcurticketfile(nowdate, no)
	if (no ~= 1 and no ~= 2) then
		return ""
	end
	
	local idx = wulin_day2buytabidx(nowdate)
	local filename = ""
	
	if (idx >  0 ) then
	 	filename = "\\data\\WULIN_TICKET_"..nowdate.."_"..no..".dat"
	else
		filename = ""
	end
	return filename, nowdate
end

function wulin_GetTicketPhase()
	local nowhour = tonumber(date("%H"))
	if (nowhour == 20) then
		return 1
	elseif (nowhour == 22) then
		return 2
	else 
		return 0
	end
end

function wulin_BuyTicket()
	local nowday = date("%m%d") 
	local buyidx = wulin_day2buytabidx(nowday)
	if (buyidx == 0) then
		Say("对不起，您已申请一次了。现在不能申请了!", 0)
		return 
	end
	
	local nowdate = date("%m%d%H")
	if (wulin_canbuyticket() == 1) then
			Say("对不起，您已申请一次了。现在不能申请了!", 0)
			return
	end
end

function wulin_TicketIsTimeout()
	local lastdate = tonumber(date("%m%d20"))
	if (GetTask(TV_LASTTIME_BUY) < lastdate) then
		return 1 --过期了
	else
		return 0 --尚未过期
	end
end

function wulin_sure_buyticket(no)
	print("sure")
	local today = tonumber(date("%m%d"))
	local nowdate  = tonumber(date("%m%d%H"))
	local nowhour = tonumber(date("%H"))
	if (nowhour == 20 or nowhour == 22) then
		local buyidx = wulin_day2buytabidx(today)
		
		if (buyidx == 0) then
			Say("对不起，目前为卖完啦工作令，稍候再来哦",0)
			return 
		end
		if (GetTask(TV_LASTTIME_BUY) >= nowdate) then
			Say("对不起，您已申请一次了。现在不能申请了!", 0)
			return 0
		end
		
		local phase = 0
		if (nowhour == 20) then
			phase = 1
		else
			phase = 2
		end
		
		if (phase ~= no) then
			print("ddd")
			return
		end
	else
		Say("对不起，活动每天只从20:00-21:00 以及22:00-23:00开始. 到时再来哦",0)
		return
	end
	
	local filename = wulin_getcurticketfile(today,no)
	if (filename == "") then
		print("asd3f")
		return 
	end
	wulin_loadfile(filename)
	local ticketcount = wulin_getdata(filename, "TICKET", "Count")
	if (ticketcount == nil or ticketcount == "") then
		ticketcount = 0
	else
		ticketcount = tonumber(ticketcount)
	end
	if (ticketcount == 0) then
			wulin_setdata(filename, "TICKET", "IsBonusCreate", 0)
	end
	ticketcount = ticketcount + 1 
	
	wulin_setdata(filename, "TICKET", "Count", tostring(ticketcount))
	wulin_setdata(filename, "TICKET", "Ticket"..ticketcount, GetName())
	wulin_setdata(filename, "TICKET", "Bonus"..ticketcount, "0")
	wulin_save(filename)
	local msgstr = "";
	if (no == 1) then
		SetTask(TV_TICKET1, ticketcount)
		msgstr = "您已购武林观众令资格。次日21h:00 后及20h:00 前可以来见我领奖!";	
	else
		SetTask(TV_TICKET2, ticketcount)			
		msgstr = "您已购武林观众令资格。次日23h:00 后及20h:00 前可以来见我领奖!";
	end
	SetTask(TV_LASTTIME_BUY, nowdate)
	Msg2Player(msgstr)
	Say(msgstr, 0)
end

--开彩票
function wulin_start_lottery(no)
	local nowday = 		 wulin_getnowstate()
	local filename, lotterydate = wulin_getcurticketfile(nowday, no)
	wulin_loadfile(filename)
	local ticketcount = tonumber(wulin_getdata(filename, "TICKET", "Count"))
	local idx = wulin_day2buytabidx(lotterydate)
	if (idx == 0) then
		print("asdfsdf"..lotterydate)
		return
	end
	local no1count = TAB_TICKETBUY[idx][no + 1];
	local tab_lottery = {};
	local restticket = ticketcount
	
	local nbonuscount = 0;
	nbonuscount =  TAB_TICKETBUY[idx][no+1];
	
	if (restticket < nbonuscount) then
		nbonuscount = restticket
	end
	
	wulin_lottery_create(filename, 1, nbonuscount, ticketcount)
	restticket = restticket - nbonuscount
	wulin_setdata(filename, "TICKET", "IsBonusCreate", 1)
	wulin_save(filename)
end

function wulin_lottery_create(lotteryfile, lotteryno, count, maxticket)
	if (count == 0) then
		return
	end
	wulin_loadfile(lotteryfile)
	local m = 0
	for i = 1, count do 
		local bfind = 0
		while(bfind == 0) do
			m =  random(1, maxticket)
			local bonus = tonumber(wulin_getdata(lotteryfile, "TICKET", "Bonus"..m))
			if (bonus == 0) then
				wulin_setdata(lotteryfile, "TICKET", "Bonus"..m, lotteryno)
				wulin_save(lotteryfile)
				local Name = wulin_getdata(lotteryfile, "TICKET", "Ticket"..m)
				WriteLog(date("%m%d%H%M").."已有中奖结果:"..lotteryno..",中奖人:"..Name)
				if (lotteryno == 1) then
					local msgstr = " "..Name.." 获得"..TAB_LOTTERY_BONUS[1][1].."请到武林官员处领奖"
					AddGlobalNews(msgstr);
				end
				bfind = 1
			end
		end
	end
end

------------------------------------------------------------------------------------
-- 打开一个文件
function wulin_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
		IniFile_Load(filename, filename)
	end

end

--获得文件中的szSection的key的值
function wulin_getdata(filename, szsect, szkey)
	--if ( TAB_TEST[szsect])  then
		----print( TAB_TEST[szsect][szkey])
		--return TAB_TEST[szsect][szkey]
	--else
		--return nil
	--end
	return IniFile_GetData(filename, szsect, szkey)
end

--设置文件中的szSection的key值为szValue
function wulin_setdata(filename, szsect, szkey, szvalue)
	--if (TAB_TEST[szsect]) then
		--TAB_TEST[szsect][szkey] = szvalue
	--else
		--TAB_TEST[szsect] = {}
		--TAB_TEST[szsect][szkey] = szvalue
	--end
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function wulin_save(filename)
	IniFile_Save(filename, filename)
end

function wulin_clearticket()
		SetTask(TV_TICKET1, 0)
		SetTask(TV_TICKET2, 0)
		SetTask(TV_LASTTIME_BUY,0)
end

--TAB_TEST = {};
--for i = 1, 2000 do 
	--wulin_sure_buyticket(1)
--end
--wulin_start_lottery(1)

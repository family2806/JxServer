-- 内阁尚书：天子系统入口
-- By: wangbin(2009-5-24)

Include("\\script\\nationalwar\\head.lua")
Include( "\\script\\lib\\say.lua" )
Include("\\script\\item\\tianziyuxi.lua")
IncludeLib("ITEM")

function main()
	Say("内阁尚书候旨",
		7,
		"天子登基/nw_enthrone",
		"天子谕旨/ng?ch?nw_emperororder",
		"国王诏书/nw_kingorder",
		"领/nw_accept",
		"民心是杆秤/nw_comment",
		"铁笔直书（史记）/nw_history",
		"我只是来玩/Cancel")
end

-- 天子登基
function nw_enthrone()
	if (NW_IsEmperor() == 1) then
		Say("登基礼已举行了，难道陛下忘了吗?")
		return
	end
	local result = NW_GetTask(NW_TASKNO_WARRESULT)
	if (result == 0 and NW_GetEmperorName() == "") then
		Say("此位英雄志气过人，但是要等时机.")
	elseif (result == 1 or result == 2) then
		local master = ""
		local side = 0
		if (result == 1) then
			-- 宋赢
			_, master = GetCityOwner(CITYIDX_LINAN)
			side = 1
		else
			-- 金赢
			_, master = GetCityOwner(CITYIDX_BIANJING)
			side = 0
		end
		if (GetName() ~= master) then
			Say("当今天子不是凡人能当的")
		else
			NW_Enthrone(side)
			NW_SetTask(NW_TASKNO_WARRESULT, 100 + result)
		end
	else
		Say("当今天子英明，你还是接受事实吧.")
	end
end

-- 天子谕旨
function nw_emperororder()
	Say("天子谕旨",
		7,
		"设立国号/nw_emperororder_setnationtitle",
		"普天同庆/nw_emperororder_congratulate",
		"大赦天下/nw_emperororder_absolve",
		"天子战书/nw_emperororder_message",
		"捐钱/nw_emperororder_levy",
		"禁言/nw_emperororder_forbidtalkdlg",
		"我只来玩/Cancel")
end

-- 国王诏书
function nw_kingorder()
	Say("你为一国之首，拥有最高权力",
		3,
		"封大神/nw_kingorder_instate",
		"调整税率/nw_kingorder_taxdlg",
		"不做什么/Cancel")
end

-- 领取
function nw_accept()
	Say("壮士出战，杀敌立功",
		5,
		"领取国战令牌/nw_accept_token",
		"领取皇帝奖励/nw_accept_domainring",
		"领取天子奖励/nw_accept_empirering",
		"领取天子玉玺/nw_accept_empireseal",
		"我只是路过看看/Cancel")
end

-- 领取/国战令牌
function nw_accept_token()
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("难道这里不属于宋金区域?")
		return
	end
	tong, master = GetCityOwner(city)
	if (GetTong() ~= tong) then
		Say("看你不像本国民众，难道你是敌国间谍?")
		return
	end
	if (master ~= GetName() and NW_GetDuty() == NWPOSITION_NONE) then
		Say("无关人不能参加国家大事")
		return
	end
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("装备空位不足,整理好再来.")
		return
	end
	local count = 10
	if (free < count) then
		count = free
	end
	local token = TAB_TOKEN[city]
	for i = 1, count do
		local item = AddItem(token[1], token[2], token[3], 1, 0, 0)
		if (item ~= 0) then
			local timeout = GetLocalTime() + SECONDS_ONEDAY
			ITEM_SetExpiredTime2(item, timeout)
			SyncItem(item)
		end
	end
	Say(format("这是<color=red>%d<color> 国战令牌，如果需要的话 可以多领.", count))
end

-- 领取/领取帝皇奖励
function nw_accept_domainring()
		
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));	
	
	local nWiner = mod(NW_GetTask(NW_TASKNO_WARRESULT), 100);
	local city   = GetCityArea()

	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("难道这里不属于宋金区域?")
		return
	end
	
	if nWiner ~= 1 and nWiner ~= 2 then
		Say("还未定夺谁是天子")
		return
	end

	if nWiner == 1 and city ~= CITYIDX_BIANJING then
		Say("奖励送给有雄心壮志收复江山的人，请到我的城市领奖!")
		return
	end
	
	if nWiner == 2 and city ~= CITYIDX_LINAN then
		Say("奖励送给有雄心壮志收复江山的人，请到我的城市领奖!")
		return
	end
	
	tong, master = GetCityOwner(city)
	if (NW_IsEmperor() == 1) then
		Say("天子应该领取<color=red>天子奖励<color>.")
	elseif (GetTong() ~= tong) then
		Say("看你的打扮，一定是敌方间谍")
	elseif (master ~= GetName()) then
		Say("无关人等不能参加国家大事")
	elseif (NW_GetTask(NW_TASKNO_GETDOMAINRING) ~= 0) then
		Say("国主已领奖了.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("战事急报，请陛下迎战.")
	else
		local free = FindFreeRoomByWH(2, 3)
		if (free ~= 1) then
			Say("装备空位不足,整理好再来.")
			return
		end
		
		local item = AddItem(0,10,7,1,0,0)
		if (item == 0) then
			WriteLog(format("[NW]Failed to give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("有不妥之处, 宝物暂时不能交给你.")
		else
			
			if nWeek == 0 then	nWeek = 7;	end
			if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
			local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
			ITEM_SetExpiredTime(item, nExpiredDate, 120000)
			SyncItem(item)
			
			NW_SetTask(NW_TASKNO_GETDOMAINRING, 1)
			WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("奖励为<color=red>翻羽<color>, 请国主接纳.")
		end
		
		
	end
end

-- 领取/领取天子奖励
function nw_accept_empirering()
		
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("难道这里不属于宋金区域?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>天子的奖励<color> 只能天子能领取，谁敢冒名天子?")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("陛下已领奖了.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("战事急报，请陛下准备迎战.")
	else
		local free = FindFreeRoomByWH(2, 4)
		if (free ~= 1) then
			Say("装备空位不足,整理好再来.")
			return
		end
		
		if nWeek == 0 then	nWeek = 7;	end
		if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
		local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
		local itemHorse = AddItem(0,10,7,1,0,0)
		if (itemHorse == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("有不妥之处, 宝物暂时不能交给你.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
		ITEM_SetExpiredTime(itemHorse, nExpiredDate, 120000)
		SyncItem(itemHorse)
		
		-- 已经成功领取到部分物品
		NW_SetTask(NW_TASKNO_GETEMPIRERING, 1) 
		
		local itemBeijin = AddGoldItem(0,142)
		if (itemBeijin == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,142)] to %s", GetName()))
			Say("有不妥之处, 宝物暂时不能交给你.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,142)] to %s", GetName()))
		ITEM_SetExpiredTime(itemBeijin, nExpiredDate, 120000)
		SyncItem(itemBeijin)
		
		local itemYaDian = AddGoldItem(0,141)
		if (itemYaDian == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,141)] to %s", GetName()))
			Say("有不妥之处, 宝物暂时不能交给你.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,141)] to %s", GetName()))
		ITEM_SetExpiredTime(itemYaDian, nExpiredDate, 120000)
		SyncItem(itemYaDian)
		
		Say("陛下的奖励为<color=red>无名戒指，无名指环, 翻羽<color>.")
	end
end

-- 领取/领取天子玉玺
function nw_accept_empireseal()
	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("难道这里不属于宋金区域?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("只有天子才能领取天子玉玺，你真是大胆，敢冒名天子")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRESEAL) ~= 0) then
		Say("你获得<color=red>天子玉玺<color> 了.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("战事急报，请陛下准备迎战.")
	else
		local free = CalcFreeItemCellCount()
		if (free == 0) then
			Say("装备空位不足,整理好再来.")
			return
		end
		local itemidx = AddItem(6, 1, 2059, 1, 0, 0)
		if (itemidx == 0) then
			WriteLog(format("[NW]Failed to give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			Say("有不妥之处, 宝物暂时不能交给你.")
		else
			WriteLog(format("[NW]Give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			tbItemTianZiYuXi:GiveCallBack(itemidx)
			NW_SetTask(NW_TASKNO_GETEMPIRESEAL, 1)
			Say("这是天子玉玺， 请陛下领取.")
		end
	end
end

-- 民心是杆秤
function nw_comment()
	Say("虽然天子的权利高，但是也不能小看民心.",
		3,
		"评价当今天子/nw_comment_commit",
		"看评价结果/nw_comment_query",
		"没有什么事/Cancel")
end

-- 铁笔直书
function nw_history()
	Say("豪杰虽多，但是在历史留名中，从古至今有几人?",
		4,
		"天子历史/nw_history_emperor",
		"宋国史记/nw_history_song",
		"金国史记/nw_history_jin",
		"我只来想念一下./Cancel")
end

-- 天子谕旨/设立国号
function nw_emperororder_setnationtitle()
	if (NW_IsEmperor() ~= 1) then
		Say("国号只有当今天子才能设立.")
	else
--		local year, mon, day, hour, min, sec, wday = MakeDateTime(7)
--		if (wday == 0 or wday > 2) then

		if 	NW_GetTask(NW_TASKNO_NATIONALTITLE) ~= 0 then
			Say("启禀陛下，国号已传遍四方，不能再改了.")
		else
			nw_emperororder_inputtitle()
		end
	end
end

-- 天子谕旨/设立国号：弹出输入框
function nw_emperororder_inputtitle()
--	AskClientForString(
--		"nw_oninputnationtitle",
--		"",
--		1,
--		NW_MAXLEN_NATIONTITLE,
--		"请陛下输入国号：")

	Say(
		"亲陛下选择国号",
		5,
		format("%s/#nw_oninputnationtitle(\"%s\")", "金龙", "金龙"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "青龙", "青龙"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "白龙", "白龙"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "火龙", "火龙"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "黑龙", "黑龙")
		)
end

-- 天子谕旨/设立国号：回调函数
function nw_oninputnationtitle(title)
	if (NW_IsEmperor() ~= 1) then
		Say("你敢假冒当今天子?")
		return
	end
	local len = strlen(title)
	if (len == 0) then
		nw_emperororder_inputtitle()
	elseif (len > NW_MAXLEN_NATIONTITLE) then
		Say("启禀陛下，这个国号太长了，百姓记不住.",
			2,
			"请重新输入/nw_emperororder_inputtitle",
			"让我再想想/Cancel")
	elseif (NW_CheckText(title) ~= 1) then
		Say("该国号需要口口相传，威名天下，四海归附",
			2,
			"请重新输入/nw_emperororder_inputtitle",
			"让我再想想/Cancel")
	else
		local emperor = NW_GetEmperorName()
		AddGlobalCountNews(format("[改变指示]天子<color=red>%s<color> 该国号成 \"<color=red>%s<color>\".", emperor, title), 5)
		NW_SetNationTitle(title)
		NW_SetTask(NW_TASKNO_NATIONALTITLE, 1)
		Say("臣领旨")
	end
end

--天子谕旨/普天同庆
function nw_emperororder_congratulate()
	if (NW_IsEmperor() ~= 1) then
		Say("接待礼仪需要天子主持")
		return
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_CONGRATULATION) + SECONDS_ONEWEEK) then
		Say("陛下， 礼仪过多将很耗费且不合理?")
	else
		Say("现在是好时辰，陛下想举行礼仪?",
			2,
			"尊令!/nw_emperororder_congratulate_inputwords",
			"不 /Cancel")
	end
end

-- 天子谕旨/普天同庆：设定贺词
function nw_emperororder_congratulate_inputwords()
	AskClientForString(
		"nw_emperororder_congratulate_words",
		"",
		1,
		NW_MAXLEN_CONGRATULATIONWORDS,
		"请陛下写祝词:")
end

-- 天子谕旨/普天同庆：设定贺词
function nw_emperororder_congratulate_words(words)
	if (NW_IsEmperor() ~= 1) then
		Say("你敢假冒当今天子?")
		return
	end
	local len = strlen(words)
	if (len == 0) then
		Say("臣的耳朵不好，请陛下再说一次.")
	elseif (len > NW_MAXLEN_CONGRATULATIONWORDS) then
		Say("祝词太长，百姓很难记住")
	elseif (NW_CheckText(words) ~= 1) then
		Say("祝词有不合理的词，请陛下三思.")
	else
		-- 持续30分钟
		NW_OpenCongratulation(words, 30)
		NW_SetTask(NW_TASKNO_CONGRATULATION, GetCurServerTime())
		AddGlobalCountNews(format("[普天同庆] 将在世界频道转播\"<color=red>%s<color>\" 祝贺天子都将得到封赏!", words), 10)
		Say("臣领旨将立即去整理.")
	end
end

-- 天子谕旨/大赦天下
function nw_emperororder_absolve()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("大赦天下是天子的权利")
			return
		end
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_ABSOLVE) + SECONDS_ONEWEEK) then
		Say("陛下慈悲，天下皆知。但是，此类监狱不能太放松")
	else
		Say("臣领旨， 已赦免天下犯人")
		NW_SetTask(NW_TASKNO_ABSOLVE, time)
		AddGlobalCountNews("[大赦天下] 所有犯人一律免罪，都可以和牢头对话，申请回家", 3)
	end
end

-- 天子谕旨/募捐
function nw_emperororder_levy()
	if (NW_IsEmperor() ~= 1) then
		Say("这是天子权限")
		return		
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_LEVY) + SECONDS_ONEWEEK) then
		Say("陛下已捐钱一次了，再捐一次将会引起民众的哀怨")
	else
		NW_SetTask(NW_TASKNO_LEVY, time)
		NW_Levy(10000, 80)
		AddGlobalCountNews("[天子捐钱] 天子有旨，所有臣民捐钱，不得抗旨", 3)
	end
end

-- 天子谕旨/天子诏书
function nw_emperororder_message()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("天下诏书是天子的权利")
			return
		end
	end
	local currtime = GetCurServerTime()
	local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
	if (tasktime ~= 0 and currtime <= tasktime + SECONDS_ONEWEEK and
		NW_GetTask(NW_TASKNO_MESSAGECOUNT) >= NW_MAXCOUNT_MESSAGE) then
		Say("陛下发的诏书太多了，百姓都不想听.")
	else
		nw_emperororder_inputmessage()
	end
end

-- 天子谕旨/天子诏书：输入内容
function nw_emperororder_inputmessage()
	AskClientForString(
		"nw_emperororder_onmessage",
		"",
		NW_MINLEN_MESSAGE,
		NW_MAXLEN_MESSAGE,
		"陛下下诏书")
end

-- 天子谕旨/天子诏书：内容检查
function nw_emperororder_onmessage(msg)
	local len = strlen(msg)
	if (len < NW_MINLEN_MESSAGE or len > NW_MAXLEN_MESSAGE) then
		Say("诏书是天子的发言，太短或者太长都不能表达意思",
			2,
			"请重新输入/nw_emperororder_inputmessage",
			"让我想想/Cancel")
	elseif (NW_CheckText(msg) ~= 1) then
		Say("诏书有不妥的词, 请陛下三思.",
			2,
			"请重新输入/nw_emperororder_inputmessage",
			"让我想想/Cancel")
	else
		local currtime = GetCurServerTime()
		local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
		local count = 1
		if (tasktime == 0 or currtime > tasktime + SECONDS_ONEWEEK) then
			NW_SetTask(NW_TASKNO_MESSAGETIME, currtime)
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		else
			count = NW_GetTask(NW_TASKNO_MESSAGECOUNT) + 1
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		end
		AddGlobalCountNews(format("[天子诏书] <color=red>%s<color>", msg), 3)
		Say(format("臣记住了，本周陛下可以再发<color=red>%d<color> 次", NW_MAXCOUNT_MESSAGE - count))
	end
end

-- 天子谕旨/禁言
function nw_emperororder_forbidtalkdlg()
	if (NW_IsEmperor() ~= 1) then
		Say("你敢假冒当今天子?")
		return
	end
	local tasktime = NW_GetTask(NW_TASKNO_FORBIDCHATTIME)
	local currtime = GetCurServerTime()
	if (tasktime ~= 0 and currtime < tasktime + SECONDS_ONEDAY) then
		Say("陛下还在生气，请等万事平顺了先.")
	else
		Say("尽管陛下可以禁言，但是民心有论断。请陛下慎重行事",
			2,
			"我已决定了/nw_emperororder_forbidtalk",
			"让我想想/Cancel")
	end
end

-- 天子谕旨/禁言：弹出输入框
function nw_emperororder_forbidtalk()
	AskClientForString(
		"nw_emperororder_forbidtalk_input",
		"",
		1,
		32,
		"请输入需要禁言的名字:")
end

-- 天子谕旨/禁言：输入玩家名字
function nw_emperororder_forbidtalk_input(name)
	NW_ForbidChat(name, 30)
	local currtime = GetCurServerTime()
	NW_SetTask(NW_TASKNO_FORBIDCHATTIME, currtime)
	AddGlobalCountNews(format("[天下诏书]\"<color=red>%s<color>\"激怒天子，禁言半小时示威.", name), 3)
	Say(format("臣领旨：禁言 <color=red>%s<color> 半小时内", name))
end

-- 民心是杆秤/评议当今天子
function nw_comment_commit()
	Say("公道自在人心，天子虽然权利高，但是也不能欺骗百姓.",
		3,
		"赞扬天子/nw_comment_celebratedlg",
		"诉告天子/nw_comment_criticizedlg",
		"没有什么事/Cancel")
end

-- 民心是杆秤/查询评议结果
function nw_comment_query()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("目前还没有天子，百姓很希望有个明君统一天下")
		return
	end
	local goodness, badness = NW_GetRemark()
	local value = floor(goodness - badness)
	local title = ""
	if (value > 3000) then
		title = "圣君"
	elseif (value >= 1001) then
		title = "明君"
	elseif (value >= 101) then
		title = "有为"
	elseif (value >= -100) then
		title = "清净"
	elseif (value >= -1000) then
		title = "无为"
	elseif (value >= -3000) then
		title = "庸君"
	else
		title = "昏君"
	end
	Say(format("当今天子是<color=yellow>%s<color>,善恶是<color=yellow>%d<color>, 关于 <color=yellow>%s<color>.", emperor, value, title))
end

-- 民心是杆秤/评议当今天子/颂扬天子：给予界面
function nw_comment_celebratedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("目前还没有天子，百姓很希望有个明君统一天下")
		return
	end
	GiveItemUI(
		"赞扬天子",
		"当今天子英明，赏善令赞扬",
		"nw_comment_celebrate",
		"Cancel")
end

-- 民心是杆秤/评议当今天子/颂扬天子
function nw_comment_celebrate(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 197) then
			Say("只能用善令奖赞扬天子")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(total_count)
	nw_comment_query()
end

-- 民心是杆秤/评议当今天子/弹劾天子：给予界面
function nw_comment_criticizedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("目前还没有天子，百姓很希望有个明君统一天下")
		return
	end
	GiveItemUI(
		"诉告天子",
		"当今天子无德，罚恶领诉告",
		"nw_comment_criticize",
		"Cancel")
end

-- 民心是杆秤/评议当今天子/弹劾天子
function nw_comment_criticize(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 198) then
			Say("只能用罚恶令诉告天子")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(-total_count)
	nw_comment_query()
end

tbHistoryScoreTitle = 
{
    [1] = {nValue = -3000, strTitle = "昏君"},
    [2] = {nValue = -1001, strTitle = "庸君"},
    [3] = {nValue = -101, strTitle = "无为"},
    [4] = {nValue = 100, strTitle = "清净"},
    [5] = {nValue = 1000, strTitle = "有为"},
    [6] = {nValue = 3000, strTitle = "明君"},
    [7] = {nValue = 3000, strTitle = "圣君"},
}

tbHistoryCapital = 
{
    [0] = "汴京",
    [1] = "临安",
}

function history_page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"离开/Cancel",};
    local tbContent = {};
    local tbTianzi = {}
	
	for i = tb_pageinfo.from, tb_pageinfo.to do
	    local strGeneration;
	    tbTianzi.szEmperor, _, tbTianzi.szTitle, tbTianzi.szTong, tbTianzi.nBeginTime, tbTianzi.nSide, tbTianzi.nScore, tbTianzi.nEndTime = NW_EmperorHistory(tb_pageinfo.total - i + 1, str_parameter);
	    local strEmperor;
	    local strBeginTime;
	    local strEndTime;
	    local strTitle;
	    local strTong;
	    local strScore;
	    local strCapital;
	    
	    if (tbTianzi.nEndTime == 0) then
	        strGeneration = "当今圣上";
	    else
	        strGeneration = format("第<color=red>%d<color>代天子", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "无系"
	        strTitle = "无系"
	        strBeginTime = "<color=yellow>V?color>";
	        strEndTime = "<color=yellow>V?color>";
	        strTong = "无系"
	        strScore = "无系"
	        strCapital = "无系"
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> 年 <color=green>%02d<color> 月 <color=green>%02d<color> 日", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));
	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>V?color>";
	        else
	            strEndTime = format("<color=green>%d<color> 年 <color=green>%02d<color> 月 <color=green>%02d<color> 日", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
	        end
	        
	        strTong = tbTianzi.szTong;
	        for j = 1, getn(tbHistoryScoreTitle) do
                if ((strScore == nil or strScore == "") and tbTianzi.nScore <= tbHistoryScoreTitle[j].nValue) then
                    strScore = tbHistoryScoreTitle[j].strTitle;
                end
            end
            if (strScore == nil or strScore == "") then
                strScore = tbHistoryScoreTitle[getn(tbHistoryScoreTitle)].strTitle;
            end
            strCapital = tbHistoryCapital[tbTianzi.nSide];
	    end
	    tbContent[getn(tbContent) + 1] = 
        {
            format("%s: <color=yellow>%s<color>", strGeneration, strEmperor),
        }
        tbContent[getn(tbContent) + 1] = 
        {
			format("国号: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("登光: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("帮会: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("退位 %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("皇城: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("世人评价： <color=yellow>%s<color>", strScore),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            "--------------------------------------------",
        }
	end
   
    local var_width = {50}
    local var_align = 1
	
	strContent = maketable(tbContent, var_width, var_align);
	
    return strContent, tbOption;
end
-- 铁笔直书/天子史记
function nw_history_emperor()
	saypage(NW_EmperorHistoryCount(), 3, "history_page_gen", -1);
end

-- 铁笔直书/宋国史记
function nw_history_song()
	saypage(NW_EmperorHistoryCount(1), 3, "history_page_gen", 1);
end

-- 铁笔直书/金国史记
function nw_history_jin()
	saypage(NW_EmperorHistoryCount(0), 3, "history_page_gen", 0);
end

-- 国王诏书/分封大臣
function nw_kingorder_instate()
	Say("请在帮会界面补和免任大臣")
end

-- 国王诏书/调整税率对话
function nw_kingorder_taxdlg()
	city = GetCityArea()
	tong, master = GetCityOwner(city)
	if ((city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) or master ~= GetName()) then
		Say("设立京城税率是国主的特权")
		return
	end
	Say("陛下下设立税率吗?",
		2,
		"尊令!/nw_kingorder_tax",
		"不 /Cancel")
end

-- 国王诏书/调整税率对话
function nw_kingorder_tax()
	city = GetCityArea()
	OpenCityManageUI(city)
end

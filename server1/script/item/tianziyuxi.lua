-- 天子玉玺
-- ZhiDong
IL("LEAGUE")
IL("SETTING")
IncludeLib("ITEM")
IncludeLib("TASKSYS");
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\global\\login_head.lua")

-- 构造
if not tbItemTianZiYuXi then
	tbItemTianZiYuXi = tbBaseClass:new();
end

-- 初始化
function tbItemTianZiYuXi:init()
	self.ParamID_Blank_1			= 1    -- 空白标记位
	self.ParamID_Blank_2			= 2    -- 空白标记位
	self.ParamID_OverdueDate		= 3	   -- 记录玉玺的过期日期
	self.ParamID_UsingDate			= 4	   -- 记录上次使用玉玺的日期
	self.ParamID_TotalCount		 	= 5	   -- 记录总共还可以使用的次数
	self.ParamID_DayCount			= 6	   -- 记录当天还可以使用的次数
	self.nMaxUseTotalCount			= 12   -- 玉玺的最大使用总次数
	self.nMaxUseDayCount			= 2	   -- 玉玺的每天最大使用次数
	self.nMinMsgLen					= 4	   -- 玉玺的最小长度
	self.nMaxMsgLen					= 80   -- 玉玺的最大长度
	self.nDetailType				= 1    -- 物品类型
	self.nParticualType				= 2059 -- 物品类型
	self.TempTask_HasYuXi			= 252  -- 临时任务变量，记录是否拥有玉玺
	self.szDescLink					= "<link=image[0,0]:\\spr\\item\\tianziyuxi.spr><link>"
	self.szMsg						= self.szDescLink.."天子玉玺，国家宝物"
	self.tbForbidWord 				= {"<item=", "<link=", "<pic=", "<color=", "<bclr=", "<enter"}
end
tbItemTianZiYuXi:init();

-- 开发测试使用函数
function tbItemTianZiYuXi:DeBug(nItemIndex)
	
--	self:GiveCallBack(nItemIndex);
	 
	local nBlank_1		= GetItemParam(nItemIndex, self.ParamID_Blank_1);		-- 空白标记位
	local nBlank_2		= GetItemParam(nItemIndex, self.ParamID_Blank_2);		-- 空白标记位
	local nOverdueDate	= GetItemParam(nItemIndex, self.ParamID_OverdueDate);	-- 玉玺的过期日期
	local nUsingDate	= GetItemParam(nItemIndex, self.ParamID_UsingDate);		-- 上次使用玉玺的日期
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount);	-- 总共还可以使用的次数
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount);		-- 当天还可以使用的次数
	
	Msg2Player("^^^^^^^^^^^^^^^^^^^^^");
	Msg2Player("nItemIndex: "..nItemIndex);
	Msg2Player("nBlank_1: "..nBlank_1);
	Msg2Player("nBlank_2: "..nBlank_2);
	Msg2Player("nOverdueDate: "..nOverdueDate);
	Msg2Player("nUsingDate:	  "..nUsingDate);
	Msg2Player("nTotalCount:  "..nTotalCount);
	Msg2Player("nDayCount:    "..nDayCount);
	Msg2Player("^^^^^^^^^^^^^^^^^^^^^");
end

-- 使用玉玺
function tbItemTianZiYuXi:OnUse(nItemIndex)
	
	-- 调试函数
--	self:DeBug(nItemIndex);	
	
	local tbOpt 		= {}	
	local nDate 		= floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期
	local nHour 		= tonumber(GetLocalDate("%H"));							-- 当前小时
	local nOverdueDate	= GetItemParam(nItemIndex, self.ParamID_OverdueDate);	-- 玉玺的过期日期
	local nUsingDate	= GetItemParam(nItemIndex, self.ParamID_UsingDate);		-- 上次使用玉玺的日期
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount);	-- 总共还可以使用的次数
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount);		-- 当天还可以使用的次数
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		Say("不能使用玉玺.")
		return 1;
	end
	
	-- 玉玺过期
	if nDate > nOverdueDate or (nDate == nOverdueDate and nHour >= 21) then
		return 0;
	end
	
	-- 新的一天，更新使用限制
	if nDate ~= nUsingDate then
		nUsingDate = nDate;
		nDayCount  = self.nMaxUseDayCount;
		SetSpecItemParam(nItemIndex, self.ParamID_UsingDate, nUsingDate);
		SetSpecItemParam(nItemIndex, self.ParamID_DayCount,  nDayCount);
	end
	
	-- 总次数超过限制
	if nTotalCount <= 0 then
		tinsert(tbOpt, "玉玺已浑浊，怕是不能再发出幸运之光了/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return 1;
	end
	
	-- 当天次数超过限制
	if nDayCount <= 0 then
		tinsert(tbOpt, "玉玺已有光芒，但是，依然没有什么反应/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return 1;
	end
	
	-- 可以使用
	AskClientForString("SendMsg2AllServer", "", self.nMinMsgLen, self.nMaxMsgLen, "想怎样告示百姓?");
	return 1;
end

-- 发送消息
function tbItemTianZiYuXi:SendMsg2AllServer(szMsg)
	
	local tbOpt			= {}	
	local nItemIndex 	= FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	
	if (ST_CheckTextFilter(szMsg) ~= 1) then
		tinsert(tbOpt, "诏书有些词不妥，请天子提醒./OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return
	end
	
	for i = 1, getn(self.tbForbidWord) do
		local bp = strfind(szMsg, self.tbForbidWord[i])
		if (bp ~= nil) then
			tinsert(tbOpt, "诏书有些词不妥，请天子提醒./OnCancel")
			Describe(self.szMsg, getn(tbOpt), tbOpt);
			return
		end
	end
	
	if (nItemIndex <= 0) then
		tinsert(tbOpt, "拥有天子玉玺才能传达诏书/OnCancel")
		Describe(self.szMsg, getn(tbOpt), tbOpt);
		return
	end

	-- 减少使用次数
	local nTotalCount	= GetItemParam(nItemIndex, self.ParamID_TotalCount) - 1;	-- 总共还可以使用的次数
	local nDayCount		= GetItemParam(nItemIndex, self.ParamID_DayCount) - 1;		-- 当天还可以使用的次数
	SetSpecItemParam(nItemIndex, self.ParamID_TotalCount, nTotalCount);
	SetSpecItemParam(nItemIndex, self.ParamID_DayCount, nDayCount);
	Msg2Player(format("看来，今天还能使用 %d 次，总共还能使用%d 次", nDayCount, nTotalCount));
	
	-- 发布消息
	AddLocalNews(format("昭告天下: %s", szMsg));
	AddLocalNews(format("昭告天下: %s", szMsg));
	AddLocalNews(format("昭告天下: %s", szMsg));
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", format("昭告天下:%s", szMsg), "", "");
	tinsert(tbOpt, "玉玺突然发出一道豪光向外四射./OnCancel")
	Describe(self.szMsg, getn(tbOpt), tbOpt);
	return
end

-- 上线公告
function tbItemTianZiYuXi:LoginMsg()
	
	local nItemIndex = FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	if (nItemIndex <= 0) then
		return
	end
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- 标记为拥有玉玺
	local szMsg = format("江湖相传：%s带传国玉玺上网.", GetName());
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		return 
	end	
	
	AddLocalNews(szMsg);
end

-- 切换地图公告
function tbItemTianZiYuXi:ChangeMapMsg()
	
	-- 不是帮会宣战地图
	if IsTongWarMap(SubWorld) ~= 1 then
		return
	end

	-- 初步检查是否拥有玉玺
	if	GetTaskTemp(self.TempTask_HasYuXi) ~= 1 then
		return
	end
	
	-- 白名不公告
	if (GetCamp() == 0 or GetCurCamp == 0) then
		return 
	end	
	
	-- 实际检查是否拥有玉玺
	local nItemIndex = FindSpecItemParam2(self.nDetailType, self.nParticualType, 0, 0);
	if (nItemIndex <= 0) then
		SetTaskTemp(self.TempTask_HasYuXi, 0);	-- 标记为没有玉玺
		return
	end
	
	local szMsg = format("江湖相传: %s 带玉玺到 %s.", GetName(), SubWorldName(SubWorld));
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "");
	
end

-- 捡起玉玺
function tbItemTianZiYuXi:PickUp( nItemIndex, nPlayerIndex )
	
	local oldPlyIdx = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- 标记为拥有玉玺
	NW_OwnSeal(GetName());					-- 记录玉玺的拥有者
	
	
	local szMsg = format("江湖相传： %s 捡到传国玉玺", GetName());
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "");
	
	PlayerIndex = oldPlyIdx;
	return 1;
end

-- 发放玉玺时的回调函数，给玉玺设置相应的初始值
function tbItemTianZiYuXi:GiveCallBack(nItemIndex)
	
	SetTaskTemp(self.TempTask_HasYuXi, 1);	-- 标记为拥有玉玺
	NW_OwnSeal(GetName());					-- 记录玉玺的拥有者
	
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期
	local nWeek = tonumber(GetLocalDate("%w"));							-- 当前星期
	local nHour = tonumber(GetLocalDate("%H"));							-- 当前小时
	
	-- 星期天
	if nWeek == 0 then
		nWeek = 7;
	end
	
	-- 星期一 且为老的一场
	if nWeek == 1 and nHour < 21 then
		nWeek = 8;
	end
	
 	local nEndDate = floor(FormatTime2Number((8 - nWeek) * 24 * 60 *60 + GetCurServerTime())/10000);	-- 结束日期
	
	SetSpecItemParam(nItemIndex, self.ParamID_Blank_1, 0 );
	SetSpecItemParam(nItemIndex, self.ParamID_Blank_2, 0 );
	SetSpecItemParam(nItemIndex, self.ParamID_OverdueDate, nEndDate );
	SetSpecItemParam(nItemIndex, self.ParamID_UsingDate, nDate);
	SetSpecItemParam(nItemIndex, self.ParamID_TotalCount, self.nMaxUseTotalCount);
	SetSpecItemParam(nItemIndex, self.ParamID_DayCount, self.nMaxUseDayCount);
	
	local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
	ITEM_SetExpiredTime(nItemIndex, nExpiredDate, 120000);
	SyncItem(nItemIndex)
end




function OnCancel()	
	
end

function main(nItemIndex)
	return tbItemTianZiYuXi:OnUse(nItemIndex);
end

function IsPickable( nItemIndex, nPlayerIndex )
	
	local oldPlyIdx = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("背包空间不足，请整理背包后再拾取。")
		PlayerIndex = oldPlyIdx;
		return 0;
	end
	
	if (GetCamp() == 0 or GetCurCamp == 0) then
		Say("白名不能拾取玉玺。")
		PlayerIndex = oldPlyIdx;
		return 0;
	end
	
	PlayerIndex = oldPlyIdx;
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	return tbItemTianZiYuXi:PickUp( nItemIndex, nPlayerIndex );
end

function SendMsg2AllServer(szMsg)
	return tbItemTianZiYuXi:SendMsg2AllServer(szMsg);
end

function LoginMsg(bExchangeIn)
	
	-- 跨服过来的就不用再提示了
	if (bExchangeIn == 1) then
		return
	end
	
	tbItemTianZiYuXi:LoginMsg();
	return
end

function YuXiChangeMapMsg()
	return tbItemTianZiYuXi:ChangeMapMsg();
end


if login_add then login_add(LoginMsg, 2) end
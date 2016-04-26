-- 精炼石系统 wangbin 2010-4-7
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

MAXCOUNT_EVERYDAY				= 30						-- 每天修炼灵露的次数限制
MIN_LEVEL						= 90
TIMEOUT_REFINING				= 30					-- 炼制一个混元灵露需要的时间（分钟）
TOTALENERGY_LIMIT_PERMONTH		= 8000000					-- 每个月最多只能增加80000的精炼石
POTION_ENERGY					= 100					-- 使用混元灵露可获得的精炼石值
ITEM_YUGUAN						= {6, 1, 2311, 1, 0, 0}	-- 玉罐
ITEM_HUNYUANLINGLU 				= {6, 1, 2312, 1, 0, 0}	-- 混元灵露
TASK_HUNYUANLINGLU_STARTDATE	= 2673					-- 当日已修炼次数 * 1000000 + 混元灵露开始修炼日期（YYMMDD）
TASK_HUNYUANLINGLU_REFINING		= 2674					-- 混元灵露修炼完成数量 * 100000 + 是否正在修炼 * 10000 + 混元灵露累计修炼时间（分钟）
TASK_HUNYUANLINGLU_USEDATE		= 2675					-- 上一次使用混元灵露的日期（YYYYMMDD）
TASK_HUNYUANLINGLU_TOTALENERGY	= 2676					-- 当前使用混元灵露增加了多少精炼石
TASK_REFININGCOUNT				= 2793					-- 待修炼的混元灵露数目

HunyuanPotion = {}

function HunyuanPotion:New(player)
	local tb = clone(HunyuanPotion)
	tb.m_Player = player
	return tb
end

function HunyuanPotion:EncodeDateTask(count, date)
	local task = count * 1000000 + date
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_STARTDATE, task)
end

function HunyuanPotion:DecodeDateTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_STARTDATE)
	local count = floor(task / 1000000)
	local time = mod(task, 1000000)
	return count, time
end

function HunyuanPotion:EncodeRefiningTask(count, flag, time)
	local task = count * 100000 + flag * 10000 + time
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_REFINING, task)
end

function HunyuanPotion:DecodeRefiningTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_REFINING)
	local count = floor(task / 100000)
	local left = mod(task, 100000)
	local flag = floor(left / 10000)
	local time = mod(left, 10000)
	return count, flag, time
end

-- 查询是否正在修炼
function HunyuanPotion:GetRefiningFlag()
	local _, flag, _ = self:DecodeRefiningTask()
	return flag
end

-- 设置是否正在修炼
function HunyuanPotion:SetRefiningFlag(flag)
	local count, _, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count, flag, time)
end

-- 查询今日已修炼次数
function HunyuanPotion:GetCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		return 0
	else
		return count
	end
end

-- 清除今日已修炼次数
function HunyuanPotion:ClearCurrentDateRefineCount()
	local _, date = self:DecodeDateTask()
	self:EncodeDateTask(0, date)
end

-- 增加今日已修炼次数
function HunyuanPotion:AddCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		date = curr_date
		count = 1
	else
		count = count + 1
	end
	self:EncodeDateTask(count, date)
end

-- 获取开始修炼日期
function HunyuanPotion:GetRefineDate()
	local count, date = self:DecodeDateTask()
	return date
end

-- 设置开始修炼日期
function HunyuanPotion:SetRefineDate(date)
	local count, _ = self:DecodeDateTask()
	self:EncodeDateTask(count, date)
end

-- 获取已经修炼完成的灵露数量
function HunyuanPotion:GetFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	return count
end

-- 增加已经修炼完成的灵露数量
function HunyuanPotion:AddFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count + 1, flag, time)
end

-- 清除已经修炼完成的灵露数量
function HunyuanPotion:ClearFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(0, flag, time)
end

-- 减少已经修炼完成的灵露数量
function HunyuanPotion:ReduceFinishedCount(count)
	local count_now, flag, time = self:DecodeRefiningTask()
	if (count_now <= count) then
		count_now = 0
	else
		count_now = count_now - count
	end
	self:EncodeRefiningTask(count_now, flag, time)
end

-- 查询修炼时间（分钟）
function HunyuanPotion:GetRefiningTime()
	local _, _, time = self:DecodeRefiningTask()
	return time
end

-- 增加修炼时间（分钟）
function HunyuanPotion:AddRefiningTime(minutes)
	local count, flag, time = self:DecodeRefiningTask()
	time = time + minutes
	self:EncodeRefiningTask(count, flag, time)
	local msg = format("大侠的混元灵露已炼得 %d 分钟了.", time)
	self.m_Player:Msg2Player(msg)
end

-- 清除修炼时间（分钟）
function HunyuanPotion:ClearRefiningTime()
	local count, flag, time = self:DecodeRefiningTask()
	if (time > 0) then
		self:EncodeRefiningTask(count, flag, 0)
	end
end

-- 消耗玉罐
function HunyuanPotion:ConsumeYuguan(count)
	if (count <= 0 or
		self.m_Player:CalcEquiproomItemCount(
			ITEM_YUGUAN[1],
			ITEM_YUGUAN[2],
			ITEM_YUGUAN[3],
			ITEM_YUGUAN[4]) < count) then
		return 0
	end
	local result = self.m_Player:ConsumeEquiproomItem(
		count,
		ITEM_YUGUAN[1],
		ITEM_YUGUAN[2],
		ITEM_YUGUAN[3],
		ITEM_YUGUAN[4])
	if (result == 1) then
		return 1
	else
		return 0
	end
end

-- 使用混元灵露
-- 增加精炼石的参数	by wangjingjun
function HunyuanPotion:Use(nEnergy)
	-- 若nEnergy为空，则用默认的混元灵露的值，否则为新增加的值
	nEnergy = nEnergy or POTION_ENERGY	 
	local player = self.m_Player
	local old_energy = player:GetEnergy()
	local nToday = GetLocalDate("%Y%m%d")
	local nLastDate = player:GetTask(TASK_HUNYUANLINGLU_USEDATE)
	local nCurAddEnergy = player:GetTask(TASK_HUNYUANLINGLU_TOTALENERGY)
	local nCurMonth = floor(nToday/100)
	local nLastMonth = floor(nLastDate/100)
	
	if (nCurMonth ~= nLastMonth) then
		nLastDate = nToday;
		nCurAddEnergy = 0;
	end
	
	if (old_energy + nEnergy > 2000000000) then
		player:Say("精炼石商店达到最高点，不能继续使用混元灵露了")
		return 0
	elseif (nCurAddEnergy + nEnergy > TOTALENERGY_LIMIT_PERMONTH) then
		player:Say(format("每人每个月最多只能%d 精炼石", TOTALENERGY_LIMIT_PERMONTH))
		return 0
	elseif (self.m_Player:AddEnergy(nEnergy) ~= 1) then
		player:Say("增加精炼石点失败.")
		return 0
	else
		nCurAddEnergy = nCurAddEnergy + nEnergy
		player:SetTask(TASK_HUNYUANLINGLU_USEDATE, nLastDate)
		player:SetTask(TASK_HUNYUANLINGLU_TOTALENERGY, nCurAddEnergy)
		
		local account = player:GetAccount()
		local name = player:GetName()
		local new_energy = player:GetEnergy()
		WriteLog(format("%s(%s) use hunyuanlinglu to add enery(%d=>%d) cur month energy (%d)",
			player:GetAccount(),
			player:GetName(),
			old_energy,
			self.m_Player:GetEnergy(),
			nCurAddEnergy))
		player:Msg2Player(format("增加 %d 精炼石点，该月已获得%d 精炼石.", nEnergy, nCurAddEnergy))
		return 1
	end
end

JingliList = {m_List = {}}

function JingliList:Add(index, item)
	self.m_List[index] = item
end

function JingliList:Del(index)
	self.m_List[index] = nil
end

function JingliList:GetCount()
	local count = 0
	for key, value in self.m_List do
		if (value) then
			count = count + 1
		end
	end
	return count
end

function JingliList:Find(index)
	return self.m_List[index]
end

function JingliList:OnTime(player, id)
	local jingli = self:Find(player)
	if (not jingli) then
		return 0
	else
		local result = jingli:OnTime()
		if (result == 0) then
			jingli:Destroy()
			return 0
		else
			return result, player
		end
	end
end

Jingli = {}

function Jingli:New(player, potion)
	local tb = clone(Jingli)
	tb.m_Timeout = 18 * 60
	tb.m_Player = player
	if (not potion) then
		tb.m_Potion = HunyuanPotion:New(player)
		tb.m_Potion:AddCurrentDateRefineCount(nil)
	else
		tb.m_Potion = potion
	end
	tb.m_TimerId = AddTimer(18 * 60, "JingliList:OnTime", player.m_PlayerIndex)
	JingliList:Add(player.m_PlayerIndex, tb)
	tb.m_Potion:SetRefiningFlag(1)
	tb.m_OwnerName = player:GetName()
	
	player:Msg2Player("开始修炼混元灵露")
	WriteLog(format("%s(%s) begin hunyunlnglu refining",
		player:GetAccount(),
		player:GetName()))
	return tb
end

function Jingli:Destroy()
	if (self.m_TimerId > 0) then
		DelTimer(self.m_TimerId)
		self.m_TimerId = 0
		JingliList:Del(self.m_Player.m_PlayerIndex)
		self.m_Player = nil
		self.m_OwnerName = ""
	end
end

function Jingli:GetTime()
	return self.m_Potion:GetRefiningTime()
end

function Jingli:ClearRefining()
	self.m_Potion:ClearRefiningTime()
	self.m_Potion:SetRefiningFlag(0)
end

function Jingli:OnTime()
	local player = self.m_Player
	local potion = self.m_Potion
	local name = player:GetName()
	if (self.m_OwnerName ~= name) then
		WriteLog(format("[ERROR JINGLI]owner chanage: %s => %s", self.m_OwnerName, name))
		return 0
	end
	potion:AddRefiningTime(1)
	if (potion:GetRefiningTime() < TIMEOUT_REFINING) then
		return self.m_Timeout
	end
	self:Success()
	potion:ClearRefiningTime()
	local count = player:GetTask(TASK_REFININGCOUNT)
	if (count > 0) then
		-- 继续炼制下一个混元灵露
		player:SetTask(TASK_REFININGCOUNT, count - 1)
		potion:AddCurrentDateRefineCount(nil)
		return self.m_Timeout
	else
		-- 结束炼制
		potion:SetRefiningFlag(0)
		player:SetTask(TASK_REFININGCOUNT, 0)
		return 0
	end
end

function Jingli:Success()
	local account = self.m_Player:GetAccount()
	local name = self.m_Player:GetName()
	local item = self.m_Player:AddItemIntoEquipmentBox(
		ITEM_HUNYUANLINGLU[1],
		ITEM_HUNYUANLINGLU[2],
		ITEM_HUNYUANLINGLU[3],
		ITEM_HUNYUANLINGLU[4],
		ITEM_HUNYUANLINGLU[5],
		ITEM_HUNYUANLINGLU[6])
	if (item > 0) then
		WriteLog(format("%s(%s) refine hunyuanlinglu ok", account, name))
		self.m_Player:Msg2Player("大侠已制造成功1个混元灵露")

		Jiluhunyuan(1)
	else
		self.m_Potion:AddFinishedCount()
		WriteLog(format("%s(%s) add stored hunyuanlinglu(%d)",
			account,
			name,
			self.m_Potion:GetFinishedCount()))
		self.m_Player:Msg2Player("大侠已制造成功一个混元灵露，请到<color=red>花隐士岛<color> 或者 <color=red>七大城市<color> 领取.")
	end
end

-- NPC对话入口
function dlg_entrance(playerindex)
	local player = PlayerList:GetPlayer(playerindex)
	-- player:Say("此功能暂未开放。")
	JingliDlg:Main(player)
end

-- 炼制混元灵露
function dlg_refine()
	local player = PlayerList:GetPlayer(PlayerIndex)
	return JingliDlg:Refine(player)
end

-- 领取混元灵露
function dlg_get()
	local player = PlayerList:GetPlayer(PlayerIndex)
	JingliDlg:Draw(player)
end

-- 设置修炼数量
function dlg_inputcount()
	local player = PlayerList:GetPlayer(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	local count = JingliDlg:Check(player, potion, 0)
	if (count > 0) then
		player:AskClientForNumber(
			"callback_inputcount",
			1,
			count,
			"你想制造多少个?")
	end
end

function callback_inputcount(count)
	if (count > 0) then
		local player = PlayerList:GetPlayer(PlayerIndex)
		local potion = HunyuanPotion:New(player)
		JingliDlg:Refine(player, potion, count)
	end
end

JingliDlg = {}

function JingliDlg:Check(player, potion, count_input)
	if (player:GetLevel() < MIN_LEVEL) then
		local fmt = "制造混元灵露需要达到一定武功水平，大侠%s要练到<color=red>%d<color>级才能到这哦"
		local msg = nil
		if (player:GetSex() == 1) then
			msg = format(fmt, "女侠", MIN_LEVEL)
		else
			msg = format(fmt, "少侠", MIN_LEVEL)
		end
		player:Say(msg)
		return 0
	elseif (player:IsCharged() == 0) then
		player:Say("只有已充值人物才能炼制混元灵露")
		return 0
	elseif (potion:GetFinishedCount() > 0) then
		player:Say("请领取已炼制好的混元灵露.")
		return 0
	end
	local count_day = potion:GetCurrentDateRefineCount(nil)	-- 当天已修炼的次数
	local count_cur = player:GetTask(TASK_REFININGCOUNT)	-- 连续修炼的次数
	if (count_day >= MAXCOUNT_EVERYDAY) then
		player:Say(
			format("今天阁下已炼制过<color=red>%d<color> 次了，请明天再来吧.",
			MAXCOUNT_EVERYDAY))
		return 0
	end
	local count_ok = MAXCOUNT_EVERYDAY - count_day - count_cur
	if (count_ok <= 0) then
		player:Say("修炼次数已够，请明天再来炼制混元灵露吧?")
		return 0
	elseif (count_ok < count_input) then
		player:Say(format("今天最多只能再多炼%d混元灵露了，请输入需要炼制的数量.", count_ok))
		return 0
	else
		return count_ok
	end
end

function JingliDlg:Main(player)
	player:Say(
		"世间万物都有天地灵气，如果你有玉罐就可以进行领取收集，收集到30分钟后，领取可以制成混元灵露。使用灵露后，可以增加内力!? ",
		3,
		"开始炼混元灵露/dlg_inputcount",
		"领取已发的混元灵露./dlg_get",
		"结束对话/Cancel")
end

function JingliDlg:Refine(player, potion, count)
	if (count <= 0 or self:Check(player, potion, count) == 0) then
		return 0
	elseif (potion:ConsumeYuguan(count) ~= 1) then
		player:Say(format(
			"滴水难成河，你还没有<color=red>%d<color> 玉罐，老夫也束手无策<enter><color=yellow><玉罐也在奇珍阁出售，请点击屏幕右下角圆空格><color>",
			count))
		return 0
	end
	if (potion:GetRefiningFlag() == 0) then	
		Jingli:New(player)
		player:AddTask(TASK_REFININGCOUNT, count - 1)
	else
		player:AddTask(TASK_REFININGCOUNT, count)
	end
	WriteLog(format("%s(%s) start hunyuanlinglu refining, count(%d)",
		player:GetAccount(),
		player:GetName(),
		count))
	player:Say(format("这里的玉罐贴有符咒，你快点去收集，然后<color=red>%d 分钟<color>可以完成!", TIMEOUT_REFINING))
	return 1
end

function JingliDlg:Draw(player)
	local potion = HunyuanPotion:New(player)
	local count = potion:GetFinishedCount()
	if (count <= 0) then
		player:Say("你还没有给我混元灵露")
		return
	end
	local item_count = 0
	for i = 1, count do
		local idx = player:AddItemIntoEquipmentBox(
						ITEM_HUNYUANLINGLU[1],
						ITEM_HUNYUANLINGLU[2],
						ITEM_HUNYUANLINGLU[3],
						ITEM_HUNYUANLINGLU[4],
						ITEM_HUNYUANLINGLU[5],
						ITEM_HUNYUANLINGLU[6])
		if (idx <= 0) then
			break
		else
			item_count = item_count + 1
		end
	end
	if (item_count == 0) then
		player:Say("请安排好装备.")
		return
	end
	potion:ReduceFinishedCount(item_count)
	WriteLog(format("%s(%s) receive stored hunyuanlinglu, count(%d)",
		player:GetAccount(),
		player:GetName(),
		item_count))
	Jiluhunyuan(item_count)
	if (item_count < count) then
		player:Say(format("者是混元灵露<color=red>%d<color> 你给我的，快准备装备领取<color=red>%d<color> 混元灵露",
			item_count,
			count - item_count))
	else
		player:Say(format("这是<color=red>%d<color>你给我的混元灵露，请领取.", item_count))
	end
end

-- 进入或者离开游戏世界
function WorldEntranceLogin(nPlayerIndex, bExchangeIn)
	WorldEntrance(nPlayerIndex, 1)
end

function WorldEntranceLogout(nPlayerIndex)
	WorldEntrance(nPlayerIndex, 0)
end

function WorldEntrance(playerindex, in)
	if (in == 1) then
		local player = PlayerList:GetPlayer(playerindex)
		local potion = HunyuanPotion:New(player)
		Enter(player, potion)
	else
		local obj = JingliList:Find(playerindex)
		if (obj) then
			obj:Destroy()
		end
	end
end

function Enter(player, potion)
	if (potion:GetRefiningFlag() == 1) then
		Jingli:New(player, potion)
	end
end


function Jiluhunyuan(nCount)
	if nCount <= 0 then
		return
	end
	AddStatData("linluchanchu_lianzhilinlu", nCount)	--数据埋点第一期
end

--========文件定义==================================--
--文件名：convertgift.lua
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-2-1
--功能叙述：
--	春节活动，用鸡年神秘礼物换取礼物。本活动分两步，
--第一步，可以把数量的鸡年神秘礼物升级。第二步，用鸡
--年神秘礼物换取奖品。
--
--游戏脚本·剑侠情缘网络版
--金山软件股份有限公司，copyright 1992-2005
--==================================================--

--========类定义====================================--
--类名：Convert
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	负责计算鸡年神秘礼物升级关系的价值量和用鸡年神秘
--礼物兑换奖品的价值量。以及选择奖品。
--
--成员变量：
--	__gifttabfile：神秘礼物价值量tabfile
--	__bonustabfile：奖品的tabfile
--	__giftWorth：神秘礼物升级的价值量表
--	__bonusWorth：奖品的价值量表
--成员函数：
--	:loadSettings()：载入价值量设定文件。
--	:giftLevelup(worth)：神秘礼物升级
--	:convert(worth)：用worth换取奖品
--
--用例：
--
--
--
--==================================================--

if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not MEM_HEAD then
	Include ("\\script\\lib\\mem.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
end

if not WORTHANALYSE_HEAD then
	Include ("\\script\\class\\worthanalyse.lua")
end

Convert = {
--========函数定义==================================--
--函数原形：:loadSettings()
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	载入配置文件并进行价值量的计算。该函数首先载入
--settings/event/chinesenewyear/giftlvlup.txt和
--settings/event/chinesenewyear/bounslist.txt文件，
--然后根据这两份文件分别计算神秘礼物升级的价值量表和
--神秘礼物兑换奖品的价值量表。
--参数：
--	无
--返回值：
--	无
--用例：
--
--
--
--==================================================--
	loadSettings = function(self)
		self.__gifttabfile = new(KTabFile,"/settings/event/chinesenewyear/giftslvlup.txt","GIFT")
		self.__bonustabfile = new(KTabFile,"/settings/event/chinesenewyear/bonuslist.txt","BONUS")
		self.__crystaltabfile = new(KTabFile,"/settings/event/chinesenewyear/crystal.txt","CRYSTAL")
		self.__giftWorth = new(WorthAnalyse,80)
		self.__bonusWorth = new(WorthAnalyse,60)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		for i=1,self.__bonustabfile:getRow() do
			self.__bonusWorth:addWorth(i,tonumber(self.__bonustabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
		self.__bonusWorth:makeBaseP()
		return
	end,
	
--========函数定义==================================--
--函数原形：:giftLevelup(worth)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	由价值量worth选出将要升级得到的神秘礼物的索引号。
--参数：
--	worth：价值量，这里是从玩家提交的神秘礼物算出来的
--价值量总和。
--返回值：
--	成功则返回将要升级得到的神秘礼物索引，否则为nil
--用例：
--
--
--
--==================================================--
	giftLevelup =function(self,worth)
		self.__giftWorth:makeWorthP(worth)
		return self.__giftWorth:getFromWorth()
	end,
	
--========函数定义==================================--
--函数原形：:convert(worth)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	由价值量worth计算出玩家将要的到的奖励编号。
--参数：
--	worth：神秘礼物的价值量之和。
--返回值：
--	如果成功，则返回所得到奖励的索引，否则为nil
--用例：
--
--==================================================--
	convert = function(self,worth)
		self.__bonusWorth:makeWorthP(worth)
		return self.__bonusWorth:getFromWorth()
	end,
	 
}

TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --大于5000万，涉嫌刷水晶
GOLD_LASTDATE = tonumber(date("%d"))  --上一次发高价值量奖品的日子，只记录日期
GOLD_WORTH = 0  --已发奖品的价值量,除以100000保存
MAXWORTHPERDAY = 100000 --5件价值最高的黄金装备
GOLD_PRICE_LIMIT = 10000000	--高于10000000的奖励算宝物。

MAXGIVENUM = 20  --可以给礼物的最大上限
TF_GIFT_WORTH = 3  --giftlvl.txt中worth项的列数
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8

TF_BONUS_TYPE = 2
TF_BONUS_TYPENAME = 3
TF_BONUS_NAME = 4
TF_BONUS_WORTH = 5
TF_BONUS_P1 = 6
TF_BONUS_P2 = 7
TF_BONUS_P3 = 8
TF_BONUS_P4 = 9
TF_BONUS_MESSAGE = 18
TF_BONUS_ANNOUNCE = 19

TF_CRYSTAL_WORTH = 2

--eg.
Convert:loadSettings()
--randomseed(date("%S"))
--for i=1,20 do
--	r = random(20000,150000000)
--	local idx = Convert:convert(r)
--	if(idx) then
--		print(r..":"..idx.."["..Convert.__bonustabfile:getCell("Worth",idx).."]="..r..Convert.__bonustabfile:getCell("Worth",idx).."->"..Convert.__bonusWorth.__worthP[idx])
--	end
--end

--========函数定义==================================--
--函数原形：ComputeWorth(nCount)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	根据给与界面的物品，计算出其价值量。
--参数：
--	nCount：给与界面中物件的总数
--返回值：
--	成功则返回价值量，否则返回nil
--用例：
--	无
--==================================================--
function ComputeWorth(nCount)
	local worth = 0	--礼物价值量
	local crystal = 0	--水晶价值量
	local maxCount = 0	--礼物的总数
	
	if(nCount == 0) then
		Talk(1,"","<#> 礼官窃喜: 给我带了什么东西?'","你挠挠头: '死了! 我忘记了! '")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --错误道具
			Talk(2,"","<#>礼官皱眉: 给我带了什么怪东西?' ","<#> 你又挠挠头: '哇! 请再带给我!' ")
			return nil
		end
		if(d > 467 and d < 487) then -- 水晶
			crystal = crystal + GetItemStackCount(itemIdx)*Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467))
		else --神秘礼物
			function checkGiftCount(idx,count)  --检测神秘道具的数量
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- 数量太多
					Talk(2,"","<#> 礼官挠头: 不好意思! 我年纪大眼花了!' ","<#> 你一腿踢中礼官的屁股")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				maxCount = maxCount + num
				local lvl = d - 508
				if(lvl ==0) then
					worth = worth + num * 100000
				else
					worth = worth + num * Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl)
				end
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --价值量大于5000w，涉嫌刷水晶
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1,"","<#> 不好意思! 至少要有一份鸡年礼物!")
		return nil
	end
	return worth + crystal
end

--========函数定义==================================--
--函数原形：GiftLevelUp(nCount)
--作者：yfeng
--创建日期：2005-1-26
--最后修改日期：2005-1-26
--功能叙述：
--	玩家选择升级神秘物品之后，弹出给与界面，此函数为
--该给与界面点击确定按钮之后的回调函数。
--参数：
--	给与界面中道具物品的总数，该数量不计算叠加的数量。
--返回值：
--	无
--用例：
--	无
--==================================================--
function GiftLevelUp(nCount)
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的特殊神秘礼物
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if(worth < 0) then
		--涉嫌刷水晶，扣掉所有物品，并记录日志
		WriteLog(date("%H%M%S")..": 账户"..GetAccount()..", 人物"..GetName()..
					"在合成鸡年礼物的时候, 发现使用水晶超过5000万的. 建议立即封锁Account")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": 账户"..GetAccount()..", 人物"..GetName()..
					"已使用"..GetTask(TID_CLONECRYSTAL).."次, 涉嫌刷水晶. 请GM注意!")
		end
		--说句神么话呢？迷惑一下
		Say("<#> 李官失望地说: '额! 失败了! 要不要再试一次?' ",2,"好的! 我想再试一下!/GiveUIForGift","算了! 不要再骗我了!/onCancel")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --失败，没有选出任何东西
		Talk(1,"","<#> 礼官摇摇头: 怎么能再失败呢?")
		return
	end
	if(idx == 1) then
		Say("<#> 礼官失望地说: '额! 失败了! 你还要再试吗?' ",2,"好的! 我想再试一下!/GiveUIForGift","算了! 别再骗我了!/onCancel")
		return
	end
	AddItem(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P2,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P3,idx),
					Convert.__gifttabfile:getCell(TF_GIFT_P4,idx),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S")..": 账户"..GetAccount()..", 人物"..GetName()..
					", 使用"..worth.."神秘礼物的数量够了, 合成"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."神秘礼物的价值量, 系统可接受 "..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."价值还有剩余.")
	Say("<#> 合成一个有神秘潜质的鸡年礼物:"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."你还满意吗?",
			2,
			"不满意！我想再来一次/GiveUIForGift","马马虎虎! 我走了!/onCancel")
	return
end

--========函数定义==================================--
--函数原形：ConvertBonus(nCount)
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	用鸡年神秘礼物兑换奖品。此函数被给与界面的确定按钮
--回调。
--参数：
--	nCount：给与界面中的物品总数
--返回值：
--	无
--用例：
--	无
--==================================================--
function ConvertBonus(nCount)
	if(GOLD_LASTDATE ~= date("%d")) then --新的一天开始了
		GOLD_LASTDATE = date("%d")
		GOLD_WORTH = 0
	end
	local worth = ComputeWorth(nCount)
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的奖励
	if(worth < 0) then
		--涉嫌刷水晶，扣掉所有物品，并记录日志
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit(i))
		end
		WriteLog(date("%H%M%S")..": 账户"..GetAccount()..", 人物"..GetName()..
					"在领取新春礼物时候, 发现有使用水晶超过500万的. 建议立即封锁Account")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S")..": 账户"..GetAccount()..", 人物"..GetName()..
					"已使用"..GetTask(TID_CLONECRYSTAL).."次, 涉嫌刷水晶. 请GM注意!")
		end
		--说句神么话呢？迷惑一下
		Talk(1,"","<#> 恭喜你独中, 但什么都得不到")
		return
	end
	local idx = Convert:convert(worth)
	if(not idx) then --失败，没有选出任何东西
		Talk(1,"","<#> 礼官摇摇头: 怎么能又失败呢?")
		return
	end
		
	local bonusWorth = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx))
	if(bonusWorth > GOLD_PRICE_LIMIT) then  --开始关注
		if((bonusWorth/100000 + GOLD_WORTH) > MAXWORTHPERDAY) then --如此贵重的物品不能发，达到每天发高级奖励的上限
			Talk(1,"","<#> 今天的礼物已经发完了! 明天再来吧!")
			return
		else
			GOLD_WORTH = GOLD_WORTH + bonusWorth/100000
		end
	end
	for i=1,nCount do  --扣除所有道具
		RemoveItemByIndex(GetGiveItemUnit(i))
	end
	WriteLog(date("%H%M%S")..": 账户"..GetAccount()..", 人物"..GetName()..
					", 使用"..worth.."神秘礼物够了, 可以兑换"..
					Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx).."新春礼物数目, 系统已经接受了"..
					tostring(worth-Convert.__bonustabfile:getCell(TF_BONUS_WORTH,idx)).."价值还有剩余.")
	return PayBonus(idx)
end

--========函数定义==================================--
--函数原形：PayBonus(bonusIdx)
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	给玩家发放settings/event/chinesenewyear/bonuslist.txt
--中第bonusIdx项的奖品
--参数：
--	bonusIdx：奖品项编号，在tabfile中的行数-1
--返回值：
--	无
--用例：
--	无
--==================================================--
function PayBonus(bonusIdx)
	local _type = tonumber(Convert.__bonustabfile:getCell(TF_BONUS_TYPE,bonusIdx))
	if(not _type) then return end --error.
	local msg = Convert.__bonustabfile:getCell(TF_BONUS_MESSAGE,bonusIdx)
	msg = replace(msg,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
	Msg2Player(msg)
	if(_type == 1) then --黄金装备
		AddGoldItem(0,Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	elseif(_type == 2) then --普通道具
		AddItem(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
						Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx),0,0,0,0,0,0,0,0)
	elseif(_type == 3) then --临时状态
		AddSkillState(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P2,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P3,bonusIdx),
									Convert.__bonustabfile:getCell(TF_BONUS_P4,bonusIdx))
	elseif(_type == 4) then --经验值
		AddOwnExp(Convert.__bonustabfile:getCell(TF_BONUS_P1,bonusIdx))
	else --莫名其妙
		print("pay bonus error.")
	end
	WriteLog(date("%H%M%S")..": 账户"..GetAccount()..", 人物"..GetName()..
			"可以兑换"..Convert.__bonustabfile:getCell(TF_BONUS_TYPENAME,bonusIdx).."--"..
			Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx)..", 价值是:"..
			Convert.__bonustabfile:getCell(TF_BONUS_WORTH,bonusIdx))
	local announce = Convert.__bonustabfile:getCell(TF_BONUS_ANNOUNCE,bonusIdx)
	if(strlen(announce)>0) then
		announce = replace(announce,"<name>",Convert.__bonustabfile:getCell(TF_BONUS_NAME,bonusIdx))
		announce = replace(announce,"<player>",GetName())
		AddGlobalNews(announce)
	end
	return
end

--========函数定义==================================--
--函数原形：GiveUIForGift()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	打开给与界面，用于合成鸡年神秘礼物。被礼官的对话
--调用。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function GiveUIForGift()
	GiveItemUI("合成鸡年礼物","给我20份鸡年礼物和1个冰晶, 我将帮你升级礼物!", "GiftLevelUp", "onCancel" );
end

--========函数定义==================================--
--函数原形：GiveUIForBonus()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	打开给与界面，用于兑换新春奖励。被礼官的对话调用。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function GiveUIForBonus()
	GiveItemUI("交换新春礼物","给我20份鸡年礼物和1个冰晶兑换新春奖励.", "ConvertBonus", "onCancel" );
end

--========函数定义==================================--
--函数原形：EventHappyNewYear()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	新春活动的礼官对话子界面。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function EventHappyNewYear()
	local buttons = {
		"我想接受新春礼物/GiveUIForBonus",
		"我想升级鸡年礼物/GiveUIForGift",
		"了解此次活动/AboutNewYearEvent",
		"全都是哄小孩的. 我不关心!/onCancel"
	}
	local talk = "<#> 欢迎参加活动<color=red>新春奖励<color>.活动期间, 你将随机打怪 <color=yellow>鸡年礼物<color>. 数量够了 <color=yellow>鸡年礼物<color>, 可以带去兑换新春奖励"
	Say(talk,getn(buttons),buttons)
	return
end

--========函数定义==================================--
--函数原形：AboutNewYearEvent()
--作者：yfeng
--创建日期：2005-1-27
--最后修改日期：2005-1-27
--功能叙述：
--	点击了解本次活动之后，出现的对话内容。
--参数：
--	无
--返回值：
--	无
--用例：
--	无
--==================================================--
function AboutNewYearEvent()
	Talk(2,"",
		"<#> 欢迎参加新春奖励活动. 活动期间, 你可以随机打怪得到鸡年礼物, 当数量够了, 可以带到<color=red>扬州- 礼官<color>兑换奖励!","<#> 这次奖励很丰富, 包括: 黄金装备, 技能书, 宝物, 面具, 能力, 经验值. 只需积累够一定数量的鸡年礼物就可以找我兑换礼物. 找到鸡年礼物的神秘物质则奖励的价值更高")
	return
end

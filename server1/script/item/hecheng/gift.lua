
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
		self.__gifttabfile = new(KTabFile,"/settings/event/juanzhouhecheng/giftslvlup.txt","GIFT")
		self.__crystaltabfile = new(KTabFile,"/settings/event/juanzhouhecheng/crystal.txt","CRYSTAL")		
		self.__giftWorth = new(WorthAnalyse,80)
		for i=1,self.__gifttabfile:getRow() do
			self.__giftWorth:addWorth(i,tonumber(self.__gifttabfile:getCell("Worth",i)))
		end
		self.__giftWorth:makeBaseP()
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
}



TID_CLONECRYSTAL = 503
MAX_CRYSTAL_WORTH = 50000000 --大于5000万，涉嫌刷水晶

MAXGIVENUM = 20  --可以给礼物的最大上限
TF_GIFT_WORTH = 3  --giftlvl.txt中worth项的列数
TF_GIFT_P1 = 4
TF_GIFT_P2 = 5
TF_GIFT_P3 = 6
TF_GIFT_P4 = 7
TF_GIFT_CRYPTIC = 8
TF_CRYSTAL_WORTH = 2

Convert:loadSettings()


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
		Talk(1, "GiveUIForGift", "<#>啥都不给，你想干啥呀。")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)

		if(g ~= 4 or d<468 or (d >486 and d < 508) or d > 518) then --错误道具
			Talk(1,"GiveUIForGift","<#>你给的是虾米东西呀，咋看不懂嗫？")
			return nil
		end
		if(d > 467 and d < 487) then -- 冰晶
			crystal = crystal + GetItemStackCount(itemIdx)* tonumber(Convert.__crystaltabfile:getCell(TF_CRYSTAL_WORTH,(d-467)))
		else --神秘礼物
			function checkGiftCount(idx,count)  --检测神秘道具的数量
				local num = GetItemStackCount(idx)
				if(count + num > MAXGIVENUM) then -- 数量太多
					Talk(1, "GiveUIForGift", "<#>你给的东西太多，看不清啊。")
					return nil
				end
				return num
			end
			local num = checkGiftCount(itemIdx,maxCount)
			if(not num) then
				return nil
			else
				if (d == 518) then
					Say("你放入的鸡年神秘礼物中有10级的鸡年神秘礼物，这可能会导致合成失败，要不要重新合成？", 2, "好的，重新合成/GiveUIForGift", "算了，下次吧/onCancel")
					return nil
				end
				maxCount = maxCount + num
				local lvl = d - 507
				worth = worth + num * tonumber(Convert.__gifttabfile:getCell(TF_GIFT_WORTH,lvl))
			end
		end
	end
	if(crystal > MAX_CRYSTAL_WORTH) then --价值量大于5000w，涉嫌刷冰晶
		SetTask(TID_CLONECRYSTAL,GetTask(TID_CLONECRYSTAL)+1)
		return -1
	end
	if(worth ==0) then
		Talk(1, "GiveUIForGift", "<#>对不起，至少需要一个鸡年神秘礼物。")
		return nil
	end

	return worth + crystal
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
	GiveItemUI("鸡年神秘礼物合成","你最多放入20个鸡年神秘礼物和多个圣诞活动时剩下的冰晶。", "GiftLevelUp", "onCancel" );
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
		WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName()..
					"在合成神秘礼物的时候，使用了超过5000万价值量的冰晶，涉嫌刷冰晶，详细检查后，考虑冻结该帐号。")
		if(GetTask(TID_CLONECRYSTAL) > 3) then
			WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName()..
					"已经第"..GetTask(TID_CLONECRYSTAL).."次使用价值量的超标冰晶，其复制冰晶的可能性非常大，建议加入黑名单")
		end
		--说句神么话呢？迷惑一下
		Talk(1,"","<#>咦，失败了，咋回事啊？这咋、咋整呀……")
		return
	end
	local idx = Convert:giftLevelup(worth)
	if(not idx) then  --失败，没有选出任何东西
		Talk(1,"","<#>咦，失败了，咋回事啊？这咋、咋整呀……")
		return
	end
	if (idx == 1) then
		Talk(1,"","<#>咦，失败了，咋回事啊？这咋、咋整呀……")
		return
	end

	AddItem(tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P1,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P2,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P3,idx)),
					tonumber(Convert.__gifttabfile:getCell(TF_GIFT_P4,idx)),
					0,0,0,0,0,0,0,0)
	WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName()..
					"，用了"..worth.."价值量的神秘礼物，合成得到"..
					Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx).."价值量的神秘礼物，系统得到"..
					tostring(worth-Convert.__gifttabfile:getCell(TF_GIFT_WORTH,idx)).."剩余价值量。")
	Talk(1, "","<#>你合成出了一个潜质为"..Convert.__gifttabfile:getCell(TF_GIFT_CRYPTIC,idx).."的鸡年神秘礼物")
	Msg2Player("你获得了一个鸡年神秘礼物")
	return
end

function main()
	Talk(1, "GiveUIForGift", "合成鸡年神秘礼物：只能放入最多20个<color=yellow>鸡年神秘礼物<color>，就可能合成更高级的鸡年神秘礼物。如果你有圣诞活动时剩下的<color=yellow>冰晶<color>也可以放入来提高合成的几率。")
end

function onCancel()
end
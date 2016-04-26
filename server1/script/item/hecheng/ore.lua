if not STRING_HEAD then
	Include ("\\script\\lib\\string.lua")
end

if not KTABFILE_HEAD then
	Include ("\\script\\class\\ktabfile.lua")
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
		self.__oretabfile = new(KTabFile,"/settings/item/004/itemvalue/ore.txt","ORE")
	end	
}

MAXGIVENUM = 50  --可以给最大上限
TF_ORE_WORTH = 2

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
	local maxCount = 0	--礼物的总数
	local mark = 0

	if(nCount == 0) then
		Talk(1,"GiveUIForOre","<#>你啥米都不放，怎么合成嗫？")
		return nil
	end
	for i=1,nCount do
		local itemIdx = GetGiveItemUnit(i)
		local g,d,p,lvl = GetItemProp(itemIdx)

		if (mark ~= 0) then
			if (mark ~= lvl) then

				Talk(1,"GiveUIForOre","<#>你放入的都是啥米东西？好像等级都不同嘛。")
				return nil
			end
		end
		mark = lvl

		if (lvl > 4) then
			Talk(1, "GiveUIForOre", "<#>你放入的玄晶矿石等级太高，超出了我的能力范围。")
			return nil
		end
		if(g ~= 6 or p ~= 147) then --错误道具
			Talk(1, "GiveUIForOre", "<#>你放入的都是啥米东西？是玄晶矿石吗？")
			return nil
		end
		function checkGiftCount(idx,count)  --检测神秘道具的数量
			local num = GetItemStackCount(idx)
			if(count + num > MAXGIVENUM) then -- 数量太多
				Talk(1,"GiveUIForOre","<#>你给的东西太多，看不清啊，眩晕……")
				return nil
			end
			return num
		end
		local num = checkGiftCount(itemIdx,maxCount)
		if(not num) then
			return nil
		else
			maxCount = maxCount + num
			worth = worth + num * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl))
		end

	end

	return worth, mark
end
--========函数定义==================================--
--函数原形：GiveUIForOre()
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
function GiveUIForOre()
	GiveItemUI("玄晶矿石合成","将最多50个同一等级的玄晶矿石放入物品栏内，就可以合成出相应价值对应个数的高一等级的玄晶矿石。", "OreLevelUp", "onCancel" );
end

--========函数定义==================================--
--函数原形：OreLevelUp(nCount)
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
function OreLevelUp(nCount)
	local worth, lvl = ComputeWorth(nCount)
	if(not worth) then return end
	--已经得到合理的价值量，删除所有物品，选择对应的特殊神秘礼物
	local num, worth2 = ConvertWorth(worth, lvl)
	local lvl2 = lvl + 1
	
	for i=1,nCount do
		RemoveItemByIndex(GetGiveItemUnit( i ))
	end
	if (num < 1) then
		Talk(1, "", "哎呀呀，合成失败了，拿那么少的玄晶矿石来合成高级的可是有很大的危险性呢！")
		return
	end

	if(not num) then  --失败，没有选出任何东西
		Talk(1,"","<#>咦，失败了，咋回事啊？这、这、你向GM汇报一下吧，我不知道怎么办啊！")
		print("Error: the number of ore is non.")
		return
	end
	
	AddStackItem(num, 6, 1, 147, lvl2, 1, 1, 1)
	WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName()..
					"，用了共"..worth.."价值量的"..lvl.."等级的玄晶矿石，合成得到"..
					num.."个"..lvl2.."等级的玄晶矿石，系统得到"..
					worth-worth2.."剩余价值量。")
	Talk(1, "", "你合成出了<color=yellow>"..num.."<color>个<color=yellow>"..lvl2.."<color>等级的玄晶矿石！")
	Msg2Player("你获得了"..num.."个玄晶矿石")
	return
end

function ConvertWorth(worth, lvl)
	local lvlworth = tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	count = floor(worth / lvlworth)
	value = count * tonumber(Convert.__oretabfile:getCell(TF_ORE_WORTH,lvl + 1))
	if ( random( lvlworth) < (worth - value) and (worth - value) ~= 0) then
		count = count + 1
	end
	return count, value
end


function main()
	Talk(1, "GiveUIForOre", "合成高级玄晶矿石：每次最多放入<color=yellow>50<color>个<color=yellow>同一等级<color>的玄晶矿石，就可以合成出高一等级的玄晶矿石。但是，最高只能合成出等级为<color=yellow>5<color>的玄晶矿石。")
	return
end

function onCancel()
end
MAXNUM_GIFT = 10

function main()
	Talk(1, "GiveUIForShenmi_Ore", "合成神秘矿石：每次放入<color=yellow>10<color>个<color=yellow>10级<color>的鸡年神秘礼物，就可以合成出一个神秘矿石。")
	return
end

function GiveUIForShenmi_Ore()
		GiveItemUI("神秘矿石合成","在下面的物品栏内放入10个10级的鸡年神秘礼物，就可以合成一个神秘矿石。", "Covert_ShenmiOre", "onCancel" );
end

function Covert_ShenmiOre(nCount)
	local q = 0
	local d = 0
	local num = 0
	local maxCount = 0
	if (nCount == 0) then
		Talk(1, "GiveUIForShenmi_Ore", "<#>啥都不给，你想干啥呀。")
		return 
	end
	if (nCount >10 ) then
		Talk(1, "GiveUIForShenmi_Ore", "<#>你放入的物品数目好像不对，看清楚再放吧！")
		return l
	end
	
	for i = 1, nCount do
		local itemIdx = GetGiveItemUnit( i )
		local g,d,_ = GetItemProp(itemIdx)
		if(g ~= 4 or d ~= 518) then
			Talk(1, "GiveUIForShenmi_Ore","<#>你给的是虾米东西啊，怎么看不懂嗫？" )
			return 
		end
			function checkGiftCount(idx,count)  --检测神秘道具的数量
				local num = GetItemStackCount(idx)
				if(count + num > MAXNUM_GIFT) then -- 数量太多
					Talk(1, "GiveUIForShenmi_Ore", "<#>你给的东西太多，看不清,晕……")
					return nil
				end
				return num
			end
		num = checkGiftCount(itemIdx,maxCount)
		if (not num) then
			return 
		else
			maxCount = maxCount + num
		end
	end
	if (maxCount ~= 10) then
		Talk(1, "GiveUIForShenmi_Ore", "<#>你给的鸡年神秘礼物数目不够耶！")
		return 
	else
		for i=1,nCount do
			RemoveItemByIndex(GetGiveItemUnit( i ))
		end
		AddItem(6, 1, 398, 1, 1, 1, 1)
		Talk(1, "", "恭喜你合成出了一个神秘矿石！")
		Msg2Player("你获得一个神秘矿石")
		return
	end
end

function onCancel()
end
Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

tbNSKT_star_white = {}

function main(itemidx)
	--¼ì²éÊ¹ÓÃÎïÆ·Ìõ¼ş
	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 vµ ®·  n¹p thÎ.")
		return 1
	end
	-- het event, ÎïÆ·Ê¹ÓÃµ½ÆÚ
	if (tbNSKT_Item_Star:isExpired(itemidx) == 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	-- Ê¹ÓÃÎïÆ·³É¹¦£¬É¾³ıitem
	if (tbNSKT_star_happiness:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "§¹i hiÖp ®·  ®¹t tèi ®a sö dông vËt phÈm nµy!")
		return 1 -- ²»É¾³ı item	
	end
end

function tbNSKT_star_white:UseItem()
	if (tbNSKT_Item_Star and tbNSKT_Item_Star:isMaxItemUse() == 0 ) then
		--²»ÄÜÉèÖÃtask, ²»½±Àø, É¾³ıÎïÆ·
		if (tbNSKT_Item_Star:setUseCount() ~= 1)then
			return 1;
		end
		local tbAwardExp = {nExp = 50e6} --50 trieu exp
		tbNSKT_Item_Star:giveAward(tbAwardExp, "PhÇn th­ëng EXP ng«i sao tr¾ng");
		return 1;
	end
	return 0; --Ê¹ÓÃ max, ²»ÄÜÊ¹ÓÃ, ²»ÄÜÉ¾³ı
end
Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal3Col = {}

function main(itemidx)
	--¼ì²éÊ¹ÓÃÎïÆ·Ìõ¼ş
	if(tbNSKT_Crystal:checkCondition() == 0)then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 vµ ®·  n¹p thÎ.")
		return 1
	end
	-- het event, ÎïÆ·Ê¹ÓÃµ½ÆÚ
	if (tbNSKT_Crystal:isExpired(itemidx) == 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	-- su dung vat pham thanh cong, xoa item
	if (tbNSKT_Crystal3Col:UseItem() == 1)then
		return 0;	
	else
		Talk(1, "", "§¹i hiÖp ®·  ®¹t tèi ®a sö dông vËt phÈm nµy!")
		return 1 -- ²»É¾³ıitem	
	end
end

function tbNSKT_Crystal3Col:UseItem()
	if (tbNSKT_Crystal and tbNSKT_Crystal:isMaxItemUse() == 0 ) then
		local tbExp = {
								{n_Exp =30e5, n_Rate = 10},
								{n_Exp =25e5, n_Rate = 20},
								{n_Exp =20e5, n_Rate = 70}								
							};
							
		local nTaskValue = GetBitTask(tbNSKT_Crystal.nTaskID, tbNSKT_Crystal.nStartBit, tbNSKT_Crystal.nEndBit)
		local nTemp = (tbNSKT_Crystal.nMaxExp  - nTaskValue) * tbNSKT_Crystal.nScaleFactor
		--neu tbExp = nil, ²»·¢½±£¬·µ»Ø1É¾³ıÎïÆ·
		if (not tbExp) then
			return 1;
		end
		-- ¾­Ñé²»ÄÜ³¬¹ı8ti½çÏŞ
		for i = 1, getn(tbExp) do
			if (nTemp < tbExp[i].n_Exp) then
				tbExp[i].n_Exp = nTemp
			end
		end		
		
		local tbAward = {}
		for i = 1, getn(tbExp) do
			tbAward[i] = {
									[1] = {nExp = tbExp[i].n_Exp},
									[2] = 
											{
												pFun = function (tbItem, nItemCount, szLogTitle)
													%tbNSKT_Crystal:addTask(%tbExp[%i].n_Exp)
												end
											},
									nRate = tbExp[i].n_Rate,
								};
		end
		--Èç¹ûÎïÆ·°ñ²»ÄÜ½¨Á¢»òÕßÎïÆ·°ñ²»¶ÔÒªÇó£¬·µ»Ø1É¾³ıÎïÆ·
		if (not tbAward or getn(tbAward) ~= getn(tbExp)) then
			return 1;
		end
		
		tbNSKT_Crystal:giveAward(tbAward, "PhÇn th­ëng EXP kÕt tinh tam s¾c");		
		return 1;
	end
	return 0; --Ê¹ÓÃmax£¬²»ÄÜÊ¹ÓÃ£¬²»ÄÜÉ¾³ı
end
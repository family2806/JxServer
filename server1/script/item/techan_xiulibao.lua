IncludeLib("SETTING"); --载入SETTING脚本指令库
IncludeLib("FILESYS")
IncludeLib("TONG")
IncludeLib("ITEM")

ITEMPARAM_LIMITDATE = 2
ITEMPARAM_TONGID = 1
function main(nItemIndex)
local szTongName , nTongID = GetTongName()

	if (xiulibao_checkdate(nItemIndex) == -1) then
		Say("<#>修理包已过使用期限，不能够再使用！", 0)
		Msg2Player("修理包过了使用期限，损坏了。")
		return
	end
	--调修理指令
	--用%d替代RepairCallBack前三个参数，当回调时填入: nItemIdx, nPrice, nItemPrice，后面的参数类似Say(...)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..")")
	return 1
end

function xiulibao_checkdate(nItemIndex)
	local nItemdate = GetItemParam(nItemIndex, 1);
	if (GetCurServerTime() <= nItemdate) then
		return 1;
	else
		return -1;
	end;
end

function GetDesc(nItem)
	local nEndYear = GetItemParam(nItem, 2) + 2000;
	local nEndMMDD = GetItemParam(nItem, 3);
	local nEndMon = floor(nEndMMDD / 100);
	local nEndDay = mod(nEndMMDD, 100);
	local nEndHour = GetItemParam(nItem, 4);

	return "\n使用截止日期为：<color=blue>200"..nEndYear.."年"..nEndMonth.."月"..nEndDay.."日<color>";
end

--参看ws_tiangong.lua
function RepairCallBack(nItemIdx, nPrice, nItemPrice, nParam)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local quality = GetItemQuality(nItemIdx)
	-- 黄金装备修理价格公式调整为：100*(装备等级^2)/每点耐久度	
	if (quality == 1 or quality == 4)then
		if (quality == 4 and GetPlatinaLevel(nItemIdx) >= 6) then
			Say("不能修理此物品", 0);
			return 1
		end
		
		local nItemLevel = GetItemLevel(nItemIdx);
		--每耐久度的价格
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur
		local nCostlyPrice = nCheapPrice * 3; -- 简修的三倍
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("<#>", 3, 
		"简修装备："..nCheapPrice.."两，耐久度下降"..nLostDur.."点/#Cheap_Repair("..nItemIdx..","..nCheapPrice..")",
		"精修装备："..nCostlyPrice.."两/#Costly_Repair("..nItemIdx..","..nCostlyPrice..")",
		"不用了/cancel")
		return	
	end	
	Say("<#>修理此装备需花费："..nPrice.."两，你要修理吗？", 2, 
	"修理/#TG_Repair("..nItemIdx..","..nPrice..")",
	"不用了/cancel")
end

--精修
function Costly_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		-- Msg2Player("修复装备！")
		SetCurDurability(nItemIdx, nCurMaxDur)
		WriteLog(date("%H%M%S").."："..GetAccount().."("..GetName()..") 使用("..nCostPrice..")两银子，精修黄金装备(ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>你的银两不足！", 0)
		return
	end
end
--简修
function Cheap_Repair(nItemIdx, nCostPrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
	else
		Say("<#>你的银两不足，备齐银子再来吧！", 0)
		return
	end
end
--普修
function TG_Repair(nItemIdx, nCostPrice)
	if (GetCash() < nCostPrice) then
		Say("<#>你的银两不足，备齐银子再来吧！", 0)
		return
	end
	Pay(nCostPrice)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
end
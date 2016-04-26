
TB_XMASMASK = {394,395,396,397,398,399,400,401,402,403,404,248,249,250,251};
--2006-12-22~2007-01-05 圣诞充卡 送面具
--使用扩展点4
function takeMaskFree()
	local nExtValue = GetExtPoint(4);
	
	if (nExtValue <= 0) then
		Say("您不够条件获赠面具 ", 0);
		return
	end;
	PayExtPoint(4, 1);
	local nMaskID = TB_XMASMASK[random(getn(TB_XMASMASK))];
	local nItemIdx = AddItem(0,11, nMaskID, 1,0,0);
	Say("这是面具"..GetItemName(nItemIdx)..". 感谢您的支持", 0);
	WriteLog("[XMAS-MASK]"..GetLocalDate("%Y-%m-%d %H:%M").." Name:"..GetName().." Account:"..GetAccount().." take a mask : "..GetItemName(nItemIdx));
end;

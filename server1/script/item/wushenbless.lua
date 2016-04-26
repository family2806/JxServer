--武神赐福
--wushenbless.lua
--使用后可获得2小时(系统时间)在宋金、信使、闯关、联赛、野叟、辉煌之夜中贡献度双倍状态
--Task2509

function main(nItemIdx)
	local nItemTime = GetItemParam(nItemIdx,1);
	local nCurTime = GetCurServerTime();	--秒
	if (nItemTime < nCurTime) then
		Msg2Player("这个物品已过了有效期，不能再使用了。");
		return 0;
	end;
	local nEndTime = nCurTime + 2*60*60;
	SetTask(2509, nEndTime);
	Msg2Player("您获得2个小时在宋金大战、信使任务、时间的挑战、武林联赛、野叟任务、辉煌之夜中所获贡献度翻倍的状态。")
end;

function GetDesc(nItemIdx)

	local nYear = GetItemParam(nItemIdx, 2) + 2000;
	local nMonth = GetItemParam(nItemIdx, 3);
	local nDate = GetItemParam(nItemIdx, 4);

	return "使用期限：<color=blue>"..nYear.."年"..nMonth.."月"..nDate.."日"
end


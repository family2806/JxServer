--面具处理
--返回 （1:允许佩戴, 0:不允许佩戴）
Include("\\script\\lib\\pay.lua");

MARK_DAJIANGJUN_TASK_NO = 2620
MARK_YUANSUAI_TASK_NO = 2621

function CanEquip(nParticular)	
	--VLDNB 10 - 在斗场不能带TK面具- 20111017
	if nParticular == 482 or nParticular == 447 or nParticular == 450 or nParticular == 446 then
		local tbMapID = {
			605, 608, 609,
			606, 610, 611,
			607, 612, 613,
		}
		local nW, _, _ = GetWorldPos()
		for i = 1, getn(tbMapID) do
			if tbMapID[i] == nW then
				return 0
			end
		end
	end
	-- 大将军易容
	if (nParticular == 446 or nParticular == 450 or nParticular == 454 or nParticular == 455) then
		
		if (IsCharged() ~= 1 or GetLevel() < 50) then
			Say("只有50级以上充值的玩家才能使用.", 0)
			return 0;
		end		
--		local ndate = tonumber(GetLocalDate("%m%d"));
--		local nUseTimes = GetBitTask(MARK_DAJIANGJUN_TASK_NO, 0, 8) -- 使用次数
--		local nLastUseDate = GetBitTask(MARK_DAJIANGJUN_TASK_NO, 8, 24) -- 上次使用时间
--		
--		if( nLastUseDate ~= ndate) then
--			nLastUseDate =  ndate;
--			nUseTimes = 0;
--		end
--		
--		if (nUseTimes >= 2) then
--			Say("一天只能使用2次大将军易容面具", 0)
--			return 0;
--		end
--		
--		nUseTimes = nUseTimes + 1;
--		SetBitTask(MARK_DAJIANGJUN_TASK_NO, 0, 8,  nUseTimes);
--		SetBitTask(MARK_DAJIANGJUN_TASK_NO, 8, 24, nLastUseDate);
		
		return 1;
	end

	-- 元帅易容
	if (nParticular == 447) then
		
		if (IsCharged() ~= 1) then
			Say("只有50级以上充值的玩家才能使用.", 0)
			return 0;
		end
		
--		local ndate = tonumber(GetLocalDate("%m%d"));
--		local nUseTimes = GetBitTask(MARK_YUANSUAI_TASK_NO, 0, 8) -- 使用次数
--		local nLastUseDate = GetBitTask(MARK_YUANSUAI_TASK_NO, 8, 24) -- 上次使用时间
--		
--		if( nLastUseDate ~= ndate) then
--			nLastUseDate =  ndate;
--			nUseTimes = 0;
--		end
--		
--		if (nUseTimes >= 2) then
--			Say("一天只能使用2次元帅易容面具", 0)
--			return 0;
--		end
--		
--		nUseTimes = nUseTimes + 1;
--		SetBitTask(MARK_YUANSUAI_TASK_NO, 0, 8,  nUseTimes);
--		SetBitTask(MARK_YUANSUAI_TASK_NO, 8, 24, nLastUseDate);
		
		return 1;
	end
	
	
	 
	 return 1;
end;
		
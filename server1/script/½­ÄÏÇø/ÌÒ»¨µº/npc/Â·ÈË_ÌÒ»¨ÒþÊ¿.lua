-- 江南区 桃花岛 路人_桃花隐士.lua
-- by: Dan_deng(2004-05-15)
-- 卖挂机药，查询时间，为洗点做合法性检查

Include("\\script\\global\\timerhead.lua")
Include("\\script\\missions\\autohang\\function.lua")

function main()
	--Uworld137 = GetTask(137)
	--if (Uworld137 == 0) then						-- 第一次对话，需要检测技能更新
	--	if (check_faction() < 20) then			-- 需要更新其技能
	--		Talk(1,"","桃花隐士：相见即是有缘，既然来到桃花岛，先去见过你本门的长辈吧。说不定他们一高兴指点你两招就受用无用了哈。")
	--	else												-- 不需更新，直接跳过
	--		Talk(1,"","桃花隐士：欢迎一定来到桃花岛，看你气宇不凡，定是年轻有为的小朋友。")
	--	end
	-- elseif (Uworld137 < 20) then					-- 没有去更新技能的，不允许买挂机药
	--	Talk(1,"","桃花隐士：快去拜见你的本门长辈吧，我喜欢懂礼貌的好孩子。")
	--elseif (GetLevel() >= 50) then		-- 买挂机道具也要检测合法性
		-- Say("桃花隐士：桃花岛充满着灵气，是练功的宝地。喝碗<color=red>腊八粥<color>，轻轻松松功力自动提升！一碗可维持功效一小时。",3,"好，我喝/buy_yes","请问一下腊八粥功效还有多少时间/check_time","下次再说吧/OnCancel")
	--end
	
	strNeedLevel = "桃花岛与世隔绝，路途危险，不到<color=red> "..AEXP_NEEDLEVEL.."级<color>就想进去？回去练功去!";
	-- 免费双经验
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- 免费双经验日子
		nLevel = GetLevel();	
		if (nLevel < AEXP_NEEDLEVEL) then
			Say(strNeedLevel, 0);
		else
			Say("现在桃花岛灵气极盛，这时候练功不需要腊八粥。但是喝了粥也不会消除时间。今天是美好的一天。老夫也感觉神清气爽。好了！大侠不必花银两！机会少有，赶快争取练功吧！", 0);
		end
		
		return 1;		
	end
	
	nLevel = GetLevel();	
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(strNeedLevel, 0);
	else
		Say("桃花岛充满灵气. 喝碗<color=red>腊八粥<color> 功力会大增. 一碗粥功效有1小时！",
			4,
			"好的! 我喝! /buy_yes",
			"请问: 这个粥,喝多久之后才会有功效? /check_time",
			"我想制作混元灵露/refine",
			"下次再说/OnCancel");
	end
end

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function check_faction()
	if (GetTask(3) >= 10*256) and (GetTask(3) ~= 75*256) then			-- 天王或此门派出师
		SetTask(137,3)
		return 3
	elseif (GetTask(7) >= 10*256) and (GetTask(7) ~= 75*256) then		-- 少林或此门派出师
		SetTask(137,7)
		return 7
	elseif (GetTask(2) >= 10*256) and (GetTask(2) ~= 75*256) then		-- 唐门或此门派出师
		SetTask(137,2)
		return 2
	elseif (GetTask(10) >= 10*256) and (GetTask(10) ~= 75*256) then	-- 五毒或此门派出师
		SetTask(137,10)
		return 10
	elseif (GetTask(1) >= 10*256) and (GetTask(1) ~= 75*256) then		-- 峨嵋或此门派出师
		SetTask(137,1)
		return 1
	elseif (GetTask(6) >= 10*256) and (GetTask(6) ~= 75*256) then		-- 翠烟或此门派出师
		SetTask(137,6)
		return 6
	elseif (GetTask(4) >= 10*256) and (GetTask(4) ~= 75*256) then		-- 天忍或此门派出师
		SetTask(137,4)
		return 4
	elseif (GetTask(8) >= 10*256) and (GetTask(8) ~= 75*256) then		-- 丐帮或此门派出师
		SetTask(137,8)
		return 8
	elseif (GetTask(5) >= 10*256) and (GetTask(5) ~= 75*256) then		-- 武当或此门派出师
		SetTask(137,5)
		return 5
	elseif (GetTask(9) >= 10*256) and (GetTask(9) ~= 75*256) then		-- 昆仑或此门派出师
		SetTask(137,9)
		return 9
	else																					-- 白名的，不需要更新
		SetTask(137,20)
		return 20
	end
end;

function check_time()

	-- 免费双经验
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- 免费双经验日子
		Say("现在桃花岛灵气很旺，这时候练功不需要用到腊八粥。但是喝了腊八粥也不会花时间。机会不多。大侠快争取练功吧！", 0);
		return 1;
	end
	
	nCurValue = GetTask(AEXP_TASKID);
	
	if (nCurValue == 0) then	-- 可能从未喝过腊八粥
		Say("好像<color=red>腊八粥<color>没有作用!再喝一碗看看吧!", 0);
		return 0;
	end

	nTemp = mod(nCurValue, AEXP_TIME_ONE);
	nHours = (nCurValue - nTemp) / AEXP_TIME_ONE; -- 已喝的碗数(小时数)
	nMinutes = nTemp * 60 / AEXP_TIME_ONE;

	if (nHours == 0) and (nMinutes < AEXP_FREQ) then	-- 挂机时间不足
		Say("腊八粥的功效没有了！你只要再买一点就可以继续发挥了!", 0);
	elseif (nHours > 0) then				-- 还有1小时以上
		Say("腊八粥的功效可以维持<color=red> "..nHours.."<color>小时<color=red>"..nMinutes.."<color> 分", 0);
	else
		Say("腊八粥的功效可以维持<color=red> "..nMinutes.."<color> 分", 0);
	end
end;

g_arBuyNumber = {1, 2, 4, 8}; -- 单位：小时
function buy_yes()
	nLevel = GetLevel();
	arBuyStr = {};
	nCount = getn(g_arBuyNumber);

	for i = 1, nCount do
		nNumber = g_arBuyNumber[i];
		nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
		if (nMoney > 0) then
			arBuyStr[i] = ""..nNumber.."碗[ "..nMoney.." lng]".."/buy_deal";
		end
	end

	arBuyStr[nCount + 1] = "我还不想喝!/OnCancel"
	Say("你想喝几碗?", nCount+1, arBuyStr);
end;

function buy_deal(nSel)
	nNumber = g_arBuyNumber[nSel+1]; -- 单位：小时
	
	--碗数检查 - start
	nCurValue = GetTask(AEXP_TASKID);
	temp = (AEXP_TIME_MAX - nCurValue) / AEXP_TIME_ONE; -- 目前可喝的碗数(小时数)
	nRemainNumber = floor(temp);
	if (nRemainNumber <= 0) then
		Msg2Player("你已经喝了"..AEXP_HOUR_MAX.."碗腊八粥, 感觉自己已经喝不下了.可能1小时之后消化了才可以喝几碗. ")
		return 0;
	end

	if (nNumber > nRemainNumber) then
		Msg2Player("你感觉自己最多可以喝"..AEXP_HOUR_MAX.."碗腊八粥,现在喝完了"..(AEXP_HOUR_MAX - nRemainNumber).."碗. ")
		nNumber = nRemainNumber;
	end
	--碗数检查 - end

	nLevel = GetLevel();
	nMoney = AEXP_GetNeedMoney(nLevel, nNumber);
	if (GetCash() >= nMoney) then
		Pay(nMoney);
		nValueTotal = nCurValue + (AEXP_TIME_ONE * nNumber);
		SetTask(AEXP_TASKID,  nValueTotal);

		-- 碗数及时间提示 - start
		nTemp = mod(nValueTotal, AEXP_TIME_ONE);
		nHours = (nValueTotal - nTemp) / AEXP_TIME_ONE; -- 已喝的碗数(小时数)
		nMinutes = nTemp * 60 / AEXP_TIME_ONE;
		Msg2Player("你已经喝了"..nNumber.."瓶腊八粥. 可以自动练功"..nHours.."小时"..nMinutes.."分");
		-- 碗数及时间提示 - end
				
		if (nCurValue == 0) then -- 可能是第一次喝
			Talk(1,"","腊八粥只在桃花岛上才有功效! 如果喝离开这里会失去功效")
		end
	else
		Talk(1,"","腊八粥是一种神气的药品，不能送!大侠要带"..nMoney.."两来买!")
	end
end;

function OnCancel()
end;

Include("\\script\\tong\\tong_header.lua");

Include("\\script\\global\\repute_head.lua")

function CheckLeaveTongPower()
	str, result = GetTong()		--判断是否处于帮会中
	if (result == 1) and (str ~= "") then
		-- LLG_ALLINONE_TODO_20070802
--		need_money = {10000,100000,500000}
		need_money = {500000,100000,10000,10000,10000}
		figure = GetTongFigure()		--判断角色在帮会中的身份
		if (figure == TONG_MASTER) then
			Msg2Player("帮主不允许反叛帮会")
			return 0
		else
			if (GetCash() >= need_money[figure]) then
				SetTaskTemp(11,need_money[figure])
				Nrepute = check_repute(figure)		-- 通过帮会中的职位判断应减多少声望
				SetTaskTemp(12,Nrepute)
				Msg2Player("警告：叛离帮会需要交纳"..need_money[figure].."两培养费，并且声望会下降"..Nrepute.."点！")
				return need_money[figure]		--根据身份判断是否够钱
			else
				Msg2Player("警告：叛离帮会需要交纳"..need_money[figure].."两培养费，但是你现在并没有这么多钱。")
				return 0
			end
		end
	else
		Msg2Player("你现在并不在任何帮会中！")
		return 0
	end
end;

function check_repute(Tong_title)		-- 通过在帮会中的职位判断应减多少声望
	Rep = GetRepute()
	Repute_Level = GetReputeLevel(Rep)
	if (Tong_title == TONG_ELDER) then			-- 长老
		reduce_repute = GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)			-- 应该降低的声望
	elseif (Tong_title == TONG_MANAGER) then		-- 队长
		reduce_repute = floor((GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)) * 0.5)
	else								-- 帮众、隐士
		reduce_repute = floor((GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)) * 0.25)
	end
	if (Rep <= reduce_repute) then	-- 如果声望不足则减为0
		reduce_repute = Rep 
	end
	return reduce_repute
end

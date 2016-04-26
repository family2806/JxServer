--西南北区 成都府 衙门门口告示牌1
-- Update: Dan_Deng(2004-02-27) 重新设计任务(成都杀野猪)
-- 可重复任务（重复周期：现实时间1天）

function main(sel)
	Uworld11 = GetTask(11)
	Udate = tonumber(date("%Y%m%d"))						-- 需要转换成数值才能直接进行比较
	if (GetSex() == 0) then			-- 男女内容不同
		sexstr = "壮士"
	else
		sexstr = "女侠"
	end

	if (Uworld11 == 0) or ((Uworld11 > 255) and (Uworld11 < Udate)) then		-- 可以接任务
		Say("通告：最近在城外有野猪扰乱，破坏庄稼，真是麻烦，已经悬赏500两白银，找勇士消灭这些野猪。杀死野猪的，可以来衙门领奖.",2,"悬赏榜/W11_get","没有庄稼/no")
	elseif (Uworld11 <= 255) then		-- 任务进行中
		Talk(1,"","成都府衙役: "..sexstr..GetName().."许多侠士乐意为民除害，给人民带来平安，准备迎接战胜归来的壮士. ")
	else				-- 未到重复时间
		Talk(1,"","成都府衙役: "..sexstr..GetName().."为民除害，谁杀得了4个区域的野猪，本府就奖励500两，作为表扬侠义的行动. ")
	end
end;

function W11_get()
	Talk(1,"","成都府衙令：近日四郊受到野猪骚扰，使得庄稼毁殃参半，委实可恶，现悬赏白银五百两，寻找能铲除这群野猪的勇士。凡是杀死野猪十头者，即可到衙门处领取赏银。")
	SetTask(11,1)
end

function no()
end

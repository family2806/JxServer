-- 龙门镇-古阳洞-“妖刀”赵方(世界任务“救小娟”)
-- by：Dan_Deng(2004-03-03)

function OnDeath()
	Uworld41 = GetByte(GetTask(41),1)
	if (Uworld41 >= 10) and (Uworld41 < 100) and (HaveItem(352) == 0) and (random(0,99) < 50) then		-- 任务中并且没有钥匙，50%机率
		if (Uworld41 == 10) then		-- 第一次打时加剧情对话,及变量赋值
			if (GetSex() == 0) then		-- 对话男女不同
				Talk(1,"","英雄饶命，昨天抢来小娟之后她抵死不从，现在还关在黑牢里面呢。这是钥匙，只求英雄饶过小的狗命!")
			else
				Talk(1,"","女侠饶命，昨天抢来小娟之后她抵死不从，现在还关在黑牢里面呢。这是钥匙，只求英雄饶过小的狗命!")
			end
			Uworld41 = SetByte(GetTask(41),1,30)
			SetTask(41,Uworld41)
			AddNote("打败强盗头目“妖刀”赵方，得到一把打开黑牢救小娟的钥匙")
		end
		AddEventItem(352)			-- 机关钥匙
		Msg2Player("拿到机关钥匙")
	end
end;

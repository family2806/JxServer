-- 龙门镇　路人　孙家嫂子
-- by：Dan_Deng(2003-09-16)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld41 = GetByte(GetTask(41),1)
	if (GetLevel() >= 40) and (GetReputeLevel(GetRepute()) >= 5) then		-- 符合任务条件
		if (Uworld41 == 0) or (Uworld41 == 5) then			-- 任务启动
			Talk(4,""," (哭声) ","这位大嫂，有什么头疼的事吗？"," (哭声) ","... ")
			SetTask(41,5)
		elseif (Uworld41 == 10) or (Uworld41 == 30) then	-- 任务进行中
			Talk(1,"","大侠愿意帮我把小娟就回来吗？感激不尽！")
		elseif (Uworld41 == 100) then					-- 已经救出小娟，任务未交
			Talk(1,"","小娟！我的孩子回来了！真是苦了我的孩子了。你赶快去见父亲让他不要担心了.")
		else		-- 任务已完成
			Talk(1,"","真是感谢大侠！我和其他几个人要送长生药给大侠.")
		end
	else
		Talk(1,"","我家老头，从早到晚就一直瞎想什么是志气，什么是英雄？全都是废话，都不想一下实际生活!")
	end
end;

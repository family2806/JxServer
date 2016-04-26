-- 大理　路人　茶客2
-- by：Dan_Deng(2003-09-16)

function main()
	if (GetSex() == 0) then
		Talk(1,""," 小兄弟，你也喜欢喝茶啊？想敬不如会晤，坐下来喝一杯茶，聊聊天吧!")
	else
		Talk(1,""," 这位姑娘，你喜欢喝茶吗？想敬不如会晤，坐下来喝一杯茶，聊聊天吧!")
	end
end;

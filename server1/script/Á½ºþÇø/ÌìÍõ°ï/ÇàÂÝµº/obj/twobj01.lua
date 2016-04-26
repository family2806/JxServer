--description: 天王帮出师任务 青螺岛宝箱
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 60*256+20) and (HaveItem(101) == 1) then
		DelItem(101)
		Talk(2,"","天王遗书已经被金人拿走了","地上有一些指向青螺岛的标记，看来杀手刚离开不久﹗. ")
		SetTask(3, 60*256+40)
		AddNote("打开湖北边的宝箱，才知道天王遗书被金国杀手拿走了. ")
	elseif (UTask_tw == 60*256+40) then
		Talk(1,"","宝箱是空的. ")
	else
		Talk(1,"","没有钥匙，打不开宝箱.")
	end
end;

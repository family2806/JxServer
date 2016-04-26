-- 丐帮秘洞 宝箱empty 出师任务
-- by：Dan_Deng(2003-07-29)

function main()
	if (GetTask(8) == 60*256+10) then
		Talk(2,"","打开箱子.","你失望，因为箱子空空的.")
	else
		Talk(1,"","宝箱锁了")
	end
end;

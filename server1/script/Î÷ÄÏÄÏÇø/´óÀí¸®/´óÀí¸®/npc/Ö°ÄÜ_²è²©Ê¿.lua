-- 大理　职能　茶博士
-- by：Dan_Deng(2003-09-16)

-- 各个级别的同伴剧情任务实体处理文件
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

function main()
	
	-- 控蛇人之秘的任务处理
	if taskProcess_002_02:doTaskEntity()~=0 then return end;
	if taskProcess_002_11:doTaskEntity()~=0 then return end;
	
	Talk(3,"","我们的茶是云南最出名的，我们大理出名的茶是夏关陀茶。","夏关陀茶外形不一样，大的像碗一样小的像衣扣一样.","古人云：夏关茶，陀江水。夏关茶一定要用江水泡才对。茶泡完后是橘黄色，味道香浓，是极品。.")
end;

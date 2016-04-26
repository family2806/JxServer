-- 龙门镇 职能 药店老板
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
		Say("到了龙门镇就要买点药预防头疼脑热!", 3, "交易/yes","我来领初级任务/yboss", "不交易/no")
end;

function yes()
	Sale(27);  			--弹出交易框
end;

function no()
end;

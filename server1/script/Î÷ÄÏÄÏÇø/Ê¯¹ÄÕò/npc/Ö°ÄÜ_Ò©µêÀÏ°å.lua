-- 石鼓镇 职能 药店老板
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
		Say("石鼓镇祖传，包治百病，客官想买什么?", 3, "交易/yes","我来接入门任务/yboss", "不交易/no")
end;

function yes()
	Sale(27);  			--弹出交易框
end;

function no()
end;

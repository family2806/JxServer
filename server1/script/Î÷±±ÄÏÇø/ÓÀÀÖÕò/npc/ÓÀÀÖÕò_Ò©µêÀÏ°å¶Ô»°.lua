--西北南区 永乐镇 药店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
		Say("行走江湖，准备点药防身是不能少的!", 3, "交易/yes","我来领入门任务/yboss", "不交易/no");
end;


function yes()
Sale(85);  		--弹出交易框
end;


function no()
end;



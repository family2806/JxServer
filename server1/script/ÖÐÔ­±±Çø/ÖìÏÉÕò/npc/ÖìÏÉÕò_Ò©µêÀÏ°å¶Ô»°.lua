--中原北区 朱仙镇 药店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Say("客官想买什么 ", 3, "交易/yes","我来接入门任务/yboss", "不交易/no");
end;


function yes()
Sale(88);  		--弹出交易框
end;


function no()
end;


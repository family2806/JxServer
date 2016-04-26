--中原南区 扬州府 路人17乐清秋对话
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_leqingqiu()
	else
Say("乐清秋：我没有别的本事，只能靠买几幅字画养家糊口，唉！难怪人说，百无一用是书生啊……", 0);
	end
end;





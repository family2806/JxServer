--中原南区 扬州府 赌徒3对话
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_dugun()
	else
Say("赌徒：本来好容易赢了几把，结果又输了，真不甘心！", 0);
	end
end;





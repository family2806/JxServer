--西北南区 凤翔府 路人8阿牛对话

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_aniu()
	else
Say("阿牛：人说米脂的女娃最漂亮，也不知是真是假，俺咋就没碰上一个半个呢？",0)
	end
end;
--中原南区 襄阳府 路人6龚阿牛对话


Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)

i = random(0,2)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_taokan()
	else
		if (i == 0) then
Say("龚阿牛：出了城，往北走，不远就是武当山。",0)
		return
		end;
		
		if (i == 1) then
Say("龚阿牛：听说武当派的掌门是个得道真人，不晓得是不是得道了就能够长生不老。",0)
		return
		end;
		
		if (i == 2) then
Say("龚阿牛：要不是屋里有八十岁老娘，我早就上武当山拜师学艺去了。",0)
		end;
	end
end;


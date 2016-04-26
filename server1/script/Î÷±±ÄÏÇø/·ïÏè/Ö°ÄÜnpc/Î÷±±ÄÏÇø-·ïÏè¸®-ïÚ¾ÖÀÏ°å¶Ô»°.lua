--西北南区 凤翔府 镖局老板对话
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(188) == 1 then
		allbrother_0801_FindNpcTaskDialog(188)
		return 0;
	end
	
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_shuangying()
	else
		i = random(0,1)
		if (i == 0) then
Say("镖局老板：俺们双鹰镖局在西北一带的黑白两道都有朋友，所以保镖从无闪失，这靠的全都是江湖上朋友的面子！",0)
		else
Say("镖局老板：俺们吃镖行饭的人，除了真功夫，全靠黑白两道的朋友们赏脸，这‘交情’二字，有时比真刀真枪的功夫还要紧些。", 0)
		end;
	end
end
		
		
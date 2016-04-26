--西南北区 成都府 路人13贺兰芝对话
Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_helanzhi()
	else
Say("贺兰芝：我男人在城门当差，一站就一整日，太辛苦了，我要做点好菜给他补补身子。",0)
	end
end;
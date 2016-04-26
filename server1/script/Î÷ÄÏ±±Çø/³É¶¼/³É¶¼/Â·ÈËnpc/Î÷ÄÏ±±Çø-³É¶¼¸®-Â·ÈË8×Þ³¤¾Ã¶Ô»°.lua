--西南北区 成都府 路人8邹长久对话
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_zouchangjiu()
	else
Say("邹长久：早就听说这川妹子是一个赛一个的漂亮，今日一见，果然是美得很哪，要不是我早娶了老婆……",0)
	end
end;


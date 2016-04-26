--中原南区 扬州府 嫖客1对话
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_shenfeng()
	else
Say("嫖客：自古文人皆多情。唐人杜牧有诗曰“十年一觉扬州梦，赢得青楼薄幸名”，我只不过效法古人，倚红偎翠，不辜负这青春好时光罢了。",0)
	end
end;



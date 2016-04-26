Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\GM_Tool\\dispose_item.lua");
Include("\\script\\GM_Tool\\exp_recall.lua");
function main()
	local tbOpp = {}
	local str = "<#> 冬天寒冷，我一个人真孤单!";
	tinsert(tbOpp,"我需要一个幸运号，大侠可以给我吗?/DisposeItem_main");
	tinsert(tbOpp, "<#>退出/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function OnCancel()
end
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\GM_Tool\\dispose_item.lua");
Include("\\script\\GM_Tool\\exp_recall.lua");
function main()
	local tbOpp = {}
	local str = "<#> ���캮�䣬��һ������µ�!";
	tinsert(tbOpp,"����Ҫһ�����˺ţ��������Ը�����?/DisposeItem_main");
	tinsert(tbOpp, "<#>�˳�/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

function OnCancel()
end
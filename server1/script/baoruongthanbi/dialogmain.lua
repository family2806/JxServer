Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\baoruongthanbi\\openbox\\openbox.lua")
Include("\\script\\baoruongthanbi\\key\\definitionkey.lua")
Include("\\script\\baoruongthanbi\\key\\keyupgrade.lua")


function BRTB_Dialog_main()
	
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> 不懂我能帮大侠什么呢?";
	
	tinsert(tbOpp,"我到这想请人打开神秘箱/OpenBox_main");
	tinsert(tbOpp,"我到这想请人鉴定万能钥匙/DefinitionKey_main");
	tinsert(tbOpp,"我到这想请人升级万能钥匙/KeyUpgrade_main");
	tinsert(tbOpp, "<#>退出/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 


Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\baoruongthanbi\\openbox\\openbox.lua")
Include("\\script\\baoruongthanbi\\key\\definitionkey.lua")
Include("\\script\\baoruongthanbi\\key\\keyupgrade.lua")


function BRTB_Dialog_main()
	
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> �������ܰ����ʲô��?";
	
	tinsert(tbOpp,"�ҵ��������˴�������/OpenBox_main");
	tinsert(tbOpp,"�ҵ��������˼�������Կ��/DefinitionKey_main");
	tinsert(tbOpp,"�ҵ�����������������Կ��/KeyUpgrade_main");
	tinsert(tbOpp, "<#>�˳�/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 


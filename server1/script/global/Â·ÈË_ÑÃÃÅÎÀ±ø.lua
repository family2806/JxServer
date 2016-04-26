if (not __GOVERM_SOLDIER_H__) then
    __GOVERM_SOLDIER_H__ = 1;
Include("\\script\\missions\\springfestival\\dialog.lua");

function gsoldier_entance()
	local aryszContent = {	"寻找其他信息/main_former",
							"我最近实在忙得很，你找别人吧。/OnCancel"};
							
	if (sf06_isactive() == 1) then
		tinsert(aryszContent, 1, "春天活动/sf06_mainentrance");
	end;
	
	if (getn(aryszContent) > 2) then
		Say("<color=yellow>衙门卫兵<color>：月明星溪，乌鹊南飞。国家正是用人之际，我看你也是学武之人，能帮个忙吗？", getn(aryszContent), aryszContent);
	else
		main_former();
	end;
	
end;

function OnCancel()
	
end;
end; --// end of __GOVERM_SOLDIER_H__
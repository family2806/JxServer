if (not __GOVERM_SOLDIER_H__) then
    __GOVERM_SOLDIER_H__ = 1;
Include("\\script\\missions\\springfestival\\dialog.lua");

function gsoldier_entance()
	local aryszContent = {	"Ѱ��������Ϣ/main_former",
							"�����ʵ��æ�úܣ����ұ��˰ɡ�/OnCancel"};
							
	if (sf06_isactive() == 1) then
		tinsert(aryszContent, 1, "����/sf06_mainentrance");
	end;
	
	if (getn(aryszContent) > 2) then
		Say("<color=yellow>��������<color>��������Ϫ����ȵ�Ϸɡ�������������֮�ʣ��ҿ���Ҳ��ѧ��֮�ˣ��ܰ��æ��", getn(aryszContent), aryszContent);
	else
		main_former();
	end;
	
end;

function OnCancel()
	
end;
end; --// end of __GOVERM_SOLDIER_H__
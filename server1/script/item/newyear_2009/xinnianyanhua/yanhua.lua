Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	newyear0901_resettask();
	
	local n_date	= tonumber(GetLocalDate("%Y%m%d"));
	if (n_date >= 20090216) then
		Say("����Ʒ�ѹ���.", 0);
		return 0;
	end
	
	if (GetTask(newyear0901_TSK_GetExp_Yanhua) + 200 > 20000) then
		Say("�����Ѵﵽ��߾��飬��ˣ�������ʹ��ӭ���̻���.", 0);
		return 1;
	end
	SetTask(newyear0901_TSK_GetExp_Yanhua, GetTask(newyear0901_TSK_GetExp_Yanhua) + 200);
	AddOwnExp(2000000);
	CastSkill(932, 1);
end
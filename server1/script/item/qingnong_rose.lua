IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE = 1553
function main()
if (gb_GetModule("���˽����") == 1) then
	if (GetSex() == 1) then
		if (GetTask(TSK_VALENTINE) >= 99) then
				Say("<#>���Ѿ�ʹ����<color=yellow>99����Ũõ�廨<color>������ô�໨��װ�λᱻ����Ŷ��", 0)
				return 1
		end
		AddOwnExp(1000000)
		AddSkillState(440, 20, 1,32400)--30�����ڻ��˫������ʱ�䡣
		AddSkillState(450, 20, 1,32400)--����ֵ30����������20�㡣
		SetTask(TSK_VALENTINE, GetTask(TSK_VALENTINE) + 1)
		if (GetTask(TSK_VALENTINE) == 99) then
			Msg2Player("<#>��ʹ����һ����Ũõ�廨���100W�㾭��ֵ������˫������������20���Сʱ��")
		else
			Msg2Player("<#>��ʹ����һ����Ũõ�廨���100W�㾭��ֵ������˫������������20���Сʱ����������ʹ��"..(99 - GetTask(TSK_VALENTINE)).."����Ũõ�廨��")
		end
		return
	else
		Msg2Player("<#>��Ũõ�廨ֻ����Ůʹ���أ�")
		return 1
	end
end
end
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\vonghoa\\item\\yanhua.lua")
Include("\\script\\lib\\awardtemplet.lua")

 
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("��Ʒ��ʹ���ڣ��Զ���ʧ.")
		return 0;
	end
	if (GetTask(Task_IsCurUse_VongHoa) ~= 0) then
		Talk(1,"","������ʹ����Ʒ !")
		return 1
	end
	if (GetTask(Task_BeUse_VongHoa) >= nMaxEXP) then
		Talk(1,"","ʹ�û�Ȧ�ﵽ�����ֵ!")
		return 1
	end
	if (GetLevel() < 50) then
		Talk(1,"","�ȼ�����50��������ʹ�� !")
		return 1
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "װ������5����λ.");
			return 1
	end
	Create_main(nItemIndex)
	--WriteLog(date("%Y%m%d %H%M%S").."\t".."������"..GetAccount().."\t"..GetName().."\t".."ʹ��������")	
end
--by ��־ɽ [2006-09-12]
--2006����֮���±������˵õ���Ӧ�Ľ���
--Illustration: ���� -- lightcage au06- -- midautumn2006

if (not __H_ITEM_MOONCAKE__) then
	__H_ITEM_MOONCAKE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);
	
--nIndex
tab_Exp = {
	20000 ,
	40000 ,
	100000 ,
	500000 ,
	1000000 ,
	2000000 ,
}

--������ں���
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < AU06_BEGINDATE or nDate >= 20061117 or 
			gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		Say("�±��Ѿ�������,�޷�ʹ��.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("ֻ��50�����ϳ�ֵ��Ҳ���ʳ�������±���", 0);
		return 1;
	end;
	
	if (not nIndex) then
		return 1;
	end;
	
	local nCount = getn(tab_Exp);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	local nExp = GetTask(AU06_TK_EXP);
	if (nExp >= EXP_AWARD_LIMIT) then
		Say("ÿ��ͨ���±������Ի��<color=red>"..EXP_AWARD_LIMIT.."��<color>����ֵ���㲻����ʳ���ˡ�", 0);
		return 1;
	end;
	--���轱��
	SetTask(AU06_TK_EXP, nExp + tab_Exp[nIndex]);
	AddOwnExp(tab_Exp[nIndex]);
	
	--������ʾ
	Msg2Player("������<color=yellow>"..tab_Exp[nIndex].."<color>�㾭�顣")
	return 0;
end

end; --//end of __H_ITEM_MOONCAKE__
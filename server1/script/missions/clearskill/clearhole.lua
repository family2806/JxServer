Include("\\script\\missions\\clearskill\\head.lua");
Include("\\script\\task\\system\\task_string.lua");

TTID_CityIndex 	= 101;

-- ϴ�㶴(��һ��)��ع���
-- ����ֵ: -1 ʧ�ܣ�1�ɹ�
function CSP_EnterClearMap(nCityIndex)
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "<#>׳ʿ��û�дﵽ�ȼ�"..CSP_NEEDLEVEL.."<#>, ���ܽ�ϴ�赺")
		return -1;
	end
	
	if (GetCamp() == 0) then
		Talk(1, "", "��û���κμ��ܣ���ôҲ��ȥϴ�赺? ")
		return -1;
	end

	-- �����кż�¼����ʱ������
	SetTaskTemp(TTID_CityIndex, nCityIndex);
	
	-- ȥϴ�赺����Ѵ���
	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- ��ѽ���
		Say("<#>��ѽ���ϴ�赺�Ļ���ֻ��"..CSP_MAXClearTime.."<#>��. ׳ʿ���������?", 2, "����ϴ��/CSP_FreeEnterClearMap", "��Ϣһ��/gotocsm_no")
		return 1;
	else
		-- û����ѻ����ˣ���ˮ����ʯ
		strNoFree = 
		{
			"<#>����: ��Ѵ���������, ���Ǹ��¿���ʹ��<color=blue>˯��(�����) <color>��<color=blue>�ɺ챦ʯ(������) <color>����ϴ�赺. ������ͬ����?",
			"<#>ֻϴ���ܵ�[3��ˮ��]/CSP_JEnterClearMap_Skill",
			"<#>ֻϴ���ܵ�[����]/CSP_JEnterClearMap_Skill2",
			"<#>ֻϴǱ�ܵ�[6���ɺ챦ʯ]/CSP_JEnterClearMap_Prop",
			"<#>ֻϴǱ�ܵ�[����]/CSP_JEnterClearMap_Prop2",
			"<#>ϴǱ�ܺͼ��ܵ�[3��ˮ��+ 6���ɺ챦ʯ]/CSP_JEnterClearMap_All",
			"<#>ϴǱ�ܼ��ܵ�[����+ ����]/CSP_JEnterClearMap_All2",
			"<#>˼��һ��/CSP_Cancel"
		};
		-- Say(strNoFree[1], 7, strNoFree[2], strNoFree[3], strNoFree[4], strNoFree[5], strNoFree[6], strNoFree[7], strNoFree[8]);
		CreateTaskSay(strNoFree)
		return 1;
	end
	return 1;
end;

-- ��ѽ����Ļ���
function CSP_FreeEnterClearMap()
	
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- ȫϴ
	CSP_EnterClearMapCore();
end

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - ���ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Skill()
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","��û�д�<color=blue>3��ˮ��<color>.��Ҫ�ļ��ҹ�֮������. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "������˺ܶ�ˮ��, ���ǲ��þ�������3��ˮ������, ���ǰ�ʣ���ˮ�����ڴ�������? ")
		return -1;
	end

	-- ��ˮ��
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end
	
	CSP_WriteLog("��ʹ��"..nJCount.."ˮ����, ����ϴ�赺");
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- ϴ���ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("����ϴ�赺, ����Բ���ϴ���ܵ�. ");

end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","��û�д�<color=red>6���ɺ챦ʯ<color>.��Ҫ�ļ�, ����������. ")
		return -1;
	end
	
	-- ���ɺ챦ʯ(����)
	for i = 1, CSP_NEEDJEWEL_PROP do DelItemEx(353) end

	CSP_WriteLog("��ʹ��"..CSP_NEEDJEWEL_PROP.."�ɺ챦ʯ, ����ϴ�赺");
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- ϴǱ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("����ϴ�赺, �����һֱϴǱ�ܵ�. ");
end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - ���ܵ�&Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All()
	j353 = GetItemCountEx(353)
	if (j353 < CSP_NEEDJEWEL_PROP) then
		Talk(1,"","��û�д�<color=red>6���ɺ챦ʯ<color>.��Ҫ�ļ�, ����������. ")
		return -1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)
	nJCount = j238 + j239 + j240;
	if (nJCount < CSP_NEEDJEWEL_SKILL) then
		Talk(1,"","��û�д�<color=blue>3��ˮ��<color>.��Ҫ�ļ�, ����������. ")
		return -1;
	end
	if (nJCount > CSP_NEEDJEWEL_SKILL) then
		Talk(1, "", "������˺ܶ�ˮ��, ���ǲ��þ�������3��ˮ������, ���ǰ�ʣ���ˮ�����ڴ�������? ")
		return -1;
	end
	
	-- ���ɺ챦ʯ(����)
	for i = 1,CSP_NEEDJEWEL_PROP do DelItemEx(353) end
	-- ��ˮ��
	for i = 1,j238 do DelItemEx(238) end
	for i = 1,j239 do DelItemEx(239) end
	for i = 1,j240 do DelItemEx(240) end	

	CSP_WriteLog("ʹ����"..nJCount.."ˮ��, ��"..CSP_NEEDJEWEL_PROP.."�ɺ챦ʯ, ����ϴ�赺");
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- ϴ���ܵ��Ǳ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("����ϴ�赺,����������ε�ϴ���ܵ�. ");
end;

function CSP_Cancel()
end

-- �����ĺ��ĺ���
function CSP_EnterClearMapCore()
	-- ����ʱ������ȡ�����к�
	nCityIndex = GetTaskTemp(TTID_CityIndex);
	nMapID = CSP_GetClearMapID(nCityIndex);
	-- ��ͼ�Ҳ���������
	if (nMapID == -1) then
		CSP_WriteLog("����ID:"..nMapID.."û�ҵ�, ����ϴ�赺ʧ��!");
		return -1;
	end

	LeaveTeam();
	nResult = NewWorld(nMapID,1615,3200);
	if (nResult == 0) then
		CSP_WriteLog("����ID:"..nMapID.."�����������,����ϴ�赺ʧ��!");
		Msg2Player("�����������!");
		return -1;
	end
	
	-- ����ĳЩ���ܣ�����ʹ�ûسǷ���������ӳ�����������̯
	DisabledUseTownP(1);
	DisabledUseHeart(1);
	DisabledStall(1);
	
	-- ���÷�ս��״̬
	SetFightState(0)
	
	-- ��¼������(�뿪ʱ��ԭ)
	nSWID, nRevID = GetPlayerRev();
	SetTask(CSP_TID_RevivalSWID, nSWID);
	SetTask(CSP_TID_ReviveID, nRevID);
	
	-- �����µ���ʱ������
	SetRevPos(nMapID, CSP_RevieSWID);
	SetPunish(0);	
end;

-- ����ֵ: -1 ʧ�ܣ�1�ɹ�
function CSP_LeaveClearMap(nClearMapID)
	nCityIndex = CSP_GetCityIndexByClearMap(nClearMapID);
	if (nCityIndex == -1) then
		return -1;
	end

	-- �ָ�������(ֻ��״̬�Ϸ�ʱ��������������)
	if (CSP_CheckValid() == 1) then
		nSWID = GetTask(CSP_TID_RevivalSWID);
		nRevID = GetTask(CSP_TID_ReviveID);
		SetRevPos(nSWID, nRevID);
	end
		
	-- �رձ����εĹ��ܣ�����ʹ�ûسǷ���������ӳ�����������̯
	DisabledUseTownP(0);
	DisabledUseHeart(0);
	DisabledStall(0);
	
	-- �뵺ʱ�뿪����
	LeaveTeam();
	
	-- ���÷�ս��״̬
	SetFightState(0);
	SetPunish(1);
	SetLogoutRV(0);

	nResult = GetTask(CSP_TID_ClearFreeTime);
	if (nResult < CSP_MAXClearTime) then -- ��ѽ���
		SetTask(CSP_TID_ClearFreeTime, nResult + 1) -- ��¼��Ѵ���
	else
		SetTask(CSP_TID_JewelEnterTime, GetTask(CSP_TID_JewelEnterTime) + 1) -- ��¼ʹ�ñ�ʯ�������
	end
	

	if (nCityIndex == 1) then
		NewWorld(1, 1557, 3112) -- ����		
	elseif (nCityIndex == 2) then
		NewWorld(11, 3193, 5192) -- �ɶ�	
	elseif (nCityIndex == 3) then
		NewWorld(162, 1669, 3129) -- ����	
	elseif (nCityIndex == 4) then
		NewWorld(37, 1598, 3000) -- �꾩
	elseif (nCityIndex == 5) then
		NewWorld(78, 1592, 3377) -- ����
	elseif (nCityIndex == 6) then
		NewWorld(80, 1670, 2996) -- ����		
	elseif (nCityIndex == 7) then
		NewWorld(176, 1603, 2917) -- �ٰ�
	else
		Msg2Player("ϵͳ�������ҷ�����Աȷ�Ͻ������. ");
	end	
end;


function CSP_JEnterClearMap_Skill2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","����: ������û<color=blue>����<color>. �ǲ���������ĳ����?")
		return -1;
	end

	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("��ʹ�� %d����,����ϴ�赺", CSP_NEEDJEWEL_SKILL2));
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_SKILL); -- ϴ���ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("����ϴ�赺, ����������ε�ϴ���ܵ�. ");

end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_Prop2()
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","����: ������û��<color=red>����<color>. �ǲ���������ĳ����?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("��ʹ�� %d����,����ϴ�赺", CSP_NEEDJEWEL_PROP2));
	-- ��¼����ϴ������
	SetTask(CSP_TID_ClearType, CSP_CTYPE_PROP); -- ϴǱ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("����ϴ�赺, ����������ε�ϴ���ܵ�. ");
end;

-- ʹ�ñ�ʯ��ȡ����ϴ��Ļ��� - ���ܵ�&Ǳ�ܵ�
-- JEnter - JewelEnter
function CSP_JEnterClearMap_All2()
	if (CalcItemCount(3, 6, 1, 2390,-1) < CSP_NEEDJEWEL_SKILL2) then
		Talk(1,"","����: ������û��<color=blue>����<color>. �ǲ���������ĳ����?")
		return -1;
	end
	
	if (CalcItemCount(3, 6, 1, 2391,-1) < CSP_NEEDJEWEL_PROP2) then
		Talk(1,"","����: ������û��<color=red>����<color>. �ǲ���������ĳ����?")
		return -1;
	end
	
	if (ConsumeItem(3, 1, 6,1,2390,-1) ~= 1 or ConsumeItem(3, 1, 6,1,2391,-1) ~= 1) then
		return -1;
	end
	
	CSP_WriteLog(format("����ʹ�� %d %s �� %d %s, ����ϴ�赺",CSP_NEEDJEWEL_SKILL2, "����", CSP_NEEDJEWEL_PROP2, "����") );
	SetTask(CSP_TID_ClearType, CSP_CTYPE_ALL); -- ϴ���ܵ��Ǳ�ܵ�
	CSP_EnterClearMapCore(); -- ����ϴ�赺
	Msg2Player("����ϴ�赺, ����������ε�ϴ���ܵ�. ");
end;



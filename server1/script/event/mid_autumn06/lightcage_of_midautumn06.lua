--by ��־ɽ [2006-09-12]
--2006����֮�������,��ֵõ�����,������ȡ������±�.
--Illustration: ���� -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

--������ں���
function au06_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("ֻ�г�ֵ��Ҳſ��Բμ�����", 0);
		return
	end;
	
	local tab_Content = {
		"�������ʵ�����[��Ҫ2�Ƶ���ֽ, 1����, 1�Ѳ���, 1�����1000 ��]/#determine_process( 1 )",
		"���������ǵ���[��Ҫ2������ֽ, 1����, 1�Ѳ���, 1�����2000 ��]/#determine_process( 2 )",
		"��������״����[��Ҫ2�̵���ֽ, 1����, 1�Ѳ���, 1�����3000 ��]/#determine_process( 3 )",
		"������Բ�ε���[��Ҫ2�쵥��ֽ, 1����, 1�Ѳ���, 1�����4000 ��]/#determine_process( 4 )",
		"�������������[��Ҫ1�ȵ���ֽ, 1����, 1�Ѳ���, 1�����5000 ��]/#determine_process( 5 )",
		"��������ʵ���[��Ҫ5�ֵ���ֽ, 1����, 1�Ѳ���, 1�����5000 ��]/sure_colorfulcage",
		"ֻ������һ��������!/oncancel"
	};
	Say("�����ĵ��������������˶���. �͹�����ʲô����?", getn(tab_Content), tab_Content);
end;

--ȷ������(��ͨ����)
function determine_process(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5};
	local szCageName = tab_Lightcage[nIndex][3];
	Say("��"..szCageName.."��Ҫ<color=yellow>"..tab_Lightcage[nIndex][9].."��"..tab_Lightcage[nIndex][4]..", 1����, 1�Ѳ���, 1�����<color=red>"..tab_Lightcage[nIndex][5].."<color> ����Ǯ, ����", 2, "�ã���ǰ���ͽ�!/#process_lightcage("..tab_Index[nIndex]..")", "��һ�����!/oncancel");
	
end;

--�������(��ͨ��������)
function process_lightcage(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	
	local szCageName = tab_Lightcage[nIndex][3];
	local bEnough = 1;
	--������
	if (GetCash() < tab_Lightcage[nIndex][5]) then
		bEnough = 0;
	end;
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][2], -1) < tab_Lightcage[nIndex][9]) then
		bEnough = 0;
	end

	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("�͹ٵĲ��ϲ���, <color=red>"..szCageName.."<color> ��Ҫ<color=yellow>"..tab_Lightcage[nIndex][9].."��"..tab_Lightcage[nIndex][4]..", 1����, 1�Ѳ���, 1�����<color=red>"..tab_Lightcage[nIndex][5].."<color> ����Ǯ.", 1, "����ȥ׼��!/oncancel");
		return
	end;
	
	--ɾ������
	if (Pay(tab_Lightcage[nIndex][5]) == 0) then
		return
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	if (ConsumeEquiproomItem(tab_Lightcage[nIndex][9], 6, 1, tab_Lightcage[nIndex][2], -1) ~= 1) then
		return
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
	--������Ʒ
		AddItem(6, 1, tab_Lightcage[nIndex][1], 1, 0, 0, 0);
	--����
		Say("<color=red>"..szCageName.."<color> �����꣬�͹�������?!", 0);
		Msg2Player("��õ� <color=yellow>"..szCageName.."(".."�ر�"..")<color>");
	else
	--������Ʒ
		local iIdx = AddItem(6, 1, tab_Lightcage[nIndex][6], 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--����
		Say("<color=red>"..szCageName.."<color> �����ˣ��������⡣�治����˼��", 0);
		Msg2Player("��õ�<color=yellow>"..szCageName.."<color>");
	end;
end;

--ȷ������(��ʵ���)
function sure_colorfulcage()
	Say("<color=red>��ʵ���<color><color> ��Ҫ��<color=yellow>5�ֵ���ֽ, 1����, 1�Ѳ���, 1����<color> v?<color=red>5000 ��<color> ��Ǯ, ����", 2, "�ã���ǰ���ͽ�!/make_colorfulcage", "��һ�����!/oncancel");
end;

--������ʵ���
function make_colorfulcage()
	local szCageName = "��ʵ���";
	--����Ƿ��Ѿ�����300��
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local w = GetWorldPos();
	local szCityLGName = "midautumn2006_city_"..tostring(w);
	local n_wc_Count = gb_GetTask(szCityLGName, 2);
	if (gb_GetTask(szCityLGName, 1) ~= nDate) then
		gb_SetTask(szCityLGName, 1, nDate);
		n_wc_Count = 0;
	end;
	
	if (n_wc_Count >= AU06_COLORED_LIMITED) then
		Say("�������Ѿ�����<color=yellow>3000����ʵ���<color>�ˣ���̫���ˣ�����������.", 0);
		return
	end;
	
	--������
	local bEnough = 1;
	if (GetCash() < 5000) then
		bEnough = 0;
	end;
	for i = 1221, 1225 do
		if (CalcEquiproomItemCount(6, 1, i, -1) < 1) then
			bEnough = 0;
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("�͹ٵĲ��ϲ���, <color=red>"..szCageName.."<color> ��Ҫ<color=yellow>5�ֵ���ֽ, 1����, 1�Ѳ���, 1����<color> v?<color=red>5000 ��<color> ��Ǯ.", 1, "����ȥ׼��!/oncancel");
		return
	end;
	
	--ɾ������
	if (Pay(5000) == 0) then
		return
	end;
	for i = 1221, 1225 do
		if (ConsumeEquiproomItem(1, 6, 1, i, -1) ~= 1) then
			return
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
		gb_SetTask(szCityLGName, 2, n_wc_Count + 1);
	--������Ʒ
		AddItem(6, 1, 1234, 1, 0, 0, 0);
	--����
		Say("<color=red>"..szCageName.."<color>�Ѿ������ˣ��͹�������?!", 0);
		Msg2Player("��õ�<color=yellow>"..szCageName.."(".."�ر�"..")<color>");
	else
	--������Ʒ
		local iIdx = AddItem(6, 1, 1246, 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--����
		Say("<color=red>"..szCageName.."<color>�Ѿ������ˣ����ǲ�����.�治���⣡", 0);
		Msg2Player("��õ�<color=yellow>"..szCageName.."<color>");
	end;
end;
--	��ᳵ��ű�
--	lixin 2005-12-27
Include("\\script\\global\\station.lua")
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main()
	local tabContent = {"�߹��ĵط�/WayPointFun", "�߹��ĳ���/want2station"};
	if (GetMapType(SubWorld) == 1 and GetTask(TASK_LP_COUNT) ~= 0)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				tinsert(tabContent, "����Ѵ򿪰����أ��鷳�ﴫ��"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."���ܹܰ���/chuanhua");
			end
		end
	end

	tinsert(tabContent, "���ﶼ����ȥ!/OnCancel");
	Say("<#>���򣺴�����ȥ����?", getn(tabContent), tabContent)
	
end;

function chuanhua()
	Say("����"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."�ܹ���æ�����������Ҵ������㣬������ʲô?", 2, "����Ϣ/#rwlp_dedaojianshu(1, 1)", "�뿪/OnCancel")
end;

function want2station()
	Say("<#>������ȥ��: ",8, "���� [800 ��]/#wlls_want2go(1)", "�ɶ� [800 ��]/#wlls_want2go(11)", "���� [800 ��]/#wlls_want2go(162)", "�꾩[800 ��]/#wlls_want2go(37)", "���� [800 ��]/#wlls_want2go(78)", "���� [800 ��]/#wlls_want2go(80)", "�ٰ� [800 ��]/#wlls_want2go(176)", "���ﶼ����ȥ!/OnCancel")
end

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "���踮" },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "�ɶ��� " },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "�꾩��" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "������" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "���ݸ�" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "����" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "�ٰ���" }
}

function wlls_want2go(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	if(GetCash() < 800) then
		Say("����: �Ӱ�ᵽ���������Ҫ800 ��, û�д�·����?",0)
	else
		local count = getn(tbCP_STATION[stationname]) - 1
		local randnum = random(count)
		Msg2Player("�������������ߡ� "..tbCP_STATION[stationname][count+1])
		NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
		SetFightState(0)
		SetPunish(1)
		DisabledUseTownP(0)
		SetRevPos(GetPlayerRev())
		Pay(800)
	end
end

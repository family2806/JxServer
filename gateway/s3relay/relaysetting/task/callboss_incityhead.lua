QY_GOLDBOSS_POS = 
{
["city"] =        {{78,  {{1753,3121},{1670,3462},{1369,3411},{1379,3141}}, "������ "     },	
		    	   {1,   {{1799,3265},{1835,3024},{1436,2953},{1404,3338}}, "���踮"     },	
			       {11,  {{2966,4807},{2999,5266},{3252,5349},{3346,4797}}, "�ɶ���"     },	
			       {80,  {{1934,2861},{1723,3339},{1598,3313},{1538,3041}}, "���ݸ�"     },	
			       {37,  {{1770,3403},{1520,3281},{1535,2902},{2017,2679}}, "�꾩��"     },	
			       {162, {{1404,3417},{1388,3149},{1723,3501},{1785,2986}}, "����"    },	
			       {176, {{1162,2781},{1832,3342},{1247,3354},{1754,2805}}, "�ٰ���"     },},
["ܽ�ض�"] =      {{202, {{1647,3100},{1535,3032},{1618,2950},{1528,2768}}, "ܽ�ض�"     },},
["ɽ����"] =      {{76,  {{1583,2989},{1767,3086},{1671,3220},{1551,3144}}, "ɽ����"     },},
["��ʯ��"] =      {{10,  {{1667,3055},{1773,2935},{1836,3082},{1750,3193}}, "��ʯ��"     },},
["��Ϫ��"] =      {{198, {{1547,2814},{1640,2918},{1687,3025},{1624,3072}}, "��Ϫ��"     },},
["�������"] =  {{336, {{1113,3134},{1241,3038},{1422,3113},{1475,2929}}, "�������" },},
["��ȶ�"] =      {{75,  {{1717,3094},{1614,3191},{1843,3169},{1793,3030}}, "��ȶ�"     },},
["���궴"] =      {{199, {{1445,2959},{1602,3295},{1696,3034},{1852,3174}}, "���궴"     },},
["���춴"] =      {{204, {{1624,3379},{1818,3460},{1527,3529},{1403,3407}}, "���춴"     },},
["����ɽ��"] =  {{322, {{1938,3957},{1697,3511},{1595,3976},{2046,3351}}, "����ɽ��" },},
["������"] =      {{203, {{1626,3049},{1471,2992},{1590,3282},{1792,3234}}, "������"     },},
["ɳĮ 1"] =   {{225, {{1289,3261},{1486,3180},{1401,3284},{1603,3221}}, "ɳĮ 1"  },},
["ɳĮ 2"] =   {{226, {{1623,3118},{1708,3346},{1873,3217},{1789,3050}}, "ɳĮ 2"  },},
["ɳĮ 3"] =   {{227, {{1628,3277},{1658,3050},{1365,3160},{1498,3398}}, "ɳĮ 3"  },},
["��ˮ��"] =      {{181, {{1635,3079},{1415,3041},{1504,3099},{1616,2951}}, "��ˮ��"     },},
["���ж�"] =      {{205, {{1612,3364},{1585,3226},{1495,3110},{1275,3059}}, "���ж�"     },},
["����ɽ�� "] =  {{321, {{1474,3008},{1065,3059},{1007,2626},{1413,2440}}, "����ɽ�� " },},
["Ī�߿�"] =      {{340, {{1893,3275},{1762,2967},{1288,3304},{1447,2798}}, "Ī�߿�"     },},
["��ɽ��"] =      {{342, {{1212,2419},{1253,2924},{1516,2802},{1529,2477}}, "��ɽ��"     },},
["����ɱ�"] =  {{336, {{1531,2535},{1140,2639},{1166,2824},{1425,2793}}, "����ɱ�" },},
["�ر�ɳĮ"] =    {{224, {{1739,2857},{1622,2974},{1784,3096},{1447,3040}}, "�ر�ɳĮ"   },},
["Į����ԭ"] =    {{341, {{1538,2429},{1258,2648},{1331,3182},{1484,3040}}, "Į����ԭ"   },},
}


function qy_makeboss_onlyone_pos()
	for i = 1, getn(QY_GOLDBOSS_APOS_INFO) do
		bossname = QY_GOLDBOSS_APOS_INFO[i][1]
		bossid = QY_GOLDBOSS_APOS_INFO[i][2]
		bosslvl = QY_GOLDBOSS_APOS_INFO[i][3]
		series = QY_GOLDBOSS_APOS_INFO[i][4]
		if(bossid == 748) then
			series = random(0, 4)
		end
		szMap = QY_GOLDBOSS_APOS_INFO[i][5][random(1,getn(QY_GOLDBOSS_APOS_INFO[i][5]))]
		world, posx, posy, worldname = qy_get_bosspos(szMap)
		str = format("�����ഫ %s �ѳ����� %s ������һ����һ��Ѫս!",bossname, worldname)
		
		GlobalExecute(format("dw QY_MakeBoss_RandInCity(%d, %d, %d, %d, %d, %d, [[%s]], [[%s]] )",bossid, bosslvl, series, world, posx, posy, bossname, str ));
		OutputMsg("Create Boss "..bossname..","..bossid..","..bosslvl..","..world..","..posx..","..posy..","..series..date("----%Y%m%d%H%M"))
	end
end

function qy_get_bosspos(szMap)
	local cityidx = random(getn(QY_GOLDBOSS_POS[szMap]))
	local posidx = random(1,getn(QY_GOLDBOSS_POS[szMap][cityidx][2]));
	local world = QY_GOLDBOSS_POS[szMap][cityidx][1]
	local posx = QY_GOLDBOSS_POS[szMap][cityidx][2][posidx][1]
	local posy = QY_GOLDBOSS_POS[szMap][cityidx][2][posidx][2]
	return world, posx, posy, QY_GOLDBOSS_POS[szMap][cityidx][3]
end

--QY_GOLDBOSS_DPOS_INFO
function qy_makeboss_lotsof_pos()
	for i = 1, getn(QY_GOLDBOSS_DPOS_INFO) do
		bossname = QY_GOLDBOSS_DPOS_INFO[i][1]
		bossid = QY_GOLDBOSS_DPOS_INFO[i][2]
		bosslvl = QY_GOLDBOSS_DPOS_INFO[i][3]
		series = QY_GOLDBOSS_DPOS_INFO[i][5]
		str = QY_GOLDBOSS_DPOS_INFO[i][6]
		if(bossid == 748) then
			series = random(0, 4)
		end
		OutputMsg(bossname, bossid, bosslvl, series.."test")
		if (random(100) > 60) then
			world_t, posx_t, posy_t, worldname_t = qy_get_bosspos_incity()
			flag = 0
			for i=1, getn(TAB_CITY_EMPTY) do
				if (world_t == TAB_CITY_EMPTY[i]) then
					flag = 1
					break
				end
			end
			if (flag ~= 1) then
				TAB_CITY_EMPTY[getn(TAB_CITY_EMPTY)+1] = world_t
				world = world_t
				posx = posx_t
				posy = posy_t
				worldname = worldname_t
				str = format("�����ഫ %s �ѳ����� %s ������һ����һ��Ѫս!",bossname, worldname)
				GlobalExecute(format("dw QY_MakeBoss_RandInCity(%d, %d, %d, %d, %d, %d, [[%s]], [[%s]])",bossid, bosslvl, series, world, posx, posy, bossname, str));
			else
				GlobalExecute(format("dw CallBossDown_Outter(%d, [[%s]])", bossid, str))
			end
		else
			GlobalExecute(format("dw CallBossDown_Outter(%d, [[%s]])", bossid, str))
		end
		OutputMsg("Create Boss "..bossname..","..bossid..","..bosslvl..","..series..date("----%Y%m%d%H%M"))
	end
end

function qy_makeboss_fixure(ngroup)
	GlobalExecute(format("dw CallBossDown_Fixure(%d)", ngroup))
end;
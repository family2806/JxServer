IncludeLib("LEAGUE")
function query()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "�ҵı�����Ϣ/selfmatch", "�ҵı�����Ϣ/owntong", "����������Ϣ/whichtong", "˳��·��/no");
end

function owntong()
	Say("���뿴�ĸ���Ŀ�ı�����Ϣ?", 7, "����������Ϣ/owntong_SINGLE", "˫��/owntong_DOUBLE", "���ж�/owntong_FIVE", "ʮ�ɶ�/owntong_TEN", "ʮ����/owntong_SIXTEEN", "��һҳ/query", "�ر�/no");
end

function owntong_SINGLE()
	Say("���뿴�ĸ����ɵĵ���������Ϣ?", 12, "����/owntong_sl", "����/owntong_tw", "����/owntong_tm", "�嶾/owntong_wu", "��ü/owntong_em", "����/owntong_cy", "ؤ��/owntong_gb", "����/owntong_tr", "�䵱/owntong_wd", "ؤ��/owntong_kl", "��һҳ/owntong", "�ر�/no");
end

function owntong_sl()
	local owntongteamname = getowntongname().."��������1_";
	Say("���뿴���ֵ����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(1,'"..owntongteamname.."1')", "��2��".."/#tonginfo(1,'"..owntongteamname.."2')", "��3��".."/#tonginfo(1,'"..owntongteamname.."3')", "��4��".."/#tonginfo(1,'"..owntongteamname.."4')", "��5��".."/#tonginfo(1,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_tw()
	local owntongteamname = getowntongname().."��������2_";
	Say("���뿴���������ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(2,'"..owntongteamname.."1')", "��2��".."/#tonginfo(2,'"..owntongteamname.."2')", "��3��".."/#tonginfo(2,'"..owntongteamname.."3')", "��4��".."/#tonginfo(2,'"..owntongteamname.."4')", "��5��".."/#tonginfo(2,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_tm()
	local owntongteamname = getowntongname().."��������3_";
	Say("���뿴���ŵ����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(3,'"..owntongteamname.."1')", "��2��".."/#tonginfo(3,'"..owntongteamname.."2')", "��3��".."/#tonginfo(3,'"..owntongteamname.."3')", "��4��".."/#tonginfo(3,'"..owntongteamname.."4')", "��5��".."/#tonginfo(3,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_wu()
	local owntongteamname = getowntongname().."��������4_";
	Say("���뿴�嶾�����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(4,'"..owntongteamname.."1')", "��2��".."/#tonginfo(4,'"..owntongteamname.."2')", "��3��".."/#tonginfo(4,'"..owntongteamname.."3')", "��4��".."/#tonginfo(4,'"..owntongteamname.."4')", "��5��".."/#tonginfo(4,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_em()
	local owntongteamname = getowntongname().."��������5_";
	Say("���뿴��ü�����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(5,'"..owntongteamname.."1')", "��2��".."/#tonginfo(5,'"..owntongteamname.."2')", "��3��".."/#tonginfo(5,'"..owntongteamname.."3')", "��4��".."/#tonginfo(5,'"..owntongteamname.."4')", "��5��".."/#tonginfo(5,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_cy()
	local owntongteamname = getowntongname().."��������6_";
	Say("���뿴���̵����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(6,'"..owntongteamname.."1')", "��2��".."/#tonginfo(6,'"..owntongteamname.."2')", "��3��".."/#tonginfo(6,'"..owntongteamname.."3')", "��4��".."/#tonginfo(6,'"..owntongteamname.."4')", "��5��".."/#tonginfo(6,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_gb()
	local owntongteamname = getowntongname().."��������7_";
	Say("���뿴ؤ�ﵥ���ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(7,'"..owntongteamname.."1')", "��2��".."/#tonginfo(7,'"..owntongteamname.."2')", "��3��".."/#tonginfo(7,'"..owntongteamname.."3')", "��4��".."/#tonginfo(7,'"..owntongteamname.."4')", "��5��".."/#tonginfo(7,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_tr()
	local owntongteamname = getowntongname().."��������8_";
	Say("���뿴���̵����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(8,'"..owntongteamname.."1')", "��2��".."/#tonginfo(8,'"..owntongteamname.."2')", "��3��".."/#tonginfo(8,'"..owntongteamname.."3')", "��4��".."/#tonginfo(8,'"..owntongteamname.."4')", "��5��".."/#tonginfo(8,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_wd()
	local owntongteamname = getowntongname().."�������� 9_";
	Say("���뿴�䵱�����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(9,'"..owntongteamname.."1')", "��2��".."/#tonginfo(9,'"..owntongteamname.."2')", "��3��".."/#tonginfo(9,'"..owntongteamname.."3')", "��4��".."/#tonginfo(9,'"..owntongteamname.."4')", "��5��".."/#tonginfo(9,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_kl()
	local owntongteamname = getowntongname().."��������10_";
	Say("���뿴���ص����ĸ�ս�ӵı�����Ϣ?", 7, "��1��".."/#tonginfo(10,'"..owntongteamname.."1')", "��2��".."/#tonginfo(10,'"..owntongteamname.."2')", "��3��".."/#tonginfo(10,'"..owntongteamname.."3')", "��4��".."/#tonginfo(10,'"..owntongteamname.."4')", "��5��".."/#tonginfo(10,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_DOUBLE()
	local owntongteamname = getowntongname().."˫��";
	Say("���뿴�ĸ�ս�ӵ�˫�˶�������Ϣ?", 7, "��1��".."/#tonginfo(11,'"..owntongteamname.."1')", "��2��".."/#tonginfo(11,'"..owntongteamname.."2')", "��3��".."/#tonginfo(11,'"..owntongteamname.."3')", "��4��".."/#tonginfo(11,'"..owntongteamname.."4')", "��5��".."/#tonginfo(11,'"..owntongteamname.."5')", "��һҳ/owntong_SINGLE", "�ر�/no");
end

function owntong_FIVE()
	local owntongteamname = getowntongname().."���ж�";
	Say("���뿴�ĸ�ս�ӵ����ж�������Ϣ?", 5, "��1��".."/#tonginfo(12,'"..owntongteamname.."1')", "��2��".."/#tonginfo(12,'"..owntongteamname.."2')", "��3��".."/#tonginfo(12,'"..owntongteamname.."3')", "��һҳ/owntong", "�ر�/no");
end

function owntong_TEN()
	local owntongteamname = getowntongname().."ʮȫ��";
	Say("���뿴�ĸ�ս�ӵ�ʮȫ��������Ϣ?", 4, "��1��".."/#tonginfo(13,'"..owntongteamname.."1')", "��2��".."/#tonginfo(13,'"..owntongteamname.."2')", "��һҳ/owntong", "�ر�/no");
end

function owntong_SIXTEEN()
	local owntongteamname = getowntongname().."ʮ����";
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "��1��".."/#tonginfo(14,'"..owntongteamname.."1')", "��2��".."/#tonginfo(14,'"..owntongteamname.."2')", "��һҳ/owntong", "�ر�/no");
end

function whichtong()
	Say("���뿴�ĸ�����ı�����Ϣ?", 6, "��1 ~   �� 5/tong_1to5", "Khu 6 ~ Khu10/tong_6to10", "�� 11 ~ ��15/tong_11to15", "��16 ~ �� 22/tong_16to22", "��һҳ/query", "�ر�/no");
end

function tong_1to5()
	Say("���뿴�ĸ�����ı�����Ϣ?", 7, "��1/tong_1", "��2/tong_2", "Khu 3/tong_3", "�� 4/tong_4", "��5/tong_5", "��һҳ/whichtong", "�ر�/no");
end

function tong_6to10()
	Say("���뿴�ĸ�����ı�����Ϣ?", 7, "�� 6/tong_6", "�� 7/tong_7", "��8/tong_8", "�� 9/tong_9", "�� 10/tong_10", "��һҳ/whichtong", "�ر�/no");
end

function tong_11to15()
	Say("���뿴�ĸ�����ı�����Ϣ?", 7, "��11/tong_11", "��12/tong_12", "�� 13/tong_13", "�� 14/tong_14", "�� 15/tong_15", "��һҳ/whichtong", "�ر�/no");
end

function tong_16to22()
	Say("���뿴�ĸ�����ı�����Ϣ?", 8, "��16/tong_16", "�� 17/tong_17", "�� 18/tong_18", "��19/tong_19", "�� 20/tong_20", "�� 22/tong_22", "��һҳ/whichtong", "�ر�/no");
end

function tong_1()
	Say("���뿴�ĸ�����ı�����Ϣ?", 5, "1-1/#othertong('1-1')", "1-2/#othertong('1-2')", "1-3/#othertong('1-3')", "��һҳ/tong_1to5", "�ر�/no");
end

function tong_2()
	Say("���뿴�ĸ�����ı�����Ϣ?", 5, "2-1/#othertong('2-1')", "2-2/#othertong('2-2')", "2-3/#othertong('2-3')", "��һҳ/tong_1to5", "�ر�/no");
end

function tong_3()
	Say("���뿴�ĸ�����ı�����Ϣ?", 5, "3-1/#othertong('3-1')", "3-2/#othertong('3-2')", "3-3/#othertong('3-3')", "��һҳ/tong_1to5", "�ر�/no");
end

function tong_4()
	Say("���뿴�ĸ�����ı�����Ϣ?", 5, "4-1/#othertong('4-1')", "4-2/#othertong('4-2')", "4-3/#othertong('4-3')", "��һҳ/tong_1to5", "�ر�/no");
end

function tong_5()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "5-1/#othertong('5-1')", "5-2/#othertong('5-2')", "��һҳ/tong_1to5", "�ر�/no");
end

function tong_6()
	Say("���뿴�ĸ�����ı�����Ϣ?", 5, "6-1/#othertong('6-1')", "6-2/#othertong('6-2')", "6-3/#othertong('6-3')", "��һҳ/tong_6to10", "�ر�/no");
end

function tong_7()
	Say("���뿴�ĸ�����ı�����Ϣ?", 5, "7-1/#othertong('7-1')", "7-2/#othertong('7-2')", "7-3/#othertong('7-3')", "��һҳ/tong_6to10", "�ر�/no");
end

function tong_8()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "8-1/#othertong('8-1')", "8-2/#othertong('8-2')", "��һҳ/tong_6to10", "�ر�/no");
end

function tong_9()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "9-1/#othertong('9-1')", "9-2/#othertong('9-2')", "��һҳ/tong_6to10", "�ر�/no");
end

function tong_10()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "10-1/#othertong('10-1')", "10-2/#othertong('10-2')", "��һҳ/tong_6to10", "�ر�/no");
end

function tong_11()
	Say("���뿴�ĸ�����ı�����Ϣ?", 5, "11-1/#othertong('11-1')", "11-2/#othertong('11-2')", "11-3/#othertong('11-3')", "��һҳ/tong_11to15", "�ر�/no");
end

function tong_12()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "12-1/#othertong('12-1')", "12-2/#othertong('12-2')", "��һҳ/tong_11to15", "�ر�/no");
end

function tong_13()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "13-1/#othertong('13-1')", "13-2/#othertong('13-2')", "��һҳ/tong_11to15", "�ر�/no");
end

function tong_14()
	Say("���뿴�ĸ�����ı�����Ϣ?", 3, "14-1/#othertong('14-1')", "��һҳ/tong_11to15", "�ر�/no");
end

function tong_15()
	Say("���뿴�ĸ�����ı�����Ϣ?", 3, "15-1/#othertong('15-1')", "��һҳ/tong_11to15", "�ر�/no");
end

function tong_16()
	Say("���뿴�ĸ�����ı�����Ϣ?", 3, "16-1/#othertong('16-1')", "��һҳ/tong_16to22", "�ر�/no");
end

function tong_17()
	Say("���뿴�ĸ�����ı�����Ϣ?", 3, "17-1/#othertong('17-1')", "��һҳ/tong_16to22", "�ر�/no");
end

function tong_18()
	Say("���뿴�ĸ�����ı�����Ϣ?", 3, "18-1/#othertong('18-1')", "��һҳ/tong_16to22", "�ر�/no");
end

function tong_19()
	Say("���뿴�ĸ�����ı�����Ϣ?", 3, "19-1/#othertong('19-1')", "��һҳ/tong_16to22", "�ر�/no");
end

function tong_20()
	Say("���뿴�ĸ�����ı�����Ϣ?", 4, "20-1/#othertong('20-1')", "20-2/#othertong('20-2')", "��һҳ/tong_16to20", "�ر�/no");
end

function tong_22()
	Say("���뿴�ĸ�����ı�����Ϣ?", 3, "22-1/#othertong('22-1')", "��һҳ/tong_16to20", "�ر�/no");
end

function othertong(tongname)
	Say("���뿴�ĸ����ɵı�����Ϣ?", 7, "������������/#othertong_SINGLE('"..tongname.."')", "˫��/#othertong_DOUBLE('"..tongname.."')", "���ж�/#othertong_FIVE('"..tongname.."')", "ʮ�ɶ�/#othertong_TEN('"..tongname.."')", "ʮ����/#othertong_SIXTEEN('"..tongname.."')", "��һҳ/whichtong", "�ر�/no");
end

function othertong_SINGLE(tongname)
	Say("���뿴�ĸ����ɵı�����Ϣ?", 12, "����/#othertong_sl('"..tongname.."')", "����/#othertong_tw('"..tongname.."')", "����/#othertong_tm('"..tongname.."')", "�嶾/#othertong_wu('"..tongname.."')", "��ü/#othertong_em('"..tongname.."')", "����/#othertong_cy('"..tongname.."')", "ؤ��/#othertong_gb('"..tongname.."')", "����/#othertong_tr('"..tongname.."')", "�䵱/#othertong_wd('"..tongname.."')", "����/#othertong_kl('"..tongname.."')", "��һҳ/#othertong('"..tongname.."')", "�ر�/no");
end

function othertong_sl(tongname)
	local othertongteamname = tongname.."���ɵ��� 1_";
	Say("���뿴���ֵ����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(1,'"..othertongteamname.."1')", "��2��".."/#tonginfo(1,'"..othertongteamname.."2')", "��3��".."/#tonginfo(1,'"..othertongteamname.."3')", "��4��".."/#tonginfo(1,'"..othertongteamname.."4')", "��5��".."/#tonginfo(1,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_tw(tongname)
	local othertongteamname = tongname.."���ɵ���  2_";
	Say("���뿴���������ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(2,'"..othertongteamname.."1')", "��2��".."/#tonginfo(2,'"..othertongteamname.."2')", "��3��".."/#tonginfo(2,'"..othertongteamname.."3')", "��4��".."/#tonginfo(2,'"..othertongteamname.."4')", "��5��".."/#tonginfo(2,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_tm(tongname)
	local othertongteamname = tongname.."���ɵ���  3_";
	Say("���뿴���ŵ����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(3,'"..othertongteamname.."1')", "��2��".."/#tonginfo(3,'"..othertongteamname.."2')", "��3��".."/#tonginfo(3,'"..othertongteamname.."3')", "��4��".."/#tonginfo(3,'"..othertongteamname.."4')", "��5��".."/#tonginfo(3,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_wu(tongname)
	local othertongteamname = tongname.."���ɵ���  4_";
	Say("���뿴�嶾�����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(4,'"..othertongteamname.."1')", "��2��".."/#tonginfo(4,'"..othertongteamname.."2')", "��3��".."/#tonginfo(4,'"..othertongteamname.."3')", "��4��".."/#tonginfo(4,'"..othertongteamname.."4')", "��5��".."/#tonginfo(4,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_em(tongname)
	local othertongteamname = tongname.."���ɵ��� 5_";
	Say("���뿴��ü�����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(5,'"..othertongteamname.."1')", "��2��".."/#tonginfo(5,'"..othertongteamname.."2')", "��3��".."/#tonginfo(5,'"..othertongteamname.."3')", "��4��".."/#tonginfo(5,'"..othertongteamname.."4')", "��5��".."/#tonginfo(5,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_cy(tongname)
	local othertongteamname = tongname.."���ɵ���  6_";
	Say("���뿴���̵����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(6,'"..othertongteamname.."1')", "��2��".."/#tonginfo(6,'"..othertongteamname.."2')", "��3��".."/#tonginfo(6,'"..othertongteamname.."3')", "��4��".."/#tonginfo(6,'"..othertongteamname.."4')", "��5��".."/#tonginfo(6,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_gb(tongname)
	local othertongteamname = tongname.."���ɵ���  7_";
	Say("���뿴ؤ�ﵥ���ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(7,'"..othertongteamname.."1')", "��2��".."/#tonginfo(7,'"..othertongteamname.."2')", "��3��".."/#tonginfo(7,'"..othertongteamname.."3')", "��4��".."/#tonginfo(7,'"..othertongteamname.."4')", "��5��".."/#tonginfo(7,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_tr(tongname)
	local othertongteamname = tongname.."���ɵ���  8_";
	Say("���뿴���̵����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(8,'"..othertongteamname.."1')", "��2��".."/#tonginfo(8,'"..othertongteamname.."2')", "��3��".."/#tonginfo(8,'"..othertongteamname.."3')", "��4��".."/#tonginfo(8,'"..othertongteamname.."4')", "��5��".."/#tonginfo(8,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_wd(tongname)
	local othertongteamname = tongname.."���ɵ���  9_";
	Say("���뿴�䵱�����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(9,'"..othertongteamname.."1')", "��2��".."/#tonginfo(9,'"..othertongteamname.."2')", "��3��".."/#tonginfo(9,'"..othertongteamname.."3')", "��4��".."/#tonginfo(9,'"..othertongteamname.."4')", "��5��".."/#tonginfo(9,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_kl(tongname)
	local othertongteamname = tongname.."���ɵ���10_";
	Say("���뿴���ص����ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(10,'"..othertongteamname.."1')", "��2��".."/#tonginfo(10,'"..othertongteamname.."2')", "��3��".."/#tonginfo(10,'"..othertongteamname.."3')", "��4��".."/#tonginfo(10,'"..othertongteamname.."4')", "��5��".."/#tonginfo(10,'"..othertongteamname.."5')", "��һҳ/#othertong_SINGLE('"..tongname.."')", "�ر�/no");
end

function othertong_DOUBLE(tongname)
	local othertongteamname = tongname.."˫��";
	Say("���뿴˫���ĸ�ս����Ϣ?", 7, "��һ��".."/#tonginfo(11,'"..othertongteamname.."1')", "��2��".."/#tonginfo(11,'"..othertongteamname.."2')", "��3��".."/#tonginfo(11,'"..othertongteamname.."3')", "��4��".."/#tonginfo(11,'"..othertongteamname.."4')", "��5��".."/#tonginfo(11,'"..othertongteamname.."5')", "��һҳ/#othertong('"..tongname.."')", "�ر�/no");
end

function othertong_FIVE(tongname)
	local othertongteamname = tongname.."Ng?h�nh ��u";
	Say("���뿴���ж��ĸ�ս����Ϣ?", 5, "��һ��".."/#tonginfo(12,'"..othertongteamname.."1')", "��2��".."/#tonginfo(12,'"..othertongteamname.."2')", "��3��".."/#tonginfo(12,'"..othertongteamname.."3')", "��һҳ/#othertong('"..tongname.."')", "�ر�/no");
end

function othertong_TEN(tongname)
	local othertongteamname = tongname.."ʮȫ��";
	Say("���뿴ʮȫ���ĸ�ս����Ϣ?", 4, "��һ��".."/#tonginfo(13,'"..othertongteamname.."1')", "��2��".."/#tonginfo(13,'"..othertongteamname.."2')", "��һҳ/#othertong('"..tongname.."')", "�ر�/no");
end

function othertong_SIXTEEN(tongname)
	local othertongteamname = tongname.."ʮ����";
	Say("���뿴ʮ�����ĸ�ս�ӵ���Ϣ?", 4, "��һ��".."/#tonginfo(14,'"..othertongteamname.."1')", "��2��".."/#tonginfo(14,'"..othertongteamname.."2')", "��һҳ/#othertong('"..tongname.."')", "�ر�/no");
end

function getowntongname()
	return GetTong();
end

function tonginfo(matchtype, tongname)
	leagueid = matchtype + 10
	print("getinfo-"..leagueid..":"..tongname)
	local lid = LG_GetLeagueObj(leagueid, tongname)
	if(FALSE(lid)) then
		print("С�鲻����");
		Say("���뿴�ĶӲ�����.", 0);
		return 0
	end
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name
		end
		local opp = selfinfo2next( lid, 0 )
		Say("��Ķ�����[<color=red>"..leaguename.."<color>], �ӳ���<color=red>"..captain.."<color> Ŀǰ���ڲμӱ���ѡ�ν׶Σ�����Ϊ<color=red>"..mark.."<color>. �ѹ� <color=red>"..matchcount.."<color> ��������ʤ <color=red>"..wincount.."<color> ������ƽ <color=red>"..drawcount.."<color> ������ <color=red>"..losecount.."<color> ������Ա����"..num.."�ˣ���������:",getn(opp),opp );
	else
		leaugeid = matchtype + 30;
		local lid = LG_GetLeagueObj(leaugeid, tongname)
		local loldid = LG_GetLeagueObj(matchtype + 10,  tongname)
		if(FALSE(loldid)) then
			print("С�鲻����");
			Say("���뿴�ĶӲ�����.", 0);
			return 0
		end
		if(FALSE(lid)) then
			print("С�鲻����");
			Say("���뿴�ĶӲ�����.", 0);
			return 0
		end
		local num = LG_GetMemberCount(loldid);
		local membername = {};
		local captain = "";
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(loldid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( loldid, 0 )
		if ( position == 32 ) then
			positioninfo = "����32��";
		elseif ( position == 16 ) then
			positioninfo = "����16��";
		elseif ( position == 8 ) then
			positioninfo = "����8��";
		elseif ( position == 4 ) then
			positioninfo = "����4��";
		elseif ( position == 2 ) then
			positioninfo = "������";
		else
			print("�����׶β���");
		end
		Say("��ս�ӵ�������[ "..tongname.." ], �ӳ���"..captain..", Ŀǰ����<color=red>"..positioninfo.."<color>. ��Ա����"..num..", ��������:", getn(opp), opp);
	end
end

function selfmatch()
	local tab = {};
	faction = GetLastFactionNumber()+1
	playername = GetName()
	local lid = LG_GetLeagueObjByRole(faction + 10, playername)
	if (not FALSE(lid)) then
		tab[getn(tab) + 1] = "������������/#selfinfo("..faction..")"
	end
	for i = 11, 15 do 
		local lid = LG_GetLeagueObjByRole(i + 10, playername)
		if (not FALSE(lid)) then
			local l_leaguename = LG_GetLeagueInfo(lid)
			tab[getn(tab) + 1] = "ս��["..l_leaguename.."] ���Ѽ���.".."/#selfinfo("..i..")"
		end
	end
	if ( getn( tab ) == 0 ) then
		Say("  Ŀǰ��δ�μ��κγ��α���!", 0)
		return
	end
	tab[getn(tab) + 1] = "����Ҫ/OnCancel"
	--Say("���ִ���Ա����Ҫ��ѯ�Լ�����������أ�", 7, "���ɵ�����/#selfinfo(10)", "˫����/#selfinfo(11)", "�����Ŷ���/#selfinfo(12)", "ʮȫ�Ŷ���/#selfinfo(13)", "16���Ŷ���/#selfinfo(14)", "��һҳ/query", "�ر�/no");
	Say("   ��Ҫ��ѯ�Լ������������?", getn(tab),tab);
end

function selfinfo(teamtpye)
	local playername = GetName();
	local lid = LG_GetLeagueObjByRole(teamtpye + 10,playername);
	if(FALSE(lid)) then
		print("С�鲻����");
		Say(" ��δ�μӸñ�����Ŀ", 0);
		return 0
	end
	local leaguename = LG_GetLeagueInfo(lid)
	local mark = LG_GetLeagueTask(lid, 3);
	local matchcount = LG_GetLeagueTask(lid, 9);
	local position = LG_GetLeagueTask(lid, 5);
	local wincount = LG_GetLeagueTask(lid, 6);
	local drawcount = LG_GetLeagueTask(lid, 7);
	local losecount = LG_GetLeagueTask(lid, 8);
	if ( position == 0 ) then
		local num = LG_GetMemberCount(lid);
		local membername = {};
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lid, 0 )
		
		Say("��Ķ�����[<color=red>"..leaguename.."<color>], �ӳ���<color=red>"..captain.."<color> Ŀǰ���ڲμӱ���ѡ�ν׶Σ�����Ϊ<color=red>"..mark.."<color>. �ѹ� <color=red>"..matchcount.."<color> ��������ʤ <color=red>"..wincount.."<color> ������ƽ <color=red>"..drawcount.."<color> ������ <color=red>"..losecount.."<color> ������Ա����"..num.."�ˣ���������:",getn(opp),opp );
	else
		leaugeid = teamtpye + 30;
		local lcirleid = LG_GetLeagueObjByRole(teamtpye + 10,playername);	--ѭ������lid
		local szleaguename = LG_GetLeagueInfo(lcirleid)
		local lid = LG_GetLeagueObj(leaugeid,szleaguename);	--��̭����lid
		if(FALSE(lcirleid)) then
			print("С�鲻����");
			Say("���뿴�ĶӲ�����.", 0);
			return 0
		end
		
		if(FALSE(lid)) then
			print("С�鲻����");
			Say("���뿴�ĶӲ�����.", 0);
			return 0
		end
		local num = LG_GetMemberCount(lcirleid);
		local membername = {}
		local captain = ""
		for i = 0, num -1 do
			local name,job = LG_GetMemberInfo(lcirleid, i);
			if ( job == 1 ) then
				captain = name
			end
			membername[i + 1] = name;
		end
		local opp = selfinfo2next( lcirleid, 0 )
		if ( position == 32 ) then
			positioninfo = "��ǿ32��";
		elseif ( position == 16 ) then
			positioninfo = "��ǿ16��";
		elseif ( position == 8 ) then
			positioninfo = "��ǿ8��";
		elseif ( position == 4 ) then
			positioninfo = "��ǿ4��";
		elseif ( position == 2 ) then
			positioninfo = "������";
		else
			print("�����׶β���");
		end
		Say("��Ķ�����[ "..leaguename.." ], �ӳ���"..captain..",������<color=red>"..positioninfo.."<color>. ��Ա����"..num..", ��������:", getn(opp), opp);
	end
end

function no()
end

function FALSE(value)
	if (value == nil or value == 0) then
		return 1
	end
	return nil
end

function selfinfo2next( lid, num )
	local count = LG_GetMemberCount(lid);
	local membername = {};
	local opp = {}
	local captain = ""
	for i = 0, count -1 do
		local name,job = LG_GetMemberInfo(lid, i);
		if ( job == 1 ) then
			captain = name
		end
		membername[i + 1] = name;
	end
	if ( getn(membername) - num > 10 ) then
		for i = num+1, num+10 do
			opp[ getn(opp) + 1 ] = membername[i].."/#selfinfo2next("..lid..","..(num+10)..")"
		end
		opp[getn(opp)+1] = "��һҳ/#selfinfo2next("..lid..","..(num+10)..")"
	else
		for i = num+1, getn( membername ) do
			opp[getn(opp) + 1] = membername[i]
		end
	end
	opp[getn(opp)+1] = "�ر�/no"
	if( num == 0 ) then
		return opp
	end
	Say("��������������Ա:", getn(opp), opp)
end

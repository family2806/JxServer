--by ��־ɽ [2006-09-12]
--2006����֮�������,��������
--Illustration: ���� -- lightcage au06- -- midautumn2006

if (not __H_MIDAUTUMN_06__) then
	__H_MIDAUTUMN_06__ = 1;

Include([[\script\lib\pay.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

EXP_AWARD_LIMIT = 50000000;
AU06_TK_EXP = 1776;

AU06_BEGINDATE = 20060930;
AU06_ENDDATE = 20061013;

AU06_COLORED_LIMITED = 3000;


--�������ݱ�
tab_Lightcage = {
--		1	2		3		4		5		6		7	8		9
	{1229, 1221, "�ʵ�����", "��ɫ����ֽ(������������)", 1000, 1241, 1235, "��ͨ�±�", 2},
	{1230, 1222, "���ǵ���", "��ɫ����ֽ(������������)", 2000, 1242, 1236, "��ɳ�±�", 2},
	{1231, 1223, "��״����", "��ɫ����ֽ(������������)", 3000, 1243, 1237, "�����±�", 2},
	{1232, 1224, "Բ�ε���", "��ɫ����ֽ(������������)", 4000, 1244, 1238, "�����±�", 2},
	{1233, 1225, "�������", "��ɫ����ֽ(������������)", 5000, 1245, 1239, "�����±�", 1},
	{1234, 1225, "��ʵ���", "��ɫ����ֽ(������������)", 5000, 1245, 1240, "�����±�", 5},
}

tab_BasicMaterial = {
	{1226, "����(������������)"},
	{1227, "�Ѳ���(������������)"},
	{1228, "����"},
}

--�Ƿ��ڻ�ڼ� ���أ�1�� ,0 ���ڻ�ڼ�
function au06_is_inperiod()
	if (gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		return 0
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= AU06_BEGINDATE and nDate <= AU06_ENDDATE) then --
		return 1;
	end;
	return 0;
end;

--�Ƿ�Ϊ50����ֵ�û�
function au06_IsPayed_player()
	if (IsCharged() == 0) then
		return 0;
	end;
	return 1;
end;

function oncancel()
end;

end;	--//end of __H_MIDAUTUMN_06__
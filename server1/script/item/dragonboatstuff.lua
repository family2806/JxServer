function main()
	local a = "С���� = 1����ͷ+1����β+1������+1������+4���ֽ�+1����+1����";
	local b = "<enter>��ͳ���� = 1��С����+4���ֽ�";
	local c = "<enter>��ͷ���� = 1��С����+1����ͳ����+1����ͷ";
	Say(a..b..c, 2, "��һҳ/nextpage", "�ر�/no");
	return 1;
end

function nextpage()
	local d = "��ͷ���� = 1����ͷ����1��+1����ͳ����+1����ͷ";
	local e = "<enter>�������� = 1����ͷ����+1����ͷ����+1����ͷ";
	local f = "<enter>�������� = 1����������+1����ͷ����+1����ͷ����";
	Say(d..e..f, 2, "��һҳ/main", "�ر�/no");
end

function no()
end
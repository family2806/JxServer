SKILLTYPE = 670;
SKILLLEVEL2 = 5;
SKILLLEVEL3 = 0;
SKILLEFECT = "��10��������ת���ٶ�";

function main()
	AddSkillState(SKILLTYPE, SKILLLEVEL2, SKILLLEVEL3, 10 * 18); --�ڶ��������Ǽ��ܵļ���
	Msg2Player("<#>����� <color=0xB5FDD7>"..SKILLEFECT.."<color>");
end

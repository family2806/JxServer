--���˽����
--����������ף����
IL("SETTING")
TEMPSK_ITEM_PID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
tbTeacherDay200711CardBless = 
{
	[1588] = {szName = "ʦ���ؿ�", GreetingWord = "���ڸ�ʦ����ף����", szBless = "<color=green>%s<color>  ףʦ��<color=green>%s<color> Ǯ����ˮ���ڽ�����."},
	[1589] = {szName = "���Ӻؿ�", GreetingWord = "���ڸ����Ӽ�ף����", szBless = "<color=green>%s<color> ף����<color=green>%s<color> ѧҵ��ͨ�����ճ���."},
	[1590] = {szName = "���Ѻؿ�", GreetingWord = "���ڸ�������ף����", szBless = "<color=green>%s<color> ף����<color=green>%s<color> �������ͣ�����Ԫ��."},
	[1591] = {szName = "���˺ؿ�", GreetingWord = "���ڸ�������ף����", szBless = "<color=green>%s<color> ף���� <color=green>%s<color> �����죬ȫ����."},
	[1592] = {szName = "���ؿ�", GreetingWord = "���ڸ������ף����", szBless = "<color=green>%s<color> ף���<color=green>%s<color> ��ս��ʤ�����˻ƽ�."},
	[1593] = {szName = "�����ؿ�", GreetingWord = "���ڸ�������ף����", szBless = "<color=green>%s<color> ף����<color=green>%s<color> �书������һͳ����"},
	[1594] = {szName = "ʦ�úؿ�", GreetingWord = "���ڸ�ʦ����ף����", szBless = "<color=green>%s<color> ףʦ��<color=green>%s<color> Ư���ɰ������ճ���"},
	[1595] = {szName = "�����ؿ�", GreetingWord = "���ڸ�������ף����", szBless = "<color=green>%s<color> ף����<color=green>%s<color> �񹦻��壬�����޵�."},
	[1596] = {szName = "ʦ�ܺؿ�", GreetingWord = "���ڸ�ʦ����ף����", szBless = "<color=green>%s<color> ףʦ��<color=green>%s<color> �������������ճ���."},
	[1597] = {szName = "ʦ�ֺؿ�", GreetingWord = "���ڸ�ʦ����ף����", szBless = "<color=green>%s<color> ףʦ�� <color=green>%s<color> ѧ���񹦣���������."},
}

function TeacherDay200711_card_main(nParti)
	SetTaskTemp(TEMPSK_ITEM_PID, nParti);
	Say(tbTeacherDay200711CardBless[nParti].GreetingWord, 2,"�͸�/TeacherDay200711_card_want2present", "����/TeacherDay200711_card_OnCancel");
	return 1
end

function TeacherDay200711_card_want2present()
	AskClientForString("TeacherDay200711_card_PlayerSelect", "", 1, 16, "������Է�����");
end

function TeacherDay200711_card_PlayerSelect(szRoleName)
	if (ST_CheckTextFilter(szRoleName) ~= 1) then
		Say("�Բ���������������в�������֣�������һ��!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szRoleName, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("�Բ���������������в�������֣�������һ��!", 0)
			return
		end
	end
	local nParti = GetTaskTemp(TEMPSK_ITEM_PID)
	if (nParti == 0) then
		return
	end
	SetTaskTemp(TEMPSK_ITEM_PID,0)
	local szBless = format(tbTeacherDay200711CardBless[nParti].szBless,GetName(),szRoleName);	
	if (CalcEquiproomItemCount(6, 1, nParti, -1) >= 1) then
		ConsumeEquiproomItem(1, 6, 1, nParti, -1);
		AddGlobalNews(szBless,1);
		SetTask(TSK_TeacherDay200711_CardUseTime,GetCurServerTime());
	else
		Say(format("û�ҵ�%s, ������!",tbTeacherDay200711CardBless[nParti].szName), 0)
	end
end

function TeacherDay200711_card_BlessPlayerOnline(szBless)
	
end

function TeacherDay200711_card_OnCancel()
	SetTaskTemp(TEMPSK_ITEM_PID,0)
end
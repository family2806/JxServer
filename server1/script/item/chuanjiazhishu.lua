--����֮��
Include("\\script\\event\\teacher_day_200711\\head.lua");

-- ÿ����ɫֻ��ͨ���Ҵ�֮����߻��5�ھ���ֵ������ ��
--

function main()
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local nExpLimit = GetTask(TSK_TeacherDay200711_UseExpLimit); 
	if ( nExpLimit >= TeacherDay200711_UseExpLimit) then
		Say("ʹ�üҴ��ؼ��Ѵﾭ��ֵ���ޣ�������ʹ����.",0)
		return 1;
	end
	if (GetLevel() < 50) then
		Say("�����ź���ֻ�����<color=yellow>50������<color> ����ʹ�ø��ؼ�.",0)
		return 1;
	end
	if (nDate < TeacherDay200711_START_TIME or nDate > TeacherDay200711_UseLimitTime) then
		Say("��ѽ���������ʹ��!",0);
		return 0;
	end
	--2.000.000 ����ֵ
	--1,5% ���ʻ��1���ɺ챦ʯ
	AddOwnExp(2000000);
	SetTask(TSK_TeacherDay200711_UseExpLimit,nExpLimit+2000000);
	if (random(1,10000) <= 150) then
		AddItem(4,353,1,1,0,0)
		Msg2Player(format("���%d %s",1,"���챦ʯ"))
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tGetItem %d %s2007��Խ�Ͻ�ʦ�ڻ",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),1,"���챦ʯ"));			
	end
	return 0;
end
--5.1�Ͷ��ڻ�ű�
--By LiuKuo 2005.4.20
IncludeLib("NPCINFO")

BOSSLASTDATE = tonumber(date("%d")) --��һ�λƽ�Boss���ٻ������� ֻ��¼��
BOSSMAXCOUNT = 3	--ÿ�쵥�������ٳ��Ļƽ�Boss���������ÿ̨gameserver�����ޣ���24��
BOSSNOWCOUNT = 0 --��ǰ�ٻ��Ļƽ�Boss��

--���µ�ͼ����
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--�ƽ�Boss	{ID,Name,Series}
GoldenBoss = {{562, "��������", 4},
			  {563, "Ү�ɱ���", 3},
			  {564, "����ѩ��", 3},
			  {565, "��ľ�", 3},
			  {566, "�Ű�", 0},
			  {567, "������", 2},
			  {568, "����Ʈ", 2},
			  {582, "������", 1},
			  {583, "�ϲ���", 3},
			  {739, "����", 0},
			  {740, "������ʦ", 0},
			  {741, "�Ʋ�Ⱦ", 1},
			  {742, "��ӨӨ", 1},
			  {743, "����ʦ̫", 2},
			  {744, "��Сٻ", 2},
			  {745, "������", 3},
			  {746, "��˼��", 4},
			  {747, "�����", 4},
			  {748, "����", 1},
			  {751, "����",0}}

--����Boss {ID,Name,Series}
DamahuBoss = {{751, "����",0},
			  {752, "����",0},
			  {753, "����",1},
			  {754, "����",1},
			  {755, "����",2},
			  {756, "����",2},
			  {757, "����",3},
			  {758, "����",3},
			  {759, "����",4},
			  {760, "����",4}}
			  
--СBoss	{ID,Name}
NormalBoss = {{511, "������"},
			  {513, "����"},
			  {523, "������"},
			  {725, "ˮ������"}}
			  
--ɱ������Boss	{ID,Name,��߱��}
MiniBoss = {{851, "������", 79},
			{852, "�Ƕ���", 80},
			{853, "���׵�", 81},
			{854, "�����޽�", 82},
			{855, "����", 83},
			{856, "ӦХ��", 84},
			{857, "Ԭ��Ϧ", 85},
			{858, "������", 86}}

--����npc	{ID,Name}	ͬһ�в�ͬ��id��Ӧ��ͬ�ȼ����ֵ�droprate
GoldenNpc = {{859, 859, 859, 859, 860, 861, 862, 863, "�׻�"},
			 {864, 864, 864, 864, 865, 866, 867, 868, "��Ҷ��"},
			 {869, 869, 869, 869, 870, 871, 872, 873, "ɽ��"},
			 {874, 874, 874, 874, 875, 876, 877, 878, "ˮ��"},
			 {879, 879, 879, 879, 880, 881, 882, 883, "��ɳ"},
			 {884, 884, 884, 884, 885, 886, 887, 888, "��ǹ"},
			 {889, 889, 889, 889, 890, 891, 892, 893, "����"},
			 {894, 894, 894, 894, 895, 896, 897, 898, "�˷�"},
			 {899, 899, 899, 899, 900, 901, 902, 903, "�ɹ���ʿ"},
			 {904, 904, 904, 904, 905, 906, 907, 908, "˪��"}}
			 
--��ͨnpc	{ID,Name}
NormalNpc = {{2, "���ϻ�"},
			 {37, "��Ҷ��"},
			 {169, "ɽ��"},
			 {674, "ˮ��"},
			 {703, "��ɳ"},
			 {708, "��ǹ"},
			 {589, "����"},
			 {713, "�˷�"},
			 {673, "�ɹ���ʿ"},
			 {598, "˪��"}}

function CallBoss( Level, Series )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--��ս��������
		Msg2Player("����ս��״̬����ʹ��");
		return 1
	end
	for i = 249, 318 do	--ϴ�赺ɽ��
		if ( i == nMapId ) then
			Msg2Player("�˴�����ʹ�ô���Ʒ");
			return 1
		end
	end	
	for i = 375, 415 do	--�����ν�ս����ͼ ���������ͼ �������ͼ
		if ( i == nMapId ) then
			Msg2Player("�˴�����ʹ�ô���Ʒ");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--�����ͼ����
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("�˴�����ʹ�ô���Ʒ");
			return 1
		end
	end
	local nNowDate = tonumber(date("%d"));
	
	if ( nNowDate == BOSSLASTDATE ) then	--����ϴ��ٻ������ǵ���Ļ�
		if ( BOSSNOWCOUNT >= BOSSMAXCOUNT ) then	--�����ٻ�������������ٻ��ƽ�Boss
			print("���ٻ��Ļƽ�Boss���ѳ�������.")
			nBossRate =  random( 101, 10000);
		else
			nBossRate = random( 1, 10000);
		end
	else	--����ϴ��ٻ������뵱ǰ����ͬһ��
		BOSSLASTDATE = nNowDate;	--�������������
		BOSSNOWCOUNT = 0;	--��ǰ�ٻ�����0
		nBossRate = random( 1, 10000);
	end
	
	if( Level < 90 ) then
		nBossRate =  random( 101, 10000);
	end
	
	if( nBossRate <= 100 ) then		--�ٻ��ƽ�Boss
		local i = random( 1, getn(GoldenBoss));
		local GoldenBossId = GoldenBoss[i][1];
		local GoldenBossName = GoldenBoss[i][2];
		local GoldenBossSeries = GoldenBoss[i][3];
		if( GoldenBossId == 748 ) then	--�����������
			GoldenBossSeries = random( 0, 4);
		end
		if( GoldenBossId == 751 ) then	--�������
			i = random( 1, getn(DamahuBoss));
			GoldenBossId = DamahuBoss[i][1];
			GoldenBossName = DamahuBoss[i][2];
			GoldenBossSeries = DamahuBoss[i][3];
		end
		AddNpcEx( GoldenBossId, 95, GoldenBossSeries, SubWorldID2Idx(W), X * 32, (Y +  5)* 32, 1, GoldenBossName, 1 );
		BOSSNOWCOUNT = BOSSNOWCOUNT + 1;	--��ǰ�ٻ��Ļƽ�Boss����1
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] �ٻ��ƽ�Boss:"..GoldenBossName);
		Msg2Player("���ٻ���һ���ƽ�Boss:"..GoldenBossName);
	elseif ( nBossRate > 100 and nBossRate <= 300 ) then	--�ٻ�СBoss
		local i = random( 1, getn(NormalBoss));
		local NormalBossId = NormalBoss[i][1];
		local NormalBossName = NormalBoss[i][2];
		AddNpcEx( NormalBossId, 95, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, NormalBossName, 1 );
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] �ٻ�СBoss:"..NormalBossName);
		Msg2Player("���ٻ���һ��СBoss:"..NormalBossName);
	elseif ( nBossRate > 300 and nBossRate <= 3000 ) then	--�ٻ�ɱ��Boss
		local i = floor( Level - 20 ) / 10 + 1;	--����ɱ��ﵵĵȼ�ѡ���ٻ���ɱ��Boss
		local MiniBossId = MiniBoss[i][1];
		local MiniBossName = MiniBoss[i][2];
		local MaskId = MiniBoss[i][3];
	 	AddNpcEx( MiniBossId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, MiniBossName, 1 );
	 	Msg2Player("���ٻ���һ��ɱ��Boss"..MiniBossName);
	 	AddItem( 0, 11, MaskId, 1, 0, 0 );	--�����ٳ���Boss�����һ�����
	 	Msg2Player("��õ�һ�����");
	elseif ( nBossRate > 3000 and nBossRate <= 6000 ) then	--�ٻ�����
		local i =  random( 1, getn(GoldenNpc));		--���ѡһ������npc
		local j =  floor( Level - 20 ) / 10 + 1;	--����ɱ��ﵵĵȼ�ȡ��Ӧdroprate������
		local GoldenNpcId = GoldenNpc[i][j];
		local GoldenNpcName = GoldenNpc[i][9];
		NPCINFO_AddBlueNpc( Series, GoldenNpcId, Level, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, GoldenNpcName, 15 );	--�������ֵĽű������һ����������ģ��
		Msg2Player("���ٻ���һ������:"..GoldenNpcName);
	else	--�ٻ���ͨ��
		local i = random( 1, getn(NormalNpc));
		local NormalNpcId = NormalNpc[i][1];
		local NormalNpcName = NormalNpc[i][2];
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X* 32, (Y +  5) * 32, 1, NormalNpcName, 0 );
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y -  5) * 32, 1, NormalNpcName, 0 );
		Msg2Player("��ֻ���ٻ�һЩ��ͨ��");
	end
	return 0	
end

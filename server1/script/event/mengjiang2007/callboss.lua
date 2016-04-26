
--zero 20070712 �ٻ�boss

IncludeLib("NPCINFO")
IncludeLib("TASKSYS");
Include("\\script\\global\\forbidmap.lua");


--���µ�ͼ����
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--Boss	{ID,Name,Level,Series}
mengjiangBoss ={{562, "��������",95,4},--1 ����
	{565, "��������",95,3},--2
	{741, "����ɱ��",95,1},--3
	{744, "��������",95,2},--4
	{1284, "��ڽ���",95,-1},--5 ����
	{511, "������",95,4},--6 ����
	{513, "����",95,2},--7
	{523, "������",95,1},--8
	{725,"ˮ������",85,-1},--9 ͭ��
	{851, "������",20,-1},--10 ������ľ��
	{852, "�Ƕ���",30,-1},--11
	{853, "���׵�",40,-1},--12
	{854, "�����޽�",50,-1},--13
	{855, "����",60,-1},--14
	{856, "ӦХ��",70,-1},--15
	{857, "Ԭ��Ϧ",80,-1},--16
	{858, "������",90,-1}--17
}

function CallBoss( lingpai  )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--��ս��������
		Msg2Player("��ս��״̬�޷�ʹ��");
		return 1
	end
	for i = 249, 318 do	--ϴ�赺ɽ��
		if ( i == nMapId ) then
			Msg2Player("�����޷�ʹ�ô���Ʒ");
			return 1
		end
	end	
	for i = 375, 415 do	--�����ν�ս����ͼ ���������ͼ �������ͼ
		if ( i == nMapId ) then
			Msg2Player("�����޷�ʹ�ô���Ʒ");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--�����ͼ����
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("�����޷�ʹ�ô���Ʒ");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("�ٻ����Ʋ����������������ʹ��.");
		return 1
	end;
	if(lingpai == 1) then -- ľ��
		i = random(10,17);	
		summonBoss(i);
		WriteLog(format("[�ٻ��ͽ�]\t%s\tAccount:%s\tName:%s\t%s ʹ�óɹ�",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"ľ��"));
	 elseif(lingpai == 2 ) then--ͭ��
		summonBoss(9)
		WriteLog(format("[�ٻ��ͽ�]\t%s\tAccount:%s\tName:%s\t%s ʹ�óɹ�",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"ͭ��"));
	elseif(lingpai == 3 ) then --����
		i= random(6,8);
		summonBoss(i);
		WriteLog(format("[�ٻ��ͽ�]\t%s\tAccount:%s\tName:%s\t%s ʹ�óɹ�",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"����"));
	elseif(lingpai == 4) then --����
		summonBoss(5);
		WriteLog(format("[�ٻ��ͽ�]\t%s\tAccount:%s\tName:%s\t%s ʹ�óɹ�",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"����"));
	elseif(lingpai == 5) then --����
		if( CalcFreeItemCellCount() < 10) then
			Say("����������������������ռ䣨����10����λ��.",0);
			return 1;
		end
		local equit_index=random(159,167);--�����������
		AddGoldItem(0,equit_index);
		for i=1,5 do
			summonBoss(i);
		end
		Msg2SubWorld(format("��� %s �� %s(%d,%d) �Ѿ�ʹ�ã�ʹ��ڽ�������.",GetName(),SubWorldName(SubWorld),floor(X/8),floor((Y+5)/16),"����"));
		WriteLog(format("[�ٻ��ͽ�]\t%s\tAccount:%s\tName:%s\t%s ʹ�óɹ�",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"����"));
	end
	return 0;
end
function summonBoss(mengjiang_index)
	local W,X,Y = GetWorldPos();
	BossId = mengjiangBoss[mengjiang_index][1];
	BossName = mengjiangBoss[mengjiang_index][2];
	BossLevel = mengjiangBoss[mengjiang_index][3];
	BossSeries = mengjiangBoss[mengjiang_index][4];
	if(BossSeries == -1) then BossSeries = random(0,4) end;
	AddNpcEx( BossId,BossLevel ,BossSeries, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1,BossName, 1 );
	Msg2Player(format("���Ѿ��ٻ��� %s",BossName));
end

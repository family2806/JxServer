-- ��ʳ��
IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	local npcidx = GetLastDiagNpc();
	
	-- ����ͬʱ����һ���������ˣ����ٲ���
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end;
	
	-- �����ڽ�����
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("flagobj Event error, because Mission no Start, yet");
		return 
	end
	
	-- ����Ѿ�������ʱ������������һ��
	if (BT_GetData(PL_PARAM3) ~= 0) then
		Msg2Player("��������һ����ʳ,�����ٶ����������ˡ�");
		return
	end
	
	-- �����ķ���������ʳ�������������͡�����Ȼ���˻ر�����Ӫ
	BT_SetData(PL_PARAM3, 1);
	
	Msg2Player("�����ڿ�һ����ʳ������˵�������Ӫ.");
	if (GetCurCamp() == 1) then
		ChangeOwnFeature(0,0,1341);	-- �ı��������Ϊ������������
	else
		ChangeOwnFeature(0,0,1342);	-- �ı��������Ϊ������������
	end
	
	local W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe ��<color=yellow>%s<color=0x00FFFF> �� <color=yellow>%d, %d<color=0x00FFFF> �����ʳ��, ������<color=yellow>��Ӫ",
										GetName(),X1,Y1))
		AddSkillState(460, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
	else
		Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t�i <color=yellow>%d, %d<color=0x9BFF9B> �����ʳ��, ������<color=yellow>��Ӫ",
										GetName(),X1,Y1))
		AddSkillState(461, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
	end
		
	AddSkillState(656,30,0,100000) --����ҵ��ٶ�
	
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;

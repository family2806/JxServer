Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\missions\\bw\\bwhead.lua");


szCaptainName = {};
function main()
do Talk(1, "", "��̨��δ����.") return end
	--���÷��ص�
	x,y,z = GetWorldPos();
	SetTask(BW_SIGNPOSWORLD, x);
	SetTask(BW_SIGNPOSX, y);
	SetTask(BW_SIGNPOSY, z);
	szCaptainName = bw_getcaptains(); --��ȡ���Ӷӳ������֣�

	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		ErrorMsg(3) 
		return
	end;
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local MemberCount =GetMissionV(MS_MAXMEMBERCOUNT)
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("���Ǹ�������ʿ�������ӱ�������̨�����������ڻ�û���˱��������������뱨����<color=yellow>������̨��ѿ���<color>", 3, "�ð�!/OnRegister", "�����ù�����ʲô?/OnHelp", "����һ��!/OnCancel");
	elseif (ms_state == 1) then
		Say("������̨�������ڶ�<color=yellow>"..szCaptainName[1].."<color> �Ͷ�<color=yellow>"..szCaptainName[2].."<color> ����<color=yellow>"..MemberCount.." vs "..MemberCount.."<color>, ����ʲôҪ����?",4,"����ѡ�֣�������̨./OnShowKey", "����ѡ�֣����������./OnEnterMatch", "���뿴�ⳡ����./OnLook", "�ҶԱ���û����Ȥ./OnCancel")
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	SubWorld = OldSubWorld;
end;

function OnRegister()
	--����
	if (GetTeamSize()  ~= 2) then
		Say("�뱨������Ҫ��<color=yellow>�ӳ�<color> ˫������Ķ�������˲���<color=yellow>2<color>��.", 0);
		return
	end;

	if (IsCaptain() ~= 1) then 
		ErrorMsg(5)
		return
	end;

	Say("��������̨����, ˫����������?", 9, "�뿪!/OnCancel", "1 vs 1/#SignUpFinal(1)", "2 vs 2/#SignUpFinal( 2 )", "3 vs 3/#SignUpFinal( 3 )","4 vs 4/#SignUpFinal( 4 )","5 vs 5/#SignUpFinal( 5 )","6 vs 6/#SignUpFinal( 6 )","7 vs 7/#SignUpFinal( 7 )","8 vs 8/#SignUpFinal( 8 )");
end;

function SignUpFinal(MemberCount)
	if (GetTeamSize()  ~= 2) then
		Say("��Ҫ��������Ӧ���� <color=yellow>�ӳ�<color> ˫������Ķ�����񲻹�<color=yellow>2<color> ��.", 0);
		return
	end;
	
	if (MemberCount <= 0 or MemberCount > 8) then
		return
	end
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	ms_state = GetMissionV(MS_STATE);

	if (ms_state ~= 0) then 
		ErrorMsg(8)
		return
	end
	OpenMission(BW_MISSIONID);
	local x = GetTask(BW_SIGNPOSWORLD);
	if x == 80 then
		SetMissionS(CITYID,"����")
	elseif x == 78 then
		SetMissionS(CITYID,"����")
	else
		SetMissionS(CITYID,"�ɶ�")
	end;
	
	local key = {};
	key = bw_getkey();
	SetMissionV(MS_TEAMKEY[1], key[1]);
	SetMissionV(MS_TEAMKEY[2], key[2]);
	
	OldPlayerIndex = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = GetTeamMember(i);
		SetMissionS(i, GetName());
		szCaptainName = bw_getcaptains(); --��ȡ���Ӷӳ������֣�
		if (MemberCount > 1) then
			Msg2Player("�����ϳ��Ķ�����: <color=yellow> ["..key[i].."]<color>, ����߸���Ա����Ա������ƽ˾����������ֺ����ϳ�.");			
			local szMsg = format("��ƽ˾: ���� %s��%s֮��ǼǱ������Ͽ��볡�������� %d���Ӻ���ʽ��ʼ����������:<color=yellow>[%d]<color=>, ���������ͨ������Ա��Ҫ����������ϳ�.",MemberCount, MemberCount, floor(GO_TIME/3),key[i])
			Say(szMsg,0)
			
		end
		branchTask_BW1()	--��������أ��μ��˱������м���
	end;
	
	PlayerIndex = OldPlayerIndex;
	SetMissionV(MS_MAXMEMBERCOUNT, MemberCount)
	SubWorld = OldSubWorld;
	str = "<#> ����"..GetMissionS(CITYID)..szCaptainName[1].."��<#> ������"..szCaptainName[2].."��<#>, ������̨׼����ʼ������˫���ӳ���"..szCaptainName[1].."<#>��"..szCaptainName[2].."<#>. ��̨��ѿ��ţ���ӭ��λ�ۿ�����.";
	--AddGlobalNews(str);
	local szMsg = format("���ѵǼ���%s��%s֮�����, �Ͽ��ϳ���%d���Ӻ������ʽ��ʼ.",MemberCount, MemberCount, floor(GO_TIME/3))
	Msg2Team(szMsg);
end;

function bw_getkey()
	local key = {};
	key[1] = random(1, 9999)
	key[2] = random(1, 9999)
	
	--��֤key1 key2>0, key1 ~= key2
	if (key[2] == key[1]) then
		if (key[1] < 9996) then
			key[2] = key[1] + 3
		else
			key[2] = key[1] - 3;
		end
	end
	return key;
end;



function OnHelp()
	Talk(5, "",	"������̨���໥�д�Ͷ�˫���ƽ�ĵط�.",	"��μ���̨������Ҫ�ȵ������ﱨ��.",	"���˱�֤��֮�󣬱����μ���̨����������ˣ����������н��ޣ���������˱���ʱ����˲��ܱ���!",	format("��ƽ˾: �Ǽǳɹ�֮��˫�����Ե�׼������׼��ʱ���� <color=yellow>%d<color> ��, ׼��ʱ������󣬱�������ʽ��ʼ!", floor(GO_TIME/3)) , 	format("��ƽ˾: ����ʱ����<color=yellow>%d<color> ��, ����� %d���ӻ�û��ȷ��Ӯ�Ķӣ�����Ϊ�;�.", floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3), floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3) ));
end;

function OnEnterMatch()
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		return
	end;
	
	if ((GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2])) then 
		OnJoin(0)	--�������ʲô������ the only param stand for the group ID;
	else
		Say("��������ε���̨��������ϳ�.",2, "���ˣ�������ȥ/OnEnterKey", "��������ˣ��������ʶӳ�/OnCancel")
	end;
	SubWorld = OldSubWorld;
end

function OnEnterKey()
	AskClientForNumber("OnEnterKey1", 0, 10000, "������������:");
end

function OnEnterKey1(Key)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		SubWorld = OldSubWorld;
		return
	end;
	if (Key == GetMissionV(MS_TEAMKEY[1])) then
		OnJoin(1)
	elseif (Key == GetMissionV(MS_TEAMKEY[2])) then
		OnJoin(2)
	else
		Say("������˼���������Ų��ԣ���ȷ��һ�λ���ȥ�ʶӳ���лл!",0)
	end
	SubWorld = OldSubWorld;
end

function OnLook()
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local str = szCaptainName[1].."��<#> �� "..szCaptainName[2].."�� <#> ׼����ʼ��̨�����ˣ����¾���˭��ȡ������ʤ��?";
	local str1 = "���������<#> xem/onwatch";
	Say(str, 2, str1, "�ҲµĲ��ԣ�����ȥ��/OnCancel");
	SubWorld = OldSubWorld;
end;

function onwatch()
	OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		return
	end;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2]) then 
		SubWorld = OldSubWorld
		OnJoin(0)	--�ӳ����ܽ��й�ս
	else
		OnJoin(3);	--���뵽���ڵ�
	end;
end

--to join in a fight group	group --��
function OnJoin(group)
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx < 0) then
		return
	end;
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) then 
		JoinCamp(1)
	elseif (GetName() == szCaptainName[2]) then 
		JoinCamp(2)
	elseif (group == 1 or group == 2) then
		local masteridx = SearchPlayer(GetMissionS(group))
		local masternum = 0
		if (masteridx > 0) then
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) > 0) then
				masternum = 1
			end
		end
		if (GetMSPlayerCount(BW_MISSIONID, group) - masternum < GetMissionV(MS_MAXMEMBERCOUNT) - 1) then
			JoinCamp(group)
		else
			ErrorMsg(10)
		end;
	elseif (group == 3) then
		JoinCamp(3);
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
end;

function OnFighting()
	str = "<#> ����"..szCaptainName[1].."��<#> v��"..szCaptainName[2].."��<#> ���ڱ���. ";
	Say(str, 1, "֪����. /OnCancel");
end;

function OnCancel()
end;

function ErrorMsg(ErrorId)
	if (ErrorId == 1) then 
		Say("�����μӱ���Ҫ���������֮��ſ��Ա���!",0)
	elseif (ErrorId == 2) then 
		Say("�μӱ�����˫��û�д�������.",0)
	elseif (ErrorId == 3) then 
		Say("������������ϵGM!",0);
	elseif (ErrorId == 4) then 
		Say("�㲻�Ǳ�������ѡ����˲���������ֻ�ܹۿ�!", 0);
	elseif (ErrorId == 5) then 
		Say("�����˱����Ƕӳ�",0);
	elseif (ErrorId == 6) then 
		Say("�������������!",0);
	elseif (ErrorId == 7) then 
		Say("������˼���㻹û�б����ۿ�����!",0);
	elseif (ErrorId == 8) then
		Say("������˼������֮ǰ�Ѿ����˵Ǽ���!",0);
	elseif (ErrorId == 9) then 
		Say("������˼�������Ѿ���ʼ�ˣ��㲻�ܽ�������!",0);
	elseif (ErrorId == 10) then 
		Say("������������!",0);
	else
		
	end;
	return
end;
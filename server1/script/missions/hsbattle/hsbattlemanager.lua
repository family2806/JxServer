--��������
--1��������ڵ�Npc�Ի���ѡ�����ڼ���ս��
--2��������ϲ������������ս���ڣ���һ�ŵ�ͼ��������0��Ӫģʽ����
--3����������ߵ�Npc�Ի�������ѡ��������Ӫ��
--4�����Pk�������Զ����Գ����⣬���ڱ���ͼ��
--5�����������ʱ�����Զ���ͬ��ͼ��������ҹ�����ǰ��ս����
--6��������ԣ����Դ�Npc�Ի����˽⵱ǰ��������
--7���������԰��յȼ��ֳɸ�������
--��ս����Npc��ѡ����Ӫ��Npc

Include("\\script\\missions\\hsbattle\\hshead.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\missions\\huashanqunzhan\\dailog.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
--[DinhHQ]
--20110330: change request 30/03/2011
do
	Talk(1, "", "������ʱ�ر�")
	return
end
	local tbSay = 
	{
		"<dec><npc>����������ʲô�£�",
		"��ɽ������̨/HSBattle_Dailog_Main",
	}
	tinsert(tbSay, "��ɽ��̨/#huashanqunzhan_SignUpMain(1)")
	tinsert(tbSay, "�����Ի�/OnCancel")
	CreateTaskSay(tbSay)
end;


function HSBattle_Dailog_Main()
	--���÷��ص�
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("Ŀǰ��Ȼû���˱�����̨��������ʿ��������?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("Ŀǰ��Ȼû���κΰ�ᱨ������! ��ʿ��������?", 3, "����!/OnRegister", "�����̨��������ô���ģ�/OnHelp", "��������!/OnCancel");
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	
	SubWorld = OldSubWorld;
end


function OnHelp()
	Talk(8, "",	"�����̨�ǽ����ϸ����ѧϰ���յĵط������ǹ�ƽ�����ĵص�",	"��μӰ����̨��������Ҫ���������룬��������Ҫ�Ǳ������İ�����",	"��Ӻ�2�߶ӳ��������������߰���ÿ����Ҫ��1000����. ",	"����󣬱������������������2����������ʱ�򣬲��ܱ���",	"����ɹ������߳�Ա��10���ӽ��붷����Ȼ�󣬱�����ʽ��ʼ!" ,"ʤ��ȡ����˫���Ļ���������õ�����Ա�öԷ����˵ģ������3�֣��Է����۳�1��", 	"�����������ĸ����Ļ��ָߣ������ʤ��!",	"���⣬�ڱ���ʱ�������һ��û�б�����Ա�ˣ���ʤ����������һ��. ","սʤ�İ������ջ�500���������⻹�ܻ��400�����ͽ��12000�㾭��ֵ�����һ�������û��Ѹ���Ǯ����Ҫ���۳�14000���ᾭ��ֵ. ");
end;

function OnRegister()
--����
	if (GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		return
	else
		if (IsCaptain() ~= 1) then 
			ErrorMsg(5)
			return
		end;
		
		OldPlayer = PlayerIndex;
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
			if (GetTongFigure() ~= TONG_MASTER or GetCash() < MS_SIGN_MONEY) then 
				PlayerIndex = OldPlayer
				ErrorMsg(2)
				return
			end;
		end;
		PlayerIndex = OldPlayer;
		
		TongIdTab = {};
		TongNameTab = {};
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
				if (Pay(MS_SIGN_MONEY) == 0) then
					WriteLog(GetTongName().."��ύ"..MS_SIGN_MONEY.."�����̨���������Ѳ��ɹ�!!!! ");
					PlayerIndex = OldPlayer
					ErrorMsg(3)
					return
				else
					TongNameTab[i], TongIdTab[i] =  GetTongName();
					WriteLog(TongNameTab[i].."��ύ"..MS_SIGN_MONEY.."�����̨���������ѳɹ�! ");
				end;
		end;
		PlayerIndex = OldPlayer;
		
		OldSubWorld = SubWorld;
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then
			ErrorMsg(3) 
			return
		end;
		SubWorld = idx;
		
		OpenMission(MISSIONID);
		for i  = 1, 2 do 
			SetMissionV(MS_TONG1ID + i - 1, TongIdTab[i]);
		end;
		
		SetMissionS(1, TongNameTab[1]); --1��2����MissionString��Ű�������
		SetMissionS(2, TongNameTab[2]);
		
		str = "<#> ��ʼ�����̨������Ϊ"..TongNameTab[1].."<#> ��"..TongNameTab[2];
		AddGlobalNews(str);
		SubWorld = OldSubWorld;
		Msg2Team("��λ����ɱ�������׼����10���Ӻ���ʽ��ս");
		Say("��λ����ɱ�������׼����10���Ӻ���ʽ��ս",0);
	end;
end;

function OnReady()
	str = "<#> Ŀǰ�����̨�����ڽ��붷���׶Σ���"..GetMissionS(1).."<#> ��"..GetMissionS(2).." ����Ա<#> �����붷����׼����ʼ����!";
	Say(str, 2, "���ʺ�������������붷��/OnJoin", "�����˻��������ұ�ø�ǿ�� /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("˫��������������������Ҫ������Ӻ��������. ",0)
elseif (ErrorId == 2) then 
	Say("������������Ŀǰ����Ķӳ�������Ҫ����500����",0)
elseif (ErrorId == 3) then 
	Say("�������ֹ��ϣ�����ϵ����Ա ",0);
elseif (ErrorId == 4) then 
	Say("�㲻�����ڱ����İ��ĳ�Ա�����ܽ���!", 0);
elseif(ErrorId == 5) then 
	Say("������������Ŀǰ����Ķӳ�",0);
else
	
end;

return
end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	if (GetTongName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetTongName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 2) then
		SetFightState(1)
	elseif(ms_state == 1) then  
		SetFightState(0)
	else
		return
	end;
	SubWorld=OldSubWorld
	
end;

function OnFighting()
	str = "<#> Ŀǰ�����̨���ڽ��б�������"..GetMissionS(1).."<#> ��"..GetMissionS(2).."<#> ����Ա�����������!";
	Say(str, 2, "�ҷ���������������붷��/OnJoin", "�Ҳ������������Ҳ������! /OnCancel");
end;

function OnCancel()
end;

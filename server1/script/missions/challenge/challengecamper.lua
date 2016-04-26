--CheckCondition() ��Ҫ�ú������ڼ���Ƿ���ϼ�������

Include("\\script\\missions\\challenge\\challengehead.lua");

function main()

	V = GetMissionV(MS_STATE);
	
	--��������׶εĻ���֪ͨʣ��ʱ��
	--���ս���׶εĻ���֪ͨս��ʣ��ʱ��
	if (V == 1) then 
		V1 = GetMissionV(MS_NEWSVALUE);
		RestTime = (GO_TIME - V1) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		str = "<#> �������ڱ����׶Σ�����ʱ�仹ʣ:"..RestMin.."<#>��"..RestSec.."<#>��";
		Msg2Player(str);
	elseif(V == 2) then
		gametime = (floor(GetMSRestTime(MISSIONID,11) / 18));
		RestMin, RestSec = GetMinAndSec(gametime);
		str = "<#>��������ս���׶Σ�ս��ʱ�仹��:"..RestMin.."<#>��"..RestSec.."<#>��";
		Msg2Player(str);
	end
	
	--��չ��6��ֵ���Ϊ1����ʾ�ý�ɫ����ս������Ա��������Npc���볡����
	if (GetExtPoint(6) == 1 or GetCamp() == 6 ) then 
		Say("��̨������ս���Ĺ����ˣ�����ʲô���԰�����", 7 ,  "����Ʒ�������/GetYellow", "�����Ϸ�������/GetPurple" , "�������Աߵ�����/GetWhite", "���������ϵ���������/ClearItems", "��ս��/GoWarCenter", "�뿪ս��/LeaveCenter",  "����һ��/OnCancel");
		return
	end;
	
	--�����׶�	
	if (V == 1) then
		HaveCamp1 = HaveItem(350);--�Ʒ�
		HaveCamp2 = HaveItem(347);--�Ϸ�
		HaveCamp3 = HaveItem(348);--����
		
		--���û���κε��볡���ߵĻ�
		if (HaveCamp1 == 0 and HaveCamp2 == 0 and HaveCamp3 == 0) then 
			Say("��û���κ�һ��'Ӣ������'�����ܽ�ȥ!", 0)
			return
		end;
		if (GetTeamSize() == 0)  then
			Say("�㻹δ��ӣ����ܽ�ȥ!",0);
			return
		end;
		
		str1 = "<#> ��Ķ�����"..GetTeamSize().."<#>��! ��������ı�?";
		Say(str1 ,4, "�������Ʒ�/JoinYellow", "��������Ϸ�/JoinPurple", "�����ȥ�ι�/JoinWhite", "������һ��/OnCancle");
	
	elseif (V == 2) then --��ս�׶�
		HaveCamp3 = HaveItem(348);
		if (HaveCamp3 == 1) then
			Say("��������Ҷ��Ӣ����. ��Ҫ��ս�����뿪?", 3, "����������/GoWarCenter", "�뿪����/LeaveWar", "������һ��/OnCancel");
		end;
	elseif (V == 0) then
		Say("��α�����ս��ʱ�仹û�е�",0);
	end;
	
end;

function ClearItems()
	ClearItem(347);
	ClearItem(348);
	ClearItem(350);
end;

function ClearItem(ItemId)

Count = GetItemCount(ItemId);
if (Count >= 1) then
	for i = 1, Count do 
		DelItem(ItemId)
	end;
end;

end;


function JoinYellow()
	if (HaveItem(350) >= 1) then
		CheckAndJoinCamp(1)		
	else
		Say("��û�а���Ӣ������ܽ�ȥ!",0);
	end;
end;

function JoinPurple()
	if (HaveItem(347) >= 1) then
		CheckAndJoinCamp(2)		
	else
		Say("��û��Ѫ��Ӣ������ܽ�ȥ!",0);
	end;
end;

function JoinWhite()
	if (HaveItem(348) >= 1) then 
		CheckAndJoinCamp(6)
	else
		Say("��û��Ҷ��Ӣ������ܽ�ȥ!", 0);
	end;
end;


function GetYellow()
	AddEventItem(350);
end;

function GetPurple()
	AddEventItem(347);
end;

function GetWhite()
	AddEventItem(348);
end;


function OnCancel()

end;

function GoWarCenter()
	AddMSPlayer(MISSIONID, 6);
	SetCurCamp(0)
	NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3]);
end;

function LeaveCenter()
	LeaveGame(0)	
	SetCurCamp(GetCamp())
end;


function CheckAndJoinCamp(Camp)
	
	if (IsCaptain() == 0) then
		Say("�㻹û����ӻ��߲��Ƕӳ������ܽ���! ",0);
		return
	else
		bHaveJoin = GetMissionV(MS_S_JOINED + Camp - 1);
		if (bHaveJoin == 1) then 
			Say("�����Ѿ�����һ����ʹ��ͬһ����ɫ��Ӣ�����ս��", 0);
		return
		end;
	end;
				
	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT) then
		Say("��ӵ����������޶�����������ٽ�ȥ!" , 0);
		return
	else
		OldPlayer = PlayerIndex;
		W,X,Y = GetWorldPos();
		Size = GetTeamSize();
		
		for i = 1, Size do 
			PIdx = GetTeamMember(i);
			if (PIdx > 0) then 
				PlayerIndex = PIdx;
				W1,X,Y = GetWorldPos();
				if (W1 ~= W) then 
					PlayerIndex = OldPlayer
					Say("�����������һ���˲���׼�����������֮���ٽ�ȥ����!",0);
					return
				end;
			end
		end;
		
		PlayerIndex = OldPlayer;
		
		if (Camp == 1) then 
			DelItem(350);
		elseif (Camp == 2) then 
			DelItem(347)
		else
			DelItem(348)
		end

		JoinCampInTeam(Camp);
	end;
	
end;

function JoinCampInTeam(Camp)
	OldPlayer = PlayerIndex;
	local TeamTab = {};
	Size = GetTeamSize();
	Joined = 0;
	for i = 1, Size do 
		TeamTab[i] = GetTeamMember(i);
	end;
	for i = 1, Size do
		PlayerIndex = TeamTab[i];		
		if (Camp ~= 6 and GetLevel() < 30) then 
			Msg2MSAll(MISSIONID, GetName().."<#> û�г���30�������ܲμ�!");
		else
			Joined = Joined + 1;
			JoinCamp(Camp)
		end;
	end;
	if (Joined >= 1) then
		SetMissionV(MS_S_JOINED + Camp - 1, 1);	
	end;

	PlayerIndex = OldPlayer;
	
end;

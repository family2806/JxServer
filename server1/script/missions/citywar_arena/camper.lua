--����ĳһ����Npc��Ӧ�ű�
--BattleId�ⲿ��ȫ�ֱ�������ʾ��ǰ��ս����ͼ�ı��(1-8)

--HaveBeginWar(CityID) -- CityID(1-7)		//����ĳ�������Ƿ��ѿ�ս,����ֵΪһ��BOOLֵ
--GetCityAreaName(CityID)					//ȡ1��7�ĳ�������,����ֵΪһ���ַ���
--GetCityWarBothSides(CityID)				//��ù��������ط��İ����,���������ַ���,������ֱ�����������ط�
--NotifyWarResult(CityID, WarResult)		//��������֮��֪ͨRelay�������(WarResultΪBOOLֵ��ʾ���Ƿ��Ƿ�ʤ��)
--GetCityWarTongCamp(TongName)				//��ò��빥��ս��ػ�İ����Ӫ������INT����Ӫ����ֵ
--IsArenaBegin(ArenaID) -- ArenaID(0-7)		//��õ�ǰ������̨�����Ƿ�ʼ������BOOL
--GetArenaCityArea(nArenaID)				//��õ�ǰ���ڽ��е���̨��������ĸ�����,����ֵΪCityID
--GetArenaBothSides(ArenaID)				//���ĳһ����̨��˫��������,���������ַ���,������ֱ����׷��ҷ�
--NotifyArenaResult(ArenaID, ArenaResult)	//֪ͨһ����̨�������ı��������Relay, ArenaResultΪBOOLֵ��ʾ�ļ׷��Ƿ��ʤ
--GetArenaLevel()							//��õ�ǰ��̨�������ִΣ�����ֵ 0:�����Ѿ�����������δ��ʼ��1:��һ�֣�2/3/4/5�Դ�����
--GetArenaTotalLevel()						//��õ�ǰ��̨�������ִ�
--GetCurArenaInfo()							//��õ�ǰ�ִε�����
--GetArenaTotalLevelByCity(CityID)			//���ĳ��������̨�������ִ�
--GetArenaInfoByCity(CityID, ArenaLevel)	//���ĳ��������̨����������,ArenaLevel: 0-Based

Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\lib\\common.lua")
function main()
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		WorldID = SubWorldIdx2ID(SubWorld);
		ArenaID = WorldID - 213;
		if (IsArenaBegin(ArenaID) ~= 0) then
			Tong1, Tong2 = GetArenaBothSides(ArenaID);
			Tong1 = safeshow(Tong1)
			Tong2 = safeshow(Tong2)
			Say(Tong1.."��"..Tong2.."����׼��ս����������׼���ţ�ÿ���˶�׼����", 0);
		else
			Say("ս��ʱ�仹û�е�!", 1, "֪���ˣ�����ȥ/OnCancel");
		end;
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(3)
	end;
end;

function OnHelp()
	Talk(8, "",	"�����̨�ǽ����ϸ����֮���д����յĵط�������һ����ƽ��������̨", "��Ҫ�μӰ����̨��Ҫ�����������룡������Ӧ���Ǳ������İ�����", "���֮��˫���ӳ�Ҫ��������˫������ÿ��Ҫ��Iǧ��������", "���˶���֮�󣬱������������ˡ���2���������ڼ䲻�ܱ���", "����ɹ���˫����Ա��10���Ӽ��������֮���������ʽ��ʼ!","ʤ��������˫���ı������֡�ÿλ����Ա���Է������˵Ľ���3�����֣��Է����۳�1������", "�������������ָߵİ�Ὣȡ��ʤ����", "���⣬��������һ��û�г�Ա�ٱ�����ʤ����������һ��", "ʤ���İ�Ὣ�����ջ��ѽ��ɵ�1ǧ���������⣬�����Եõ�800�����Ľ�����1��2ǧ���ᾭ�顣ʧ�ܵİ�᲻������ѽ��ɵķ��ã���Ҫ�۳�1��4ǧ���ᾭ��");
end;

function OnReady()
	V = GetMissionV(MS_NEWSVALUE);
	RestTime = (GO_TIME - V) * 20;
	
	if (RestTime < 0) then 
		RestTime=0
	end;
	
	RestMin, RestSec = GetMinAndSec(RestTime);

	str = "<#>���������б���"..GetMissionS(3).."<#>������ս�����ڱ��������:"..GetMissionS(1).."<#> ��"..GetMissionS(2).."<#>, �볡ʱ�仹��"..RestMin.."<#> ��"..RestSec.."<#> ��.";
	Say(str, 2, "�ҷ�����������Ҫ������ /OnJoin", "�Ҳ���������/OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("��Ҫ���������˫������Ҫ�����֮�����������",0)
elseif (ErrorId == 2) then 
	Say("��������Ҫ����μӱ����İ��ӳ�������Ҫ����1000����",0)
elseif (ErrorId == 3) then 
	Say("�������ϣ�����ϵ������Ա��",0);
elseif (ErrorId == 4) then 
	Say("�㲻�Ǳ���˫�����ĳ�Ա���������е��������������ܽ�ȥ!", 0);
elseif(ErrorId == 5) then 
	Say("����������Ҫ���ڶ���Ķӳ�",0);
else
	
end;

return
end;

function OnJoin()
	if (GetTongName() == GetMissionS(1)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(1);
		else
			Say("��������ʱ��̫���ˣ����ܲμ�ս��!", 0);
		end;
	elseif (GetTongName() == GetMissionS(2)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(2);
		else
			Say("T��������ʱ��̫���ˣ����ܲμ�ս��!", 0);
		end;
	else
		ErrorMsg(4)
	end;
end;

function OnFighting()
	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#>����˫����������"..GetMSPlayerCount(MISSIONID, 1).."<#> "..GetMSPlayerCount(MISSIONID, 2).."<#>. ʱ�仹ʣ��"..RestMin.."<#>�� "..RestSec.."<#>��.";
	str = "<#>���ڰ��"..GetMissionS(1).."<#>��"..GetMissionS(2).."<#>���ڽ���";
	Say(str..str1, 0);
end;

function OnCancel()

end;

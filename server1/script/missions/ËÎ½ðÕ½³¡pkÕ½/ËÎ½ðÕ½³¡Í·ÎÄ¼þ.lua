FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����
MAX_S_COUNT = 100;
MAX_J_COUNT = 100;
TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 60 * 60  * FRAME2TIME; -- ��սʱ��Ϊ1Сʱ

MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս�������У�3��ʾս�۸ոս�����

MS_SJTASKID = 20;
MS_J_DEATHCOUNT = 3; --�����м�¼��������������ı���ID
MS_S_DEATHCOUNT = 4; --�����м�¼��������������ı���ID

MS_S_SIGHCOUNT  = 5;--�������η�������������
MS_J_SIGHCOUNT  = 6;--�����н𷽹�����������
MS_KEY = 7;		--��¼��ǰ��ͼ�������һ��key����һ��������ɵ�����

MS_S_NPCDEATH = 8; -- �����м�¼��ս��Npc�������������������ID
MS_J_NPCDEATH = 9; -- �����м�¼��ս��Npc�������������������ID

MS_NEWSVALUE = 10; --�����д�����ű����ĵط�

MS_S_SHOWKING = 11; --0 means uncondition, 1 means condition but time no come ,2 mean all condition is ok ,and have showed.
MS_J_SHOWKING = 12;
MS_FIRSTSHOW = 13; --1 means Song , 2 means Jing


SJTASKID = 230; 	--��¼��ҵ�ǰ����ID
SJTASKVLAUE = 231; 	--��¼��ҵ�ǰ�����ֵ,��¼������,��Ϊ1����Ϊ2
SJTASKKEY = 232; 	--��¼��ҵ�ǰ�����key��
SJKILLNPC = 233; 	--��¼���ɱNpc����
SJKILLPK = 234; 	--��¼���PK�������

MS_TOTALPK = 250;	--��¼��Ҵ���������ҵ��ܴ���
MS_TOTALKO = 251;	--��¼�����PKս���б��������ܴ���

MS_SHOWKINGCOUNT = 100; --ĳ��Npc��������������������������ֵʱ�����������ܳ���
MS_PKCOUNT	= 50;--ĳ�������������,������������ֵ�����������ܳ���


GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- ����ʱ��Ϊ��Сʱ
SHOWKINGTIME1 = 3600 * FRAME2TIME / TIMER_1 ;
SHOWKINGTIME2 = 4200 * FRAME2TIME / TIMER_1;

MS_SIGN_MONEY = 3000; --������


sj_aryItems = {
	{ "�ɲ�¶", {6,1,71,1,0,0}, 20 },
	{ "������", {6,0,2,1,0,0}, 5 },
	{ "������", {6,0,5,1,0,0}, 5 },
	{ "������", {6,0,4,1,0,0}, 5 },
	{ "������", {6,0,1,1,0,0}, 5 },
	{ "������", {6,0,6,1,0,0}, 5 },
	{ "������", {6,0,10,1,0,0}, 5 },
	{ "������", {6,0,7,1,0,0}, 5 },
	{ "�����", {6,0,9,1,0,0}, 5 },
	{ "�׷���", {6,0,8,1,0,0}, 5 },
	{ "������", {6,0,3,1,0,0}, 30 },
	{ "�̻�", {6,0,11,1,0,0}, 1 },
	{ "õ�廨��", {6,0,20,1,0,0}, 2 },
	{ "������ӳ��", {6,1,18,1,0,0}, 5 },
		}
-------------------------------------------------------------------------
function GameOver()
idx = 0;

for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1,idx, 0);
	if (idx == 0) then 
 		break
 	end;
	if ( GetMSIdxGroup(1, idx) == 2) then --jing
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(100,45)
--		SetFightState(1)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 1585,3215);
	else				--song
		PlayerIndex = pidx;
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0)
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetRevPos(78,33)
--		SetFightState(1)
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		SetPKFlag(0)
		NewWorld(44, 886,4499);
	end;
end;


end;
-------------------------------------------------------------------------
-------------ս��ȡ���Ļ����黹��ҵı�����------------------------------
function GiveBackBonus()
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, 0);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(MS_SIGN_MONEY);
 	end;
end;
end
-------------------------------------------------------------------------
function WinBonus(WinGroup, LoserGroup)
resultstr = "";
LCount = GetMissionV(LoserGroup + 4);
WCount = GetMissionV(WinGroup + 4);

TotalMoney = (LCount + WCount) * MS_SIGN_MONEY * 0.9 
Winner = GetMSPlayerCount(1, WinGroup);
if (Winner > 0) then
	Bonus = TotalMoney / Winner;
else 
	Bonus = MS_SIGN_MONEY;
end;

MaxNpc_idx = 0;
MaxPK_idx = 0;
MaxNpc_c = 0;
MaxPK_c = 0;
sj_itemcount = getn(sj_aryItems)
idx = 0;
for i = 1 , 500 do 
	idx, pidx = GetNextPlayer(1, idx, WinGroup);
 	if (idx == 0) then 
		break
	end;
 
 	if (pidx > 0) then
   		PlayerIndex = pidx;
   		Earn(Bonus + MS_SIGN_MONEY);
   		AddLeadExp(500);				-- By Dan(ͳ�ʾ����1000��Ϊ500)
   		AddRepute(3);					-- By Dan(������20��Ϊ3)
   		Msg2Player("Xin ch�c m�ng phe b�n �� gi�nh chi�n th�ng! Danh v�ng t�ng 3 �i�m, T�i l�nh ��o t�ng 500 �i�m!")


		randitem = random(1, sj_itemcount);
		if (randitem > 0) then
			local szItemName = sj_aryItems[randitem][1];
			local arySelItemID =  sj_aryItems[randitem][2];
			AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
			Msg2Player("Xin ch�c m�ng b�n nh�n ���c <#>"..szItemName);
		end;
		
   		
   		if (GetTask(SJKILLNPC) > MaxNpc_c) then 
   			MaxNpc_idx = pidx
			MaxNpc_c = GetTask(SJKILLNPC)
   		end;
   		
   		if (GetTask(SJKILLPK) > MaxPK_c) then 
   			MaxPK_idx = pidx;
			MaxPK_c = GetTask(SJKILLPK)
   		end;
 	end;
end;


-----------ɱNpc�����˵õ�һ��װ��
if (MaxNpc_idx > 0) then 
	PlayerIndex = MaxNpc_idx ;
	sex = GetSex();
	if (sex == 0) then --��װ
	--���·� ,����Ϊ0,2,0-13(0,6 ��, 7,13Ů),8-9,0-4,70-99
		p1 = random(0,6);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> T�ng �i�m ti�u di�t Npc phe ��ch cao nh�t thu�c v� "..GetName().."<#>, b�n ti�u di�t "..MaxNpc_c.."<#> k� ��ch!";
	else
	--���·� ,����Ϊ0,2,0-13(0,6 ��, 7,13Ů),8-9,0-4,70-99
		p1 = random(7,13);
		p2 = random(8,9);
		p3 = random(0,4);
		p4 = random(50,70);
		AddItem(0,2,p1,p2,p3,p4,6,6,0,0,0,0);
		resultstr = "<#> T�ng �i�m ti�u di�t Npc phe ��ch cao nh�t thu�c v� "..GetName().."<#>, b�n ti�u di�t "..MaxNpc_c.."<#> k� ��ch!";
	end;
	AddRepute(30)
	Msg2Player("B�n nh�n ���c 30 �i�m danh v�ng v� m�t b� trang b�!");
end;

-----------PK���������˵õ�һ������
if (MaxPK_idx > 0) then
	PlayerIndex = MaxPK_idx ;
	--p1 = random(0,5);
	--p2 = random(8,9);
	--p3 = random(0,4);
	--p4 = random(70,99);
	--AddItem(0,0,p1,p2,p3,p4,7,7,7,0,0,0);
	--Msg2Player("������һ������!");
	AddRepute(15)
	AddLeadExp(5000);				-- By Dan(ͳ�ʾ����1000��Ϊ500)
	Msg2Player("Xin ch�c m�ng, trong tr�n n�y b�n l� ng��i c� ch� s� PK cao nh�t! Nh�n ���c 15 �i�m danh v�ng, t�i l�nh ��o t�ng 5000 �i�m!")
	resultstr = resultstr .."<#>Binh s� c� ch� s� PK cao nh�t l� "..GetName().."<#>,s� l��ng :"..MaxPK_c;
end;

return resultstr;

end;

-------------------------------------------------------------------------
function SJ_JoinJ()
LeaveTeam()
AddMSPlayer(1,2);
SetCurCamp(2);
SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);
SetPos(47584/32, 106880/32);
SetPunish(0);
--SetRevPos(100,45)
SetRevPos(44,50)
SetTempRevPos(44, 1573*32 ,3874 * 32);
SetCreateTeam(0);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 2);
str = GetName().."<#>tham gia doanh tr�i phe Kim";
Msg2MSAll(1,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\missions\\�ν�ս��pkս\\��������1.lua");

--��Ϊ��ҽ��˱����ѣ���ʽ�����������ʾ�Ի�

Talk(2, "", "Ch�o m�ng Kim binh s�! Hi�n t�i T�ng binh v�n ch�a xu�t hi�n, ch�ng ta h�y ngh� ng�i v� ch� l�nh", "�� t�m th�y T�ng binh, l�p t�c ch�p h�nh m�nh l�nh!");
end;
-------------------------------------------------------------------------

function SJ_JoinS()
LeaveTeam()
AddMSPlayer(1,1);
SetCurCamp(1);
SetTaskTemp(200,1);
SetFightState(0);
str = GetName().."<#>tham gia doanh tr�i phe T�ng";
SetDeathScript("\\script\\missions\\�ν�ս��pkս\\��������.lua");
SetLogoutRV(1);
SetCreateTeam(0);
SetPunish(0)
--SetRevPos(78,33)
SetRevPos(44,49)
SetPos(31168/32, 133472/32);
SetTempRevPos(44, 1515 * 32, 3980 * 32);
Msg2MSAll(1,str);
SetTask(SJTASKID, MS_SJTASKID);
SetTask(SJTASKKEY, GetMissionV(MS_KEY));
SetTask(SJTASKVLAUE, 1);
SetPKFlag(1)
ForbidChangePK(1);
Talk(2,"","Ch�o m�ng T�ng binh s�! Hi�n t�i Kim binh v�n ch�a xu�t hi�n, ch�ng ta h�y ngh� ng�i v� ch� l�nh","�� t�m th�y Kim binh, l�p t�c ch�p h�nh m�nh l�nh!");
end;

-------------------------------------------------------------------------
--Group��ʾ�Ի����������ķ��ģ�1Ϊ�Σ�2Ϊ��
--State��ʾ��ǰս�۵�״̬
function CheckLastBattle(Group, State)

if (Group == 1) then 
	JoinFun = SJ_JoinS;
else
	JoinFun = SJ_JoinJ;
end;

local MKey = GetMissionV(MS_KEY); --��ǰս�۵�ΨһKey��
local Taskid = GetTask(SJTASKID); --��ս�����͵�ID
local TaskV = GetTask(SJTASKVLAUE);

if (Taskid == MS_SJTASKID) then 
	local TaskKey = GetTask(SJTASKKEY)
    if (TaskKey == MKey) then 
		if (TaskV == Group) then
			JoinFun();
			if (State == 2) then
				SetFightState(1);
			end;
			Msg2Player("Ch�o m�ng b�n tr� l�i v�i chi�n tr��ng!");
		elseif (State == 2) then
			return 2 --��ʾ�ǵ�ǰ��Ӫ
		else 
			return 0
		end
		return 1;
	else
--		Say("������ְ�������˴����ս����",0);
		return 0;
	end;
end;
return 0;
end;
-------------------------------------------------------------------------
function CheckGoFight()
  V1 = GetMissionV(5);
  V2 = GetMissionV(6);
  if (V1 >= MAX_S_COUNT and V2 >= MAX_J_COUNT) then
  	RunMission(1);
  end;
end;
--------------------------------------------------------------------------
-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
------------------------����Ƿ����������������--------------------------
function CheckShowKing(Group)

if (Group == 1) then 
	groupvalue1 = MS_S_NPCDEATH; --��¼S��Npc���������Ĳ���Id
	groupvalue2 = MS_S_DEATHCOUNT;--��¼S��������������Ĳ���Id
else
	groupvalue1 = MS_J_NPCDEATH;
	groupvalue2 = MS_J_DEATHCOUNT;
end;

NpcDCount = GetMissionV(groupvalue1);

if (NpcDCount < MS_SHOWKINGCOUNT) then
	return 0;
end;

PlayerDCount = GetMissionV(groupvalue2);

if (PlayerDCount < MS_PKCOUNT) then
	return 0;
end;

if (Group == 1) then 
	SetMissionV(MS_S_SHOWKING, 1)
else
	SetMissionV(MS_J_SHOWKING, 1)
end;

return 1;

end;

function ShowTheKing(Group)

if (Group == 1) then 
	HideNpc("���ν���",1);
	str1 = "Th�m t� h�i b�o:Ch� t��ng phe T�ng �� xu�t hi�n! Binh s� h�y b�o v� nguy�n so�i!";
	str2 ="H�y ti�p t�c n� l�c ti�u di�t t��ng ��ch!";
	Msg2MSGroup(1,str1, 1);
	Msg2MSGroup(1,str2, 2);
	str3 = "<#>Chi�n tr��ng T�ng Kim:Ch� t��ng phe T�ng �� xu�t hi�n!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

if (Group == 2) then
	HideNpc("�����",1);
	str1 = "Th�m t� h�i b�o:Ch� t��ng phe T�ng �� xu�t hi�n! Binh s� h�y b�o v� nguy�n so�i!";
	str2 = "H�y ti�p t�c n� l�c ti�u di�t t��ng ��ch!";
	Msg2MSGroup(1,str1, 2);
	Msg2MSGroup(1,str2, 1);
	str3 = "<#>Chi�n tr��ng T�ng Kim:Ch� t��ng phe Kim �� xu�t hi�n!";
	AddGlobalCountNews(str3 , 3);
	return 0
end;

return 1;

end;

--�������Npc
--���������ҵȼ��������40����
--���η�����ұ���Ҫ����ɽ���½���������
--���𷽵���ұ���Ҫ���꾩���ſڽ���佫��������
--������ʱ��Ҫ����һ���Ľ�Ǯ��
-- Update by Dan_Deng(2003-10-23) ͨ���Ի��л���ս����ģ���Ҫ����ս��״̬Ϊ1

Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");


function main()


local State = GetMissionV(1) 

--δ��ʼ
if (State == 0 ) then 
	Say("Xin h�y ngh� ng�i v� ch� th�ng b�o!",0);
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

--�쳣���ֱ���˳�
if (State > 2) then
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

local GroupV = GetTask(SJTASKVLAUE);
result = 0;
--�����������Ѿ��������ģ��������������ģ����ӽ�ȥ
result = CheckLastBattle(2, State)
if (result == 1) then
	return
end

if (result == 2) then
	--�˾仰�ǵз������Է��ı���Npc�ĶԻ�
	--���� ������Щ�ι��Ĳ���!���Ǵ�����ʿ�Ǹ�����ս����,�����ݺ�......�ȣ��е�����ɫ��
	Say("Kim qu�c ch�ng t�i, ai c�ng d�ng c�m v� quy�t li�t, l�m th� n�o ng��i c� th� x�ng ��ng l�m ��i th�?!",0)
end

--����ʱ��
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
 		if ( nGroup == 2 ) then 
 		--�˾仰�Ǳ����ѱ���������뱨��Npc�ĶԻ�
    		Say("C� ch�t c�ng trung th�nh v�i Kim qu�c!",0)
  		else
    		Say("Kim qu�c ch�ng t�i, ai c�ng d�ng c�m v� quy�t li�t, l�m th� n�o ng��i c� th� x�ng ��ng l�m ��i th�?!",0);
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,2) >= MAX_J_COUNT) then
		Say("Hi�n t�i qu�n l�c �� �� �� ti�u di�t qu�n T�ng, binh s� h�y vui l�ng ch� ��t ti�p theo!", 0)
	return
	end;
	
	--����,Ŀǰ�ι����������ι���������Ϳ̿�����Ǵ�����������
	Say("T�ng qu�n s� thua cu�c, ch� l� v�n �� th�i gian, ng��i c� mu�n c�ng ta h��ng vinh quang?!",2, "T�i �� tham d�. /Yes", "H�y �� t�i ngh�!/No");
end;

--��սʱ��
if (State == 2) then 
	--��Ϊ��ս����ʽ����֮������δ��������뱨��Npc�ĶԻ�
	Say("B�n vui l�ng t�m m�t n�i �� ch�n tho�t",0);
	return 
end;

end;

function Yes()
if (GetMissionV(1) ~= 1) then
	return
end
if (GetLevel() >= 40) then 
  if (Pay(MS_SIGN_MONEY) == 1) then
  Msg2Player("Ch�o m�ng b�n tham gia chi�n tr��ng!");
  V = GetMissionV(6);
  SetMissionV(6, V + 1);
  SJ_JoinJ();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("B�n ch�a ��t c�p 40 ho�c kh�ng �� ti�n",0);
end;

function No()
Say("H�y suy ngh� l�i �i! th�i gian c� h�n!",0);
end;


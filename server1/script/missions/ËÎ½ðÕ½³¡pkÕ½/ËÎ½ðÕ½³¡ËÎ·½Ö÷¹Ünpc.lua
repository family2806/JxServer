--�������Npc
--���������ҵȼ��������40����
--���η�����ұ���Ҫ����ɽ���½���������
--���𷽵���ұ���Ҫ���꾩���ſڽ���佫��������
--������ʱ��Ҫ����һ���Ľ�Ǯ��

Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");

function main()

local State = GetMissionV(1) 

--δ��ʼ
if (State == 0 ) then 
	Say("Xin h�y ngh� ng�i v� ch� th�ng b�o!",0);
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;

--�쳣���ֱ���˳�
if (State > 2) then
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;


local GroupV = GetTask(SJTASKVLAUE);
--�����������Ѿ��������ģ��������������ģ����ӽ�ȥ
result = CheckLastBattle(1, State);
if (result == 1) then
	return
end

if (result == 2) then
	--�˾仰�ǵз������Է��ı���Npc�ĶԻ�
	Say("Ng��i �� x�m chi�m n��c ta, gi�t ch�t ��ng b�o ta, ta th� s� �� ng��i ch�t trong cay ��ng!",0)
end


--����ʱ��
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
	if ( nGroup == 1) then 
    		Say("T�t c� ch�ng ta ��u ph�i c� tr�ch nhi�m cho d�n t�c, b�y gi� l� l�c ta ph�c v� cho qu� h��ng!",0)
  		else
    		Say("Ng��i �� x�m chi�m n��c ta, gi�t ch�t ��ng b�o ta, ta th� s� �� ng��i ch�t trong cay ��ng!",0)
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,1) >= MAX_S_COUNT) then
		Say("Hi�n t�i qu�n l�c �� �� �� ti�u di�t qu�n Kim, binh s� h�y vui l�ng ch� ��t ti�p theo!", 0)
	return
	end;
	
	Say("Hi�n t�i qu�n l�c �� �� �� ti�u di�t qu�n Kim, binh s� h�y vui l�ng ch� ��t ti�p theo!",2, "T�i �� tham d�. /Yes", "H�y �� t�i ngh�!/No");
end;

--��սʱ��
if (State == 2) then 
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
  V = GetMissionV(5);
  SetMissionV(5, V + 1);
  AddMSPlayer(1,1);
  SJ_JoinS();
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

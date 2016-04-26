-- ����.lua ���������NPC��NPC���ڵش���
-- By: Dan_Deng(2003-12-27)
-- Uworld67 == GetTask(67)������λ���壺1-7(��������״̬)��8-15(������)��16-23(����)��24(���)��25-32(����)
-- PS��2���Ƿ��͹���ָ��
-- GetTaskTemp(5)����¼�Ƿ������ף������ף�
-- GetTaskTemp(6)����¼�����ߵ�����ID
-- GetTaskTemp(7)����¼�������ߵ�����ID
-- ���������δ��, �ȼ�>=20, �з����ӳ�, �з�ȥ������˵��, Ȼ��Ů����ȥ˵������������
-- By: Dan_Deng(2004-03-02) ��д�ű��ṹ���Ա�ά��
-- Update: Dan_deng(2004-03-02) Э�����
-- Update: Fanghao_Wu(2004-8-20) ��Ϧ����
-- Update: �ӷ��� (2007-10-12) �޸��޸���״̬

Include("\\script\\global\\teamhead.lua");
Include("\\script\\event\\valentine2007\\event.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

TK_DATE_APPLYDIV = 1779; --������������
TOTALSEC_OF_DAY = 60 * 60 * 24; -- 1����ڶ����룬���ڰ�����ת����
COSTOFSIMGLEDIV = 1000000; --������黨��

function main(sel)
	if (check_married() == 1) then
		SetTask(67, SetBit(GetTask(67), 24, 0));
		Msg2Player("<color=yellow>��Ļ���״̬�Ѹı�<color>");
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	if (GetSex() == 0) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>��������˻�û�ش��㣬��Ҫ�������?"
		tbDailog:AddOptEntry("���룬�ҵ����̫��ͻ�ˣ�����԰���ȡ����?", male_cancel)
		tbDailog:AddOptEntry("�ã���ȥ���Կ�", male_hurry)
	elseif (GetSex() == 1) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>������Ļظ��أ�����˺�����һ������?"
		tbDailog:AddOptEntry("�ǣ���Ըһ�������������.", female_yes)
		tbDailog:AddOptEntry("�����Ҳ�������ʱ�����Լ�������.", female_cancel)
	else
		tbDailog.szTitleMsg = "<#><npc>���Ϻ�æ������ʱ���Կ��ͽ�������˵Ļ���."
		tbDailog:AddOptEntry("�������������ˣ����������", Qmarry)
		tbDailog:AddOptEntry("���ǵ��Ը񲻺ϣ��������.", divorce)
		tbDailog:AddOptEntry("���Ƿ������쳳�ܣ������ϸ��ҵ��Ҹ�.", fix_marry)
		tbDailog:AddOptEntry("���뵥�������", singlediv_apply)
		tbDailog:AddOptEntry("�������������.", sure_process_dinglediv)
		tbDailog:AddOptEntry("û�£���ֻ��·������.", no)
	end
	
	tbDailog:Show()
end
-----------���������----------------
--���뵥�������
function singlediv_apply()
	if (check_marrystate() == 0) then
		return
	end;
	
	local nDays = get_passdays();
	local str = "�������ʱ�䲻�� <color=yellow>1 ��<color>, ";
	if (nDays > 0) then
		str = format("����������Ѿ�<color=yellow>%d ��<color> ��, ",nDays);
	end;
	if (GetTask(TK_DATE_APPLYDIV) ~= 0) then
		Say(format("����: %s ��Ҫ���������.", str), 0);
		return
	end;
	
	Say(format("�����޵�ͬ���ɣ�ǧ���޵ù����ߡ������������Ҫ�� <color=yellow>%d ��<color>. �������Ͼ������Ե��?",COSTOFSIMGLEDIV), 2,
		"���뵥�������/makesure_apply",
		"��������/no");
end;

--ȷ�����룺���������
function makesure_apply()
	local nDate = GetCurServerTime();
	SetTask(TK_DATE_APPLYDIV, nDate);
	
	WriteLog(format("%s\tAccount:%s[Name:%s] �����뵥�������.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));	
	Say("����: ��Ȼ���Ѿ�����ֻ���Ժ���ڣ��Ҹ���һ��ʱ�俼�ǣ�һ�ܺ�������.", 0);
	informother(Say, format("��ż %s �����������뵥������飬1�ܺ��Զ�<color=yellow>�Ͼ���ż��ϵ<color>.",GetName()), 0);
end;

--֪ͨ��ż
function informother(proc, ...)
	local Lover = GetMateName();
	if (Lover == "") then 
		return 1
	end;
	
	local nOldPlayer = PlayerIndex
	local nIdx = SearchPlayer(Lover);
	if (nIdx <= 0) then
		return 1;
	end;
	
	if (not proc or type(proc) ~= "function") then
		return 1;
	end;
	PlayerIndex = nIdx;
	call(proc, arg);
	
	PlayerIndex = nOldPlayer;
end;


--���뵥�������
function sure_process_dinglediv()
	if (check_marrystate() == 0) then
		return
	end;
	
	if (GetTask(TK_DATE_APPLYDIV) == 0) then
		Say("����: ���뵥�������?", 2,
			"���������/singlediv_apply",
			"·������/no");
		return
	end;
	
	local nDays = get_passdays();
	local str = "�������ʱ�䲻�� <color=yellow>1 ��<color>, ";
	if (nDays > 0) then
		str = format("���������� <color=yellow>%d ��<color>, ",nDays);
	end;
	if (nDays < 7) then
		Say(format("����: ��̫�ļ��ˣ�%s������һ�ܣ���ȥ�ú������",str), 0);
		return 0;
	end;
	
	Say(format("�����޵�ͬ���ɣ�ǧ���޵ù����ߡ������������Ҫ�� <color=yellow>%d ��<color>. �������Ͼ������Ե��?", COSTOFSIMGLEDIV), 2,
		"���������������/process_dinglediv",
		"��������/no");
end;

--���е��������
function process_dinglediv()
	if (GetCash() < COSTOFSIMGLEDIV) then
		Say(format("����: �����������Ҫ�� <color=yellow>%d<color> ���������Ǯ������!",COSTOFSIMGLEDIV), 0);
		return 0;
	end;
	
	if (Pay(COSTOFSIMGLEDIV) == 0) then
		return
	end;
	
	divorce_dateproc(PlayerIndex);
	WriteLog(format("%s\tAccount:%s[Name:%s] �ѽ��е��������.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));
	Say("����: ������������ˣ������ȥ��������°뱲�ӵ�����.", 0);
	
	Msg2Player(format("�ѽ� <color=yellow>%d ��<color> ����������.", COSTOFSIMGLEDIV));
	Msg2Player("����״̬Ϊ����.");
	informother(divorce_dateproc);
	informother(Say, format("��ż %s �����ϴ�����<color=yellow>�������<color>, �Ͼ����޹�ϵ.",GetName()), 0);
end;

--��������˶�����
function get_passdays()
	local nApplyDate = GetTask(TK_DATE_APPLYDIV);
	local nDate = GetCurServerTime();
	if (nApplyDate == 0 or nDate < nApplyDate) then
		return -1;
	end;
	
	local nDays = floor((nDate - nApplyDate) / TOTALSEC_OF_DAY);
	return nDays;
end;

--���õ����������
function divorce_dateproc()
	local nWorld67 = GetTask(67);
	nWorld67 = SetBit(nWorld67,24,0);
	SetTask(TK_DATE_APPLYDIV, 0);
	UnMarry();
	
	nRepute = GetRepute();				-- ������ش���
	if (nRepute > 10) then
		nRepute = 10;
	end;
	AddRepute(-1 * nRepute)								-- ����10��(����10����Ϊ0);
	
	nDivorceTimes = GetByte(nWorld67,2) + 1
	if (nDivorceTimes > 100) then
		nDivorceTimes = 100;
	end;
	nWorld67 = SetByte(nWorld67, 2, nDivorceTimes);
	SetTask(67,nWorld67);
end;

--�����������뵥��������״̬
function check_marrystate()
	local nLvl = GetLevel();
	local nSex = GetSex();
	local bMarried = GetBit(GetTask(67),24);
	
	if (nLvl < 20) then
		Say("���ϣ���Ҫ���ҿ���Ц���㻹δ���ɼ���ҵ�����.", 0);
		return 0;
	end;
	
	local str = "Ů��";
	if (nSex == 1) then
		str = "�е�";
	end;
	
	if (bMarried == 0) then
		Say(format("���ϣ���Ҫ���ҿ���Ц���㻹û��������飬��ȥ��%s����.", str), 0);
		return 0;
	end;
	return 1;
end;
function check_married_team()
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		return 1;
	end;
	local mem = {};
	mem[1] = GetTeamMember(1);
	mem[2] = GetTeamMember(2);
	local szName = "";
	for i = 1, nTeamSize do
		PlayerIndex = mem[i];
		if (check_married() == 1) then --��������������
			szName = GetName();
			SetBit(GetTask(67),24,0);
			SetTask(67,1);
		end;
		PlayerIndex = nOldPlayer;
	end;
	if (szName == "") then
		return 1
	end;
	
	local str = format("<color=yellow>����״̬  %s �Ѹı�<color>",szName)
	for i = 1, nTeamSize do
		OtherPlayer(mem[i], Msg2Player, str);
	end;
	return 1;
end;


function check_married()
	if (GetMateName() == "" and GetBit(GetTask(67),24) == 1) then
		return 1;
	end;
	return 0;
end;

----------------------- ��Ϧ���9�鰮���ɿ�����ȡ���� ------------------
function chocolate()
	Say("9���ɿ������Ի�999��㾭��ֵ��Ҳ���Ի��һЩ����Ľ�������ѡ������?",3,"��999��㾭��ֵ/chocolate_exp","����Ʒ/chocolate_gift","ûʲô����ֻ��·������!/no");
end

function chocolate_exp()
	local nNowDate = tonumber(date("%d"));
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("�����㲻��9���ɿ�������ס��һ��Ҳ������!",0);
		return
	end
	if(GetTask(1564) == nNowDate) then
		if(GetTask(1565) > 0) then
			Say("��������ɿ���������ֵ��ÿ��ֻ�ܻ�һ�Σ����У����˲�Ҫ�����Ķ���.",0);
			return
		end
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,GetTask(1565)+1);
	else
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,1);
		SetTask(1564,nNowDate);
	end
end

function chocolate_gift()
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("�����㲻��9���ɿ�������ס��һ��Ҳ�����ٮ�!",0);
		return
	end
	ConsumeEquiproomItem( 9, 6, 1, 833, 1);	
	local i = random(1,1000);
	if(i <= 300) then
		AddEventItem(353);
		Msg2Player("����1 �ɺ챦ʯ");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ���ɺ챦ʯ");	
	elseif(i > 300 and i <= 460) then
		AddEventItem(238);
		Msg2Player("����1 ��ˮ��");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ����ˮ��");		
	elseif(i > 460 and i <= 620) then
		AddEventItem(240);
		Msg2Player("����1 ��ˮ��");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ����ˮ��");		
	elseif(i > 620 and i <= 800) then
		AddEventItem(239);
		Msg2Player("����1 ��ˮ��");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ����ˮ��");		
	elseif(i > 800 and i <= 949) then
		AddItem(6,1,147,6,0,0);
		Msg2Player("����1 ������ʯ����Ϊ6");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ��������ʯ����Ϊ6 ");		
	elseif(i > 949 and i <= 979) then
		AddItem(6,1,147,7,0,0);
		Msg2Player("����1 ��������ʯ����Ϊ7");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ��������ʯ����Ϊ7");		
	elseif(i > 979 and i <= 989) then
		AddItem(6,1,147,8,0,0);
		Msg2Player("����1 ������ʯ����Ϊ8");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ��������ʯ����Ϊ8");		
	elseif(i > 989 and i <= 990) then
		AddItem(6,1,147,9,0,0);
		Msg2Player("����1 ������ʯ����Ϊ9");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ��������ʯ����Ϊ9");		
	elseif(i > 990 and i <= 1000) then
		AddItem(6,1,398,9,0,0);
		Msg2Player("����1 ���ؿ�ʯ ");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����Ϧ�ڻ��һ�����ؿ�ʯ");		
	else
	end
end
----------------------- ��Ϧ���9�鰮���ɿ�����ȡ���� ------------------

----------------------- ͨ�ù��ܺ��� ------------------
function default_talk()			-- ȱʡ�Ի�
	Talk(1,"","���˫��������һ��ֻ��Ҫ�ѳ��󣬻�δ��飬һ������������Ե����˵������������ҽ����㴫����������ϳɻ���")
end

function check_team()
	Player1_ID = GetTeamMember(1)
	Player2_ID = GetTeamMember(2)
-- ��ѯ�����е�Ů�Գ�Ա���������¼����ID����ʱ����
	if (OtherPlayer(Player2_ID,GetSex) == 1) then
		His_ID = Player1_ID
		Her_ID = Player2_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	elseif (OtherPlayer(Player1_ID,GetSex) == 1) then
		His_ID = Player2_ID
		Her_ID = Player1_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	else
		His_ID = 0
		Her_ID = 0
	end
	return His_ID,Her_ID,His_world67,Her_world67
end

function do_qmarry_cancel()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (OtherPlayer(His_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,6) == His_ID) and (OtherPlayer(His_ID,GetTaskTemp,0,7) == Her_ID) then	-- ˫�������ܶ��ϣ�����ɾ��
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		OtherPlayer(Her_ID,SetTaskTemp,5,0)
		OtherPlayer(Her_ID,SetTaskTemp,6,0)
		OtherPlayer(Her_ID,SetTaskTemp,7,0)
--		Msg2Player("���ȡ���ɹ���")
--	else
--		Msg2Player("�޷�ȡ����顣")
	end
end

function OtherPlayer_talk(PlayerId, msg)		-- Ϊ���˷���Ϣ
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId
	Talk(1,"",msg)
	PlayerIndex = OldPlayer
end
----------------------- ������ -----------------------
function Qmarry()			-- ����Լ����Ϸ��Լ��
	if (GetFaction() == "shaolin") or (GetFaction() == "emei") then		-- ������ò�׼���
		Talk(1,"","���ǳ����ˣ���ô����쳾֮�£������Ź��Ȱ�")
	elseif (GetSex() == 1) then											-- ��ͨ�Ķ�Ů�Ե�˵��
		Talk(1,"","����֮�£�������һ�������ô����ô������Ҫ�����������!")
	elseif (GetTeamSize() ~= 2) or (IsCaptain() ~= 1) then		-- (������Ա����)��(�Լ����Ƕӳ�)��תȱʡ�Ի�
		default_talk()
	else					-- ���������������ҿ�ʼ������
		His_ID,Her_ID,His_world67,Her_world67 = check_team();
--		check_married_team();
		if (Her_ID == 0) then				-- ��������Ů�Գ�Ա��תȱʡ�Ի�
			Talk(1,"","���������������Ӻ������飿��Ҫ��Ū����!")
--			default_talk()
		elseif (OtherPlayer(Her_ID,GetFaction) == "emei") then		-- ��׼Ȣ���
			Talk(1,"","��Ȣ��ð���������������మ�������Ȱ������!")
		elseif (GetBit(His_world67,24) == 1) then				-- �з��ѻ�
			Talk(1,"","�����������ˣ��ѵ�����Ҫ�������!?")
		elseif (GetBit(Her_world67,24) == 1) then		-- Ů���ѻ�
			Talk(1,"","<#> �˼�"..OtherPlayer(Her_ID,GetName).."<#> �Ѿ��޹��ˣ���ô���ټ���!")
		elseif (GetLevel() < 20) or (OtherPlayer(Her_ID,GetLevel) < 20) then		-- ���˵ȼ�����
			Talk(1,"","�㻹С���������µ��������˵!")
		else									-- ������������
			SetTaskTemp(7,Her_ID)
			SetTaskTemp(6,His_ID)
			Say("�����ˣ��ǲ��������ߵĹ�������?",2,"�ǣ�������������/qmarry_get","���ǣ�����ֻ��żȻ����/qmarry_no")
		end
	end
end

function qmarry_get()			-- �з�����������
	SetTaskTemp(5,1)
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (GetTaskTemp(7) ~= Her_ID) then			-- ���鷢���˸ı䣬�ܾ�������
		Talk(1,"","����ԥ̫�ã������Ѿ�����!")
	else
		Her_Name = OtherPlayer(Her_ID,GetName)
		Talk(1,"","<#>�ܺã����"..Her_Name.."<#> ��Ȼ������һ�ԣ�����������˵�����������뷨���.")
		Msg2Player("<#> �������� "..Her_Name.."<#> �������˼������˵�ˣ���ʼ�����ȴ����ķ�Ӧ.")
		OtherPlayer(Her_ID,Msg2Player,GetName().."<#> ������飬��ͬ��޸����𣿿��������˵�����˼��.")
		OtherPlayer(Her_ID,SetTaskTemp,5,1)
		OtherPlayer(Her_ID,SetTaskTemp,6,His_ID)
		OtherPlayer(Her_ID,SetTaskTemp,7,Her_ID)
	end
end

function male_cancel()			-- �з���ȡ������
	do_qmarry_cancel()
	Talk(1,"","ǿ�Ȳ��Ҹ��������һʱ���ܾ�������Ҫ��һ��ʱ����˵!")
	Msg2Player("����ǰ�������е㺦�ߣ��������������뷨.")
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> �ܾ�������.")		-- ��Ϣ�Ƿ���Ů����ע����Ϣ�������
end

function male_hurry()		-- ��飺�ߴ�
	Her_ID = GetTaskTemp(7)
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> ������飬��ͬ��޸����𣿿��������˵�����˼��!")
end

----------------------- ����顢ȷ�ϻ��� -------------
function female_cancel()		-- Ů�����ܾ�����
	do_qmarry_cancel()
	Talk(1,"","�㲻Ը�⣬�Ҿ͸����������Ϣ!")
	Msg2Player("��ѻ����Ϊ�Լ�����찡����û����ԥ�;ܾ����������.")
	OtherPlayer(His_ID,Msg2Player,GetName().."<#> ���Ѿܾ������飬С�Ӽ���Ŭ��Ŷ!")
end

function female_yes()			-- Ů������������
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	His_Name	= OtherPlayer(His_ID,GetName)
	Her_Name	= GetName()
	if (GetBit(Her_world67,24) == 1) then				-- �ѻ�
		Talk(1,"","���з���ˣ���ô���������?")
	elseif (GetTeamSize() ~= 2) then		-- ���������Ѹı�
		Talk(1,"","�һ�û����������ɣ���������Ұ�������Ҫһ�������ҶԻ�!")
	elseif (His_ID ~= GetTaskTemp(6)) then			-- �ӳ����������
		Talk(1,"","�������������飿�㵽����ȡ˭?���е��Ϳ�ˡ�")
	else				-- �����Ѿ����ϣ����н�鴦��
		DoMarry(GetTeam())
		
				-- �������жϻ�����ϵ�Ƿ�����ȷ��������ֱ�ӷ��� by zero 2007/06/27
		local szMaleName, szFemaleName = "","";
		local nOldPlayerIndex = PlayerIndex;
		
			PlayerIndex = His_ID;
			szMaleName = GetMateName();
			PlayerIndex = nOldPlayerIndex;
			szFemaleName = GetMateName();
			
		if szMaleName == "" or szFemaleName=="" then
			Msg2Player("<color=yellow>δ������ż��ϵ��������!<color>");
			OtherPlayer(His_ID, Msg2Player, "<color=yellow>δ������ż��ϵ��������!<color>");
			return
		end;
		
		
		SetTaskTemp(5,0)		--ȡ�����״̬
		SetTaskTemp(6,0)
		SetTaskTemp(7,0)
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		Her_world67 = SetBit(Her_world67,24,1)		-- ���ý�����
		His_world67 = SetBit(His_world67,24,1)
		if (GetBit(Her_world67,2) == 0) and (GetLevel() >= 50) then		-- Ů���ͽ�ָ
			Her_world67 = SetBit(Her_world67,2,1)		-- ���ý����������ͽ�ָ��
			present_ring(Her_ID)
		end
		if (GetBit(His_world67,2) == 0) and (OtherPlayer(His_ID,GetLevel) >= 50) then		-- �з��ͽ�ָ
			His_world67 = SetBit(His_world67,2,1)		-- ���ý����������ͽ�ָ��
			present_ring(His_ID)
		end
		SetTask(67,Her_world67)
		OtherPlayer(His_ID,SetTask,67,His_world67)

		Msg2Player("<#> ��������"..His_Name.."<#> ף����λ��ͷ���ϣ������Ҹ�!")
		OtherPlayer(His_ID, Msg2Player, Her_Name.."<#> ���ѽ���������飬ף����λ��ͷ���ϣ������Ҹ�!")
		OtherPlayer_talk(His_ID, "��ϲ��λ�����������Ѿ�˨�������˵���Ե��!")
		OtherPlayer_talk(Her_ID, "��ϲ��λ�����������Ѿ�˨�������˵���Ե��!")
		AddGlobalCountNews("<#> ����һ��ף��"..His_Name.."<#> ��"..GetName().."<#> ��λ��������ͬ�ģ���ͷ����!",3)
		
	end
end

function present_ring(PlayerId)			-- �ͽ�ָ���жϡ��ñ����������������У�
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId

	item_level = floor(GetLevel() / 10) + 2
	if (item_level > 10) then
		item_level = 10
	end
--	item_lucky = (item_level - 3) * 5
	p = {0,0,0,0,0,0}
	j = item_level - 6
	if (j > 6) then j = 6 end
	for i=1,j do
		if (item_level - i - 2 < 0) then
			p[i] = 0
		else
			p[i] = item_level - i - 2
		end
	end
	AddItem(0,3,0,item_level,random(0,4),5,p[1],p[2],p[3],p[4],p[5],p[6])
	Msg2Player("�����͸���һ����ָ ")
	PlayerIndex = OldPlayer
end

----------------------- �޸�������ϵ -------------------
function fix_marry()
	if( GetTeamSize() == 2 ) then
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = GetName()
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (His_ID ~= 0) and (Her_ID ~= 0) and (GetBit(His_world67,24) == 1) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == "") and (OtherPlayer(Her_ID,GetMateName) == "") then		-- ���ԡ����˶��顢���ѻ飬����Ϊ�����޸�
			Talk(1,"","���޳����ǳ��£���Ҫ��Ϊ�������������������������Ժ�!")
			DoMarry(GetTeam())
			Msg2Player("<#> ���"..Her_Name.."<#> �ѻָ���ż��ϵ")
			OtherPlayer(Her_ID,Msg2Player,"<#> ���"..His_Name.."<#> �� �ѻָ���ż��ϵ")
		elseif (GetBit(GetTask(67),24) == 1) and (GetMateName() == "") then			-- �����޸������Է�����������
			if (GetSex() == 0) then
				Talk(1,"","���޳����ǳ��£������ɣ���Ͱ���һ��������Ȱ��!")
			else
				Talk(1,"","���޳����ǳ��£������ɣ���Ͱ���һ��������Ȱ��!")
			end
		else			-- �Լ�����������
			if (GetSex() == 0) then
				Talk(1,"","������û���£�����ƭ����?")
			else
				Talk(1,"","������û���£�����ƭ����!")
			end
		end
	else
		if (GetSex() == 0) then
			Talk(1,"","���޳����ǳ��£������ɣ���Ͱ���һ��������Ȱ��!")
		else
			Talk(1,"","���޳����ǳ��£������ɣ���Ͱ���һ��������Ȱ��!")
		end
	end
end

----------------------- ������ -----------------------
function divorce()
	if (GetTeamSize() == 2) and (IsCaptain() == 1) then		-- ��ӡ�����Ϊ2���Լ��Ƕӳ�
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = OtherPlayer(His_ID,GetName)
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (GetBit(His_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == Her_Name) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(Her_ID,GetMateName) == His_Name) then		-- ˫������ϵ��ȷ
			Say("��鲻�Ƕ�Ϸ���������˽���Ϊ����������㲻�õ����ۣ�Ҫ��Ҫ������?",2,"�����Ѿ������ˣ��������������!/divorce_yes","����������/no")
		else
			Talk(1,"","�㵽�����˭��飿����˲��������ż!")
		end
	else
		Talk(1,"","һ��Ҫ��飬��Ҫ�������һ���������������!")
	end
end

function divorce_yes()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (His_ID == 0) or (Her_ID == 0) or (OtherPlayer(His_ID,GetMateName) ~= Her_Name) or (OtherPlayer(Her_ID,GetMateName) ~= His_Name) then			-- �������״̬
		Talk(1,"","����ԥ̫�ã������ż�Ѿ�����!")
	elseif (GetCash() >= 50000) then
		Pay(50000)
		UnMarry(GetTeam())						-- ���������ϵ]
--Msg2Player("His_world67="..His_world67.."  Her_world67="..Her_world67)
		His_repute = OtherPlayer(His_ID,GetRepute)				-- �з���ش���
		if (His_repute > 10) then His_repute = 10 end
		OtherPlayer(His_ID,AddRepute,-1 * His_repute)								-- ���з�����10��(����10����Ϊ0)
		His_DivorceTimes = GetByte(His_world67,2) + 1								-- ����������
		if (His_DivorceTimes > 100) then His_DivorceTimes = 100 end			-- ����100�β��ټ�¼
		His_world67 = SetByte(His_world67,2,His_DivorceTimes)						-- ������д��
		His_world67 = SetBit(His_world67,24,0)											-- ����״̬
--Msg2Player("His_world67="..His_world67)
		OtherPlayer_talk(His_ID,"���������������Ŀǰ�Ļ���ȡ���ˣ���ָ�������.")		-- Ϊ˫���������Ϣ
		Her_repute = OtherPlayer(Her_ID,GetRepute)				-- Ů����ش���
		if (Her_repute > 10) then Her_repute = 10 end
		OtherPlayer(Her_ID,AddRepute,-1 * Her_repute)								-- ��Ů������10��(����10����Ϊ0)
		Her_DivorceTimes = GetByte(Her_world67,2) + 1
		if (Her_DivorceTimes > 100) then Her_DivorceTimes = 100 end
		Her_world67 = SetByte(Her_world67,2,Her_DivorceTimes)
		Her_world67 = SetBit(Her_world67,24,0)
--Msg2Player("Her_world67="..Her_world67)

		OtherPlayer(His_ID,SetTask,67,His_world67)
		OtherPlayer(Her_ID,SetTask,67,Her_world67)
		OtherPlayer_talk(Her_ID,"���������������Ŀǰ�Ļ���ȡ���ˣ���ָ�������.")
	else
		Talk(1,"","����������Ѳ�������Ҫ������������!")
	end
end

----------------------- �ϻ������ ---------------------
function gather_bonus()
	Say("����, 3 �ϻ���, 3 ԧ������3 �����Ϳ��Ի�1 ��ˮ����1 ������ӳ��\n 2 �ϻ���, 2 ԧ������2 �������Ի�1 ����Ԫ����1 ������ӳ��\n 1 �ϻ���, 1 ԧ������1 �������Ի�1 ������ӳ��\n ���뻻����?",4,"��ֻ��ˮ����������ӳ�� /gather_bonus1","��ֻ����Ԫ����������ӳ��/gather_bonus2","��ֻ��������ӳ��/gather_bonus3","Ŷ���Բ����ҼǴ���!/no")
end

function gather_bonus1()
	if (GetItemCount(344) >= 3) then				-- �ϻ���
		if (GetItemCount(345) >= 3) then			-- ԧ����
			if (GetItemCount(346) >= 3) then		-- �����
				for i=1,3 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- ������ӡ��
				i = 238 + random(0,2)		-- �����һ�ű�ʯ
				AddEventItem(i)
				Talk(1,"","̫����! ������1 ��ˮ����1 ��������ӳ��.ͬʱ��ף���˵İ��������޼�!")
			else
				Talk(1,"","�㲻����������ᣬ �ҹ��������� ")
			end
		else
			Talk(1,"","�㲻������ԧ����, �ҹ���������")
		end
	else
		Talk(1,"","�㲻�������ϻ���, �ҹ���������")
	end
end

function gather_bonus2()
	if (GetItemCount(344) >= 2) then				-- �ϻ���
		if (GetItemCount(345) >= 2) then			-- ԧ����
			if (GetItemCount(346) >= 2) then		-- �����
				for i=1,2 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- ������ӡ��
				AddEventItem(342)
				Talk(1,"","̫����! ������1 ��Ԫ����1 ��������ӳ����ͬʱ��ף���˵İ��������޼�!")
			else
				Talk(1,"","�㲻��2������ᣬ �ҹ���������")
			end
		else
			Talk(1,"","�㲻��2��ԧ����, �ҹ���������")
		end
	else
		Talk(1,"","�㲻��2���ϻ���, �ҹ���������")
	end
end

function gather_bonus3()
	if (HaveItem(344) == 1) then				-- �ϻ���
		if (HaveItem(345) == 1) then			-- ԧ����
			DelItem(344)
			DelItem(345)
			AddItem(6,1,18,1,0,0,0)			-- ������ӡ��
			Talk(1,"","̫����! ������1 ��������ӳ����ͬʱ��ף���˵İ��������޼�!")
		else
			Talk(1,"","��û��ԧ����, �ҹ���������")
		end
	else
		Talk(1,"","��û�кϻ���, �ҹ���������")
	end
end

-------------- 2004-8-22 ��Ϧ���� ------------------
function present_QiXi( nPlayerIndex )
	local nPreservedPlayerIndex = PlayerIndex;
	
	PlayerIndex = nPlayerIndex;

	Talk( "����������ʮ�壬������һ���ر�����ף2λ��ͷ����!" );
	-- ��2����������ӡ����
	for i = 1, 2 do
		AddItem( 6, 1, 18, 1, 0, 0 ,0);
	end
	Msg2Player( "����2 ������ӳ��" );
	-- ��9�䡰õ�廨��
	for i = 1, 9 do
		AddItem( 6, 0, 20, 1, 0, 0 ,0);
	end	
	Msg2Player( "���� 9 ��õ��!" );
	-- 50��������Ҽ���1������ɽ��¶��
	if( GetLevel() >= 50 ) then
		AddItem(6, 1, 72, 1, 0, 0, 0);
		Msg2Player( "����һƿ��ɽ��¶ " );
	end
	
	PlayerIndex = nPreservedPlayerIndex;
end

----------------------- end ----------------------------
function no()
end
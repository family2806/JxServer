-- ��������.lua (�����������ļ�)
-- By: Dan_Deng(2003-12-08)

-- ���������ͬ���������ʵ�崦���ļ�
Include ("\\script\\task\\partner\\master\\partner_master_main.lua");

Include("\\script\\task\\tollgate\\killbosshead.lua")
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua")


Define_City = {"<#>�ٰ�","<#>����","<#>�ɶ�","<#>����","<#>�꾩","<#>����","<#>����"}

function default_talk(letter_laststation)

local nParTaskState = GetMasterTaskState(PARID_TASK_MASTER_002);
local aryTalk = {"<dec><npc>�����ϵ������Ҳ��ܣ�Ŀǰʱ�ַ��ң���͢�Լ�Ҳ������鷳Ҫ�������"};

	if nParTaskState==nil then nParTaskState = 0; end;
	
	--tinsert(aryTalk, );
	
--T�m ��ng t�nh n�ng t�n s? - Modified by DinhHQ - 20110427
	tinsert(aryTalk, "����Ϊ��͢��Щ��/especiallymessenger");
	tinsert(aryTalk, "��ֻ�������תת/no");
	
	CreateTaskSay(aryTalk);

end

function lastdefault_talk(letter_station)
	Uworld12 = GetTask(12)
	if (Uworld12 == 0) then				-- ��ʱ���Կ�ʼ������ǰδ������
		W12_get(letter_station)
	elseif (Uworld12 < 256) then		-- ������
		check_letter(letter_station)
	elseif (GetGameTime() >= Uworld12) then		-- �ѳ����ظ�ʱ�����ƣ������ٴν���������ʱʹ������ʱ�䣩
		W12_get(letter_station)
	else													-- �ȴ��ظ�����������
		Talk(1,"","��٣�������ʱû���ż���Ҫ���æ�ģ���һ��ʱ�����������ɡ�")
	end
end

function W12_get(start_city)
	dest_city = random(1,7)				-- ������7������
	if (dest_city == start_city) then		-- ���������ŵ�Դ������Ŀ������ظ�
		Talk(1,"","��٣�������ʱû���ż���Ҫ���æ�ģ���һ��ʱ�����������ɡ�")
	else
		SetTaskTemp(3,start_city*10+dest_city)		-- ʮλ��Ϊ��ʼ�أ���λ��ΪĿ���
		Say("��٣����ս��ƵƵ�����ķ��࣬��վ�����ŵ����ֲ�������Ը���æ������ÿ�����Ŷ����г����ġ�",2,"Ը��/W12_get_yes","��Ը��/no")
	end
end

function check_letter(get_city)
	x = GetTask(12)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- Ӧ�ÿ϶�������
	if (dest_city == get_city) then			-- Ŀ�����
		if (HaveItem(231+x) == 1) then			-- ���ź��ܶ�Ӧ�ϣ��������
			Talk(1,"","<#>��٣��յ�"..Define_City[start_city].."<#>�����ź�һ�⣬��֤�����������л��500����")
			DelItem(231+x)
			SetTask(12,GetGameTime()+7200)				-- ��Сʱ��7200�룩����ظ�������
			i = random(1,10)		-- �������������
			AddRepute(i)
			Msg2Player("<#>�ɹ����ź��͵�Ŀ����վ��������ɡ��������������"..i.."<#>�㡣")
			AddNote("�ɹ����ź��͵�Ŀ����վ��������ɡ�")
			Earn(500)
		else												-- �ź���ʧ��ȡ������
			Say("��٣������ô��Ҫ�Ĺ���Ū���ˣ����¿��鷳�ˡ�Ҫô����2000�������Ұ�����������ڹ�ȥ�ɡ�",2,"��Ǯ/W12_cancel","��������/no")
		end
	elseif (start_city == get_city) then	-- ��ʼ����
		if (HaveItem(231+x) == 0) then			-- �ź���ʧ��ȡ������
			Say("��٣������ô��Ҫ�Ĺ���Ū���ˣ����¿��鷳�ˡ�Ҫô����2000�������Ұ�����������ڹ�ȥ�ɡ�",2,"��Ǯ/W12_cancel","��������/no")
		else
			Talk(1,"","��٣����ǽ������ģ��鷳���һ����ȥ��")
		end
	else 																					-- �������������δ��ɣ�
		Talk(1,"","<#>��٣�������ź������͵�����ģ���Ӧ���͵�"..Define_City[dest_city].."<#>ȥ��")
	end
end

function W12_cancel()
	if (GetCash() >= 2000) then
		Pay(2000)
		SetTask(12,0)
		Msg2Player("�����������ȡ���ˡ�")
		AddNote("�����������ȡ���ˡ�")
		Talk(1,"","��٣���ξ��������ˣ��Ժ����ҪС���˰���")
	else
		Talk(1,"","��٣���2000����û�У�����ô��ô�������Ǯ�������Ұɣ�")
	end
end

function W12_get_yes()
	x = GetTaskTemp(3)
	dest_city = mod(x,10)
	start_city = (x - dest_city) / 10		-- Ӧ�ÿ϶�������
	Talk(1,"","<#>��٣�����Ұ�����ź��͵�"..Define_City[dest_city].."<#>�������ˡ�")
	Msg2Player(Define_City[start_city].."<#>������������һ�⺯���͵�"..Define_City[dest_city].."<#>ȥ��")
	AddNote("<#>�ӵ����������뽫һ�⺯����"..Define_City[start_city].."<#>�͵�"..Define_City[dest_city].."��")
	SetTask(12,x)
	AddEventItem(231+x)		-- �ź���242��ʼ�����д�1��ʼ
end

function no()
end

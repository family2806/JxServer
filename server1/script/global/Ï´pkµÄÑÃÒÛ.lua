-- ϴPK������.lua
-- By Dan_Deng(2003-11-10)

Include("\\Script\\Global\\TimerHead.lua")
Include("\\Script\\Global\\FuYuan.lua")

function default_talk()
	if (GetFightState() ~= 0) then
		SetFightState(0)
	end
	Say("���ۣ����й��������мҹ棬˫��մ��Ѫ��֮���ӵ����ĺ���Ҳ�����������ɷ����Ʋã�",3,"��������/atone","����̽��/visit","û��/no")
	LeaveTeam();
end

function atone()				-- ����ϴPK
	local PK_value = GetPK()
	local my_money = GetCash()
	local ExpPer = GetExpPercent()
	local Uworld96 = GetTask(96)
	local Uworld94 = GetTask(94)
	if (Uworld96 > 0) then		-- �ݴ���������η��ⷢ�ִ�������״̬���Ȼ�ԭ����˵
		SetTask(96,0)
		StopTimer()
		if (Uworld94 > 0) then	-- ������б���ļ�ʱ����ͬʱ��ԭ(��������μ�ʱ����ֱ�ӹؼ�ʱ��)
			if (Uworld94 ~= 9) then
				SetTimer(GetTask(95),GetTask(94));
			end
			SetTask(94,0)
			SetTask(95,0)
		end
	end
	if (PK_value == 0) then			-- ����
		Talk(2,"","��ң���ǰ��������С���������ˣ��������ס�","���ۣ���������������Ϊ������������������ֻҪ�´�С��һЩ������̫��������ȥ�ɡ�")
	elseif (Uworld94 > 0) and (Uworld94 ~= 9) then		-- �Ѿ��б���ļ�ʱ�����������ٱ��棨����ѱ���������μ�ʱ�����ݴ������
		Talk(1,"","������縺�����������δ��ɣ���ô��������˷�ʱ�䣬���Լ�����֮��������������ĵط���")
		Msg2Player("������̫���ʱ���񣬲�����Ͷ�����ס�")
	elseif (ExpPer < -50) then			-- ������ͷ��У�������ϴPK
		Talk(1,"","���ۣ���������Ѫծ���۵Ĺ߷�������������ߺߣ����ű���׷ɱ�ɣ�")
		Msg2Player("�ɷ������������鳬��50%�ߣ���������������Ŀ����")
	else
		Say(GetName()..":��ǰ��������С���������ˣ��������ס�", 1, "�����Ի�/want_atone")
	end
end

function want_atone()
	local PK_value = GetPK();
	local my_money = GetCash();
	Say("���ۣ���˫��մ��Ѫ�ȣ����뾭���ٸ������Լ��ڴ���֮�о��Ļڹ��������<enter>����<enter>���о����£�<enter>�����÷�<color=red> "..safeshow(GetName()).." <color>����PKֵΪ<color=red>"..PK_value.."<color>��û�ո÷�����ȫ���߿�<color=red>"..my_money.."<color>����Ͷ����λڹ�<color=red>"..PK_value.."<color>�졣", 2, "�������/go_atone", "����Ǳ�Ӱ�/no");
end;

function go_atone()

	SetTask(96,100+GetPK())
	i = GetTimerId()
	if (i > 0) and (i ~= 9) then		-- �������ԭ�м�ʱ�����Ҳ������μ�ʱ�����ȱ���
		SetTask(94,i)
		SetTask(95,GetRestTime(i))
	else
		SetTask(94,0)
		SetTask(95,0)
		StopTimer()
	end
	local my_money = GetCash();
	Pay(my_money);
	Msg2Player("�ٲ�û���������ϵ��������ӹ�"..my_money.."����������Ͷ����Ρ�")
	WriteLog(date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t��Ͷ����ο۵����������ֽ�"..my_money.."��")
	FuYuan_Pause();
	SetTimer(12 * CTime * FramePerSec, 9)				-- ÿ120����ͨ����ʱ�����½���PKֵ
	DisabledTeam(1);
	NewWorld(208,1785,3062)
end

function visit()			-- ̽��
	Say("���ۣ��߿��߿��������涼��Ҫ����̽ʲô̽���ǲ���ͬ������",2,"��¸5000������/go_visit","�߿�/no")
end

function go_visit()
	if (GetCash() >= 5000) then
		Talk(1,"","���ۣ���˵ʲô��������������������ˣ���Ȼ����������ȥ̽��һ��Ҳ������֮����ɡ���ס��Ҫ��ʲô͵͵�����Ĺ�������")
		Msg2Player("��¸����5000�����ӣ��������̽��")
		Pay(5000)
		SetTask(96,1)
		DisabledTeam(1);
		NewWorld(208,1785,3062)
	else
		Talk(1,"","���ۣ����߿����ǲ���һ��Ҫ�Ұ��㵱�׷�ͬ��ץ��ȥ�Ÿ��ˣ�")
	end
end

function no()
end

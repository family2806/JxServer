-- ������ͷ.lua����ϴ������
-- By Dan_Deng(2003-11-12)

Include("\\script\\global\\timerhead.lua")
Include("\\Script\\Global\\FuYuan.lua")
Include("\\script\\nationalwar\\head.lua")

function main(sel)
	local Uworld96 = GetTask(96)
	local PK_value = GetPK();
	if (Uworld96 == 1) then			-- ̽���
		Say("��ͷ��̽������û�У�����ߣ�",2,"лл��λ��磬������/visit_leave","�����ٵ���һ�£��Һܿ����/no")
--	elseif (Uworld96 == 0) then		-- ������
--		Talk(1,"","��ͷ��ι��������ô��������ص����ģ���ʲô��ȥ��GM���Ͱɣ�")
	elseif (PK_value <= 0) then		-- ϴ����PK��
		Talk(2,"PKclear","��ͷ���㣡��ʰ��������Ѿ����Գ����ˣ�","��ң���л��磬��ô�Ҿ����ˡ�")
	else									-- ϴPK��
		-- ����ϵͳ����������
		local absolve_time = NW_GetTask(NW_TASKNO_ABSOLVE)
		local current_time = GetCurServerTime()
		if (absolve_time ~= 0 and current_time < absolve_time + SECONDS_ONEHOUR) then
			Say("�ҳ����ӽ������մ��ã���������һ�����֮�ˣ�С�����������������Ͻ��ߣ�",
				2,
				"�Ͻ���/nw_absolve",
				"����Ҫ��������/Cancel")
		else
			local n_timerid = GetTimerId();
			if (n_timerid ~= 9) then
				SetTask(96,100 + PK_value);
				SetTimer(12 * CTime * FramePerSec, 9)
				return
			end
		Say("��ͷ������δ��֮���ˣ����������߶���",3,"����ʱ��/ask_timer","��¸����/pay_money","�ǣ��ǣ�����ͻ�ȥ����/no")
		end
	end
end

-- ����ϵͳ����������
function nw_absolve()
	SetPK(0)
	leave_prison()
end

function ask_timer()
	if (GetCash() >= 1000) then		-- ��500�����Ӳ�����
		Pay(1000)
		Talk(2,"","��ң���λ��磬����1000��������ȱ��裬��ֻ������һ��������ʲôʱ���ˡ�","��ͷ������Ҫ��΢��������������"..GetRestCTime(9).."���Ͻ���ȥ���ã�")
	else
		Talk(2,"","��ң���λ��磬��ֻ������һ��������ʲôʱ���ˡ�","��ͷ����ʲô�ʣ��ִ��ǲ��ǣ��������ȥ���ã�")
	end
end

function pay_money()
	PK_PayMoney = GetPK() * GetPK() * 10000
	Talk(1,"pay_money2","��ң���ͷ��磬����"..PK_PayMoney.."�����ӣ�СС��˼���ɾ��⣬ֻ����������ʵ���ǲ������˿���ס���ɷ����翪�����ұ����ҽ�أ�")
end

function pay_money2()
	Say("��ͷ�������Ǻ�������������ô��������",2,"��Ǯ����������/pay_yes","��������/pay_no")
end

function pay_yes()
	PK_PayMoney = GetPK() * GetPK() * 10000
	if (GetCash() >= PK_PayMoney) then
		Pay(PK_PayMoney)
		Msg2Player("��ͷ�����㱣���ҽ��������뿪�����ˡ�")
		Talk(1,"leave_prison","��ͷ�������˵����ɷ����������飬��Ȼ�㲡����ô�أ��Ǿ���ȥ����ҽ���ɡ���ס����ֻ�Ǳ����ҽ����������δ��ģ���ȥǧ��Ҫ�ٷ�ʲô�¶��˰���")
	else
		pay_no()
	end
end

function pay_no()
	Talk(1,"","��ͷ������������Ų������ô���ӳ��㰡��")
end

function PKclear()
	Msg2Player("����̷�ʡ֮�������ڱ��ͷų�����")
	leave_prison()
end

function leave_prison()
	StopTimer()
	if (GetTask(94) == 9) then		-- ���ϴ���ر��������μ�ʱ����������������ֱ�����
		SetTask(94,0)
		SetTask(95,0)
	elseif (GetTask(94) > 0) then		-- �ָ�����ԭ�еļ�ʱ��
		Msg2Player("������Լ����ϻ��������񣬸Ͻ�ȥ������ɡ�")
		SetTimer(GetTask(95),GetTask(94))
		SetTask(94,0)
		SetTask(95,0)
	end
	FuYuan_Resume();
	leave2()
end

function visit_leave()
	leave2()
end

function leave2()
	SetTask(96,0)
	leave_pos = GetTask(93)
	DisabledTeam(0);
	if (leave_pos == 1) then		-- �ٰ�
		NewWorld(176,1473,3245)
	else								-- �꾩
		NewWorld(37,1781,3044)
	end
--	NewWorld(57,1592,3195)		-- �ӵ���ɽ����
end

function no()
end

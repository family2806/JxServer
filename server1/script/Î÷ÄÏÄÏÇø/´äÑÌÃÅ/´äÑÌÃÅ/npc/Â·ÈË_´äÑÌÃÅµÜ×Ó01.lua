-- ������ �����ŵ���1 ��������
-- by��Dan_Deng(2003-07-25)

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--�������������
		Talk(1,"U36_enter","����ս���󣬻���黨����<color=Red>��������<color>����ʦ�����.")
	elseif (Uworld36 == 0) and (GetLevel() >=10) and (GetFaction() ~= "cuiyan") then		--��������
		Say("�����Ź棬���Ϊ�������ӣ���Ҫ��<color=Red>������<color>, ƾ���¸Һ��ǻۻ��<color=Green>�黨<color>, ����������?",2,"���ԣ���������/enroll_yes","������ֻ�����ι�. /no")
	elseif (GetFaction() == "cuiyan") then			-- ͬ��
		Say("ʦ���뵽������������?",2,"�ԣ���ʦ�������ý�ȥ/U36_enter","��ֻ��������ʦ��/no")
	elseif (UTask_cy == 70*256) then
		Talk(1,"","ʦ��˴λ����ǿ�����λʦ�ã���ʲô�仯��?")
	else
		Talk(1,"","��ӭ��ͼ��٣���ӻ������Աߵ�·��ȥ.")
	end
end;

function enroll_yes()
	Talk(1, "U36_enter", "������ <color=Red>���<color>. �������õ��黨����ʦ�����.")
	Uworld36 = SetByte(GetTask(36),2,10)
	SetTask(36,Uworld36)
	AddNote("�ӻ������񣬻���黨������ȥ���ڳ��ڵĴ����ŵ���")
	Msg2Player("�ӻ������񣬻���黨������ȥ���ڳ��ڵĴ����ŵ���")
end;

function U36_enter()
--	SetPos(207,1693)
	SetPos(210,1622)
end

function no()
end;

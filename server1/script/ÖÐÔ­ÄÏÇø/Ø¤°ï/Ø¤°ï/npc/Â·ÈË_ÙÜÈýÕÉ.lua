-- ؤ�� �Ƴj���������� �������񡢳�ʦ����
-- by��Dan_Deng(2003-07-28)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(209) == 1 then
		allbrother_0801_FindNpcTaskDialog(209)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 60*256+10) then		-- ��ʦ������
			if (HaveItem(211)==1) and (HaveItem(201)==1) and (HaveItem(208)==1) and (HaveItem(209)==1) and (HaveItem(210)==1) and (HaveItem(206)==1) and (HaveItem(207)==1) and (HaveItem(200)==1) and (HaveItem(205)==1) then
				L60_prise()
			else
				Talk(1,"","ֻ��Ҫ�õ�9�����ӣ��Ϳ���˳����ʦ������! ")
			end
		elseif (UTask_gb == 60*256) and (GetLevel() >= 50) then		--��ʦ��������
			Say("������ӣ��������ʦ�ߣ�������뱾�����ƶ�������Ÿ����������е���ȥ���ܶ���? ",2,"��Ȼ��. /L60_get_yes","�һ������ʦ/no")
		else
			Talk(1,"","����˭���࣬����������Ž��������԰ѱ��﷢����.")
		end
	elseif (Uworld30 == 10) then		--�������������
		if (HaveItem(72) == 1) and (HaveItem(73) == 1) and (HaveItem(74) == 1) and (HaveItem(75) ==1) then
			Talk(1,"enroll_prise","�ܳ��ϣ������Ѿ��ҵ�4��")
		else
			Talk(1,""," ��Ҫ���ļ���û�У������ǲ")
		end
	elseif (Uworld30 == 0) and (GetLevel() >=10) and (GetFaction() ~= "gaibang") then		--������������
		Say("��ҪС���л��ӣ���Ȼ���֣�����Ҳ�м�ʶ����������?",2,"�ã�������. /enroll_get_yes","������ֻ�ǲι�. /enroll_get_no")
	else
		Talk(1,"","�����ֵ�ƽ����Ȼ�е�࣬���ǣ����Žᡣ�з�һ��ԣ��о�һ��ȡ����˲��ᶮ�����ǵĿ��ֵ�!")
	end
end;

function enroll_get_yes()
	Talk(1, "", "���ˣ����������ԣ����ȥ���ݰ������ļ���Ʒ")
	Uworld30 = SetByte(GetTask(30),2,10)
	SetTask(30,Uworld30)
	AddNote("������ȥ������4����Ʒ ")
	Msg2Player("������ȥ������4����Ʒ")
end;

function enroll_prise()
	Talk(1,"","�������������������ֵ���֣��ã�������Ϊ��������! ")
	DelItem(72)
	DelItem(73)
	DelItem(74)
	DelItem(75)
	i = ReturnRepute(15,29,2)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld30 = SetByte(GetTask(30),2,127)
	SetTask(30,Uworld30)
	AddNote("������񣬳�Ϊؤ����ʽ���� <color=Red> <color>. ")
	Msg2Player("������񣬳�Ϊؤ����ʽ���� ")
end;

function L60_get_yes()
	SetTask(8,60*256+10)
	AddNote("�ӳ�ʦ���񣺽����ض�����9������ ")
	Msg2Player("�ӳ�ʦ���񣺽����ض�����9������ ")
end;

function L60_prise()
	DelItem(211)
	DelItem(201)
	DelItem(208)
	DelItem(209)
	DelItem(210)
	DelItem(206)
	DelItem(207)
	DelItem(200)
	DelItem(205)
	SetRank(68)
	SetTask(8, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("��5�����ӷ���ؤ���ɳ�ʦ���񣬱���Ϊ��ң��ؤ. ")
	Msg2Player("��ϲ��˳����ʦ������Ϊ��ң��ؤ ")
end;

function no()
end;

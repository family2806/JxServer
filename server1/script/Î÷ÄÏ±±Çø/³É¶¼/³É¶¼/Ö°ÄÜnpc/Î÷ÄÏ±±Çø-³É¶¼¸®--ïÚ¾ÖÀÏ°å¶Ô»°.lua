--description: ���ϱ����ɶ����ھ��ϰ� 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Say("һ�������أ�û��˭�Ƕ��֣�������ʲô�£�",3,"������֧������/branch_branchlengqiang","��������ü�ɵ�40������/emei_fourtytask","û�£���Ľ������������!/no")
end;

function branch_branchlengqiang()
Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 >= 60 and Uworld1055 <= 120 ) then
			branch_lengqiang()
	else
		Talk(1,"","˭����Ϊ���ں��������ʵ�ϣ�ÿ�γ�ȥ��������˵�����ܻ���!")
	end
end

function emei_fourtytask()
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+40) then 							--������40������
		Talk(6, "", "��˵���ھֲ���һ���λ��ڵġ�ܽ�ؽ���ͼ������������Ҫ��������!", "�ھ��ϰ壺�ô�Ŀ�������֪���Ƿ�ͼ�ļ�ֵ�𣿶�������Ҳ���� ","�����л����ڵ���Ҫһ������ʲô�������ø��Ұɣ�Ҫʲô����ֻ�ܿ���!", "�㵹��ˬ�죬�ã�ֻҪ����Ϊ�����������������ҾͰѡ�ܽ�ؽ���ͼ����������.", "����������?", "<color=Red>��������<color>��<color=Red>ӥ�������<color>��<color=Red>������ָ<color>��ȫ�Ǳ�����������˳���ļ�����������������ɲ������Ŷ!")
		SetTask(1, 40*256+50)
		SetTask(29,0)				-- ��ʼ������֮ǰ������
		AddNote("���ھ��ϰ�Ի��������񣬽������������ң�ӥ��������ͱ�����ָ.")
		Msg2Player(" ��'�ھ��ϰ�Ҫ��ȥ���������ң�ӥ��������ͱ�����ָ����ȡ��ܽ�ؽ���ͼ�� ")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 0)) then		-- ���߶�ʧ�Ĵ���
		AddEventItem(21)
		Talk(1,"","�Ҹո���ͼ���������������ˣ��ҿ���������!")
	elseif (UTask_em == 40*256+50) then	-- ������40��������
		if (HaveItem(166)== 1  and  HaveItem(167)== 1  and  HaveItem(168)== 1) then
			Talk(1,"","���߽�����������Ϊ�ȣ���ԭ��ֻ������֪�Ѷ��ˣ�û�뵽�����Ū�����������������ã��ҾͰѡ�ܽ�ؽ���ͼ���͸���!")
			DelItem(166)
			DelItem(167)
			DelItem(168) 
			AddEventItem(21)
			Msg2Player("�õ�ܽ�ؽ���ͼ��'.")
			SetTask(1, 40*256+60)
			SetTask(29,0)
			AddNote("���������ң�ӥ��������ͱ�����ָ����ȡ��ܽ�ؽ���ͼ��.")
		else									--û��������������
			Talk(1,"","�ҹ� �� <color=Red>��������<color>, <color=Red>ӥ�������<color> �� <color=Red>������ָ<color> ����˵.")
		end
	else
		Talk(1,"","�ھ��ϰ壺���ھֵ���ʦ�Ǹ�������һ��ù��򣬱��ھֽӵ����⣬������˸Ҵ����⣬�ǽ����Բ�������")
	end
end

function no()
end

-- �ٰ� ·��NPC С̫�ࣨؤ��50������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+40) then				--����50������
		Talk(2,"L50_pay","ʲô��?","���ǲܹ��������ݣ��Ӽ�����˵㶫��Т�������˼ң��鷳��ͨ��һ��!")
	else
		Talk(1,"","С̫�ࣺ�߿��߿�����Ҫ�ڻʹ�ǰ�������ȥ�ģ�")
	end
end;

function L50_pay()
	Say("����! ʲô����? ��Ȼ����Т������ô��֪�����?",2,"��¸3000������! /L50_pay_yes","����/L50_pay_no")
end;

function L50_pay_yes()
	if (GetCash() >= 3000) then
		Pay(3000)
		Talk(1,"after_pay","֪��֪��������3000����Т�����ȾƵ�!")
	else
		Talk(1,"","��С��������!")
	end
end;

function after_pay()
	NewWorld(177, 1569, 3169)
	Msg2Player("��¸3000��С̫��,�����������԰��")
	Talk(1,"","�����⻹��࣬�ܹ�������������԰����ȥ��������!")
end

function L50_pay_no()
end;

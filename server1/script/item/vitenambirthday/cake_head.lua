CAKE_ITEM = 
{
{"���յ���",200000},
{"�ϵ����յ���",1000000},
}

MAX_EXP_CAKE = 50000000
TASK_CAKE_EXP = 1743

function main()
	if (GetTask(TASK_CAKE_EXP) < MAX_EXP_CAKE) then
		Msg2Player("���ѳ���һ��"..CAKE_ITEM[caketype][1]..", ��ý���"..CAKE_ITEM[caketype][2].."����ֵ.")
		AddOwnExp(CAKE_ITEM[caketype][2])
		SetTask(TASK_CAKE_EXP,GetTask(TASK_CAKE_EXP) + CAKE_ITEM[caketype][2]) 
		if (GetTask(TASK_CAKE_EXP) >= MAX_EXP_CAKE) then
			Msg2Player("��ֻ�ܴ����յ�����5000����ֵ!")
		else
			Msg2Player("�����Զ��һ�����յ����� "..(MAX_EXP_CAKE-GetTask(TASK_CAKE_EXP)).."����ֵ.")
		end
		return 0
	else
		Say("��ֻ�ܴ����յ�����5000����ֵ!",0)
		return 1
	end
end
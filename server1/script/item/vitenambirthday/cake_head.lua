CAKE_ITEM = 
{
{"B�nh sinh nh�t",200000},
{"�ϵ�B�nh sinh nh�t",1000000},
}

MAX_EXP_CAKE = 50000000
TASK_CAKE_EXP = 1743

function main()
	if (GetTask(TASK_CAKE_EXP) < MAX_EXP_CAKE) then
		Msg2Player("B�n �� �n 1 "..CAKE_ITEM[caketype][1]..", nh�n ���c ph�n th��ng"..CAKE_ITEM[caketype][2].."�i�m kinh nghi�m.")
		AddOwnExp(CAKE_ITEM[caketype][2])
		SetTask(TASK_CAKE_EXP,GetTask(TASK_CAKE_EXP) + CAKE_ITEM[caketype][2]) 
		if (GetTask(TASK_CAKE_EXP) >= MAX_EXP_CAKE) then
			Msg2Player("��ֻ�ܴ�B�nh sinh nh�t���5000����ֵ!")
		else
			Msg2Player("�����Զ��һ��B�nh sinh nh�t��� "..(MAX_EXP_CAKE-GetTask(TASK_CAKE_EXP)).."�i�m kinh nghi�m.")
		end
		return 0
	else
		Say("��ֻ�ܴ�B�nh sinh nh�t���5000����ֵ!",0)
		return 1
	end
end
----description: ���ִ�_ţţ
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- �ȴ���Ⲣɾ�������ĺ�����������ֻ�����Ǯ

function main(sel)
	UTask_world37=GetTask(65)
	if (UTask_world37==2) then		--�Ѿ��ӵ�����
		Say("��Ҫȥ�������ˣ�����һ��������������",2,"Ȱ˵/reason", "֧��/help")
	elseif (UTask_world37==9) then		--ѡ��Ȱ˵
		Say("���������ѵģ�����ҲҪ�ܾ�",0)
	elseif (UTask_world37==10) then		--ѡ��֧��
		Say("��Ҫȥ�������ˣ�����һ��������������",0)	
	else
		Say("������Щ���������磬Ҫ�ǿ���������һ���ͺ���",0)
	end
end;

function reason()		--ѡ��Ȱ˵ţţ
	Talk(3,"prise","����Ļ��˺��׵ģ��㻹��ôС��������Ҳû������ôȥ��������ѽ?","�ţ���˵��Ҳ�ԣ��ǵ��ҳ����˾�ȥ��������!","�ԣ��Ȱѻ��������ã��Ժ��ȥ����. ")
end;

function prise()
	Talk(1,"","�����Ȼؼ��ˡ�лл�㣬�������е��ҩ�����͸����!")
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	SetTask(65,9)
	AddRepute(6)		-- ������6��
	AddNote("�ҵ�ţţ��Ȱ���ؼң��������. ")
	Msg2Player("Ȱ˵ţţ�ؼң��������. ")
	Msg2Player("�õ�������ҩ")
	Msg2Player("��Ľ�����������6��. ")
end;

function help()			--ѡ�����ţţ
--	Say("��ң�СС��ͣ���ͦ��־����",3,"��һ������/arm","��һ������/money","��������/wait")
	Say("СС��ͣ���ͦ��־��!",2,"��һ������/money","��������/wait")		--���ܹ������������������䣬������ֻ��Ǯ
end

function arm()
	if x==0 then	--���û������
		Say("������û������?",3,"��һ������/arm","��һ������/money","��������/wait")
	else 
		--������
		Talk(1,"","лл�㣬�����!")
		AddOwnExp(100)
		SetTask(65,10)
		AddNote("�ҵ�ţţ������һ��������֧�����Ĵ�����")
	end
end

function money()
	if (GetCash() < 100) then
--		Say("��ң���ѽ��������û��ʲôǮ��",3,"��һ������/arm","��һ������/money","��������/wait")
		Talk(1,"","������û��Ǯ�����һ���")		--���ܹ������������������䣬������ֻ��Ǯ
	else
		Pay(100)
		Talk(1,"","лл�㣬�����!")
		AddOwnExp(100)
		SetTask(65,11)
		AddRepute(4)
		AddNote("�ҵ�ţţ������һ��������֧�����Ĵ����Ρ��������")
		Msg2Player("�ҵ�ţţ������һ��������֧�����Ĵ����Ρ��������")
		Msg2Player("��Ľ�����������! ")
		Msg2Player("��Ľ�����������4��. ")
	end
end

function wait()
end

----description: ���ִ�_С��
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/28 yuanlan
--Update: 2003-08-07 Dan_Deng
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel) 
  	UTask_world38=GetTask(66)
  	if ((UTask_world38 == 0) and (GetLevel() >= 6)) then		-- ��Ҫ6�����ϲ���������
  		Talk(3, "select", "С������ô�޵���ô����ѽ?", "үү���ˣ����Ǽ���ûǮ��ҩ.", "����ʲô�� ")
  	elseif (UTask_world38 == 1) then
		Talk(1,"","лл�ֳ���֮ǰүү��ҩ��ҩ���ϰ��õ�.")
  	elseif (UTask_world38 == 5) then
  		if (HaveItem(186) == 1) then
  			DelItem(186)
  			Talk(1,"","����лл�㣬����һ����ָ����������!")
  			SetTask(66,10)
  			i = random(0,3)
  			if (i < 3) then 
  				i = 8 
  			else 
  				i = 9 
  			end
  			AddRepute(i)
  			AddNote("�����㻢�Ǹ�С����������� ")
  			Msg2Player("�����㻢�Ǹ�С�����������  ")
  			if (random(0,3) == 0) then				-- 25%�Ļ��ʵö�����ָ
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
  				AddItem(0,3,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("��ý�ָ. ")
  			else
				p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
  				AddItem(0,3,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
  				Msg2Player("��û����ָ")
  			end
  			Msg2Player("����������� "..i.."��.")
  		else
  			Say("�㲻С��Ū�����㻢�Ǹ��ˣ���������������Ҫ�����㻢�Ǹ�.", 2, "��ȥ��Ǯ/find", "��ҩ���ϰ�����ҩ/redo")
  		end		
	elseif ((UTask_world38 > 1) and (UTask_world38 < 10)) then			-- �����е���ͨ�Ի�
		Talk(1,"","лл�㡣֮ǰ��үү��ҩ��ҩ���ϰ�����.")
  	elseif (UTask_world38 >= 10) then			-- ��������ĶԻ�
  		Talk(1,"","лл�㣬��ҩ�ˣ�үү�Ĳ�һ�����.")
	else					-- ������Ի�
  		Talk(1,"","үү�����Ѹߣ����岻�á���ֻϣ���Լ���ҽ���ܰ����β�.")
	end
end;

function select()
	Say("��Ҳ������ʲôҩ����֮ǰҩ���ϰ������.", 2, "������ҩ/yes", "����û�й�ϵ /no")
end;

function yes()
	Talk(1,"","лл�㣬�����ҩ���ϰ������ҩ.")
	SetTask(66,1)
	AddNote("�����񣺰�С����ҩ. ")
	Msg2Player("�����񣺰�С����ҩ. ")
end;

function no()
end;

function find()
end;

function redo()
Talk(1,"","��ҩ��ȡҩ!")
SetTask(66, 2)
SetTask(67, 0)
AddNote("<color=red> ��Ϊ���㻢�Ǹඪ�ˣ���ȥ��ҩ���ϰ���ҩ. <color> ")
Msg2Player("��Ϊ���㻢�Ǹඪ�ˣ���ȥ��ҩ���ϰ���ҩ. ")
end;

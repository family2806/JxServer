--description: �䵱�ɳ�ʦ���� �䵱ɽ����3
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","����: <color=Red>�ؽ�<color> �� <color=Red>��������<color> ����ֻ���Ⱦƣ��۸����գ��ϰ���Թ��<color=Red>����<color>����������")
			Msg2Player("������д�ţ�ȥ���������ؽ���Ϊ�����. ")
			SetTask(17, SetByte(GetTask(17),3,2))
			AddNote("������д�ţ�ȥ���������ؽ���Ϊ�����. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 5) then
			Talk(1,"","����������Ȼ��������<color=Red>����<color>  <color=Red>�ؽ�<color>.....")
			Msg2Player("����������Ȼ������ˮ�����֮��... ")
		elseif (UTask_wd60sub == 5) then
			AddEventItem(71)
			Talk(1,"","ȡ�� <color=Red>����<color> �򿪱��䣬���һ��<color=Red>̫���澭<color>.")
			Msg2Player("�������������һ��̫���澭. ")
			SetTask(17, SetByte(GetTask(17),3,10))
			AddNote("�򿪱�����һ��̫���澭")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(71) == 0) then
				AddEventItem(71)
			else
				Talk(1,"","�����ѿ�")
			end
		end
	else
		Talk(1,"","δ�������㲻�ܴ򿪱���!")
	end
end;

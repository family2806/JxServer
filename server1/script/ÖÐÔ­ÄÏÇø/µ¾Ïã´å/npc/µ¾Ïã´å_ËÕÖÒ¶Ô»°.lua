--description: ���ִ�_����
--author: wangzg	
--date: 2003/7/22
-- Update: Dan_Deng(2003-08-11)

function main()
	UTask_world43=GetTask(71)
	if (UTask_world43==1) then
		Talk(3, "select", "�ֵ������ң���ĸ����������!", "�Ҳ���ĸ�׵��ģ������Ҿ����Ӿ���!", "Ϊʲô?")
	elseif (UTask_world43==2) then
		Talk(1,"","ллָ��! ")
	elseif (UTask_world43==3) then
		Talk(1,"","���鷳��Ȱ��ĸ��! ")
	else	
		Talk(1,"","�������ڽ���֮�֣�������Ҳ�����! ")
	end
end;

function select()
Say("���ڹ������ѣ�����ô��ֻ����?",2,"Ȱ�� /against","�޳� /support")
end

function against()
	Talk(4,"","�����㻹���ᣬ���ӱ���ʮ�겻����ѧ�㱾�죬�պ����ɱ��! ", ".....��˵��Ҳ�е���","��֪���ͺã����ȥ��ĸ�װɣ���������!", "�õģ�лл!")
	SetTask(71,2)
	AddNote("Ȱ���ҳɹ�. ")
	Msg2Player("Ȱ���ҳɹ�. ")
end

function support()
	Talk(3,"","˵�ĺܺã�����Ȼ���ᣬ����־����.","�������飬���ǵ���ĸ�ײ���ȥ.","����ģ��Ұ���Ȱ����")
	SetTask(71,3)		
	AddNote("֧�����ҵľ�����������Ȱĸ��")
	MsgPlayer("֧�����ҵľ�����������Ȱ�մ���")
end

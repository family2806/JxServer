--������ ������ ·��3�����Ի�

function main(sel)

	if ( GetTask(1256) == 1) then
	
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","��˵��һλ��֪��������������ʦ̫�����ޱߣ���ȥ���ʿ���.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","����������ʱ�����ǸϿ��ҵ�������ĸ�Դ�����˺ܵ��İ�.")	 	
		 end
		 return
	elseif ( GetTask(1256) == 2) then
		Talk(1,"","��˵��һλ��֪��������������ʦ̫�����ޱߣ���ȥ���ʿ�.")
		return
	end

Say("���Ϻ�ɽѧ�䣬��һ������´����������ˣ���ǿ�����������е�����ô���磡",0)

end;


--������ ������ ·��8�Ż۶Ի�

function main(sel)

	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)
		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","��˵��һλ��֪��������������ʦ̫�����ޱߣ���ȥ���ʿ�.")
		 	SetTask(1256, 2);
		 	return
		 else
		 	Talk(1,"","��Ϊ����ֲ��������Ϻ�ɽ��·����û���������´�����.")
		 	return
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","��˵��һλ��֪��������������ʦ̫�����ޱߣ���ȥ���ʿ�.")
		return
	end

Say("�Żۣ���Ҳ����ɽ�ݷö��´��������������ҵ�ż����Ҫ�Ǽ��������鷳��������ǩ��������",0)

end;


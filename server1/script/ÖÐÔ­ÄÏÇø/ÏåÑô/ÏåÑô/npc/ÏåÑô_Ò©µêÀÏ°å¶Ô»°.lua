--description: ��ԭ���� ������ ҩ���ϰ�Ի� �䵱�ɳ�ʦ����
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "����ս���������ӣ�������ʲô�취��?", "������������Ҫ5��ҩ <color=Red> �ϻ������Ρ����顢��������ɰ��<color>.ȥ<color=Red>��ţɽ��<color> ��!")
			SetTask(17, SetByte(GetTask(17),1,5))
			AddNote("ҩ���ϰ� (201,202) ˵��ţɽ���кϻ������Ρ����顢��������ɰ5��ҩ")
		elseif (UTask_wd60sub == 5) then
			if ( HaveItem(107) == 1 and HaveItem(134) == 1 and HaveItem(135) == 1 and HaveItem(136) == 1 and HaveItem(137) == 1) then
				Talk(2, "", "���ҵ�5��ҩ����������ҩ���ս����ʿ����!", "�������ѣ�ƥ�����𡣷��ģ���һ�����ƣ���ʱ��ȥ!")
				DelItem(107)
				DelItem(134)
				DelItem(135)
				DelItem(136)
				DelItem(137)
				SetTask(17, SetByte(GetTask(17),1,8))
				AddNote("�ҹ�5��ҩ�ϣ�����ҩ���ϰ壬�����˼���������.")
				Msg2Player("�ҹ�5��ҩ�ϣ�����ҩ���ϰ壬�����˼���������.")
			else
				Say("ҩ���ϰ壺����������Ҫ����ҩ�ģ�<color=Red>���顢�ϻ������Ρ���������ɰ<color>��ȱһ���ɡ�������ҩ�Ķ�������<color=Red>��ţɽ�Ķ���<color>��",
					2,
					"����/yes",
					"������/no")
			end
		else
			Say("�������ƴ��ˣ����ˡ�ײ�ˡ����˵�Ҫ���У�������ʲôҩ?",
				3,
				"����/yes",
				"�������Ԫ��¶ /refine",
				"������/no")
		end
	else
		Say("ҩ���ϰ壺���������Ƹ��ִ��ˡ����ˡ�ײ�ˡ����ˡ����ˡ����˵�ҩ�ȱ𴦶���ȫ������Ҫ��ô��ҩ��",
			3,
			"����/yes",
			"���ƻ�Ԫ��¶/refine",
			"������/no")
	end
end

function yes()
	Sale(12)  			--�������׿�
end

function no()
end

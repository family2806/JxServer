--description: ������ ������ �Ƶ��ϰ�Ի� ������������
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\timerhead.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 20) then 							--��������������
Talk(4, "", "��ң��ϰ壬������ʲô����ã�", "�Ƶ��ϰ壺������õľƷ�<color=Red>����������<color>Ī����ֻ���������־ƺܷѹ��򣬶���ԭ��Ҳ�����ң����Լ�Ǯ�����ˡ�", "��ң�ֻҪ�ƺþ��У�������һ̳��Ҫ�������ӣ�", "�Ƶ��ϰ壺�����ٶ�Ҳû�ã������Ѿ��ܾ�û���������־��ˣ���Ϊȱ��ԭ��<color=Red>��֥<color>��<color=Red>����<color>��<color=Red>������<color>���������Ū��������ԭ�ϣ��ҾͰ�������һ̳����˵������ҩ��������<color=Red>����ɽ�Ķ�����<color>��ֻ���������кܶ���˵Ĺ��ޣ�����û�˸�ȥ������")
		SetTask(38,SetByte(GetTask(38),1,40))
		AddNote("�Ͱ����ؾƹ��ϰ�Ի���֪��Ҫ��3��ԭ����ƣ���֥�����Σ�������.")
		Msg2Player("֪��Ҫ��3��ԭ����ƣ���֥�����Σ�������. ")
	elseif (Uworld38 == 40) then
		if (HaveItem(116) == 1) and (HaveItem(135) == 1) and (HaveItem(144) == 1) then
			if (GetTimerId() > 0) then		-- ���м�ʱ����������
				Talk(1,"","�������н��������񣬻�Ҫ����")
				return
			end
			Talk(2,"","�ϰ�! �������ҹ�3��ԭ���ˣ����������������!","�õģ�����Ҫ1��Сʱ�ſ���. ")
			DelItem(116)
			DelItem(135)
			DelItem(144)
			SetTask(38,SetByte(GetTask(38),1,60))
			SetTimer(1 * CTime * FramePerSec, 1)									--������ʱ��
			AddNote("���������ؾƹݣ�����ԭ�ϣ�֪��Ҫ��һСʱ. ")
			Msg2Player("����ԭ�ϣ�֪��Ҫ��һСʱ. ")
		else
			Talk(1,"","��˵������ҩ��������<color=Red>����ɽ�Ķ�����<color>��ֻ���������кܶ���˵Ĺ��ޣ�����û�˸�ȥ����. ")
		end
	elseif (Uworld38 == 60) then			-- Ϊ��ʱ���ݴ�����ֶ���ʱ����
		i = GetRestSec(1)
		if (i > 0) then
			Talk(1,"","ʱ�仹û�����ƻ�û����ã��㻹Ҫ��: "..i.."��, ")
		else
			StopTimer()						--������ʱ
			SetTask(38,SetByte(GetTask(38),1,80))
			TWenroll_getitem()
		end
	elseif (Uworld38 == 80) and (HaveItem(90) == 0) then
		TWenroll_getitem()
	elseif (Uworld38 >= 80) then		-- ��ɴ������
		Talk(1,"","���������������ͽ��������")
	else
		Talk(1,"","�Ƶ��ϰ壺�������������������֮�磬�Ӳ��ḻ���͹�Ҫ�Ե�ʲô�ʻ����ȵ�ʲô�ƣ�")
	end
end;

function TWenroll_getitem()
	AddEventItem(90)
	Msg2Player("�õ�һ��������. ")
--	SetTask(3, 8)
	AddNote("һСʱ�󣬻����ƹ���������. ")
end

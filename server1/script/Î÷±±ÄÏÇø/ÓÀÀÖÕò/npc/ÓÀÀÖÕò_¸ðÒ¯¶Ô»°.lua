--description: ���ִ�_��ү
--author: wangzg	
--date: 2003/7/21
--update 2003/7/24 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world42=GetTask(70)
	if (UTask_world42==2) then
		Talk(2, "step1", "�ҿ���������鿴ô?","�ߣ��ҿ����Ǵ山��³��ͷ�����İɡ���ͺ���˵������Ҫ����͵ú��һ��������á��ļ�־�������ҵġ�����¼��.")
	elseif ((UTask_world42==6) and (HaveItem(189) == 1)) then		-- ����
		Talk(2, "step3", "������Ҫ����.", "̫���ˣ����������Ҫ����.")
	elseif ((UTask_world == 8) and (HaveItem(188) == 0)) then		-- �鶪��
		Talk(1,"","С�ӣ���֪�������������������ҵ������")
		AddEventItem(188)
		Msg2Player("�õ�����¼")
	else
		Talk(1,"","С�ӣ����˲�һ��Ҫ�������棬�еĶ���˵�����Ͳ���Ҫ������!")
	end
end;

function step1()
	SetTask(70,4)
	AddNote("�ҵ����ϸ�ң�����³�����ļ�־������¼. ")
end;

function step3()
DelItem(189)
AddEventItem(188)
SetTask(70,8)
AddNote("�ڸ�ң����ļ�־������¼")
Msg2Player("���ļ�־������¼")
end;

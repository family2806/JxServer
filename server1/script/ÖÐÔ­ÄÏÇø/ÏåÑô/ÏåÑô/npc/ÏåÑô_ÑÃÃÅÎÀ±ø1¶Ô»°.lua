--��ԭ���� ������ ��������1�Ի�

FESTIVAL06_NPCNAME = "<color=yellow>��������:<color>";
Include([[\script\global\·��_��������.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Say("�سǴ����Ѵ����ź�����ܵ������ˣ�������û������ô��!", 0)
		AddNote("�������������Ի���֪���ؽ��Ѵ����ź�����ܵ�����. ")
		Msg2Player("ԭ�������Ѵ����ź�����ܵ�����. ")
	else
		Talk(1,"","����������ι��С�ӣ���̽ͷ̽�Եģ���ô˹ѽ���ѵ����ǽ��˵ļ�ϸ��")
	end
end;

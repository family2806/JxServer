function main()
--����һ����ʯ

AddEventItem(351);
Msg2Player("��ϲ�������õ���һ��ɽ�����ͼ��Ƭ��");
Name = GetName();
str = format("��ϲ��%s �õ���һ��ɽ�����ͼ��Ƭ��", Name);
AddGlobalNews(str);
WriteLog(date("%m%d%H%M")..str);
DelObject();
end;
--��ԭ���� ���ݸ� ����

function main(sel)
	Say("������������ؿ�����!",2,"��ѡѡ��. /yes","����/no")
end;

function yes()
	Say("ӭ����װ������Ů��װ���۸�Ϊ88888 ��!",3,"�����·�/male","�����·� /female","����/no")
end;

function no()
	Say("����Ҳû��! �������",0)
end;

function male()
	if(GetCash()>=88888)then
		AddItem(0,2,28,7,0,0,0)
		Pay(88888)
	else
		Say("����Ǯ����������Ǯ������!",0)
	end
end;

function female()
	if(GetCash()>=88888)then
		AddItem(0,2,28,8,0,0)
		Pay(88888)
	else
		Say("����Ǯ����������Ǯ������!",0)
	end
end;

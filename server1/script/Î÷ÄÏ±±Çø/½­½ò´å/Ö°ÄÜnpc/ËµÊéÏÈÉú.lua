--���ϱ��� ����� ˵������������

function main(sel)

Say("���佭������������ֻ��һ��ƶ�����!", 2, "��һ����/yes", "���� /no");

end;


function yes()
	i=random(0,2);
	if(i == 0)then
		PlayMusic("\\Music\\Music901.mp3")
	elseif(i == 1)then
		PlayMusic("\\Music\\Music902.mp3")
	else
		PlayMusic("\\Music\\Music903.mp3")
	end;
end;


function no()
end;

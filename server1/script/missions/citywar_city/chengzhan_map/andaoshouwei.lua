--��������
function main()
	Say("���������������Ϯ���о����ܵ�������ʹ������ܵ���?", 2, "�� /OnGo", "���� /OnCancel");
end

function OnGo()
	local mapid = 221
	local i = random(0,1);
	
	if (i == 0) then
		NewWorld(mapid,1739,3513)
	else
		NewWorld(mapid,1836,3405)
	end
	
	SetFightState(1);
end

function OnCancel()
end

function GetDesc(nItem)
	return ""
end

function main(nItem)
	Say("�����з������4�������ͷ�������<color=red> �����ػ���<color> �챣��", 6, 
		"���4�������get_chejinfu",
		"���4����ľ��get_chemufu", 
		"���4����ˮ��get_cheshuifu", 
		"���4�������get_chehuofu", 
		"���4��������get_chetufu", 
		"���������뮷/no");
	return 1	
end

function get_chejinfu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>�밲��һ��װ��������Ҫ��һ����λ��Ȼ��ʹ�����з�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] ʹ�����з����4�������",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2807,0,0,0)
	end;
end

function get_chemufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>�밲��һ��װ��������Ҫ��һ����λ��Ȼ��ʹ�����з�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] ʹ�����з����4����ľ��",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2808,0,0,0)
	end;
end

function get_cheshuifu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>�밲��һ��װ��������Ҫ��һ����λ��Ȼ��ʹ�����з�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] ʹ�����з����4����ˮ��",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2809,0,0,0)
	end;
end

function get_chehuofu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>�밲��һ��װ��������Ҫ��һ����λ��Ȼ��ʹ�����з�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] ʹ�����з����4�������",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2810,0,0,0)
	end;
end

function get_chetufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>�밲��һ��װ��������Ҫ��һ����λ��Ȼ��ʹ�����з�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] ʹ�����з����4��������",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2811,0,0,0)
	end;
end

function no()
end

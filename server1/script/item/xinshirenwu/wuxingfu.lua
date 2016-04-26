function GetDesc(nItem)
	return ""
end

function main(nItem)
	Say("打开五行符将获得4个符降低防御能力<color=red> 宝库守护者<color> 天保库", 6, 
		"获得4个撤金符get_chejinfu",
		"获得4个撤木符get_chemufu", 
		"获得4个撤水符get_cheshuifu", 
		"获得4个撤火符get_chehuofu", 
		"获得4个撤土符get_chetufu", 
		"让我先想想/no");
	return 1	
end

function get_chejinfu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>请安排一下装备，至少要留一个空位，然后使用五行符")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] 使用五行符获得4个撤金符",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--扣除五行符
	for i = 1, 4 do
		AddItem(6,1,2807,0,0,0)
	end;
end

function get_chemufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>请安排一下装备，至少要留一个空位，然后使用五行符")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] 使用五行符获得4个撤木符",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--扣除五行符
	for i = 1, 4 do
		AddItem(6,1,2808,0,0,0)
	end;
end

function get_cheshuifu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>请安排一下装备，至少要留一个空位，然后使用五行符")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] 使用五行符获得4个撤水符",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--扣除五行符
	for i = 1, 4 do
		AddItem(6,1,2809,0,0,0)
	end;
end

function get_chehuofu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>请安排一下装备，至少要留一个空位，然后使用五行符")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] 使用五行符获得4个撤火符",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--扣除五行符
	for i = 1, 4 do
		AddItem(6,1,2810,0,0,0)
	end;
end

function get_chetufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>请安排一下装备，至少要留一个空位，然后使用五行符")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] 使用五行符获得4个撤土符",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--扣除五行符
	for i = 1, 4 do
		AddItem(6,1,2811,0,0,0)
	end;
end

function no()
end

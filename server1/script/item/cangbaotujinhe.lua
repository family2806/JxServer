-----------------------------------------------------
--文件名		：	cangbaotujinhe.lua
--创建者		：	子非魚
--创建时间		：	2008-01-17
--功能描述		：	右键点击使用后可获得12片藏宝图碎片
--物品编号		：	6,1,1651,1,0,0
------------------------------------------------------

function main()
	
	if (CalcFreeItemCellCount() < 12)  then		--背包空间判断，必须预留12格
		Say("请先再安排一下装备!");
		return 1;
	end;
	
	for i = 490, 501 do							--藏宝图碎片 编号
		AddEventItem(i);
	end;
	
	Msg2Player("获得12块藏宝图.");
	
	WriteLog(format("%s\t%s\tName:%s\tAccount:%s\t",
				"锦盒",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(),
				GetAccount(),
				"获得12块藏宝图."));
end;
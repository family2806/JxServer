Include("\\RelaySetting\\Task\\bosswhere.lua")
Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 51122
Interval = 1440;
Count = 0;
StartHour=23;
StartMin=0;

function NewBoss()
	str = "�ٸ������������׷���ӷ�!"
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["zhangzongzheng"][Random(getn(where.zhangzongzheng))+1], 511, 90;
end;




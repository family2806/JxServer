Include("\\RelaySetting\\Task\\bosswhere.lua")
Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 52320
Interval = 1440;
Count = 0;
StartHour=19;
StartMin=30;

function NewBoss()
	str = "��˵����������ɱ�˺ܶ཭������ "
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["liuqingqing"][Random(getn(where.liuqingqing))+1], 523, 90;
end;




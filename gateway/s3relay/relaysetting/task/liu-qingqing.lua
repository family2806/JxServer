Include("\\RelaySetting\\Task\\bosswhere.lua")
Include("\\RelaySetting\\Task\\GoldBossHead.lua");
Sid = 523
Interval = 1440;
Count = 0;
StartHour=-1;
StartMin=-1;

function NewBoss()
	str = "听说唐门柳青青杀了很多江湖高手"
	GlobalExecute(format("dw AddLocalNews([[%s]])", str));
	return 1, where["liuqingqing"][Random(getn(where.liuqingqing))+1], 523, 90;
end;




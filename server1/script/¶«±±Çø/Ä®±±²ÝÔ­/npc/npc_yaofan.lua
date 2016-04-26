-- 漠北草原 职能 药贩
-- By: li_xin(2005-01-18)

function main()
	Say("药店老板：虽然此地是北极，但是也有天然的珍稀药材，这位客官想买什么?", 2, "交易/yes", "不交易/no")
end;

function yes()
	Sale(100);  			--弹出交易框
end;

function no()
end;

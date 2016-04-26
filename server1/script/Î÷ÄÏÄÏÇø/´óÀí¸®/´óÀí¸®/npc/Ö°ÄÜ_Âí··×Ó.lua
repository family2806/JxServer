-- 大理　职能　马贩子
-- by：Dan_Deng(2003-09-16)

function main()
	Say("行走江湖的人，都需要一匹战马，我的马虽然不是名马，但是，他的耐力惊人，它的性格温和，价格也不贵.", 2, "交易/yes", "不交易/no")
end;

function yes()
	Sale(48)
end;

function no()
end;

-- 西山屿 职能 药贩
-- By: li_xin(2005-01-27)

function main()
	Say("西山屿是一个易进难出的地方。如果想要在上面活得久一点，还是买点我的药吧!", 2, "交易/yes", "不交易/no")
end;

function yes()
	Sale(100);  			--弹出交易框
end;

function no()
end;

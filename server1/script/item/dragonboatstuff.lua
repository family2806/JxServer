function main()
	local a = "小龙舟 = 1个龙头+1个龙尾+1个龙身+1个龙骨+4个橹桨+1个舵+1个鼓";
	local b = "<enter>传统龙舟 = 1个小龙舟+4个橹桨";
	local c = "<enter>马头龙舟 = 1个小龙舟+1个传统龙舟+1个龙头";
	Say(a..b..c, 2, "下一页/nextpage", "关闭/no");
	return 1;
end

function nextpage()
	local d = "鸟头龙舟 = 1个马头龙舟1个+1个传统龙舟+1个龙头";
	local e = "<enter>兽形龙舟 = 1个鸟头龙舟+1个马头龙舟+1个龙头";
	local f = "<enter>巨型龙舟 = 1个兽形龙舟+1个鸟头龙舟+1个马头龙舟";
	Say(d..e..f, 2, "上一页/main", "关闭/no");
end

function no()
end
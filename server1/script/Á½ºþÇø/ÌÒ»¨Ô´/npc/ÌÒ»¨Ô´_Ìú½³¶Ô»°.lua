--两湖区 桃花源 铁匠对话
Include("\\script\\global\\紫色及黄金装备铸造.lua")

function main(sel)

Say("铁匠：自古美酒配英雄、名剑配侠士，虽然一枝柳条亦可杀人，但是习武之人，有谁会不喜欢宝剑利刃呢？", 2, "交易/yes", "不交易/no");

end;


function yes()
Sale(40);  			--弹出交易框
end;


function no()
end;








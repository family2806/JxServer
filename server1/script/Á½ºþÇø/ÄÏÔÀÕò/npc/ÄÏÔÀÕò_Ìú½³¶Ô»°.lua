--两湖区 南岳镇 铁匠对话

Include("\\script\\global\\紫色及黄金装备铸造.lua")
function main(sel)

Say("铁匠：人在江湖飘，哪能没把刀？我这里的名剑利器可不少，请慢慢挑。", 2, "交易/yes", "不交易/no");

end;


function yes()
Sale(34);  			--弹出交易框
end;


function no()
end;








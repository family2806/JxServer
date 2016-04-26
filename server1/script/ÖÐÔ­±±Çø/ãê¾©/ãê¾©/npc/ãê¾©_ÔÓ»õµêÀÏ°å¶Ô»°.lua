--中原北区 汴京府 杂货店老板对话
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
Say("杂货店老板：您要点什么？如今这世道大家都过的不容易，所以我这店里的东西都不贵，你看看需要些什么？", 2, "交易/yes", "不交易/no");

end;


function yes()
Sale(8);  			--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;



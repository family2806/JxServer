--中原南区 扬州府 杂货店老板对话
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("杂货店老板娘：咱们扬州水路通衢，是南北货物集散之地，所以我这里的商品集东西南北之大全，应有尽有，要买点什么？", getn(Buttons), Buttons);

end;


function yes()
Sale(5);  			--弹出交易框
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;






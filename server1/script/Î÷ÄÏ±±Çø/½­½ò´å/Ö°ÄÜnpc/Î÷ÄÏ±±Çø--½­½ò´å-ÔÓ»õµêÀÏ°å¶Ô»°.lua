--西南北区 江津村 杂货店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("杂货店老板：小店的货齐全着呢，你想买点什么？先看看吧",getn(buttons), buttons);
end;


function yes()
Sale(23);   			--弹出交易框
end;


function no()
end;







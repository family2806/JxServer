--中原南区 稻香村 杂货店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("各地的货，我这里都有 ",getn(buttons), buttons);
end;


function yes()
Sale(90);   			--弹出交易框
end;


function no()
end;
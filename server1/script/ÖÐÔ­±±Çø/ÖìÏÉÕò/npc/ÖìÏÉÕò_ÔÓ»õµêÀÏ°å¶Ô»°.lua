--中原北区 朱仙镇 杂货店老板对话
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("只有客官想，这里没有什么是买不到的",getn(buttons), buttons);
end;


function yes()
Sale(87);   			--弹出交易框
end;


function no()
end;
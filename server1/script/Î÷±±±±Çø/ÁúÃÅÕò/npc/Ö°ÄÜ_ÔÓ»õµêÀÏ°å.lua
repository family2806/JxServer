--龙门镇 职能 杂货店老板
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");
function main(sel)
	local buttons = store_sel_village_extend()
		Say("本店虽小但什么都有。客官想买什么?",getn(buttons), buttons)
end;

function yes()
	Sale(26)
end;

function no()
end;

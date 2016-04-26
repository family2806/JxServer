-- 石鼓镇 职能 杂货店老板
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("客官想买什么？想买什么都有",getn(buttons), buttons);
end;

function yes()
	Sale(26)			-- 临时使用，与龙门镇重用
end;

function no()
end;

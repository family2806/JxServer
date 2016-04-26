----西南北区 江津村 路人2吴老太对话

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_wulaotai()
	else
Say("吴老太：我虽然没有儿子，可是养了个孝顺的好闺女，街坊都说我老婆子有福气。",0)
	end
end;
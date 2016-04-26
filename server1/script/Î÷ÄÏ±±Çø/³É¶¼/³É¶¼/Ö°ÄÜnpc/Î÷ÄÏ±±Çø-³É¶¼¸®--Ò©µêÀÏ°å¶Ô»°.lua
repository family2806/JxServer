--西南北区 成都府 药店老板对话

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	Say("药店老板：我年轻的时候，想做一个像华佗一样的名医，后来娶妻生子，为了养家糊口，只得开了这家药店。瞧我这个人，罗嗦了半天，还没有问你要买啥子药？",
		3,
		"交易/yes",
		"炼制混元灵露/refine",
		"不交易/Cancel")
end

function yes()
	Sale(15) 		--弹出交易框
end

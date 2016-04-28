-- 临安　职能　药店老板
-- by：Dan_Deng(2003-09-16)

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	Say(10855,
		3,
		"交易/yes",
		"炼制混元灵露/refine",
		"不交易/Cancel")
end;

function yes()
	Sale(12)  				--弹出交易框
end

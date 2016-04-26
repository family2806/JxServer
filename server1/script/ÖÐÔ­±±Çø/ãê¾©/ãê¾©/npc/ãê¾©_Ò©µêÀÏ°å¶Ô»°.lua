--中原北区 汴京府 药店老板对话
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("药店老板：我这儿什么药都有，养身健体的、治病消灾的、延年益寿的、补血提气的，您要买什么药？",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(9) 			--弹出交易框
end

if TEACHERSWITCH then
	tinsert(OPTIONS, "帮我放药酒/brew")
end
tinsert(OPTIONS, "交易/yes")
tinsert(OPTIONS, "炼制混元灵露/refine")
tinsert(OPTIONS, "不交易/Cancel")

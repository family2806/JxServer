--西北南区 凤翔府 药店老板对话
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("药店老板：俺这里卖的草药有病治病、无病养身。像你们这种在刀口上讨生活的人，更是离不了这些活命的草药。",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(12) 		--弹出交易框
end;

if TEACHERSWITCH then
	tinsert(OPTIONS, "帮他酿药酒/brew")
end
tinsert(OPTIONS, "交易/yes")
tinsert(OPTIONS, "炼制混元灵露/refine")
tinsert(OPTIONS, "不交易/Cancel")

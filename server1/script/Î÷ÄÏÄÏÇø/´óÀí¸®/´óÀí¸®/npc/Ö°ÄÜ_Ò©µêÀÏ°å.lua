-- 大理 职能 药店老板
-- By: Dan_Deng(2003-09-16)
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

OPTIONS = {}

function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	Say("我的店靠点苍山生活，上面有上千种草药.",
		getn(OPTIONS),
		OPTIONS)
end;

function yes()
	Sale(12)  			--弹出交易框
end

if TEACHERSWITCH then
	tinsert(OPTIONS, "帮我放药酒/brew")
end
tinsert(OPTIONS, "交易/yes")
tinsert(OPTIONS, "我想制作混元灵露refine")
tinsert(OPTIONS, "不交易/Cancel")

ValenAct_nStartDate = 20120209
ValenAct_nEndDate = 20120301
ValenAct_TSK_REDLINE = 0
ValenAct_TREE_STATE = 1
ValenAct_TSK_STATE = 2
ValenAct_TSK_PUBTIME = 3
ValenAct_TSK_CREATETIME = 4
ValenAct_TSK_ID_AND_RANDOMTIME = 5
ValenAct_TSK_ACCTIME = 6
ValenAct_TSK_SCORE = 7
ValenAct_TSK_AWARD = 8
ValenAct_TSK_SINGLE_TIME = 9
--ValenAct_nLifePeriod = 30*60 
ValenAct_nMidTime = 60	-- 每个任务放弃未领取时间
ValenAct_nLoopTime = 90	-- 每个任务以领取未完成时间
ValenAct_nStepTime = 300 -- 成长阶段
ValenAct_nStepTaskTime = 270 -- 每个阶段任务时间
ValenAct_nStepPartTime = 30 -- 每个阶段空闲时间
ValenAct_nPickTime = 10*60  -- 采摘时间
ValenAct_nTskStepCount = 3
ValenAct_tbMap = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53}
ValenAct_tbNpcId = {1252, 1253, 1254, 1255,}
ValenAct_nUnGrow = 0
ValenAct_nGrowing = 1
ValenAct_tbConfig = {
	["玫瑰种子"] = {nTeamSize = 2, nItemIndex = 3109, nSexScore = 1, 
		tbName = {"玫瑰盘", "小玫瑰树", "玫瑰树没有开花", "玫瑰树开满花", },
		tbDialog = {
			"君心思我心",
			"执子之手，与子皆老.",
			"此情无计可消除，才下眉头,却上心头.",
			"我愿与君相知",
			"愿天下有情人终成眷属.",
		},
		szAddStatKey = "qingrenjie_zhongmeiguihuazhong",
	},
	["u H錸g"] = {nTeamSize = nil, nItemIndex = 3110,	nSexScore = nil,
		tbName = {"红豆种子", "小红豆树", "红豆树未开花", "红豆树结果", },
		tbDialog = {
			"红豆生南国，春来发几枝",
			"愿君多采撷，此物最相思",
			"情人怨遥，竟夕起相思",
			"长相思，长相思，若问相思甚了期。除非相见时.",
			"长相思，长相思，欲把相思说似谁 浅情人不知.",
			"长相思兮长相忆，短相思兮无穷极.",
		},
		szAddStatKey = "qingrenjie_zhonghongdou",
	},
}
ValenAct_nRedLineIndex = 3111
ValenAct_Op = {"Ti nc", "浇水", "割草", "除虫",}
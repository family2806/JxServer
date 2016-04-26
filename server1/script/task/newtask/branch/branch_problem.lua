--宋金问答 （偶用了一种愚蠢的写法，哎）
--by xiaoyang
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function branch_songjinproblem()

	Describe("下面你将参与到关于宋金战争的问答中间来，请做好准备，这可能是一道比较艰难的关卡。那么，我们是否开始？<enter>",2,"开始吧/branch_problemstart","我再想想/no")
end

function branch_problemstart()
	Describe(DescLink_SongJinProblem.."1、拿到帅旗变为举旗士兵后，怎样知道目的地坐标并成功夺得帅旗？<enter>"
	.."A:夺到帅旗后，公告栏中会告诉玩家目的坐标，或者随时使用旗标得知目的地坐标，旗标不会消耗，到达目的地后再次使用旗标便成功达成夺旗，并且消耗掉旗标。<enter>" --y
	.."B:夺到帅旗后，公告栏中会告诉玩家目的坐标，或者随时使用旗标得知目的地坐标，但旗标会消耗，到达目的地后再次使用旗标便成功达成夺旗，同样会消耗掉旗标。<enter>"
	.."C:夺到帅旗后，公告栏中会告诉玩家目的坐标，或者随时使用旗标得知目的地坐标，到达目的地后再次使用旗标便成功达成夺旗，旗标无论怎样使用都不会消耗。<enter>"
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem1a","B/branch_problem1b","C/branch_problem1c")
end

function branch_problem1a()
		Describe(DescLink_SongJinProblem.."2、新版宋金大战的开放时间是几时？<enter>"
	.."A:每天的12：00、24:00开放报名，报名时间为30分钟。报名结束后正式开战，战斗时间为60分钟。<enter>"
	.."B:没有固定时间，由系统广播滚动通知。<enter>"
	.."C:每天的13：30、19：30、21：30开放报名，报名时间为30分钟。报名结束后正式开战，战斗时间为60分钟。<enter>" --y
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem2a","B/branch_problem2b","C/branch_problem2c")
	
end

function branch_problem1b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem1c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem2a()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem2b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem2c()
		Describe(DescLink_SongJinProblem.."3、加入战役后我如何知道当前的战况？<enter>"
	.."A:玩家可以随时使用～键（tab键上方的按键）打开和关闭即时战报界面，了解当前战况。<enter>"--y
	.."B:玩家只能通过左下方的公告中得知当前的战况。<enter>"
	.."C:玩家可以在后营的军需官处，询问到当前的战况。<enter>" 
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem3a","B/branch_problem3b","C/branch_problem3c")
end

function branch_problem3a()
	Describe(DescLink_SongJinProblem.."4、报名新版宋金大战需要什么条件？<enter>"
	.."A:没有等级要求，只要交纳报名费3000两剑侠币，就可参加。但是，报名结束后就不能报名进入。<enter>"
	.."B:玩家需要达到或超过40级，并交纳报名费3000两剑侠币，就可参加。报名时间结束后，但报名人数未达上限400人，仍可报名进入。<enter>"--y
	.."C:玩家需要达到或超过40级，并交纳报名费3000两剑侠币，就可参加。但是，报名结束后就不能报名进入。<enter>" 
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem4a","B/branch_problem4b","C/branch_problem4c")
end

function branch_problem3b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem3c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem4a()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem4b()
	Describe(DescLink_SongJinProblem.."5、玩家夺得帅旗，变为举旗士兵后各项属性值有没有改变？<enter>"
	.."A:有。玩家的各属性抗性和攻击力都有所增加。<enter>"
	.."B:没有什么变化。<enter>"
	.."C:有。玩家的跑速会有相应下降，其他属性无变化。<enter>" --y
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem5a","B/branch_problem5b","C/branch_problem5c")
end

function branch_problem4c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem5a()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem5b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem5c()
	Describe(DescLink_SongJinProblem.."6、我进入宋金大战后掉线了怎么办？<enter>"
	.."A:报名之后中途下线或战争中下线之后再上线可直接去报名处通过对话进入，不必再次交纳报名费。<enter>"--y
	.."B:报名之后中途下线或战争中下线之后再上线可直接去报名处通过对话进入，但是要再次交纳报名费。<enter>"
	.."C:报名之后中途下线或战争中下线之后再上线都不能再次进入，只能等下一次开放时间报名进入。<enter>" 
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem6a","B/branch_problem6b","C/branch_problem6c")
end

function branch_problem6a()
	Describe(DescLink_SongJinProblem.."7、新版宋金大战有没有死亡惩罚？<enter>"
	.."A:有一定死亡惩罚，会损失一定的经验值，死亡后被传送到战场后营，可以继续冲向战场。<enter>"
	.."B:没有任何惩罚，死亡之后会被传送到战场后营，玩家可以继续冲向前方。<enter>"--y
	.."C:有死亡惩罚，死亡后不能再进入战场，但不会损失经验值和金钱。<enter>" 
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem7a","B/branch_problem7b","C/branch_problem7c")
end

function branch_problem6b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem6c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem7a()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem7b()
	Describe(DescLink_SongJinProblem.."8、宋金战专用道具能不能购买？<enter>"
	.."A:可以。玩家只能在宋金战未开战前，在新版宋金大战报名点的军需官处使用获得的宋金积分购买专用道具。<enter>"--y
	.."B:可以。玩家可以随时在新版宋金大战报名点的军需官处购买宋金专用道具，需要花费一定的剑侠币。<enter>"
	.."C:不可以。玩家只能在新版宋金战场内杀NPC得到。<enter>" 
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem8a","B/branch_problem8b","C/branch_problem8c")
end

function branch_problem7c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem8a()
	Describe(DescLink_SongJinProblem.."9、进入战场后能不能摆摊买卖物品？<enter>"
	.."A:玩家只能在新版宋金大战的报名点处摆摊。<enter>"
	.."B:玩家在新版宋金大战的报名点和战场中都不能摆摊。<enter>"
	.."C:玩家在新版宋金大战的报名点和战场后营中都可以摆摊。<enter>" --y
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem9a","B/branch_problem9b","C/branch_problem9c")	
end

function branch_problem8b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem8c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem9a()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem9b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem9c()
	Describe(DescLink_SongJinProblem.."10、在宋金大战中，能不能随意选择阵营？<enter>"
	.."A:不行。一名玩家一旦报名参加一方，以后所有的战役都必须参加这一方的阵营。<enter>"
	.."B:可以。玩家可以在这一场参加一方，紧接着的下一场就参加敌方阵营。<enter>"
	.."C:不行。一名玩家在一个战役周期内只能选择加入宋金其中一方，不能更换阵营。<enter>" --y
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem10a","B/branch_problem10b","C/branch_problem10c")	
end

function branch_problem10a()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem10b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem10c()
	Describe(DescLink_SongJinProblem.."11、如何奔赴宋金战场？<enter>"
	.."A:从襄阳城可以到宋方报名点，从朱仙镇可以到金方报名点。此外，使用宋金战诏书可以直接传送到宋金报名点。<enter>"--y
	.."B:到七大城市的车夫处，交纳一定的费用就可以坐车到达送进报名点。<enter>"
	.."C:到各大城市的城门找守城士兵，交给五千圆就可直接传送到宋金战场。<enter>" 
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem11a","B/branch_problem11b","C/branch_problem11c")	
end

function branch_problem11a()
	Describe(DescLink_SongJinProblem.."12、如何得到宋金战诏书？<enter>"
	.."A:可以打怪得到。<enter>"
	.."B:可以在7大城市的杂货店买到，每个5000两剑侠币。<enter>"--y
	.."C:需要用特殊物品换取。<enter>" 
	.."你觉得上面三个答案，哪个是正确的呢？<enter>",
	3,"A/branch_problem12a","B/branch_problem12b","C/branch_problem12c")	
end

function branch_problem11b()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem11c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem12a()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problem12b()
	Describe("恭喜您，全部回答正确，过关拉！",1,"结束对话/branch_problemend")
end

function branch_problem12c()
	Talk(1,"","对不起，您回答错了，但请不要放弃，继续努力吧。")
	return
end

function branch_problemend()
	Uworld1053 = nt_getTask(1053)
	Uworld1057 = nt_getTask(1057)
	Uworld1061 = nt_getTask(1061)
	AddOwnExp(200000)
	if ( Uworld1053 == 30 ) then
		nt_setTask(1053,40)
	elseif ( Uworld1057 == 50 ) then
		nt_setTask(1057,60)
	elseif ( Uworld1061 == 50 ) then
		nt_setTask(1061,60)
	end
	Msg2Player("你已顺利过关，可以进行下面的任务了。")
end
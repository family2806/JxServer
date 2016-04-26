CP_MAXROUND = 40

CP_HELP_FRESHMAN = {
					"比赛 <color=yellow>武林新秀联赛<color> 目的是为了江湖新手的进步，为同门其他玩家创造切磋武艺的机会，提高新手的武功技能，给同门兄弟交流的机会，帮助新手习惯江湖的生活。 ",
					"<color=yellow>报名条件<color>: 等级从50到90级，去见武林新秀联赛官员报名."..CP_MAXROUND.."场.",
					"<color=yellow>比赛时间<color>: 武林新秀联赛从2005年6月1日到2005年6月10日结束. <color=yellow>20:00<color> 开始到<color=yellow>23:00<color> 结束. 每 <color=yellow>3<color> 小时总共有 <color=yellow>9<color> 场。每轮比赛报名时间为5分钟，比赛时间为15分钟.",
					"武林新秀联赛按照分数选择前五名. "..CP_MAXROUND.."在赛场，胜一场得3分，打平为1分，输了就没有分。到结束时，将由系统自己选出前五名，敕封门派武林新秀称号。",
					"每个参加报名的玩家在参加过程中，将获得一定奖励。每次参加一轮将获得一定奖励，此外玩家还能获得物品，如：烟花，玄晶矿石，福缘露，仙草露，水晶。) "
				}

function help_freshmanmatch()
	Talk( 2, "help_freshmanmatch2", CP_HELP_FRESHMAN[ 1 ], CP_HELP_FRESHMAN[ 2 ])
end

function help_freshmanmatch2()
	Talk( 2, "help_freshmanmatch3", CP_HELP_FRESHMAN[ 3 ], CP_HELP_FRESHMAN[ 4 ])
end

function help_freshmanmatch3()
	Talk( 1, "", CP_HELP_FRESHMAN[ 5 ])
end

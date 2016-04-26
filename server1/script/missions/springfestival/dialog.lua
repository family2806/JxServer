if (not _H_DIALOG_FESTIVAL2006_H_) then
	_H_DIALOG_FESTIVAL2006_H_ = 1;
Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\springfestival\award.lua]]);
Include([[\script\missions\springfestival\signin.lua]]);

--	对换函数主入口
function sf06_mainentrance()
	local tab_Content = {
	"不成问题!/signin_temp",
	"我已把“30岁人”赶走了!/sf07_getaward",
	"关系到赶走“30岁人”活动/sf07_detail",
	"最近我太忙了，找他人吧!/no"
	}
	Describe("只要春回<color=yellow>30岁人<color> 都来迫害村民。为帮助村民解决这个祸害，武林盟主集合了各位武林人士帮助村民驱赶 <color=yellow>30岁人<color>, 帮助他们有一个平安的新年。为了报答武林盟主高尚的行为，官府贴出了驱赶30岁人的任务奖励 <color=yellow> <color>. 在该任务中，玩家将要使用节日鞭炮道具来驱赶30岁人。30岁的人也可以使用道具进攻玩家。各位人士可以到这里报名<color=yellow>驱赶30岁人<color>.你想参加吗?", getn(tab_Content), tab_Content);
end;

function signin_temp()
	Say("驱赶30岁人救助村民是一个高贵的行为，体现了爱护动物的精神.", 2, "哈哈，快带我到有'30岁人'的地方去./signin", "等一下，我要准备。/no");
end;

--	介绍函数
function sf07_detail()
	Describe("每次 '驱赶30岁人'活动将在<color=yellow> 15分钟内举行 <color>, 其中，有<color=yellow>5 分钟<color> 来准备。报名后，你将会被送到准备区域，当活动开始时，你将会被带到活动区域。<color=yellow>15秒<color> 活动开始后，在参加的人当中，会有1到2个人会化身为' 30岁人 '. 玩家变成'30岁人' 需要扑捉<color=yellow>野猪<color> 出现在区域内的。剩余的玩家将要用<color=yellow>炮仗<color> 来 '驱赶' 30岁人, 阻挡'30岁人' 捕捉野猪. 活动结束后, <color=yellow> 衙门差役<color> 将根据使用<color=yellow>炮仗<color> 的数量来扔'30岁人'领奖。.", 1, "我知道了./sf06_mainentrance");
end;

--	给予奖励主函数
function sf07_getaward()
	local nCount = GetTask(TK_CO_COUNT_ONETIME);
	local nRank = GetTask(TK_CO_RANK);
	
	if (nCount == 0 or nRank == 0) then
		Say("好像你还未去'驱赶30岁人'.想领奖，快去出力吧."..CO_ANIMALNAME.."跑去.", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 2) then
		Say("不够地方放，请整理装备.", 0);
		return
	end;
	SetTask(TK_CO_COUNT_ONETIME, 0);
	SetTask(TK_CO_RANK, 0);
	nRank1 = festival_award_rank(nRank);
    festival_expaward(nRank1);
	festival_goodsaward(nRank1);
	if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
		Say("哈哈，很好。! 刚刚你找到了<color=yellow>"..nCount.."个<color>"..CO_MOUSENAME..", 排名第 <color=yellow>"..nRank.."<color>,这是你的奖励，拿去吧!", 0)
	else
		Say("哈哈，做的好。你打中总共<color=yellow>"..nCount.." 次<color>"..CO_ANIMALNAME..", 排名第<color=yellow>"..nRank.."<color>,这是你的奖励，拿去吧!", 0)
	end;
end;

end;	--	end of _H_DIALOG_FESTIVAL2006_H_
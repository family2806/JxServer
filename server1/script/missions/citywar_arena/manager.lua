--参赛流程
--1、与主入口的Npc对话，选择进入第几个战区
--2、如果符合参赛条件则进入战区内（另一张地图），并以0阵营模式进入
--3、玩家与两边的Npc对话，自由选择参与的阵营。
--4、玩家Pk死亡后将自动被仍出场外，但在本地图内
--5、当玩家死亡时，会自动向同地图的所有玩家公布当前的战况。
--6、如果可以，可以从Npc对话中了解当前的总排行
--7、比赛可以按照等级分成各种赛场
--入战区的Npc、选择阵营的Npc
Include("\\script\\missions\\citywar_arena\\head.lua");
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

function main()
	--设置返回点
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);
	Say("你想进入赛场挑战吗?", 9, "斗场1/EnterBattle", "斗场2 /EnterBattle", "斗场3 /EnterBattle", "斗场4 /EnterBattle", "斗场5 /EnterBattle", "斗场6 /EnterBattle", "斗场7 /EnterBattle", "斗场8 /EnterBattle","不去/OnCancel");
end;

function EnterBattle(nBattleId)
	SetFightState(0)
	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;

function OnHelp()
	Talk(8, "",   "帮会擂台是江湖上个帮会之间切磋武艺的地方！这是一个公平竞争的舞台", "想要参加帮会擂台，要先来向我申请！申请人应该是比赛帮会的帮主！", "组队之后双方队长要来报名。双方帮主每人要交I千万两定金。", "交了定金之后，比赛申请就完成了。在2个班会比赛期间不能报名", "申请成功，双方队员有10分钟加入比赛。之后比赛将正式开始!","胜负将计入双方的比赛积分。每位帮会成员将对方打重伤的将有3个积分，对方被扣除1个积分", "比赛结束，积分高的帮会将取得胜利！", "此外，比赛中有一边没有成员再比赛则胜利属于另外一边" ,"胜利的帮会将可以收回已缴纳的1千万两，此外，还可以得到800万两的奖励和1万2千点帮会经验。失败的帮会不能领回已缴纳的费用，还要扣除1万4千点帮会经验");
end;

function OnCancel()

end;

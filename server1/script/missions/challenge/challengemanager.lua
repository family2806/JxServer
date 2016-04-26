--参赛流程
--1、与主入口的Npc对话，选择进入第几个战区
--2、如果符合参赛条件则进入战区内（另一张地图），并以0阵营模式进入
--3、玩家与两边的Npc对话，自由选择参与的阵营。
--4、玩家Pk死亡后将自动被仍出场外，但在本地图内
--5、当玩家死亡时，会自动向同地图的所有玩家公布当前的战况。
--6、如果可以，可以从Npc对话中了解当前的总排行
--7、比赛可以按照等级分成各种赛场
--入战区的Npc、选择阵营的Npc
Include("\\script\\missions\\challenge\\challengehead.lua");

MapTab = {};

MapTab[1]= {209, 1568, 3278};
MapTab[2]= {210, 1568, 3278};
MapTab[3]= {211, 1568, 3278};

MapCount = getn(MapTab);

function main()
	if (GetCamp() == 0) then 
		Say("你不是江湖人士，不能进入战区!",0);
		return
	end;

	--设置返回点
	SetTask(300, 80);
	SetTask(301, 1908);
	SetTask(302, 2844);
	Say("欢迎参加比赛！只有已近报名的选手才可以进入武场！你想要进去哪个战区?", 4 , "第一战区/DoJoin", "第二战区/DoJoin", "第三战区/DoJoin","我不是参加比赛的选手，我不进去. /OnCancel");
end;

function DoJoin(nSel)
	if (nSel + 1 > MapCount) then
		return
	end;
	LeaveTeam();
	WantToJoin(MapTab[nSel + 1][1], MapTab[nSel + 1][2], MapTab[nSel + 1][3]);
end;


function WantToJoin(nMapId, nX, nY)
	SetFightState(0);
	SetLogoutRV(1);
	SetTaskTemp(200,1);--此时无法修改帮会阵营
	w, x, y = GetLeavePos();
	SetTempRevPos(w, x * 32 , y * 32); --设置暂时重生点为报名点附近
	NewWorld(nMapId, nX, nY);
end;

function OnCancel()

end;

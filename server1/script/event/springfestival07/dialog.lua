Include([[\script\event\springfestival07\item\libcracker.lua]]);

function main_entrance()
	if (sf07_isactive() == 0) then
		Say("活动期间 (02/02/2007到06/03/2007), 我会帮助你们做爆竹.", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>只有50级以上的充值玩家<color>才可以参加元旦活动", 0);
		return
	end;
	Say("我将帮助你们做爆竹迎接热闹的新年. 你想做哪种爆竹呢?", 7,
	"我想做中号爆竹/#confirm_make(1)",
	"我想做大号爆竹/#confirm_make(3)",
	"我想做小号鞭炮/#confirm_make(2)",
	"我想做中号鞭炮/#confirm_make(4)",
	"我想做大号鞭炮/#confirm_make(5)",
	"我想了解除夕燃炮活动/detail",
	"我一会回来!/no"
	);
end;

function detail()
	Describe("活动期间，玩家练功可能会偶然得到压岁包，里面有各种爆竹。我可以帮助每个人做任意一种爆竹。但也会有失败的时候！嘻！嘻！如果成功了就会是特别鞭炮，失败了就会失去普通鞭炮!爆竹种类不同效果也不同. (翻到上一页)/main_entrance");
end;

tab_Content = {
	{"中号爆竹", "3颗小爆竹", 50, {1352, "中号爆竹"}, {1, 1351, "小爆竹"}, "如果制作失败,你将损失1颗小爆竹"},
	{"小号爆竹", "10颗小爆竹, 2颗中号爆竹和1000两.", 20, {1354, "小号特别鞭炮"}, {0, 1357, "普通小号鞭炮"}, "如果制作失败,你将得到1普通小号鞭炮. 如果成功了, 将得到1小号特别鞭炮"},
	{"大号爆竹", "3颗中号爆竹", 50, {1353, "大号爆竹"}, {1, 1352, "中号爆竹"}, "如果制作失败,你将失去1颗中号爆竹"},
	{"中号鞭炮", "10颗中号爆竹, 2颗大爆竹和3000两.", 20, {1355, "中号特别鞭炮"}, {0, 1358, "中号普通鞭炮"}, "如果制作失败,你将将得到中号普通鞭炮. 如果成功了, 将得到中号特别鞭炮"},
	{"大号鞭炮", "100颗大爆竹5000两.", 15, {1356, "大号特别鞭炮"}, {0, 1359, "普通大号鞭炮"}, "如果制作失败,你将得到普通大号鞭炮. 如果成功了, 将得到大号特别鞭炮"},
};
function confirm_make(nIndex)
	Say("要制作1 <color=yellow>"..tab_Content[nIndex][1].."<color>需要有<color=yellow>"..tab_Content[nIndex][2].."<color>. 但不一定能成功！ "..tab_Content[nIndex][6].."做吗?", 2, "我想做/#make_crackers("..nIndex..")", "我还没准备好!/no");
end;

tab_material = {
{1351, "小爆竹"},
{1352, "中号爆竹"},
{1353, "大爆竹"},
{-1, " 两"},
};
tab_Count = {
{3, 0, 0, 0},
{10, 2, 0, 1000},
{0, 3, 0, 0},
{0, 10, 2, 3000},
{0, 0, 100, 5000},
}
function make_crackers(nIndex)
	if (CalcFreeItemCellCount() < 2) then
		Say("请先整理背包!", 0);
		return 1;
	end;
	
	local nSucc = 1;
	for i = 1, 3 do
		if (CalcEquiproomItemCount(6,1,tab_material[i][1],-1) < tab_Count[nIndex][i]) then
			nSucc = 0;
			break;
		end;
	end;
	
	if (GetCash() < tab_Count[nIndex][4]) then
		nSucc = 0;
	end;
	
	if (nSucc == 0) then
		Say("客官材料不够！待会再来吧！", 1, "哦！我去备齐了再来!/no");
		return
	end;
	
	Pay(tab_Count[nIndex][4]);
	
	local nSeed = random(1, 100);
	local str;
	if (nSeed <= tab_Content[nIndex][3]) then	-- 成功了
		delmaterial(nIndex);
		AddItem(6, 1, tab_Content[nIndex][4][1], 1,0,0,0);
		str = "成功了!这是<color=yellow>"..tab_Content[nIndex][4][2].."<color>.";
		Say(str.." 请领取!", 0);
		Msg2Player(str);
	else
		if (tab_Content[nIndex][5][1] == 1) then
			ConsumeEquiproomItem(1, 6, 1, tab_Content[nIndex][5][2], -1);
			str = "真倒霉!你损失1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>.";
			Say(str, 0);
			Msg2Player(str);
		else
			delmaterial(nIndex);
			AddItem(6, 1, tab_Content[nIndex][5][2], 1,0,0,0);
			str = "真倒霉!这次只得到1 <color=yellow>"..tab_Content[nIndex][5][3].."<color>."
			Say(str.."请领取!", 0);
			Msg2Player(str);
		end;
	end;
end;


function delmaterial(nIndex)
	for i = 1, 3 do
		ConsumeEquiproomItem(tab_Count[nIndex][i],6,1,tab_material[i][1],-1);
	end;
end;

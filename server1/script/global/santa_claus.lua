-- 南蛮老人.lua (圣诞活动)
Include([[\script\missions\chrismas\ch_head.lua]]);
Include([[\script\missions\chrismas\xmas_day.lua]]);

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20061222) then
		Describe(DescLink_LiGuan.."圣诞节快乐!", 1, "结束对话/oncancel");
	else
		Describe(DescLink_LiGuan.."哈哈！圣诞节快乐！想知道今年圣诞节有什么活动吗?", 5, 
			"听说圣诞老人掉了行李/want_xmasevent",
			"我想造雪人./want_snowman",
			"我想用雪人换礼品./want_gift",
			"我想了解活动内容/xmas_about",
			"我现在很忙，稍候回来./oncancel");
	end;
end;

function want_xmasevent()
	if (isXmasTime() ~= 1) then
		Describe(DescLink_LiGuan.."谢谢你，我已经找到行李包了.",1, "结束对话/oncancel");
		return 0;
	end;
	Describe(DescLink_LiGuan.."我刚刚掉了一个行李包，里面有很多圣诞礼物，你可以帮我找回来吗?", 4,
	"当然可以啦./onok",
	"我已经找到他们了./award",
	"结束圣诞活动./detail",
	"现在我很忙，有空再聊哦./oncancel")
end;


function onok()
	if (50 > GetLevel()) then
		strTalk = DescLink_LiGuan.."你的历练没有达到50级，还不能参加圣诞活动。";
		Describe(strTalk, 1, "结束对话/oncancel");
		return
	end;
	Describe(DescLink_LiGuan.."哦，那真是谢谢了，你先到那边准备准备，我一会就带你到他们走丢的地方。", 2, "好的。/wantjoin", "我突然有些急事，先等等吧。/oncancel");
end;

function award()
	local nCount = GetTask(TK_COUNT_ONETIME);
	local nRank = GetTask(TK_RANK);
	SetTask(TK_COUNT_ONETIME, 0);
	SetTask(TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Describe(DescLink_LiGuan.."你好像没有找到任何的圣诞精灵吧。", 1, "结束对话/oncancel");
		return
	end;
	local strSay = format("你真的找到他们了，实在太好了！我看看，你一共找到了%d个<color=yellow>圣诞精灵<color>，是找到精灵第%d多的人，来来，这是给你的礼物，收下吧，呵呵呵~", nCount, nRank);
	Describe(DescLink_LiGuan..strSay, 1, "收下礼物。/oncancel");
	giveaward(nRank);
end;

function detail()
	Describe(DescLink_LiGuan.."找精灵活动一场为<color=yellow>15<color>分钟，其中有<color=yellow>5<color>分钟准备时间，在报名参加后你会被带到准备地图，活动开始后你会被带到圣诞精灵走丢的地方，如果你在那里见到<color=yellow>圣诞精灵<color>的话只要用鼠标<color=yellow>左键点击<color>他就可以了，当然你或许会受到其他玩家的阻挠，这时候你可以用活动道具来应付这些情况，只要你找到足够多的<color=yellow>圣诞精灵<color>那么圣诞老人会给你不错的礼物哦。", 1, "真的这么神奇？我看看。/oncancel");
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = "你获得了一个黄金种子"
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = "你获得了一个水晶种子"
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = "你获得了一个玫瑰种子"
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = "你获得了一个幸运种子"
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function wantjoin()
	local w, x, y;
	w, x, y = GetWorldPos();
	SetTask(TK_LEAVERMAPID, w);	--存储玩家离开的坐标
	SetTask(TK_LEAVERPOSX, x);
	SetTask(TK_LEAVERPOSY, y);
	joingame() --加入到游戏中
end;

function xmas_about()
	Describe(DescLink_LiGuan.."在活动时间内，玩家需要打怪来收集礼盒，里面会有<color=yellow>雪花，茄子，松枝，帽子，松树，围巾<color>, 是用来制作<color=yellow>特别雪人的原料<color>. 人工制作失败，将作出 <color=yellow>一般的雪人<color>. 然后，可以用雪人来换取礼品.", 1, "我知道了/main");
end;

function oncancel()	--取消

end;

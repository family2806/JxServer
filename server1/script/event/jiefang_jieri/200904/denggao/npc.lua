Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");


function main()
	jf0904_InitTaskctrl();
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < jf0904_act_dateS or nDate >= jf0904_act_dateE) then
		Say("不属于活动时间.", 0);
		return
	end
	Say("黄连姥姥: 从28-04-2009到31-05-2009各位大侠可以参加登顶番西邦峰的比赛. 番西邦峰又叫印支屋脊，是印度支那半岛上的最高峰，番西邦峰的登顶之路十分困难艰苦，凭借着所有力量和意志才能成功. 胜利者将得到诱人的奖励。 大侠想要参加这次登顶比赛吗?", 5,
		"上交item领取积累点./item_exchange_score",
		"看已有积累点./view_score",
		"看积累点最高的前10名的名单./view_top10_player",
		"领取登顶番西邦峰前10的奖励/get_award",
		"我只是看看!/");
end
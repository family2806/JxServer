--中秋节2007 月饼礼盒
--by 小浪多多
--2007-09-07

Include("\\script\\event\\zhongqiu2007\\head.lua")

function mainzhongqiu2007_entry()
	Describe("礼官：云游和仙羽是两幅名画，被收藏在皇宫，由于战事连连，被裂成很多碎片，流失在各地。听说<color=yellow>临安的华员外 (169/194)<color> 和<color=yellow>襄阳的郭员外(198/208) <color>正在寻找这两幅画，谁可以帮他们找到这两幅画将获得相应的奖励。中秋快到了，在皇宫也需要做很多中秋月饼，从<color=red>22-09-2007<color> 到 <color=red>24h00 日31-10-2007<color>, 每盒饼都有几率获得<color=red>云游图碎片<color> 或者 <color=red>仙羽图碎片<color>, 大侠想换什么？",2,"这是中秋饼盒./zhongqiu2007_getlihe","我稍候回来!/NoChoice")
end

function zhongqiu2007_getlihe()
	if check_level() == 0 then
		Say(tb_content["szlevel"],0)
		return 1
	end
	if check_pay() == 0 then
		Say(tb_content["szpay"],0)
		return 1
	end
	if CalcEquiproomItemCount(6,1,1514,-1) < 1 then
		Say("礼官：大侠没带的中秋月饼盒，是不是忘记在箱子里了",0)
		return 1
	end
	if CalcFreeItemCellCount() < 4 then
		Say("礼官：装备不足空位，请整理装备.",0)
		return 1
	end

	local ncurexp = GetTask(TSK_ZHONGQIU2007_LIHE)
	local nexp = 8000000
	if ncurexp >= NZHONGQIU2007_MAX then
		Msg2Player("获得的经验值超过上限.")
		return 1
	else
		if(ncurexp + nexp) >= NZHONGQIU2007_LIHE_MAX then
			nexp = NZHONGQIU2007_LIHE_MAX - ncurexp
		end
		SetTask(TSK_ZHONGQIU2007_LIHE,(ncurexp+nexp))
		AddOwnExp(nexp)
		Msg2Player(format("获得 <color=yellow>%s<color> 经验值",nexp))
		WriteLog(format("[zhongqiu2007_lihe]\t Date:%s\t Account:%s\t Name:%s\t GetExp:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nexp));
	end
	ConsumeEquiproomItem(1,6,1,1514,-1)
	local nrate = random(1,tb_Mareial_LIHE[1]);
	local nsum = 0
	for nkey,nitem in tb_Mareial_LIHE[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial_LIHE[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local nidx = AddItem(g,d,p,1,0,0)
				Msg2Player(format("您获得1 <color=yellow>%s<color>",GetItemName(nidx)))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
				return 0
			end
	end
end

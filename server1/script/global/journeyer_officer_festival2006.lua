if (not __JOURNEYER_OFFICER_FESTIVAL2006_H__) then
    __JOURNEYER_OFFICER_FESTIVAL2006_H__ = 1;
    Include([[\script\missions\springfestival\festival_head.lua]]);
    
    function festival2006()
        Say(FESTIVAL06_NPCNAME.."最近年兽又出来四处害人了，年兽这种东西会附身在人身上，被附身的人会变成怪物的模样并且不受控制地害人，只有用<color=yellow>鞭炮<color>才能把它赶走。最近官府的人手几乎都去应付年兽了，但还是不够，我看你也是学武之人，能帮个忙吗？", 5, "没问题，为民除害舍我其谁！/festival06_wantjoin", "我已经把年兽赶跑了！/festival06_award", "关于打年兽活动/festival06_knowabout", "打听消息。/main_former", "我最近实在忙得很，你找别人吧。/festival06_Cancal");
    end;
    
    function festival06_wantjoin()
        Say(FESTIVAL06_NPCNAME.."你能答应真是太好了，要注意的是最近因为年兽引起的骚乱，许多孩子走丢了，在年兽出现的时候要注意不要让年兽把他们抓走了，他们会很感谢你的。", 2, "我知道了，快带我去年兽出没的地方吧。/festival_joingame", "再等一下，我去准备准备。/festival06_Cancal");
    end;
    
    function festival06_award()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nGetCount <= 0 or nRank <= 0) then
            Say(FESTIVAL06_NPCNAME.."你好像并没有去驱赶年兽吧，我们的探子一直看着呢，想要奖赏的话就先去把年兽打跑吧。", 1, "结束对话。/festival06_Cancal");
            return
        end;
        festival06_addaward();
        if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT) then
            Say(FESTIVAL06_NPCNAME.."刚才好险啊，你刚刚被年兽附身了，还好大家合力把附在你身上的年兽赶跑了，不过你敢去面对年兽就已经很了不起了，这是我的一点心意，你收下吧。", 1, "收下礼物。/festival06_Cancal");
        else
            Say(FESTIVAL06_NPCNAME.."我已经从探子那里听说了，干得好！你在刚才的战斗中一共用鞭炮击中了年兽"..nGetCount.."次，是击中年兽第"..nRank.."多的人，这是给你的报酬，拿好了！", 1, "收下礼物。/festival06_Cancal");
        end;
    end;
    
    function festival06_knowabout()
        Say(FESTIVAL06_NPCNAME.."找打年兽活动一场为<color=yellow>15<color>分钟，其中有<color=yellow>5<color>分钟准备时间，在报名参加后你会被带到准备地图。活动开始后你会被带到年兽出没的地方，在活动开始<color=yellow>15<color>秒后在参加活动的玩家当中便会有1~2名玩家被年兽附身，变成年兽的玩家需要去抓地图中出现的“<color=yellow>走丢的孩子<color>”。", 2, "下一页/festival06_next", "结束对话。/festival06_Cancal");
    end;
    
    function festival06_next()
        Say(FESTIVAL06_NPCNAME.."而其他玩家需要用“<color=yellow>鞭炮<color>”驱赶年兽，并阻止年兽把孩子抓走，一场活动结束后“<color=yellow>衙门差役<color>”会按玩家用<color=yellow>鞭炮<color>击中年兽的名次来颁发奖励。", 1, "我知道了。/festival06_Cancal");
    end;
    
tabExp = {
5000000,
4000000,
3000000,
2000000,
1500000,
1000000,
500000,
500000,
};
tabRate = {
	{0, 0, 0, 0.12, 0.15, 0.2, 0.24, 0.15, 0.1, 0.04},
	{0, 0, 0, 0.15, 0.15, 0.2, 0.24, 0.15, 0.08, 0.03},
	{0, 0, 0, 0.16, 0.15, 0.25, 0.25, 0.12, 0.05, 0.02},
	{0.05, 0.05, 0.12, 0.08, 0.12, 0.15, 0.2, 0.15, 0.08, 0},
	{0.05, 0.06, 0.12, 0.08, 0.12, 0.15, 0.18, 0.18, 0.06, 0},
	{0.05, 0.06, 0.12, 0.08, 0.12, 0.15, 0.15, 0.24, 0.03, 0},
	{0.08, 0.08, 0.16, 0.08, 0.12, 0.15, 0.12, 0.2, 0.01, 0},
	{0.1, 0.1, 0.15, 0.1, 0.12, 0.18, 0.15, 0.1, 0, 0}
};

tabGoods = {
    
};
    function festival06_addaward()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nRank > getn(tabExp)) then
            nRank = getn(tabExp);
        end;
        SetTask(TK_FE_COUNT_ONETIME, 0);
        SetTask(TK_FE_RANK, 0);
        
        nRank = festival_award_rank(nRank);
        festival_expaward(nRank);
        festival_goodsaward(nRank);
        if (nRank <= 2) then
            local nSeed = random(1, 100);
            if (nSeed <= 2) then
                AddItem(0, 11, 263, 1, 0, 0, 0);
                Msg2Player("你获得了一个<color=yellow>年兽面具<color>")
            end;
        end;
    end;
    
    function festival_goodsaward(nRank)
        local nGroup = GetTask(TK_FE_GROUPID);
    	local nGoodsType = festival_getgoodtype(nRank, nGroup);
    	local strsay = "";
    	if (nGoodsType == 1) then
    		AddItem(6, 1, 122, 1, 0, 0, 0);
    		strsay = "你获得了一个小福缘"
    	elseif (nGoodsType == 2) then
    		AddItem(6, 1, 71, 1, 0, 0, 0);
    		strsay = "你获得了一个仙草露"
    	elseif (nGoodsType == 3) then
    		local szItemName = festival_addpkwan();
    		strsay = "你获得了一个"..szItemName;
    	elseif (nGoodsType == 4) then
    		AddItem(6, 1, 123, 1, 0, 0, 0);
    		strsay = "你获得了一个中福缘"
    	elseif (nGoodsType == 5) then
    		AddItem(6, 1, 147, 4, 0, 0, 0);
    		strsay = "你获得了一个4级玄晶"
    	elseif (nGoodsType == 6) then
    		AddItem(6, 1, 124, 1, 0, 0, 0);
    		strsay = "你获得了一个大福缘"
    	elseif (nGoodsType == 7) then
    		AddItem(6, 1, 147, 5, 0, 0, 0);
    		strsay = "你获得了一个5级玄晶"
    	elseif (nGoodsType == 8) then
    		AddItem(6, 1, 147, 6, 0, 0, 0);
    		strsay = "你获得了一个6级玄晶"
    	elseif (nGoodsType == 9) then
    		AddItem(6, 1, 147, 7, 0, 0, 0);
    		strsay = "你获得了一个7级玄晶"
    	elseif (nGoodsType == 10) then
    		AddItem(6, 1, 147, 8, 0, 0, 0);
    		strsay = "你获得了一个8级玄晶"
    	end;
  		Msg2Player(strsay);
    end;
    
    function festival_getgoodtype(nRank, nGroup)
        
    	local nSeed = random(100);
    	local nRate = {}
    	local i;
    	for i = 1, 10 do
    		nRate[i] = tabRate[nRank][i] * 100;
    	end;
    	local nBase = 0;
    	for i = 1, 10 do
    		nBase = nBase + nRate[i];
    		if (nBase >= nSeed) then
    			return i;
    		end;
    	end;
    end;
    
    function festival_expaward(nRank)
        if (nRank < 1) then
            nRank = 1;
        end;
        if (nRank > 8) then
            nRank = 8;
        end;
        local nCount = tabExp[nRank];
    	AddOwnExp(nCount);
    	Msg2Player("你获得了<color=yellow>"..nCount.."<color>点经验")
    end;
    
    function festival_addpkwan()
        local itemidx = random(1, 10);
        AddItem(6, 0, itemidx, 1, 0, 0, 0);
        tab_pkwan_name = {"长命丸", "加跑丸", "大力丸", "高闪丸", "高中丸", "飞速丸", "冰防丸", "雷防丸", "火防丸", "毒防丸"};
        return tab_pkwan_name[itemidx];
    end;
    
    function festival_award_rank(nRank)
        local nGroup = GetTask(TK_FE_GROUPID);
        if (nGroup > FE_SMALLMAPCOUNT) then
            if (nRank == 1) then
                nRank = 3;
            else
                nRank = 8;
            end;
        end;
        return nRank;
    end;
    
    function festival06_Cancal()
        
    end;
end;
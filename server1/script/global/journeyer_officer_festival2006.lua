if (not __JOURNEYER_OFFICER_FESTIVAL2006_H__) then
    __JOURNEYER_OFFICER_FESTIVAL2006_H__ = 1;
    Include([[\script\missions\springfestival\festival_head.lua]]);
    
    function festival2006()
        Say(FESTIVAL06_NPCNAME.." gÇn nhÊt n¨m thó l¹i ®i ra chung quanh h¹i ng­êi liÔu , n¨m thó lo¹i vËt nµy sÏ phô ®ang ë trªn th©n ng­êi , bÞ phô th©n ng­êi cña sÏ biÕn thµnh qu¸i vËt ®Ých bé d¸ng h¬n n÷a kh«ng bÞ khèng chÕ h¹i ng­êi , chØ cã dïng <color=yellow> roi ph¸o <color> míi cã thÓ ®em nã ®uæi ®i . gÇn nhÊt quan phñ ng­êi cña tay c¬ hå còng ®i ®èi phã n¨m thó liÔu , nh­ng vÉn lµ kh«ng ®ñ , ta xem ng­¬i còng lµ häc vâ ng­êi , cã thÓ gióp chuyÖn sao ? ", 5, "Kh«ng thµnh vÊn ®Ò , v× d©n trõ h¹i bá ta kú ng­êi nµo /festival06_wantjoin", "Ta ®· ®em n¨m thó ®uæi ch¹y /festival06_award", " liªn quan tíi ®¸nh n¨m thó ho¹t ®éng /festival06_knowabout", "Hái th¨m tin tøc . /main_former", "Ta gÇn nhÊt b©y giê rÊt bËn rén , ng­¬i t×m ng­êi kh¸c ®i . /festival06_Cancal");
    end;
    
    function festival06_wantjoin()
        Say(FESTIVAL06_NPCNAME.." ng­¬i cã thÓ ®¸p øng thËt lµ thËt tèt qu¸ , ph¶i chó ý chÝnh lµ gÇn nhÊt bëi v× n¨m thó ®­a tíi tao lo¹n , rÊt nhiÒu hµi tö ®i mÊt , ë n¨m thó xuÊt hiÖn thêi ®iÓm ph¶i chó ý kh«ng nªn ®Ó cho n¨m thó ®em bän hä b¾t ®i , bän hä sÏ rÊt c¶m t¹ ng­¬i . ", 2, "Ta biÕt , mau dÉn ta ®i n¨m thó ra kh«ng cã ®Þa ph­¬ng ®i . /festival_joingame", "Chê thªm chót n÷a , ta ®i chuÈn bÞ mét chót . /festival06_Cancal");
    end;
    
    function festival06_award()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nGetCount <= 0 or nRank <= 0) then
            Say(FESTIVAL06_NPCNAME.." ng­¬i thËt gièng nh­ còng kh«ng cã ®i xua ®uæi n¨m thó ®i , th¸m tö cña chóng ta vÉn nh×n ®©y , muèn t­ëng th­ëng lêi cña tr­íc hÕt ®i ®em n¨m thó ®uæi ch¹y ®i . ", 1, "KÕt thóc ®èi tho¹i . /festival06_Cancal");
            return
        end;
        festival06_addaward();
        if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT) then
            Say(FESTIVAL06_NPCNAME.." míi võa råi nguy hiÓm thËt a , ng­¬i míi võa bÞ n¨m thó phô th©n liÔu , còng may mäi ng­êi hîp lùc ®em ghÐ vµo trªn ng­êi ng­¬i ®Ých n¨m thó ®uæi ch¹y , bÊt qu¸ ng­¬i d¸m ®i ®èi mÆt n¨m thó còng ®· rÊt kh«ng dËy næi , ®©y lµ ta ®Ých mét chót t©m ý , ng­¬i nhËn lÊy ®i . ", 1, "NhËn lÊy lÔ vËt . /festival06_Cancal");
        else
            Say(FESTIVAL06_NPCNAME.." ta ®· tõ th¸m tö n¬i ®ã nghe nãi , lµm rÊt kh¸  ng­¬i ë ®©y chiÕn ®Êu míi võa råi trung tæng céng dïng roi ph¸o ®¸nh tróng n¨m thó "..nGetCount.." lÇn , lµ ®¸nh tróng n¨m thó thø "..nRank.." nhiÒu ng­êi , ®©y lµ ®­a cho ng­¬i thï lao , cÇm ch¾c ", 1, "NhËn lÊy lÔ vËt . /festival06_Cancal");
        end;
    end;
    
    function festival06_knowabout()
        Say(FESTIVAL06_NPCNAME.." muèn ¨n ®ßn n¨m thó ho¹t ®éng mét cuéc v× <color=yellow>15<color> phót , trong ®ã cã <color=yellow>5<color> phót chuÈn bÞ thêi gian , ë ghi danh tham gia sau ng­¬i sÏ bÞ mang tíi chuÈn bÞ b¶n ®å . ho¹t ®éng b¾t ®Çu sau ng­¬i sÏ bÞ mang tíi n¨m thó ra kh«ng cã ®Þa ph­¬ng , ®ang ho¹t ®éng b¾t ®Çu <color=yellow>15<color> gi©y sau ë tham gia ho¹t ®éng ®Ých nhµ ch¬i trong sÏ gÆp cã 1~2 tªn nhµ ch¬i bÞ n¨m thó phô th©n , biÕn thµnh n¨m thó ®Ých nhµ ch¬i cÇn ®i b¾t b¶n ®å trung xuÊt hiÖn “<color=yellow> ®i vøt hµi tö <color>” . ", 2, "Trang kÕ tiÕp /festival06_next", "KÕt thóc ®èi tho¹i . /festival06_Cancal");
    end;
    
    function festival06_next()
        Say(FESTIVAL06_NPCNAME.." mµ nh÷ng kh¸c nhµ ch¬i cÇn dïng “<color=yellow> roi ph¸o <color>” xua ®uæi n¨m thó , còng ng¨n c¶n n¨m thó ®em con b¾t ®i , mét cuéc ho¹t ®éng sau khi kÕt thóc “<color=yellow> nha m«n sai dÞch <color>” sÏ theo nh­ nhµ ch¬i dïng <color=yellow> roi ph¸o <color> ®¸nh tróng n¨m thó ®Ých h¹ng tíi ban hµnh t­ëng th­ëng . ", 1, "Ta biÕt . /festival06_Cancal");
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
                Msg2Player("Ng­¬i thu ®­îc mét <color=yellow> n¨m thó mÆt n¹ <color>")
            end;
        end;
    end;
    
    function festival_goodsaward(nRank)
        local nGroup = GetTask(TK_FE_GROUPID);
    	local nGoodsType = festival_getgoodtype(nRank, nGroup);
    	local strsay = "";
    	if (nGoodsType == 1) then
    		AddItem(6, 1, 122, 1, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét tiÓu Phóc duyÕn "
    	elseif (nGoodsType == 2) then
    		AddItem(6, 1, 71, 1, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét tiªn th¶o lé "
    	elseif (nGoodsType == 3) then
    		local szItemName = festival_addpkwan();
    		strsay = " ng­¬i thu ®­îc mét "..szItemName;
    	elseif (nGoodsType == 4) then
    		AddItem(6, 1, 123, 1, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét trung phóc duyªn "
    	elseif (nGoodsType == 5) then
    		AddItem(6, 1, 147, 4, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét 4 cÊp huyÒn tinh "
    	elseif (nGoodsType == 6) then
    		AddItem(6, 1, 124, 1, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét ®¹i phóc duyªn "
    	elseif (nGoodsType == 7) then
    		AddItem(6, 1, 147, 5, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét 5 cÊp huyÒn tinh "
    	elseif (nGoodsType == 8) then
    		AddItem(6, 1, 147, 6, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét 6 cÊp huyÒn tinh "
    	elseif (nGoodsType == 9) then
    		AddItem(6, 1, 147, 7, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét 7 cÊp huyÒn tinh "
    	elseif (nGoodsType == 10) then
    		AddItem(6, 1, 147, 8, 0, 0, 0);
    		strsay = " ng­¬i thu ®­îc mét 8 cÊp huyÒn tinh "
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
    	Msg2Player("Ng­¬i thu ®­îc <color=yellow>"..nCount.."<color> chót kinh nghiÖm ")
    end;
    
    function festival_addpkwan()
        local itemidx = random(1, 10);
        AddItem(6, 0, itemidx, 1, 0, 0, 0);
        tab_pkwan_name = {"Tr­êng mÖnh hoµn ", "Thªm ch¹y hoµn ", "§¹i lùc hoµn ", "Cao nhanh chãng hoµn ", "Trung häc ®Ö nhÞ cÊp hoµn ", "Nhanh chãng hoµn ", "B¨ng phßng hoµn ", " l«i phßng hoµn ", " löa phßng hoµn ", "§éc phßng hoµn "};
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
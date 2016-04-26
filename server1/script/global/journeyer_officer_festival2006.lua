if (not __JOURNEYER_OFFICER_FESTIVAL2006_H__) then
    __JOURNEYER_OFFICER_FESTIVAL2006_H__ = 1;
    Include([[\script\missions\springfestival\festival_head.lua]]);
    
    function festival2006()
        Say(FESTIVAL06_NPCNAME.."��������ֳ����Ĵ������ˣ��������ֶ����ḽ���������ϣ���������˻��ɹ����ģ�����Ҳ��ܿ��Ƶغ��ˣ�ֻ����<color=yellow>����<color>���ܰ������ߡ�����ٸ������ּ�����ȥӦ�������ˣ������ǲ������ҿ���Ҳ��ѧ��֮�ˣ��ܰ��æ��", 5, "û���⣬Ϊ�����������˭��/festival06_wantjoin", "���Ѿ������޸����ˣ�/festival06_award", "���ڴ����޻/festival06_knowabout", "������Ϣ��/main_former", "�����ʵ��æ�úܣ����ұ��˰ɡ�/festival06_Cancal");
    end;
    
    function festival06_wantjoin()
        Say(FESTIVAL06_NPCNAME.."���ܴ�Ӧ����̫���ˣ�Ҫע����������Ϊ���������ɧ�ң���ຢ���߶��ˣ������޳��ֵ�ʱ��Ҫע�ⲻҪ�����ް�����ץ���ˣ����ǻ�ܸ�л��ġ�", 2, "��֪���ˣ������ȥ���޳�û�ĵط��ɡ�/festival_joingame", "�ٵ�һ�£���ȥ׼��׼����/festival06_Cancal");
    end;
    
    function festival06_award()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nGetCount <= 0 or nRank <= 0) then
            Say(FESTIVAL06_NPCNAME.."�����û��ȥ�������ްɣ����ǵ�̽��һֱ�����أ���Ҫ���͵Ļ�����ȥ�����޴��ܰɡ�", 1, "�����Ի���/festival06_Cancal");
            return
        end;
        festival06_addaward();
        if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT) then
            Say(FESTIVAL06_NPCNAME.."�ղź��հ�����ոձ����޸����ˣ����ô�Һ����Ѹ��������ϵ����޸����ˣ��������ȥ������޾��Ѿ����˲����ˣ������ҵ�һ�����⣬�����°ɡ�", 1, "�������/festival06_Cancal");
        else
            Say(FESTIVAL06_NPCNAME.."���Ѿ���̽��������˵�ˣ��ɵúã����ڸղŵ�ս����һ���ñ��ڻ���������"..nGetCount.."�Σ��ǻ������޵�"..nRank.."����ˣ����Ǹ���ı��꣬�ú��ˣ�", 1, "�������/festival06_Cancal");
        end;
    end;
    
    function festival06_knowabout()
        Say(FESTIVAL06_NPCNAME.."�Ҵ����޻һ��Ϊ<color=yellow>15<color>���ӣ�������<color=yellow>5<color>����׼��ʱ�䣬�ڱ����μӺ���ᱻ����׼����ͼ�����ʼ����ᱻ�������޳�û�ĵط����ڻ��ʼ<color=yellow>15<color>����ڲμӻ����ҵ��б����1~2����ұ����޸���������޵������Ҫȥץ��ͼ�г��ֵġ�<color=yellow>�߶��ĺ���<color>����", 2, "��һҳ/festival06_next", "�����Ի���/festival06_Cancal");
    end;
    
    function festival06_next()
        Say(FESTIVAL06_NPCNAME.."�����������Ҫ�á�<color=yellow>����<color>���������ޣ�����ֹ���ްѺ���ץ�ߣ�һ���������<color=yellow>���Ų���<color>���ᰴ�����<color=yellow>����<color>�������޵��������䷢������", 1, "��֪���ˡ�/festival06_Cancal");
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
                Msg2Player("������һ��<color=yellow>�������<color>")
            end;
        end;
    end;
    
    function festival_goodsaward(nRank)
        local nGroup = GetTask(TK_FE_GROUPID);
    	local nGoodsType = festival_getgoodtype(nRank, nGroup);
    	local strsay = "";
    	if (nGoodsType == 1) then
    		AddItem(6, 1, 122, 1, 0, 0, 0);
    		strsay = "������һ��С��Ե"
    	elseif (nGoodsType == 2) then
    		AddItem(6, 1, 71, 1, 0, 0, 0);
    		strsay = "������һ���ɲ�¶"
    	elseif (nGoodsType == 3) then
    		local szItemName = festival_addpkwan();
    		strsay = "������һ��"..szItemName;
    	elseif (nGoodsType == 4) then
    		AddItem(6, 1, 123, 1, 0, 0, 0);
    		strsay = "������һ���и�Ե"
    	elseif (nGoodsType == 5) then
    		AddItem(6, 1, 147, 4, 0, 0, 0);
    		strsay = "������һ��4������"
    	elseif (nGoodsType == 6) then
    		AddItem(6, 1, 124, 1, 0, 0, 0);
    		strsay = "������һ����Ե"
    	elseif (nGoodsType == 7) then
    		AddItem(6, 1, 147, 5, 0, 0, 0);
    		strsay = "������һ��5������"
    	elseif (nGoodsType == 8) then
    		AddItem(6, 1, 147, 6, 0, 0, 0);
    		strsay = "������һ��6������"
    	elseif (nGoodsType == 9) then
    		AddItem(6, 1, 147, 7, 0, 0, 0);
    		strsay = "������һ��7������"
    	elseif (nGoodsType == 10) then
    		AddItem(6, 1, 147, 8, 0, 0, 0);
    		strsay = "������һ��8������"
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
    	Msg2Player("������<color=yellow>"..nCount.."<color>�㾭��")
    end;
    
    function festival_addpkwan()
        local itemidx = random(1, 10);
        AddItem(6, 0, itemidx, 1, 0, 0, 0);
        tab_pkwan_name = {"������", "������", "������", "������", "������", "������", "������", "�׷���", "�����", "������"};
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
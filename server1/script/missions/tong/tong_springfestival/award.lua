-- 奖励.lua (帮会打年兽活动)
if (not __SF_AWARD_H__) then
__SF_AWARD_H__ = 1;

IncludeLib("FILESYS");
Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");
SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];



function springfestival_aword(nTongID, nWorkshopID)
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	--获得活动坊等级
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID);
	if (nLevel < 1 or nLevel > 10) then
		Say("你的帮会还未建设该作坊.", 1, "我知道了!/festival06_Cancal")
		return 0;
	end;
	
    local nGetCount = GetTask(SF_COUNT_ONETIME);
    local nRank = GetTask(SF_TK_RANK);
    SetTask(SF_COUNT_ONETIME, 0);
    SetTask(SF_TK_RANK, 0);
    if (nGetCount <= 0 or nRank <= 0) then
        Say("活动坊总管:好像你还未去打年兽，想领奖，快去打年兽先吧.", 1, "等着瞧/festival06_Cancal");
        SetTaskTemp(193, 0);
        return
    end;
    local strniaoshou = "太危险了，你刚刚被怪兽侵入，幸运的是大家合力赶走了怪物。为了感谢你的勇敢，我有一点心意，请接纳。";
    local stryongshi = "做的很好，你已用炮仗打中了年兽 <color=yellow>"..nGetCount.."<color> 次，排名第?<color=yellow>"..nRank.."<color>, 这是给你的礼品，拿着吧。";
    
    festival_addaward(nRank);
    local isDouble = festival_double(nLevel);--看看是否获得双倍
	if (1 == isDouble) then
		strniaoshou = "真是幸运，你获得 <color=red>双倍奖励<color>, "..strniaoshou;
		stryongshi = "真是幸运，你获得 <color=red>双倍奖励<color>, "..stryongshi;
		festival_addaward(nRank);--双倍奖励
	end;
    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
        Say(strniaoshou, 1, "领取礼物./festival06_Cancal");
    else
        Say(stryongshi, 1, "领取礼物./festival06_Cancal");
    end;
    SetTaskTemp(193, 0);
end;

--取出tab文件的内容
function gettabfiledata(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function festival_double(nLevel)
	local nResult = 0;
	local nSeed = random(100);
	local nRate = tonumber(gettabfiledata(SFHD_DATAFILE, nLevel + 1, 7));
	if (nSeed <= nRate * 100) then
		nResult = 1;
	end;
	return nResult;
end;

festival_tabExp = {
5000000,
4000000,
3000000,
2000000,
1500000,
1000000,
500000,
500000,
};
festival_tabRate = {
	{0 ,0 ,0 ,0.464 ,0.2 ,0.175 ,0.15 ,0.01 ,0.001 ,0 },
	{0 ,0 ,0 ,0.5562 ,0.2 ,0.145 ,0.09 ,0.008 ,0.0008 ,0 } ,
	{0 ,0 ,0.3845 ,0.3 ,0.15 ,0.1 ,0.06 ,0.005 ,0.0005 ,0 } ,
	{0 ,0 ,0.546 ,0.2 ,0.12 ,0.085 ,0.045 ,0.004 ,0 ,0 } ,
	{0 ,0 ,0.653 ,0.15 ,0.09 ,0.075 ,0.03 ,0.002 ,0 ,0.01 } ,
	{0 ,0.295 ,0.4 ,0.15 ,0.076 ,0.068 ,0.01 ,0.001 ,0 ,0 } ,
	{0.267 ,0.3 ,0.2 ,0.12 ,0.08 ,0.03 ,0.003 ,0 ,0 ,0 } ,
	{0.586 ,0.2 ,0.12 ,0.06 ,0.03 ,0.004 ,0 ,0 ,0 ,0 }
};

festival_tab_Goods = {
{"福缘露(小) ",	1,	122	},
{"福缘露 (中) ",	1,	123	},
{"福缘露(大) ",	1,	124	},
{"玄晶3级",	3,	147	},
{"仙草露 ",	1,	71	},
{"玄晶4级",	4,	147	},
{"玄晶5级",	5,	147	},
{"玄晶6级",	6,	147	},
{"玄晶7级",	7,	147	},
{"节日炮仗",	1,	1345 },	--概率调为0，不产出
};
function festival_addaward(nRank)
    if (nRank > getn(festival_tabExp)) then
        nRank = getn(festival_tabExp);
    end;
    nRank = festival_award_rank(nRank);
    festival_expaward(nRank);
    festival_goodsaward(nRank);
--    if (nRank <= 2) then
--        local nSeed = random(1, 100);
--        if (nSeed <= 2) then
--            AddItem(0, 11, 263, 1, 0, 0, 0);
--            Msg2Player("你获得了一个<color=yellow>年兽面具<color>")
--        end;
--    end;
end;

function festival_goodsaward(nRank)
    local nGroup = GetTask(TK_GROUPID);
	local nGoodsType = festival_getgoodtype(nRank, nGroup);
	local strsay = "";
	if (festival_tab_Goods[nGoodsType][2] == 1) then
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], 1, 0, 0, 0);
	else
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], festival_tab_Goods[nGoodsType][2], 0, 0, 0);
	end;
	Msg2Player("你获得 <color=yellow>"..festival_tab_Goods[nGoodsType][1].."<color>.");
end;

function festival_getgoodtype(nRank, nGroup)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 10 do
		nRate[i] = festival_tabRate[nRank][i] * 100;
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
    local nCount = festival_tabExp[nRank];
	AddOwnExp(nCount);
	Msg2Player("你获得<color=yellow>"..nCount.."<color>经验值")
end;

function festival_addpkwan()
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"长命丸", "加跑丸", "大力丸", "高闪丸", "高中丸", "飞速丸", "冰防丸", "雷防丸", "火防丸", "毒防丸"};
    return tab_pkwan_name[itemidx];
end;

function festival_award_rank(nRank)
    local nGroup = GetTask(TK_GROUPID);
    if (nGroup > SF_SMALLMAPCOUNT) then
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

end; --// end of __SF_AWARD_H__
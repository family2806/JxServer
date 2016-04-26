if (not __FESTIVAL07_HEAD__) then
	__FESTIVAL07_HEAD__ = 1;
	
IncludeLib("BATTLE");
Include([[\script\lib\coordinate.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua") --
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\pay.lua")


--常值部分
--DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>圣诞老人：<link>"	

CO_DATE_BEGIN = 20070209;
CO_DATE_END = 20070223;

CO_PREPAREMISSIONID = 30;
CO_MISSIONID = 31;
CO_MINIMUM = 5;

CO_FRAME = 18;	--每秒18帧
CO_REFRASHTIME = 15 * CO_FRAME; -- 每15秒钟刷一次怪
CO_VANISHTIME = 10 * CO_FRAME;	--圣诞精灵停留3秒钟
CO_RUNINTERVER = 30 * CO_FRAME; --30秒一次，可以公告游戏
CO_MAXPLAYTIMES = 5; --每人最多一天玩5次
CO_LEVELLIMIT = 50; --玩家参加需要的最小级别

CO_PREPARETIME = 57; --准备场计时器
CO_FAIRY_SMALLTIMERID = 58;	--刷怪计时器
CO_REPORT_SMALLTIMERID = 59;	--RunMission用的计时器；
CO_INTERVER = 5 * CO_FRAME;	--3秒钟触发刷怪和清楚怪触发器

--GLB值
GLB_CO_PHASE = 849; --春节活动的时间
--===============和怪相关==================
CO_NPCID = 1256;	--刷出怪的NCP index
CO_MAPID = {584, 585};	--圣诞活动地图Id

CO_SMALLMAPCOUNT = 19;	--一共有12张小地图
CO_MOUSECOUNT_MIN = 10;	--一个小地图一次最少刷地鼠数目
CO_MOUSECOUNT_MAX = 10;	--一个小地图一次最多刷地鼠数目
CO_MAXPLAYERCOUNT = 10;	--每个游戏最多10个人；
CO_NIANSHOU_XUANYUN = 10;   --年兽每被攻击10次就被眩晕
CO_ALL_MAXPLAYERCOUNT = 100; --一共最多120人；
--=========================================

--=========任务变量===============
TK_CO_LEAVERMAPID = 1123;	--存储明月镇的mapid
TK_CO_LEAVERPOSX = 1124;	--存储离开游戏的x坐标点
TK_CO_LEAVERPOSY = 1125;	--存储离开游戏的y坐标点

TK_CO_DAYKEY = 1126;	--记录是哪一天
TK_CO_PLAYTIMES = 1127; --记录一天内玩的次数
TK_CO_TOTAL = 1794;		--记录一共玩了多少次；

TK_CO_COUNT_ONETIME = 1128;	--记录一场点了多少个

TK_CO_RANK = 1129;		--记录一场的排名；

TK_CO_GROUPID = 1130;	--记录玩家的Group号
TK_CO_EXP_BEISHU = 1131; -- 获得经验的倍数
TK_CO_EXP_TIME = 1132;  -- 获得双倍的时间
	
TK_CO_ATTACKED_TIMES = 1133;    --记录年兽被攻击的次数
TK_CO_ATTACKED_INTERVER = 1134;     --普通玩家使用道具间隔
--================================

--MS部分；
MS_CO_STATE = 1;
MS_CO_TIMERSTATE = 2; --用来记录用于交替的进行刷怪和清除怪：0－清除怪；1－刷出怪
MS_CO_NEWSVALUE = 3; --
MS_CO_BEGINGMAPID = 10; --记录开始的地图的ID
MS_CO_PREPARENEWSVALUE = 5; --准备场计时变量
MS_CO_GAMECOUNT = 6;    --  记录一场开始的游戏的个数
--常量部分；
FESTIVAL_SHREWMOUSE = "springfestival07";
CO_ANIMALNAME = "30岁人";
CO_MOUSENAME = "白猪"; --圣诞精灵的名字
CO_GIFTNAME = "留下的礼物";       --礼物NPC的名字
CO_SIGNNPCNAME = "<color=yellow>衙门差役<color>:";    --报名圣诞老人的名字
CO_MAPPOINTFLORDER = "springfestival2006";
FESTIVAL_OK = 1;    --设置状态肯定表示
FESTIVAL_NO = 0;    --设置状态否定表示
FESTIVAL_ENTERSPEED = 16; --进行游戏的玩家的速度
FESTIVAL_LEAVERSPEED = -1; --离开游戏的玩家的速度

Include([[\script\missions\libfestival\head.lua]]);

--	是否在活动时间
function sf06_isactive()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < CO_DATE_BEGIN or nDate > CO_DATE_END or gb_GetTask("shut_springfestival07", 1) == 1) then
		return 0
	end;
	return 1;
end;

--生成一个相对于当前玩家的选项
function festival_make_option(szFunName)
	local szName = GetName()
	return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
end

--检查该玩家是否仍在游戏中，成功返回PlayerIndex否则返回nil
function festival_check_pl(szPlayName)
	local nPlIdx = SearchPlayer(szPlayName)	--玩家是否在当前服务器
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(CO_MISSIONID, nPlIdx)	--玩家是否在指定Mission中
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end
--检查道具是否可以被使用
function itemuseplacecheck(nType)   --nType :1——公共道具；2——年兽专用道具；3——普通玩家专业道具
    local ww, xx, yy = GetWorldPos();
    if (CO_MAPID[2] ~= ww) then
	    Talk(1, "", "该物品只用于春季活动.");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) <= FE_SMALLMAPCOUNT and 2 == nType) then
    	    Talk(1, "", "只有打怪玩家才能使用该面具");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT and 3 == nType) then
    	    Talk(1, "", "只有一般玩家才能使用该物品.");
        return 0;
    end;
    
    return 1
end;
--找到对立阵营，年兽——>玩家，玩家——>年兽
function festival_getgroupid(nGroupId)
    if (nGroupId < 1) then
        return nil
    end;
    
    if (nGroupId > CO_SMALLMAPCOUNT) then
        return nGroupId - CO_SMALLMAPCOUNT;
    else
        return nGroupId + CO_SMALLMAPCOUNT;
    end;
end;

function festival_go_other_place()  --随机传到起始点
    local nBeginMapID = GetMissionV(MS_CO_BEGINGMAPID);
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\elf_]]..nMapId..[[.txt]];
	local PosX, PosY = getadata(szFile);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

function festival_go_back(nBeginMapID)  --随机传到起始点
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];
	local PosX, PosY = getadatatow(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

function festival_checkinterver()
    local gametime = GetGameTime();
    if (GetTask(TK_CO_ATTACKED_INTERVER) > gametime) then
        return 0;
    else
        SetTask(TK_CO_ATTACKED_INTERVER, gametime + 2);
        return 1;
    end;
end;
end;

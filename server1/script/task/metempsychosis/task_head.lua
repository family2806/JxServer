-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 多次转生头文件
-- 文件名　：task_head.lua
-- 创建者　：子非魚
-- 创建时间：2009-02-04 16:21:20

-- ======================================================
--print(10e6)


TB_LEVEL_REMAIN_PROP = {
		--[等级level] = { {magicpoint, prop, resist}<,{}>};
			}

function Load_TransLifeSetting()
	
	local b1 = TabFile_Load("\\settings\\task\\metempsychosis\\translife.txt", "TransLifeSetting")
	if b1~=1 then
		print("Load TransLifeSetting Failed!")
		return
	end
	local nRowCount = TabFile_GetRowCount("TransLifeSetting", "LEVEL")
	
	for y = 2, nRowCount do
		local n_level = tonumber(TabFile_GetCell("TransLifeSetting", y, "LEVEL"));
		
		local tb = {};
		
		for z = 1, 5 do
			
			local n_magicpoint = tonumber(TabFile_GetCell("TransLifeSetting", y, "MAGICPOINT"..z));
			local n_prop = tonumber(TabFile_GetCell("TransLifeSetting", y, "PROP"..z));
			local n_resist = tonumber(TabFile_GetCell("TransLifeSetting", y, "RESIST"..z));
			local n_addskilll = tonumber(TabFile_GetCell("TransLifeSetting", y, "SKILLLIMIT"..z));
			
			if (n_magicpoint) then
				tb[getn(tb) + 1] = {n_magicpoint, n_prop, n_resist, n_addskilll};
			end
			
		end
		
		if (n_level ~= nil) then
			TB_LEVEL_REMAIN_PROP[n_level] = tb;
		end
	end	
end

Load_TransLifeSetting()

TB_LEVEL_LIMIT = {160, 170, 180, 200, 200};
TB_TRANSTIME_LIMIT = {90, 180, 180, 180, 180};
-- 4转需要的其他道具
TBITEMNEED_4 = {
	[1] = {szName = "霹雳弹", tbProb = {6,1,2973}, nCount = 999},	-- 霹雳弹
	[2] = {szName = "<北斗长生术-大乘心法>", tbProb = {6,1,2974}, nCount = 1},  -- 北斗长生术—大乘心法
	}

TB_TRANSLIFE_ERRORMSG = { 
	[1] = "<dec><npc>修炼北斗长生术需要解下你身上所有装备!",
	[2] = "<dec><npc>好像钱不够 <color=red>100000000<color>.",
	[3] = "<dec><npc>修炼北斗长生术需要",
	[4] = "<dec><npc>这位少侠未学到<北斗长生术 - 基础篇>, 物品在奇珍阁有卖.",
	[5] = "<dec><npc>这位少侠不够修炼等级，请回去继续修炼 .",
	[6] = "<dec><npc>修炼北斗长生术 需要闭关修炼",
	[7] = "<dec><npc><北斗长生术 - 心法篇> 最多只能修炼5层，你已学满了.",
	[8] = "<dec><npc>杀手任务还未完成! 完成后再来吧 .",
	[9] = "<dec><npc>信使任务还未完成! 完成后再来吧.",
	[10]= "<dec><npc>野叟任务还未完成! 完成后再来吧.",
	[11]= "<dec><npc>野叟获得取消任务的机会。请完成任务后再来.",
	[12]= "<dec><npc>2次重生的间隔为 %d 天.",
	[13]= "<dec><npc>转生4需要<color=red> 20000 万 <color> 两，请准备好了再来.",
	[14]= "<dec><npc>转生4需要<color=red> 999 <color> 霹雳丹，请准备好了再来.",
	[15]= "<dec><npc>转生4需要<color=red> 北斗长生术 - 大乘心法<color>, ，请准备好了再来.",
}

-- 五行人物的天生属性值
TB_BASE_STRG = {35,20,25,30,20};
TB_BASE_DEX = {25,35,25,20,15};
TB_BASE_VIT = {25,20,25,30,25};
TB_BASE_ENG = {15,25,25,20,40};

ZHUANSHENG_DESC		= "METEMPSYCHOSIS";
ZHUANSHENG_TUITION	= 100000000;	-- 转生所需JXB
ZHUANSHENG_XIANDAN_MINEXP	= 2*10e8;	-- 北斗仙丹至少要20亿
ZHUANSHENG_XIANDAN_BASEEXP		= 10e6;	-- 北斗仙丹单位是 1000w
ZHUANSHENG_ITEM_BEGIN	= 20090420---20090420;		-- 制作仙丹开始时间 0点
ZHUANSHENG_ITEM_ENDLE	= 20090503;		-- 制作仙丹结束时间 24点
ZHUANSHENG_ITEM_EXTIME	= 20090601;		-- 仙丹有效使用时间

LG_SHITULEAGUE = 1;				-- 师徒战队
LG_WLLSLEAGUE = 5;				-- 武林联赛战队

TSK_ZHUANSHENG_FLAG = 2547;
TSK_ZHUANSHENG_1 = 2548;	-- 转生 用来保存最大抗性的任务变量，从低字节开始依次保存火、冰、毒、电的最大抗性
TSK_ZHUANSHENG_2 = 2549;			-- 转生 用来保存最大抗性的任务变量，最低字节保存最大物理抗性，其余字节未使用
TSK_ZHUANSHENG_XIANDAN	= 2581;		-- 制作北斗仙丹
TSK_ZHUANSHENG_AWARD	= 2582;		-- byte1:3转前10名领取翻羽;1:未领,255:已领取


TSK_KILLER_ID = 1082;
TSK_MESSENGER_FENG = 1201;
TSK_MESSENGER_SHAN = 1202;
TSK_MESSENGER_QIAN = 1203;
TSK_TASKLINK_STATE = 1028;
TSK_TASKLINK_CancelTaskLevel = 2571;
TSK_TASKLINK_CancelTaskExp1 = 2570;
TSK_TASKLINK_CancelTaskExp2 = 2575;

TSK_ZHUANSHENG_GRE = {2577, 2578, 2579}	-- 每次转生所选等级和抗性
TSK_ZHUANSHENG_LASTTIME = 2580;			-- 保存最后次转生的ServerTime 以秒记（相对1700-0-0到目前的描述）
TSKM_ZHUANSHENG_RESISTID = 199;			-- 临时存放选择增加的抗性
--抗性编号，0：火，1：冰，2:毒，3:电，4:物理
TB_BASE_RESIST = {
	[0] = "火防",
	[1] = "冰防",
	[2] = "毒防",
	[3] = "雷防",
	[4] = "普防",
	}

TSK_TRANSLIFE_4 = 2908		-- 保存是否接受了4转任务	
TSK_LEAVE_SKILL_POINT_4 = 2909		-- 保存剩余的4转技能的剩余技能点	
TSK_USED_SKILL_POINT_4 = 2899		-- 保存已经使用了多少技能点
TSK_LAST_UP_LEVEL_4 = 2910		-- 保存最后一次更新4转技能的剩余技能点的等级 
ZHUANSHENG_TUITION_4	= 200000000;	-- 第4次转生所需JXB
CLEAR_SKILL_4_PRICE = 10000000	-- 4转技能点洗点的价格
TB_SKILL_4 = {{1123,0},{1124,0},{1125,0},{1126,0},{1127,0},{1128,0},{1129,0},{1130,0}}		-- 保存4转技能的相关id

NSTARTLEVEL_4 = 105		-- 4转技能从105级开始获得技能点
NPERPOINTNEEDLEVEL = 5  -- 每5级获得一个技能点
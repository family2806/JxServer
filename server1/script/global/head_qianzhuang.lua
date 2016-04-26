--------------------------------------
-- 钱庄功能的头文件

Include("\\script\\global\\systemconfig.lua") -- 系统配置

IncludeForRegionVer("\\script\\global\\", "gamebank_head.lua")

--------------------------------------

QUESTKEY_TICKET = 488;					-- 银票的物品ID
EXTPOINT_TICKET = 2;					-- 银票的扩展点
EXTPOINT_TICKET_NEW = 6;
QUESTKEY_TICKET_NEW = 962

EXTPOINT_MAXVAL = 32768;	
			-- 扩展点的最大值
---------------------------------------------------------------
--使用银票功能函数 银票分银票和新银票两种，本function 统一处理
--输入参数，ticket 银票数量 logstr 操作描述（会记日志）
--返回值为 -1异常 0银票不够 1 银票扣除成功
--如果银票不够，不会扣银票的

function qz_use_silver( ticket , logstr)
	if (logstr == nil) then
		logstr = "[未知]"
	end
	
	if (SYSCFG_GAMEBANK_TICKET_USE == nil) then -- 出错了~~
		print("use_ticket have close, but something is wrong...");
		Msg2Player("功能出错！");
		return -1
	end
	
	if (ticket < 1 or ticket == nil) then
		Msg2Player("功能出错")
		return -1
	end
	local nCountOld = GetItemCountEx(488);--旧银票
	local nCountNew = GetItemCountEx(962);
	if (nCountOld + nCountNew < ticket) then
		return 0;
	end
	
	local nDelCountOld = ticket;
	local nDelCountNew = 0;
	if (nCountOld < ticket) then
		nDelCountOld = nCountOld;
		nDelCountNew = ticket - nCountOld;
	end;
	for i = 1, nDelCountOld do
		DelItemEx(488);
	end
	for i = 1, nDelCountNew do
		DelItemEx(962);
	end
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount().."，["..GetName().."]：花费"..ticket.."张银票"..logstr, 0, 0, 0, (-ticket));
	
	if (nDelCountOld > 0) then
		UseSilver(2, 2, nDelCountOld); -- 银票兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
	end;
	if (nDelCountNew > 0) then
		UseSilver(3, 2, nDelCountNew); -- 银票兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
	end;
	SaveNow(); -- 立即存盘
	return 1;
end

function buy_hunyuanlinglu()
		local szMsg = 
		{
				"钱九爷：最近从京城进了一批混元灵露（内含100精炼石），能让你在游历江湖时炼制更好的装备，还可为换取各种物品。全中原只此一家，绝无分号。要不要看看？",	--1
				"1铜钱购买混元灵露/#buy_addhunyuan_yes(1)",	--2
				"5铜钱购买混元灵露/#buy_addhunyuan_yes(5)",	--3
				"10铜钱购买混元灵露/#buy_addhunyuan_yes(10)",	--4
				"50铜钱购买混元灵露/#buy_addhunyuan_yes(50)",	--5
				"100铜钱购买混元灵露/#buy_addhunyuan_yes(100)",	--6
				"我没兴趣/no",			--7
		};

			Say(szMsg[1], 6, szMsg[2], szMsg[3], szMsg[4], szMsg[5], szMsg[6], szMsg[7]);
				
end

function buy_addhunyuan_yes(nNedCount)
	if (nNedCount < 1 or nNedCount == nil) then
		print("Fail!!!!");
		return
	end;
	if(CalcFreeItemCellCount() < 5) then
		Say("背包空位不足，最少需要5格空位", 0);
		return
	end
	local nCount = CalcEquiproomItemCount(4, 417, 1, 1)
	
	if (nCount < nNedCount) then
		Talk(1,"","您身上的钱不够了，凑足了钱再来吧。")
		return 1;
	end
	ConsumeEquiproomItem(nNedCount, 4, 417, 1, 1)
	
	WriteGoldLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName()..format("]: 花费 %d 铜钱, 购买混元灵露.",nNedCount),-2,0,0,0);
	for i=1,nNedCount do
		AddItem(6,1,2312,1,0,0,0)  ----混元灵露
	end
	
	UseSilver(1, 2, nNedCount); -- 金元宝兑换为铜钱的消耗统计(直接消耗的元宝银票，与铜钱兑换等同处理)
	SaveNow(); -- 立即存盘
	  	
	Talk(1,"","购买混元灵露成功！请检查<color=yellow>背包<color>")
	Msg2Player("购买混元灵露成功！请查看背包。")
end

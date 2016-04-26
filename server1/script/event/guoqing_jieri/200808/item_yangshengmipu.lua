-- ====================== 文件信息 ======================

-- 剑侠情缘网络版一追寻秘谱道具养生秘谱脚本

-- Edited by 子非魚
-- 2008/07/24 13:43

-- ======================================================

Include("\\script\\event\\guoqing_jieri\\200808\\head.lua");	-- 活动相关信息文件
Include("\\script\\lib\\pay.lua");

function main()
	zxmp_reset_vertsk();
	
	if (zxmp_200808_itemdate() ~= 1) then
		Msg2Player("物品过期，自动丢弃.")
		return 0;
	end
	
	if (GetLevel() < 50 or IsCharged() == 0) then
			Say("只有50级以上的充值玩家才可以使用.", 0)
		return 1;
	end
	
	local n_ran = random(100*10000);
	local n_sum = 0;
	local n_idx = 0;
	local sz_msg = "";
	
	for i, tb in TB_ZHUIXUNMIPU_ITEMLIST do
		n_sum = n_sum + tb.n_rate * 10000;
		if (n_sum >= n_ran) then
			n_idx = i;
			
			if (tb.n_type == 2) then
				local ng, nd, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.sz_name;
				AddGoldItem(ng, nd);
				sz_msg = format("得到黄金装备 %s", sz_name);
			elseif (tb.n_type == 1) then
				local ng, nd, np, nl, ns, nlk, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.tb_itemid[3], 
										tb.tb_itemid[4], tb.tb_itemid[5], tb.tb_itemid[6], tb.sz_name;
				AddItem(ng, nd, np, nl, ns, nlk);
				sz_msg = format("得到 %s", sz_name);
			elseif (tb.n_type == 3) then
				
				AddRepute(tb.n_repute);
				sz_msg = format("得到 %d 名望点", tb.n_repute);
			end
			if (sz_msg ~= "") then
				Msg2Player(sz_msg);
				WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t %s。","养生秘谱",
							GetLocalDate("%Y-%m-%d,%X"),
							GetName(),
							GetAccount(),
							sz_msg	));
			end
			break
		end
	end
	
	if (n_idx == 0) then
		return 1;
	end
	
	local n_addexp = zxmp_200808_checkexp();
	
	if (n_addexp <= 0) then
		Msg2Player("已经达到8亿的经验界限，不能再继续领取.");
	else
		AddOwnExp(n_addexp);
		SetTask(TSK_ZXMP_MAXEXP, GetTask(TSK_ZXMP_MAXEXP) + n_addexp);
		Msg2Player(format("你获得 %d 经验值.",n_addexp));
		WriteLog(format("[使用 %s]\t%s\tName:%s\tAccount:%s\t 增加 %s 经验值.", "养生秘谱",
						GetLocalDate("%Y-%m-%d,%X"),
						GetName(),
						GetAccount(),
						n_addexp	));
	end
end


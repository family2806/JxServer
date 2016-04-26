--情谊卡奖励
Include([[\script\event\teachersday06_v\head.lua]]);

--发奖入口
function vt06_prizeenter()
	if (vt06_isactive() == 0) then
		return 0;
	end;
	
	Describe("在这个教师节，各位侠客<color=yellow>80级以下<color> 完成黄金、杀手BOSS和杀绿色BOSS任务，有机会获得4个字 一字为师。送4个字给师傅，地址将获得高徒卡，师傅将获得恩师卡。可以将该两个卡换成礼品。你想换什么卡？", 3, "我想换恩师卡/#vt06_sendgift(1)", 
		"我想换高徒卡#vt06_sendgift(2)", "离开/no");
end;

tab_Goods = {{"恩师卡", 1293}, {"高徒卡", 1295}};
tab_Idx = {1, 2, 3, 4, 5, 6}

function vt06_sendgift(nIdx)
	Say("收集到很多卡，经验值奖励更多<color=yellow>1<color>"..tab_Goods[nIdx][1].." 获得 <color=yellow>40 万点<color>, <color=yellow>2<color>"..tab_Goods[nIdx][1].." 頲 <color=yellow>100 v筺 甶觤<color>, <color=yellow>5<color>"..tab_Goods[nIdx][1].." 頲 <color=yellow>300 v筺 甶觤<color>.", 4,
	"我想换 1 "..tab_Goods[nIdx][1].." 40万点/#vt06_giveprize("..nIdx..", 1, 400000)",
	"我想换 2 "..tab_Goods[nIdx][1].." 100万点/#vt06_giveprize("..nIdx..", 2, 1000000)",
	"我想换 5 "..tab_Goods[nIdx][1].." 300万点/#vt06_giveprize("..nIdx..", 5, 3000000)",
	"取消/no");
end;

function vt06_giveprize(nIdx, nCount, nExp)
	local nOwnedExp = GetTask(TK_EXPLIMIT);
	
	if (nOwnedExp >= VT06_EXPLIMIT) then
		Say("您获得<color=yellow>"..VT06_EXPLIMIT.."<color> 经验值，不能再获得了!", 0);
		return
	end;
	
	if (CalcEquiproomItemCount(6,1,tab_Goods[nIdx][2],-1) < nCount) then
		Say("您好像不足 <color=yellow>"..nCount.."<color>"..tab_Goods[nIdx][1].."! 继续努力哦", 0);
		return
	end;
	
	--删物品
	if (ConsumeEquiproomItem(nCount,6,1,tab_Goods[nIdx][2],-1) == 0) then
		return
	end;

	--加经验
	nOwnedExp = nOwnedExp + nExp;
	SetTask(TK_EXPLIMIT, nOwnedExp);
	AddOwnExp(nExp);
	Say("您获得<color=yellow>"..nExp.."<color> 经验值.", 0);
end;
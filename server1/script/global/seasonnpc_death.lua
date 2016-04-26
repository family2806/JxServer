
-- ====================== 文件信息 ======================

-- 剑侠情缘online 野叟死亡脚本
-- Edited by peres
-- 2006/12/26 PM 15:39

-- 嫣师姐为我穿上衣服时突然笑着说道，妹妹出落得越来越水灵了。
-- 不懂这仙女般的玉体以后会托付给哪个男人呢。
-- 女子长大以后一定会将身子托付给男人吗？我的脸微微涨红了一下。
-- 嫣师姐弯下腰帮我把裙带束好，她说，是的。
-- 因为，这是女子一生的宿命。

-- ======================================================

function OnDeath()
	DoTeamProcess(addSeasonnpcExp);
end;


-- 对所有队员执行同一过程
function DoTeamProcess(funProcess)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();

	if (nMemCount == 0) then
		funProcess();
	else
		for i = 1, nMemCount do -- 在这里开始循环遍历每个玩家
			PlayerIndex = GetTeamMember(i);
			funProcess();
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 循环结束后在这里归还主玩家 ID
	end;
end;


function addSeasonnpcExp()
	AddOwnExp(50000);
	Msg2Player("完成野叟任务获得<color=green>50000 经验值<color>!");
end;
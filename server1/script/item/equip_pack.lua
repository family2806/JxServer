
-- ====================== 文件信息 ======================

-- 剑侠情缘online IB 服务器五行装备礼包脚本文件
-- Edited by peres
-- 2006/10/26 PM 11:51

-- 就如同她的笑从来都不是代表快乐，
-- 她的哭泣也没有任何意味。
-- 她说，好了。
-- 我们说会儿话吧。
-- 拿了裙子和内衣，非常沉静地一件一件穿上。
-- 态度有明显的生疏，仿佛想退回到她的世界里去。

-- ======================================================

aryFiveEquip = {
	
	[1267]={"玄铁剑",        0,0,0,10},
	[1268]={"大风刀",        0,0,1,10},
	[1269]={"金箍棒",        0,0,2,10},
	[1270]={"破天戟",        0,0,3,10},
	[1271]={"破天锤",        0,0,4,10},
	[1272]={"霸王镖",        0,1,0,10},
	[1273]={"碎月刀",        0,1,1,10},
	[1274]={"孔雀翎",        0,1,2,10},	
	[1275]={"龙凤血玉镯",    0,8,0,10},
	[1276]={"天蚕护腕",      0,8,1,10},
	[1277]={"通天发冠",      0,7,3,10},
	[1278]={"掩日盔",        0,7,4,10},
	[1279]={"玄犀面罩",      0,7,9,10},
	[1280]={"青星钗",        0,7,12,10},
	[1281]={"天蚕腰带",      0,6,0,10},
	[1282]={"白金腰带",      0,6,1,10},
	[1283]={"天蚕靴",        0,5,1,10},
	[1284]={"飞凤靴",        0,5,3,10},
		
	}; 


function main(nIndex)
	local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
	local i=0;
	if aryFiveEquip[nParticular] then
		for i=0,4 do
			AddItem(aryFiveEquip[nParticular][2],
					aryFiveEquip[nParticular][3],
					aryFiveEquip[nParticular][4],
					aryFiveEquip[nParticular][5],
					i,
					0,0);
		end;
		Msg2Player("您得到了一套五行的<color=yellow>"..aryFiveEquip[nParticular][1].."<color>！");
		WriteLog("[五行装备任务礼包]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]打开了一个"..aryFiveEquip[nParticular][1].."礼包。");
	else
		Say("你购买的是一个无效的五行礼包！", 0);
		return 1;
	end;
	return 0;
end;


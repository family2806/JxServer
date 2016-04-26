-- 钱庄功能 (越南版本)
-- by：Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) 从统一功能移动处理银票到此独有
-- Update: Fanghao_Wu(2004-9-04) 增加元宝兑换铜钱功能

-- Update: paul zhang(2005-09-06) 为越南版作修改，只使用银元宝，没有金元宝，银元宝可充成包周(7天)或者25小时，
--			铜钱暂时不开放，同时增加一个头文件用于控制功能的开放与关闭
-- Update: paul zhang(2005-12-28) 为越南版作修改，由于越南方的原因，修改成只使用金元宝，没有银元宝，但是金元宝的作用修改为可充成包周(7天)或者25小时，

-- Edited by peres
-- 2005/12/29 开放一个元宝换 15 个铜钱的功能
-- end;

Include("\\script\\global\\systemconfig.lua") -- 系统配置
--Include("\\script\\global\\yuanbao_head.lua")
--Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
--Include("\\script\\misc\\maskfree\\event.lua")		--免费面具领取
Include("\\script\\event\\vnchristmas2006\\event.lua")	--圣诞充卡送面具

--Msg2Player("gamebank_proc-- vn")

function gamebank_proc()
	local msg = {
--		"我想取铜钱/get_ingot",
--		"我想用铜钱换游戏时间/pay_ingot",--换 knb 成玩的日期
--		"检查我还存有多少铜钱/show_ingot",
		"我想换元宝成铜钱/change_ingot_to_coin",
		"顺便路过而已/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "对了，少侠需要什么?";
	else
		talk = "对了，女侠需要什么?";
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061223 and nDate <= 20070114) then
		tinsert(msg, 1, "领取礼品：面具/takeMaskFree");
	end;
	
	Say(talk, getn(msg), msg)
end
------------- 查询元宝 --------------------
function show_ingot()
	local nMoney = GetExtPoint(1)
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("在您的银库里发生了错误，暂时不能取铜钱，请联系发行商解决!")
		return
	end
	if (nMoney <= 0) then
		Say("钱庄老板：客官没有存奇珍异宝在这里",1,"知道了/no")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> 客官已在本店总共存了<color=green>"..nCurVar.."<color> 铜钱.",1,"懂了/no")
	end
end

------------- 取元宝 -----------------------
function get_ingot()

	if (SYSCFG_GAMEBANK_GOLDSILVER_OPEN ~= 1) then
		Talk(1,"","对不起，钱庄正在维修，2天后客官再来吧")
		return
	end

	local nMoney = GetExtPoint(1)	
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("发生错误了!")
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "装备不足5个空位.");
			return 1
	end
	if (nMoney <= 0) then					-- 没有扩展点数
		Talk(1,"","对不起，客官没有在本店存铜钱!")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> 客官已经在本店总共存了 <color=green>"..nCurVar.."<color> 铜钱，想取出来吗?", 2, "我想取出20个铜钱/get_ingot10", "不取/no")
	end
end

function get_ingot10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- 出错了~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("功能出错!");
		return
	end
	
	if (GetExtPoint(1) < 1) then
		Talk(1,"","您的银库发生了错误，暂时不能取出铜钱，请联系发行商解决!")
		return
	end
	Say("客官确定想取铜钱? (确定后，请不要退出游戏!) ", 2, "确定/get_ingot10ok", "退出/no");
end

function get_ingot10ok()
	PayExtPoint(1,1)
	Msg2Player("目前正在给您取铜钱，请注意不要退出游戏!")
end;

------------- 兑现元宝 ---------------------
function pay_ingot()

	if (SYSCFG_GAMEBANK_SILVER_PAY ~= 1) then
		Talk(1,"","对不起，目前钱庄正在装修，2天后客官再来吧")
		return
	end

	-- 越南的银元宝物品ID与大陆版本的金元宝物品ID一致
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		Say("钱庄老板：没问题！客官想换<color=green>铜钱<color>成什么形式呢?", 3,"我想用20个铜钱换成10天玩/pay_ingot_10a","我想用20个铜钱换成20个小时来玩/pay_ticket_10b","不换了/no")
	else
		Say("客官没有带够铜钱",1,"对了！我忘记带了/no")
	end

end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("功能出错!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
			Msg2Player("扣铜钱失败!")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."换取10天玩"..GetAccount().."\t"..GetName().."\t".."用20个铜钱换成10天玩失败")
			return
		end
		UseSilver(1,1,1)
		SaveNow(); -- 立即存盘
		WriteLog(date("%Y%m%d %H%M%S").."\t".."换10天玩"..GetAccount().."\t"..GetName().."\t".."用20个铜钱换成10天玩成功")
		WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 10 DAY CHARGE", 0, -1, 0 );
		Say("钱庄老板: <color=green>使用20个铜钱<color> 换成 <color=red>10天玩<color> 成功。请客官再检查一下!", 0)
	end
end

function pay_ticket_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- 出错了~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("功能错误!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
		if (nCurTD >= 20) then
			if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
				Msg2Player("扣铜钱失败!")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."换成20个小时玩"..GetAccount().."\t"..GetName().."\t".."用20个铜钱换成20个小时玩失败")
				return
			end
			UseSilver(1,0,1)
			SaveNow(); -- 立即存盘
			WriteLog(date("%Y%m%d %H%M%S").."\t".."换成20个小时玩"..GetAccount().."\t"..GetName().."\t".."用20个铜钱换成20个小时玩成功")
			WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 20 HOURS CHARGE", 0, -1, 0 );
			Say("钱庄老板: <color=green>S使用20个铜钱<color> 换成<color=green>20个小时玩<color> 成功。请客官再检查一下!", 0)
		end
end

------------- 兑换铜钱---------------------
function change_ingot_to_coin()	
--do return end
	local nSilverCount = GetItemCountEx(343);		-- 元宝个数

	if (SYSCFG_GAMEBANK_SILVER_COIN ~= 1) then
		Talk(1,"","对不起！钱庄正在维修，2天后客官再来吧")
		return
	end

	if (nSilverCount <= 0) then					-- 没有元宝
		Say( "客官没有带金元宝?", 1, "对了，我忘记带了/no");
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "装备不足5空位.");
			return 1
	end

	Say( "钱庄老板：客官同意换取铜钱吗?", 2, "换元宝成"..COIN_CHANGE_COUNT_OF_SILVER.."<#> 铜钱/change_silver_to_coin", "不换了/no");

end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- 出错了~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("功能错误!");
		return
	end
	
	if (GetItemCountEx(343) > 0) then		
		DelItemEx(343);		
		AddStackItem( COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
		UseSilver(1, 2, 1); -- 银票兑换为铜钱的消耗统计
		
		SaveNow(); -- 立即存盘
		WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER );
		--local nSilverCount = GetItemCountEx( 343 );		-- 元宝个数
		--if( nSilverCount > 0 ) then
		--	Say( "钱庄老板：您的元宝已成功兑换成"..COIN_CHANGE_COUNT_OF_SILVER.."<#>个铜钱，请客倌核查。", 2, "知道了/no", "再兑换一些铜钱/change_coin" );
		--else
		Say( "钱庄老板：客官换元宝出来"..COIN_CHANGE_COUNT_OF_SILVER.."<#> 铜钱！请客官再检查一下!",0);
		--end
	end
end

------------ 关于铜钱 ------------------
function onAboutCoin()
	Talk( 2,"","钱庄老板：可以带元宝到本店换成铜钱, 1 <color=yellow>元宝<color>换得<color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color> 铜钱。元宝换成铜钱后，就不能换回来了","铜钱可以到各城市的商贩处买奇珍异宝.","点击鼠标左键到一个铜钱上，拉出另一个铜钱叠在上面，最多为<color=yellow>100个<color>. 按键盘<color=yellow>Shift<color> 以及按鼠标左键到一个铜钱上，输入想换的钱数，按确定来完成。!");
end
----------------------------------------
function no()
end

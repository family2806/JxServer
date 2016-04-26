-- 临安　职能　杂货店老板
-- by：Dan_Deng(2003-09-16)

--========脚本修改==================================--
--修改者：yfeng
--修改日期：2005-1-28
--修改原因：春节市场活动
--
--
--==================================================--
Include "/script/event/chinesenewyear/eventhead.lua"
Include("\\script\\global\\global_zahuodian.lua");


--if CHINESENEWYEAR then
--	tinsert(Buttons,1,"购买节日道具/BuyNewyearItem")
--end 
	
function main()
local Buttons = store_sel_extend();
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2006122200 and nDate <= 2007011424) then
		tinsert(Buttons,1,"购买卡片/BuyVnXasCard")
	end;
	Say("杂货店老板：本店号称南北杂货，东西南北的商品一应俱全，东海的珊瑚树，戈壁的骆驼帽，岭南的孔雀翎，长白山的紫貂皮，不管是你见过的还是没见过的，也不管是你想得到的还是想不到的，我这儿全有。",
			getn(Buttons),
			Buttons)
end;

function yes()
	Sale(2);  				--弹出交易框
end;

function no()
end;

function BuyNewyearItem()
	Sale(101)
	return
end

function BuyChristmasCard()
	Sale(97);
end

function BuyVnXasCard()
	Sale(147)
end;
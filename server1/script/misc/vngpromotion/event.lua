Include("\\script\\lib\\basic.lua")

COIN_EXTPOINT = 3

function takeCoin()
	Say("在25-09-2009 到 24h 01-11-2009 将举行中秋节会优惠促销活动。客户充值将会获赠铜钱.",2,"给我领铜钱/wantCoin"," 我知道了/OnCancel")
end;

function wantCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <= 0) then
		Say("请客户充值，有机会领取铜钱!",0)
		return
	end
	
	Say("目前客户总共有<color=yellow>"..nExtValue.."<color> 铜钱在账号内。确认取完出来吗？",2,"对了，我想取。/sureCoin","目前不需要/OnCancel")
end;

function sureCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <=0 ) then
		Say("取铜钱时发生错误，请联系技术部",0)
		return
	end
	
	local nMod = mod(nExtValue, 100)
	local nReal = nExtValue / 100
	if (nMod ~= 0) then nReal = nReal + 1 end
	
	if (CalcFreeItemCellCount() < nReal) then
		Say("钱庄老板：装备不足空位，请整理装备.",0)
		return
	end
	
	local nFinish = 0
	local nCoin = nExtValue
	
	while (nFinish == 0) do
		if (nCoin <= 100) then
			PayExtPoint(COIN_EXTPOINT, nCoin)
			AddStackItem(nCoin,4,417,1,1,0,0,0)
			nFinish = 1
		else
			PayExtPoint(COIN_EXTPOINT, 100)
			AddStackItem(100,4,417,1,1,0,0,0)
			nCoin = nCoin - 100
		end
	end

	Say("你的铜钱在这里，请领取。祝你快乐",0)
	Msg2Player("你获得"..nExtValue.."铜钱")
	WriteLog(format("[VNGPROMOTION]\tDate:%s\tAccount:%s\tName:%s\ttake:%s coin",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nExtValue))
end;

function OnCancel()
end;

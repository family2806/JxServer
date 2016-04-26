Include("\\script\\lib\\basic.lua")

IP_EXTPOINT = 4 								-- Ext used for IP Bonus
IP_BIT = 1 											-- Bit check
IP_Name = "双倍经验"		-- Event Name
IP_SWITCH = 0 									-- Open or close event


function IpBonus()
do return end
	local nPromotionSay =
	{		
		"阁下想知道自己够条件领奖了吗?/getInfo",
	}	
	
	local nDay = tonumber(date("%w"))
	
	if nDay == 6 or nDay == 0 then
		tinsert(nPromotionSay,"领取奖励/getBonus")
	end	
	
	tinsert(nPromotionSay,"在下只是路过而已!/OnCancel")
	
	Say("执行者将送给在机房的玩家或者有贡献的个人很多奖励<color=red>"..IP_Name.."<color>.",getn(nPromotionSay),nPromotionSay)
end;

function IsIPBonus()
	return IP_SWITCH
end

function CheckIPBonus()
	local nExtValue = GetExtPoint(IP_EXTPOINT)	
	if (GetBit(nExtValue,IP_BIT) == 1) then
		return 1
	else
		return 0
	end
end

function getBonus()
	if  (IsIPBonus() == 1) then		
		if (CheckIPBonus() == 1) then			
			AddIPAward();
		else
			Say("真是遗憾，你的IP不属于领奖名单",1,"真是不好意思/OnCancel")
			return
		end;	
	end;
end;

function getInfo()
	if (CheckIPBonus() == 1) then
		Say("恭喜！你的IP正处于领奖名单，请努力些哦!",1,"多谢/OnCancel")
		return
	else
		Say("真是遗憾，你的IP不属于领奖名单，稍后再来哦",1,"真是不好意思/OnCancel")
		return
	end;
end;

function AddIPAward()
	if GetSkillState(451) > 0 then
		Say("你不是已经领了吗?" ,1,"真是不好意思/OnCancel")
		return
	end	
	
	Say("送给你一件小礼物，该礼物是<color=red>"..IP_Name.."<color>.",1,"多谢/OnCancel")
	AddSkillState(451, 20, 1, 18*60*60*24);
	Msg2Player("恭喜你获得奖励"..IP_Name);	
	WriteLog(format("[IPBonus]\t%s\t%s\t%s\t%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),IP_Name))
end;

function OnCancel()
end;

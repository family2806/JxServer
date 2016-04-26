Include("\\script\\lib\\basic.lua")

IP_EXTPOINT = 4 								-- Ext used for IP Bonus
IP_BIT = 1 											-- Bit check
IP_Name = "˫������"		-- Event Name
IP_SWITCH = 0 									-- Open or close event


function IpBonus()
do return end
	local nPromotionSay =
	{		
		"������֪���Լ��������콱����?/getInfo",
	}	
	
	local nDay = tonumber(date("%w"))
	
	if nDay == 6 or nDay == 0 then
		tinsert(nPromotionSay,"��ȡ����/getBonus")
	end	
	
	tinsert(nPromotionSay,"����ֻ��·������!/OnCancel")
	
	Say("ִ���߽��͸��ڻ�������һ����й��׵ĸ��˺ཱܶ��<color=red>"..IP_Name.."<color>.",getn(nPromotionSay),nPromotionSay)
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
			Say("�����ź������IP�������콱����",1,"���ǲ�����˼/OnCancel")
			return
		end;	
	end;
end;

function getInfo()
	if (CheckIPBonus() == 1) then
		Say("��ϲ�����IP�������콱��������Ŭ��ЩŶ!",1,"��л/OnCancel")
		return
	else
		Say("�����ź������IP�������콱�������Ժ�����Ŷ",1,"���ǲ�����˼/OnCancel")
		return
	end;
end;

function AddIPAward()
	if GetSkillState(451) > 0 then
		Say("�㲻���Ѿ�������?" ,1,"���ǲ�����˼/OnCancel")
		return
	end	
	
	Say("�͸���һ��С�����������<color=red>"..IP_Name.."<color>.",1,"��л/OnCancel")
	AddSkillState(451, 20, 1, 18*60*60*24);
	Msg2Player("��ϲ���ý���"..IP_Name);	
	WriteLog(format("[IPBonus]\t%s\t%s\t%s\t%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),IP_Name))
end;

function OnCancel()
end;

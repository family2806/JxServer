Include("\\script\\lib\\basic.lua")

COIN_EXTPOINT = 3

function takeCoin()
	Say("��25-09-2009 �� 24h 01-11-2009 ����������ڻ��Żݴ�������ͻ���ֵ�������ͭǮ.",2,"������ͭǮ/wantCoin"," ��֪����/OnCancel")
end;

function wantCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <= 0) then
		Say("��ͻ���ֵ���л�����ȡͭǮ!",0)
		return
	end
	
	Say("Ŀǰ�ͻ��ܹ���<color=yellow>"..nExtValue.."<color> ͭǮ���˺��ڡ�ȷ��ȡ�������",2,"���ˣ�����ȡ��/sureCoin","Ŀǰ����Ҫ/OnCancel")
end;

function sureCoin()
	local nExtValue = GetExtPoint(COIN_EXTPOINT)
	
	if (nExtValue <=0 ) then
		Say("ȡͭǮʱ������������ϵ������",0)
		return
	end
	
	local nMod = mod(nExtValue, 100)
	local nReal = nExtValue / 100
	if (nMod ~= 0) then nReal = nReal + 1 end
	
	if (CalcFreeItemCellCount() < nReal) then
		Say("Ǯׯ�ϰ壺װ�������λ��������װ��.",0)
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

	Say("���ͭǮ���������ȡ��ף�����",0)
	Msg2Player("����"..nExtValue.."ͭǮ")
	WriteLog(format("[VNGPROMOTION]\tDate:%s\tAccount:%s\tName:%s\ttake:%s coin",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),nExtValue))
end;

function OnCancel()
end;

-- TimerHead.lua
-- By: Dan_Deng(2003-08-23) ��ʱ����ع���

FramePerSec = 18			-- ÿ gi�y ֡��������������
CTime = 600					-- ÿ c� canh gi� ��600 gi�y ��10���ӣ�����

function GetRestSec(i)		-- ֱ�ӷ��ؼ�ʱ��ʣ�� gi�y ��
	return floor(GetRestTime(i) / FramePerSec)
end;

function GetRestCTime(i)			-- ��ȡ��ʱ��ʣ��ʱ�䣬����һ c� canh gi� ʱ���й�ʱ��ת��
	x = floor(GetRestTime(i) / FramePerSec)
	if (x < CTime) then		-- ����һ c� canh gi� 
		y = x.." gi�y "
	else
		y = floor(x / CTime).." c� canh gi� "
	end
	return y
end;

function GetTimerTask(i)			-- ͨ����ʱ��ID�Ž�����Ӧ����
	
end
-- �ٰ���ְ�ܡ��ӻ����ϰ�
-- by��Dan_Deng(2003-09-16)

--========�ű��޸�==================================--
--�޸��ߣ�yfeng
--�޸����ڣ�2005-1-28
--�޸�ԭ�򣺴����г��
--
--
--==================================================--
Include "/script/event/chinesenewyear/eventhead.lua"
Include("\\script\\global\\global_zahuodian.lua");


--if CHINESENEWYEAR then
--	tinsert(Buttons,1,"������յ���/BuyNewyearItem")
--end 
	
function main()
local Buttons = store_sel_extend();
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2006122200 and nDate <= 2007011424) then
		tinsert(Buttons,1,"����Ƭ/BuyVnXasCard")
	end;
	Say("�ӻ����ϰ壺����ų��ϱ��ӻ��������ϱ�����ƷһӦ��ȫ��������ɺ��������ڵ�����ñ�����ϵĿ�ȸ�ᣬ����ɽ������Ƥ��������������Ļ���û�����ģ�Ҳ����������õ��Ļ����벻���ģ������ȫ�С�",
			getn(Buttons),
			Buttons)
end;

function yes()
	Sale(2);  				--�������׿�
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
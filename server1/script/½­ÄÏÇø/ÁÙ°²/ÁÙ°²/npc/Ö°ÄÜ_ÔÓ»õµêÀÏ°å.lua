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
		tinsert(Buttons,1,"Mua th� /BuyVnXasCard")
	end;
	Say("B� ti�m x�ng danh l� t�p h�a Nam B�c. H�ng h�a ��ng t�y �i�u c� �� c�. S�n h� � ��ng h�i, m� l�c �� � gobi.... B�t k� ng��i �� nh�n th�y hay ch�a, � ��y ta �i�u c� c�..",
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
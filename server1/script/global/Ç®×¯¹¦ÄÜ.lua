-- Ǯׯ����.lua		������ı�׼�ļ�
-- By Dan_Deng(2003-12-31)
-- Update: Dan_Deng(2004-01-06) ����Ʊ�����Ƴ����ٰ�Ǯׯ����
Include("\\script\\global\\head_qianzhuang.lua") -- Ǯׯͷ�ļ�
IncludeForRegionVer("\\script\\global\\", "gamebank_proc.lua")

function main_proc()
	if (GetSex() == 0) then
		Say("Ǯׯ�ϰ壺������λ����ҪЩʲô����",3,"������û�к����/buy_sele","���뻻Ԫ����ͭǮ/change_ingot_to_coin","�����/no")
	else
		Say("Ǯׯ�ϰ壺������λ����ҪЩʲô����",3,"������û�к����/buy_sele","���뻻Ԫ����ͭǮ/change_ingot_to_coin","�����/no")
	end
end
------------ ���� ---------------------
function buy_sele()
	--Say("Ǯׯ�ϰ壺������ĺ������ӷ�٣���������أ�����������Ʒ��С���10000��������100000�����Լ�<color=green>�������ͺ�������\n������<color>���ɿ������Լ�����������Ǯ�ĺ����\n<color=green>������<color>�ǿ��԰�<color=yellow>ͭǮ<color>�ĺ������Ȼ�����ͭǮ����������������",5,"Ҫ��С�����/buy1","��������/buy2","Ҫ������/ruyi_hongbao","Ҫ������/hesui_hongbao","��Ҫ��/no")
	Say("Ǯׯ�ϰ壺�ð��ð���������ĺ������ӷ�٣���������أ�����������Ʒ��С���10000��������100000������֪������Ҫ���֣�",3,"Ҫ��С�����/buy1","��������/buy2","��Ҫ��/no")
end

function buy1()
	if (GetCash() >= 10000) then
		Pay(10000)
		AddItem(6,1,14,1,0,0,0)
		Talk(1,"","Ǯׯ�ϰ壺С���Ҽ�������պ��ˣ�")
	else
		Talk(1,"","Ǯׯ�ϰ壺����Ǯ����̫������")
	end
end

function buy2()
	if (GetCash() >= 100000) then
		Pay(100000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","Ǯׯ�ϰ壺����Ҽ�������պ��ˣ�")
	else
		Talk(1,"","Ǯׯ�ϰ壺����Ǯ����̫������")
	end
end

function no()
end

function hesui_hongbao()	--�Զ���ͭǮ
	AskClientForNumber("Package_Hesui", 1, 100, "������ͭǮö��:");
end
function Package_Hesui(nMoney)
	if (CalcEquiproomItemCount(4, 417, 1, 1) < nMoney) then
		Talk(1,"","Ǯׯ�ϰ壺������ͭǮ���󲻹�"..nMoney.."öŶ��")
	else
		ConsumeEquiproomItem(nMoney, 4, 417, 1, -1)
		local nItem = AddItem(6,1,1052,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		SyncItem(nItem)
		Talk(1,"","Ǯׯ�ϰ壺������Ҽ�������պ��ˣ�")
	end
end


function ruyi_hongbao()		--�Զ����Ǯ
	AskClientForNumber("Package_Ruyi", 1, 10000000, "�����������:");
end
function Package_Ruyi(nMoney)
	if (GetCash() < nMoney) then
		Talk(1,"","Ǯׯ�ϰ壺����Ǯ���󲻹�"..nMoney.."��Ŷ��")
	else
		Pay(nMoney)
		local nItem = AddItem(6,1,1051,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		local nM1 = floor(nMoney / 1000000)
		local nM2 = floor(mod(nMoney, 1000000) / 1000)
		local nM3 = mod(nMoney, 1000)
		SetSpecItemParam(nItem, 2, nM1)
		SetSpecItemParam(nItem, 3, nM2)
		SetSpecItemParam(nItem, 4, nM3)
		SyncItem(nItem)
		Talk(1,"","Ǯׯ�ϰ壺������Ҽ�������պ��ˣ�")
	end
end
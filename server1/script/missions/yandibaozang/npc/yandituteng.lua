-- �׵�ͼ����Ƭ
-- by С�˶��
-- 2008.02.25
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

Include("\\script\\lib\\composeclass.lua");

function YDBZ_tradeYandiTuTeng()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	local tbarytalk = {
		format("<npc>�ռ���9����Ƭ���ø��ң��ҽ�����ϳ�һ����Ƭͼ�ڣ���������ϳ���?\n װ����<color=yellow>%s<color> ��ͼ����Ƭ",nCount),
		"���뻻�׵�ͼ��/YDBZ_SureDoTrade",
		"��ֻ��·��/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTrade()
	local tbarytalk = {
		format("<npc>�ռ���9����Ƭ���ø��ң��ҽ�����ϳ�һ����Ƭͼ��. ��ȷ����ϳ���?",nCount),
		"�ԣ�лл����/YDBZ_DoTrade",
		"��ֻ��·��/NoChoice",
	}
	CreateTaskSay(tbarytalk);	
end
function YDBZ_DoTrade()
	local nCount = CalcEquiproomItemCount(6,1,1685,-1);
	if nCount < 9 then
		Say("װ������9��ͼ����Ƭ!!!",0);
		return 0;
	end
	ConsumeEquiproomItem(9,6,1,1685,-1);
	AddItem(6,1,1606,1,0,0);
	Msg2Player("��ϲ����1<color=yellow> �׵�ͼ��<color>");
end

function YDBZ_tradeYandiLingQi()
	
	local tbarytalk = {
		"<dec>��ѡ��ȡ��ʽ:",
		"2 �׵�ͼ��/#YDBZ_SureDoTradeLingQi(1)",
		"2 �׵�ͼ�� + 1 xu/#YDBZ_SureDoTradeLingQi(2)",
		"��ֻ��·��/NoChoice",
	}
	CreateTaskSay(tbarytalk);
end

function YDBZ_SureDoTradeLingQi(n_sel)
	local tbFormula = {
			[1] = {
						tbMaterial = {{tbProp = {6,1,1606, -1}, szName = "�׵�ͼ��", nCount = 2}},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "�׵�����"},
			},
			[2] = {
						tbMaterial = {
							{tbProp = {6,1,1606, -1}, szName = "�׵�ͼ��", nCount = 2},
							{tbProp = {4,417,1, -1}, szName = "ͭǮ", nCount = 1},
						},
						tbProduct = {tbProp = {6,1,2532,1,0,0}, szName = "�׵�����"},
			},
	};
	
	--�������Ϊ�գ�ʹ��Ĭ��ֵ
	local szLogTitle	= "yandi_tradeLingQi";
	
	local tbMaterial	= tbFormula[n_sel].tbMaterial
	local tbProduct		= tbFormula[n_sel].tbProduct
	
	local nComposeCount = 1
	
	local nFreeItemCellLimit = 1
	
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("Ϊȷ���Ʋ���ȫ����ȷ��װ����ʣ%d ��λ.", nFreeItemCellLimit))
		return 0
	end
	
	if tbComposeClass:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = tbFormula.szFailMsg or "<color=red>��������ԭ�ϲ���!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if tbComposeClass:ConsumeMaterial(tbMaterial, nComposeCount, szLogTitle) ~= 1 then
		Msg2Player("����ʧ�ܣ�ʧȥһЩԭ��.")
		return 0;
	end
	local n_ran = random(100);
	if (n_sel == 1 and n_ran > 60) then
		Msg2Player("����ʧ�ܣ�ʧȥ����ԭ��.");
		return
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, szLogTitle, nComposeCount)
	end
	
end


function YDBZ_tradeXuanYuanLing()
	local n_count = CalcItemCount(3, 6, 1, 2532, -1);
	if (n_count >= 100) then
		ConsumeItem(3, 100, 6,1,2532, -1);
		tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2351,1,0,0}, szName = "��Գ��"}, "yandi_tradeXuanyuan");
	else
		CreateTaskSay({format("<dec>%s��ʣ: <enter>%s", "����Գ��" ,format("%d %s", 100, "�׵�����")), "��֪����!/NoChoice"});
	end
end

-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - ����:ɱ���ر�
-- �ļ�������shashou_mibao.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- ����ģ��
Include("\\script\\task\\tollgate\\killer\\mibao_head.lua")

local n_XuanTian_Chui = 6;

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("��Ҫ%d %s, ����������������!", %n_XuanTian_Chui, "���촸"));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "ɱ���ر�"))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- ��������һ��
	else
		Msg2Player("���ڿ�λ����! ");
		return 1
	end
end

-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ��ս���
-- �ļ�������tiaozhan_libao.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-04-26 13:16:50

-- ======================================================

Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");

function main(nItemIdx)
--	local n_level = GetLevel();
--	if (n_level < 50 or IsCharged() ~= 1) then
--		Say("ֻ��50�������ѳ�ֵ��Ҳ���ʹ��.", 0)
--		return 1;
--	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say(format("Ϊ����ʧȥ�Ʋ�����ȷ��װ������ %d ��λ.", 20), 0);
		return 1;
	end
	tbItem = { tbProp = {6,1,1499,1,1,0}, nCount = 20};
	tbAwardTemplet:GiveAwardByList(tbItem, "��ս���")
end


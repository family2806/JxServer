-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - ����:ɱ���ر�
-- �ļ�������shashou_mibao.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- ����ģ��
local n_XuanTian_Chui = 6;

tbItem_Mibao = {
	{szName = " ti�n th�o l� ",tbProp = {6,1,71,1,1,0}, nRate = 15.873},--ok
	{szName = " t� m�ng l�m ", tbProp = {6,1,2350,1,1,0}, nRate = 0.2},--ok
	{szName = " huy�n vi�n l�m ", tbProp = {6,1,2351,1,1,0}, nRate = 0.5},--ok
	{szName = " t� m�ng l�m ", tbProp = {6,1,2350,1,1,0}, nRate = 0.1},--ok
	{szName = " huy�n vi�n l�m ", tbProp = {6,1,2351,1,1,0}, nRate = 0.1},--ok
	{szName = " ��i l�c ho�n ", tbProp = {6,0,3,1,1,0}, nRate = 25},--ok
	{szName = " nhanh ch�ng ho�n ", tbProp = {6,0,6,1,1,0}, nRate = 25},--ok
	{szName = " khi�u chi�n l� t�i ", tbProp = {6,1,2006,1,1,0}, nRate = 20},--ok
	{szName = " huy ho�ng qu� ( cao ) ", tbProp = {6,1,906,1,1,0}, nRate = 10, nExpiredTime = 10080},--ok
	{szName = " ho�ng kim chi qu� ", tbProp = {6,1,907,1,1,0}, nRate = 0.5, nExpiredTime = 10080},--ok
	{szName = " h�i thi�n t�i t�o c�m nang ", tbProp = {6,1,1781,1,1,0}, nRate = 3, tbParam = {60}},	-- ���Ұ���60��--ok
}

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("C�n %d %s, c�c h� s� mang s� l��ng kh�ng �� !", %n_XuanTian_Chui, "Huy�n thi�n ch�y "));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "D� t�u ��ch b� b�o "))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- ��������һ��
	else
		Msg2Player("T�i b�n trong ch� tr�ng ch�a �� ! ");
		return 1
	end
end

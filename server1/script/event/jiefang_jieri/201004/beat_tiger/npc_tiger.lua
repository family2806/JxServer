-- Ѱ���� �ϻ�
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")

function OnDeath(nNpcIndex)
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		Msg2Player("��ѽ���");
		return
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		Msg2Player("���δ��ʼ����ע��ʱ��.");
		return
	end		
	
	-- ��¼��������ʱ��
	local nDeathTime = GetCurServerTime();
	local tbPlayerInfo = tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	
	if tbPlayerInfo == nil then
		tbBeatTiger.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()] = {nkillTime = nDeathTime, nAwardDate = 0,};
	else
		tbPlayerInfo.nkillTime = nDeathTime;
	end
	
	Msg2Player("�����Ѿ����ɱѪ�ϻ��ˣ��뵽���㴦�콱!");
	
end


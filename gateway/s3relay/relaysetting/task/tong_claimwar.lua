--�����ս��������
function ClaimWar(nClaimWarSrcTongID, nClaimWarDestTongID, nLeftMinutes)
	local strSrcTongName  = GetTongNameByID(nClaimWarSrcTongID);
	local strDestTongName = GetTongNameByID(nClaimWarDestTongID);
	
	local szMsg = format("���%s  �� �Ѿ���ս����%s, ս��ʱ�仹ʣ%d ����.", strSrcTongName, strDestTongName, nLeftMinutes);
	local szEndMsg = format("���%s ������ս����%s.", strSrcTongName, strDestTongName);
	if (nLeftMinutes == 0) then
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szEndMsg));
	else
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg));
	end;
end
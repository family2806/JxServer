function GetDesc(nItem)
	return ""
end

function main(nItem)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId ~= 395 then
		Msg2Player("����Ʒֻ�����챣���ͼ��ʹ��")
		return 1
	end
	
	local tbList,nCount = GetAroundNpcList(20, 8)--����20���Ϊһ����Χ
	for i = 1,nCount do
		local nNpcIndex = tbList[i]
		local nNpcId = GetNpcSettingIdx(nNpcIndex)
		if nNpcId == 849 then
			local szNpcName = GetNpcName(nNpcIndex)
			Msg2Player(szNpcName.."�������ѽ���")
			AddNpcSkillState(nNpcIndex, 1038, 1, 1, 18 * 60 * 60)
		end
	end

	Msg2Player("��ֻ��ʹ��1�������")
	WriteLog(format("Account:%s[Name:%s] ʹ�ó����",
				GetAccount(),
				GetName())
			);
	return
end

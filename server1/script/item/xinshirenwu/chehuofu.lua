function GetDesc(nItem)
	return ""
end

--���Է�ֽ�Զ��ٷ�Χ�ڵĹ�������
function testAround(nDist)
    local tbList,nCount = GetAroundNpcList(nDist, 8)
    	for i = 1,nCount do
    		local nNpcIndex = tbList[i]
    		local nNpcId = GetNpcSettingIdx(nNpcIndex)
    		if nNpcId == 849 then
    			local szNpcName = GetNpcName(nNpcIndex)
    			Msg2Player(format("%s ��Χ��%d", szNpcName, nDist))
    		end
    end
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
			Msg2Player(szNpcName.."�������½�")
			AddNpcSkillState(nNpcIndex, 1041, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("��ʹ��һ�������")
	WriteLog(format("Account:%s[Name:%s] ʹ�ó����",
				GetAccount(),
				GetName())
			);
	return
end

function GetDesc(nItem)
	return ""
end

function main(nItem)
	local nMapId, nX, nY = GetWorldPos()
	if nMapId ~= 395 then
		Msg2Player("该物品只能在天保库地图内使用")
		return 1
	end
	
	local tbList,nCount = GetAroundNpcList(20, 8)--距离20大概为一屏范围
	for i = 1,nCount do
		local nNpcIndex = tbList[i]
		local nNpcId = GetNpcSettingIdx(nNpcIndex)
		if nNpcId == 849 then
			local szNpcName = GetNpcName(nNpcIndex)
			Msg2Player(szNpcName.."抗冰下降")
			AddNpcSkillState(nNpcIndex, 1040, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("您使用1个撤水符")
	WriteLog(format("Account:%s[Name:%s] 使用撤水符",
				GetAccount(),
				GetName())
			);
	return
end

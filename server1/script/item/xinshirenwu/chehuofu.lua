function GetDesc(nItem)
	return ""
end

--调试符纸对多少范围内的怪起作用
function testAround(nDist)
    local tbList,nCount = GetAroundNpcList(nDist, 8)
    	for i = 1,nCount do
    		local nNpcIndex = tbList[i]
    		local nNpcId = GetNpcSettingIdx(nNpcIndex)
    		if nNpcId == 849 then
    			local szNpcName = GetNpcName(nNpcIndex)
    			Msg2Player(format("%s 范围内%d", szNpcName, nDist))
    		end
    end
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
			Msg2Player(szNpcName.."抗火已下降")
			AddNpcSkillState(nNpcIndex, 1041, 1, 1, 18 * 60 * 60)
		end
	end
	
	Msg2Player("您使用一个撤火符")
	WriteLog(format("Account:%s[Name:%s] 使用撤火符",
				GetAccount(),
				GetName())
			);
	return
end

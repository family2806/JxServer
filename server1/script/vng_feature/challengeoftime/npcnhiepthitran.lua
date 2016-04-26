tbCOT_Party = {}
DescLink_NhiepThiTran = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>聂弑尘:<link>";
function tbCOT_Party:CheckCondition()
	if IsCaptain() ~= 1 then
		Talk(1, "", "对不起，只有队长才有权检查组队的参加条件!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()
	local nOldPlayer = PlayerIndex
	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		--检查杀手锏
		if self:CalcSword() < 1 then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "没有杀手锏"))
		end
	
		--检查当日闯关次数
		local nDailyTaskCount = self:GetDailyTaskCount()
		if ( nDailyTaskCount >= 3) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "闯关已购3次"))
		else
			local nLHHUse = self:GetLHHUseCount()
			if (nDailyTaskCount == 1 and nLHHUse < 1) or (nDailyTaskCount == 2 and nLHHUse < 2) then
				tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "未使用龙血丸"))
			end
		end
		
	end -- loop whole party
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then
		local strTittle = DescLink_NhiepThiTran.."组队目前不能参加\n 挑战:"
		for i = 1, getn(tbDialog) do
			strTittle = strTittle.."\n"..tbDialog[i]
		end
		Describe(strTittle, 1, "关闭/OnCancel")
	else
		local strTittle = DescLink_NhiepThiTran.."组队目前可以参加挑战"
		Describe(strTittle, 1, "关闭/OnCancel")
	end
end

function tbCOT_Party:CalcSword()
	local nHaveSword = 0
	for j =  20, 90, 10 do
		if nHaveSword > 1 then
			break
		else
			nHaveSword = CalcEquiproomItemCount( 6, 1, 400, j ) + nHaveSword
		end
	end
	return nHaveSword	
end

function tbCOT_Party:GetDailyTaskCount()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nResult = 0
	if (ndate ~= GetTask(1551)) then --当日未去闯关
			nResult = 0
	else		
		if ndate ~= GetTask(2641) then --未使用龙血丸
			if GetTask(1550) <= 0 then --可以参加的闯关次数
				nResult = nResult + 1
			end
		else
			nResult = 1 + GetTask(2642) - GetTask(1550)
			if nResult < 0 then
				nResult = 0
			end
		end
	end
	return nResult
end

--使用龙血丸次数
function tbCOT_Party:GetLHHUseCount()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nResult = 0
	if ndate ~= GetTask(2641) then 
		nResult = 0
	else
		nResult = GetTask(2642)
	end
	return nResult
end

function OnCancel()

end
tbCOT_Party = {}
DescLink_NhiepThiTran = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>��߱��:<link>";
function tbCOT_Party:CheckCondition()
	if IsCaptain() ~= 1 then
		Talk(1, "", "�Բ���ֻ�жӳ�����Ȩ�����ӵĲμ�����!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()
	local nOldPlayer = PlayerIndex
	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		--���ɱ���
		if self:CalcSword() < 1 then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "û��ɱ���"))
		end
	
		--��鵱�մ��ش���
		local nDailyTaskCount = self:GetDailyTaskCount()
		if ( nDailyTaskCount >= 3) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "�����ѹ�3��"))
		else
			local nLHHUse = self:GetLHHUseCount()
			if (nDailyTaskCount == 1 and nLHHUse < 1) or (nDailyTaskCount == 2 and nLHHUse < 2) then
				tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "δʹ����Ѫ��"))
			end
		end
		
	end -- loop whole party
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then
		local strTittle = DescLink_NhiepThiTran.."���Ŀǰ���ܲμ�\n ��ս:"
		for i = 1, getn(tbDialog) do
			strTittle = strTittle.."\n"..tbDialog[i]
		end
		Describe(strTittle, 1, "�ر�/OnCancel")
	else
		local strTittle = DescLink_NhiepThiTran.."���Ŀǰ���Բμ���ս"
		Describe(strTittle, 1, "�ر�/OnCancel")
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
	if (ndate ~= GetTask(1551)) then --����δȥ����
			nResult = 0
	else		
		if ndate ~= GetTask(2641) then --δʹ����Ѫ��
			if GetTask(1550) <= 0 then --���ԲμӵĴ��ش���
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

--ʹ����Ѫ�����
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
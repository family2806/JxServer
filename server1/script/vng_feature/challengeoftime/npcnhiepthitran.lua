tbCOT_Party = {}
DescLink_NhiepThiTran = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>Nhi’p Th› Tr«n:<link>";
function tbCOT_Party:CheckCondition()
	if IsCaptain() ~= 1 then
		Talk(1, "", "Xin lÁi, chÿ c„ ÆÈi tr≠Îng mÌi c„ quy“n ki”m tra Æi“u ki÷n tham gia cÒa tÊ ÆÈi!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()
	local nOldPlayer = PlayerIndex
	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		--ºÏ≤È…± ÷Ôµ
		if self:CalcSword() < 1 then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Kh´ng c„ S∏t ThÒ Gi∂n"))
		end
	
		--ºÏ≤Èµ±»’¥≥πÿ¥Œ ˝
		local nDailyTaskCount = self:GetDailyTaskCount()
		if ( nDailyTaskCount >= 3) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "ß∑ v≠Ót ∂i ÆÒ 3 l«n"))
		else
			local nLHHUse = self:GetLHHUseCount()
			if (nDailyTaskCount == 1 and nLHHUse < 1) or (nDailyTaskCount == 2 and nLHHUse < 2) then
				tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Ch≠a sˆ dÙng Long Huy’t Hoµn"))
			end
		end
		
	end -- loop whole party
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then
		local strTittle = DescLink_NhiepThiTran.."TÊ ÆÈi hi÷n tπi kh´ng th” tham gia\n khi™u chi’n:"
		for i = 1, getn(tbDialog) do
			strTittle = strTittle.."\n"..tbDialog[i]
		end
		Describe(strTittle, 1, "ß„ng/OnCancel")
	else
		local strTittle = DescLink_NhiepThiTran.."TÊ ÆÈi hi÷n tπi c„ th” tham gia khi™u chi’n"
		Describe(strTittle, 1, "ß„ng/OnCancel")
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
	if (ndate ~= GetTask(1551)) then --µ±»’Œ¥»•¥≥πÿ
			nResult = 0
	else		
		if ndate ~= GetTask(2641) then --Ch≠a sˆ dÙng Long Huy’t Hoµn
			if GetTask(1550) <= 0 then --ø…“‘≤Œº”µƒ¥≥πÿ¥Œ ˝
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

-- π”√¡˙—™ÕË¥Œ ˝
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
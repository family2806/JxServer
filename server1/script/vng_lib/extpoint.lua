if not tbExtPointLib then 
	tbExtPointLib = {}
end

function tbExtPointLib:GetBitValue(nExtPoint, nBitPos)
	local nVal = GetExtPoint(nExtPoint)
	return(GetBit(nVal, nBitPos))
end

function tbExtPointLib:SetBitValue(nExtPoint, nBitPos, nBitValue)
--BÊ sung ki”m tra gi∏ trﬁ extpoint ©m - Modified by DinhHQ - 20110814
	local nVal = GetExtPoint(nExtPoint)
	if nVal < 0 then
		return 0
	end
	if (nBitValue == 0) then		
		nVal = SetBit(nVal,nBitPos, 0)
		nVal = GetExtPoint(nExtPoint) - nVal
		return PayExtPoint(nExtPoint, nVal)		
	elseif (nBitValue == 1) then
		nVal = SetBit(nVal, nBitPos, 1)
		nVal = nVal - GetExtPoint(nExtPoint)
		return AddExtPoint(nExtPoint, nVal)
	end
end
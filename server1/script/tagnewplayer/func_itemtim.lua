Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\QualityItem.lua");



function ToStrNumb(set)
	local s = "{"
	local sep = ""
	local val = ""
	for k,v in set do
			if (type(v) == "table") then
				val = ToStrNumb(v)
			else
				val = v
			end
			if (type(v) == "string") then
				val = "\"" ..v.."\""
			end
			s = s .. sep .. val
			sep = ", "
	end
	return s .. "}"
end

tbItem=
{
	{strSelect ="ñ��"},
	{strSelect ="�·�"},
	{strSelect ="����"},
	{strSelect ="����"},
	{strSelect ="ѥ��"},
	{strSelect ="��һ����"},
	{strSelect ="�ڶ�����"}
};
tbWeapon=
{
	{strName ="��"},
	{strName ="�ɵ�"},
	{strName ="����"},
	{strName ="��"},
	{strName ="ǹ"},
	{strName ="��"}
};



function GetItemTim()
		local tbSeries={}
		if (CheckObject() < 1) then
			Talk(1, "", "����μ�����.");
			return
		end
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) ~= 1) then
			Talk(1, "", "�ý���ֻ����һ�� !");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "װ������60��λ.");
			return
		end
		SelectItemTim(tbSeries)
end
function SelectItemTim(tbSeries)
	local tbOpp = {}
	local str = "<#>�����ѡ��װ��";
	local szTempSeries = ToStrNumb(tbSeries)
	str = str .. ShowSelItem(tbSeries)
		
	for i = 1, getn(tbItem) do
			local strFunc = tbItem[i].strSelect
			tinsert(tbOpp,"������ȡװ��".. strFunc.." /#SelectSeries("..i.. ",".."\""..strFunc.."\"".."," .. szTempSeries .. ")");
	end
	tinsert(tbOpp, "<#>�˳�/CancelSelectItem")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
	
end
function SelectSeries(nIndex, strFunc, tbSeries)
	
	if (getn(tbSeries)> 0) then
		for i =1, getn(tbSeries) do
				
				if (tbSeries[i][1] == strFunc) then
					do
						Talk(1,"",format("��������ѡ��װ��%s�ˣ�������ѡ��!!!", strFunc))
						return
					end
				end
		end
	end

	local szTempSeries = ToStrNumb(tbSeries)
	if (strFunc ~= "��һ����" and strFunc ~= "�ڶ�����") then
		local tbOpp = {}
		local str = "<#> ����ѡ����������";
		tinsert(tbOpp,"������ȡ��ϵװ��/#SelectItem(0,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"������ȡľϵװ��/#SelectItem(1,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"������ȡˮϵװ��/#SelectItem(2,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"������ȡ��ϵװ��/#SelectItem(3,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"������ȡ��ϵװ��/#SelectItem(4,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp, "<#>�˳�/CancelSelectItem")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end
		Say( str, getn( tbOpp ), tbOpp )
	else
		local tbOpp = {}
		local str = "<#> �����ѡ������"
		for i=1, getn(tbWeapon) do
			local strItemName = tbWeapon[i].strName
			tinsert(tbOpp,"��ѡ: " .. strItemName.."/#SelectItem(0,".."\""..strItemName.."\"".. "," .. szTempSeries .. ")");
		end
		tinsert(tbOpp, "<#>�˳�/CancelSelectItem")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end;
		Say( str, getn( tbOpp ), tbOpp )
	end
end
function SelectItem(nSeries, strFunc, tbSeries)

	if (getn(tbSeries)> 0) then
		for i =1, getn(tbSeries) do
				
				if (tbSeries[i][1] == strFunc) then
					do
						Talk(1,"",format("��������ѡ��װ��%s�ˣ�������ѡ��!!!", strFunc))
						return
					end
				end
		end
	end
	tbSeries[getn(tbSeries)+1] = {strFunc, nSeries}
	if (getn(tbSeries)> 0) then
		local nCount = 0
		for i =1, getn(tbSeries) do
			for j = 1, getn(tbWeapon) do
				if (tbSeries[i][1] == tbWeapon[j].strName) then
					nCount = nCount + 1
				end
			end
		end
		
		if (nCount > 2) then
			do
					Talk(1,"","������ѡ�����������������!!!")
					return
			end
		end
		
	end		
		if (getn(tbSeries) < 7) then
			SelectItemTim(tbSeries)
		else
			--tbItem = clone(tbItem)
			local strTitle = "<#>�����Ѹ�װ��ѡ�������� "
			--for strItemName,numSeries in tbSeries do
			strTitle = strTitle .. ShowSelItem(tbSeries)
			local szTempSeries = ToStrNumb(tbSeries)
			Say(strTitle, 2,
			"������ȡ/#ConfirmGetItem(" .. szTempSeries .. ")",
			"���� /CancelSelectItem")
		end
end
function ConfirmGetItem(tbSeries)
		for k,v in tbSeries do
			Msg2Player(v[1])
		end
		SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim, 1)--set bit 7 len 1de xac nhan  gamer nhan  phan thuong
		local nSex = GetSex()

		 for i = 1, getn(tbSeries) do
			local strItemName = tbSeries[i][1]
			local numSeries = tbSeries[i][2]
			AddQItem(strItemName, numSeries, nSex)
		end
		
		Addweapon(tbSeries)
		--tbSeries={}		
end
function Addweapon(tbSeries)
		 for i = 1, getn(tbSeries) do
					local strItemName = tbSeries[i][1]
					local nItemIndex = nil
					if (strItemName == "��") then
						nItemIndex = AddQualityItem(2,0,0,1,10,0,0,30,219,9,290,135,-1)				
					elseif (strItemName == "�ɵ�") then
						nItemIndex = AddQualityItem(2,0,1,1,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "����") then
						nItemIndex = AddQualityItem(2,0,1,0,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "��") then
						nItemIndex = AddQualityItem(2,0,0,0,10,0,0,30,219,9,290,135,-1)					
					elseif (strItemName == "ǹ") then
						nItemIndex = AddQualityItem(2,0,0,3,10,0,0,30,219,9,290,125,-1)					
					elseif (strItemName == "��") then
						nItemIndex = AddQualityItem(2,0,0,2,10,0,0,30,219,9,290,135,-1)					
					end
				
				if (nItemIndex ~= nil) then
					SetItemBindState(nItemIndex, -2);
					SyncItem(nItemIndex)
					local strItem = GetItemName(nItemIndex)
					Msg2Player("���� "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."����ƽ���"..GetAccount().."\t"..GetName().."\t".."�����"..strItem)
				end
		end--for
end

function ShowSelItem(tbSeries)
	local szTem = ""
	for i = 1, getn(tbSeries) do
				local numSeries = tbSeries[i][2]
				local strItemName =  tbSeries[i][1]
				local nSeries=""
				if (numSeries == 0) then
					nSeries = "��"
				elseif(numSeries == 1) then
					nSeries = "ľ"
				elseif(numSeries == 2) then
					nSeries = "ˮ"
				elseif(numSeries == 3) then
					nSeries = "��"
				else
					nSeries = "��"
				end
				szTem = szTem .. "\n<color=yellow>"..strItemName.."<color> ϵ<color=red>"..nSeries.."<color>"
	end
	return szTem
end

function CancelSelectItem()

end







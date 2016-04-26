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
	{strSelect ="帽子"},
	{strSelect ="衣服"},
	{strSelect ="腰带"},
	{strSelect ="手套"},
	{strSelect ="靴子"},
	{strSelect ="第一武器"},
	{strSelect ="第二武器"}
};
tbWeapon=
{
	{strName ="刀"},
	{strName ="飞刀"},
	{strName ="飞镖"},
	{strName ="剑"},
	{strName ="枪"},
	{strName ="棒"}
};



function GetItemTim()
		local tbSeries={}
		if (CheckObject() < 1) then
			Talk(1, "", "请检查参加条件.");
			return
		end
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) ~= 1) then
			Talk(1, "", "该奖励只能领一次 !");
			return
		end
		if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "装备不足60空位.");
			return
		end
		SelectItemTim(tbSeries)
end
function SelectItemTim(tbSeries)
	local tbOpp = {}
	local str = "<#>请大侠选择装备";
	local szTempSeries = ToStrNumb(tbSeries)
	str = str .. ShowSelItem(tbSeries)
		
	for i = 1, getn(tbItem) do
			local strFunc = tbItem[i].strSelect
			tinsert(tbOpp,"我想领取装备".. strFunc.." /#SelectSeries("..i.. ",".."\""..strFunc.."\"".."," .. szTempSeries .. ")");
	end
	tinsert(tbOpp, "<#>退出/CancelSelectItem")
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
						Talk(1,"",format("大侠正在选择装备%s了，还想再选择啊!!!", strFunc))
						return
					end
				end
		end
	end

	local szTempSeries = ToStrNumb(tbSeries)
	if (strFunc ~= "第一武器" and strFunc ~= "第二武器") then
		local tbOpp = {}
		local str = "<#> 大侠选择五行属性";
		tinsert(tbOpp,"我想领取金系装备/#SelectItem(0,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"我想领取木系装备/#SelectItem(1,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"我想领取水系装备/#SelectItem(2,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"我想领取火系装备/#SelectItem(3,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp,"我想领取土系装备/#SelectItem(4,".."\""..strFunc.."\"".. "," .. szTempSeries ..")");
		tinsert(tbOpp, "<#>退出/CancelSelectItem")
		if ( getn( tbOpp ) == 0 ) then
			Say(str, 0);
			return
		end
		Say( str, getn( tbOpp ), tbOpp )
	else
		local tbOpp = {}
		local str = "<#> 请大侠选择武器"
		for i=1, getn(tbWeapon) do
			local strItemName = tbWeapon[i].strName
			tinsert(tbOpp,"我选: " .. strItemName.."/#SelectItem(0,".."\""..strItemName.."\"".. "," .. szTempSeries .. ")");
		end
		tinsert(tbOpp, "<#>退出/CancelSelectItem")
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
						Talk(1,"",format("大侠正在选择装备%s了，还想再选择啊!!!", strFunc))
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
					Talk(1,"","大侠已选择了允许的武器数量!!!")
					return
			end
		end
		
	end		
		if (getn(tbSeries) < 7) then
			SelectItemTim(tbSeries)
		else
			--tbItem = clone(tbItem)
			local strTitle = "<#>阁下已给装备选择了五行 "
			--for strItemName,numSeries in tbSeries do
			strTitle = strTitle .. ShowSelItem(tbSeries)
			local szTempSeries = ToStrNumb(tbSeries)
			Say(strTitle, 2,
			"我想领取/#ConfirmGetItem(" .. szTempSeries .. ")",
			"放弃 /CancelSelectItem")
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
					if (strItemName == "刀") then
						nItemIndex = AddQualityItem(2,0,0,1,10,0,0,30,219,9,290,135,-1)				
					elseif (strItemName == "飞刀") then
						nItemIndex = AddQualityItem(2,0,1,1,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "飞镖") then
						nItemIndex = AddQualityItem(2,0,1,0,10,0,0,30,219,9,290,140,-1)						
					elseif (strItemName == "剑") then
						nItemIndex = AddQualityItem(2,0,0,0,10,0,0,30,219,9,290,135,-1)					
					elseif (strItemName == "枪") then
						nItemIndex = AddQualityItem(2,0,0,3,10,0,0,30,219,9,290,125,-1)					
					elseif (strItemName == "棒") then
						nItemIndex = AddQualityItem(2,0,0,2,10,0,0,30,219,9,290,135,-1)					
					end
				
				if (nItemIndex ~= nil) then
					SetItemBindState(nItemIndex, -2);
					SyncItem(nItemIndex)
					local strItem = GetItemName(nItemIndex)
					Msg2Player("你获得 "..strItem)
					WriteLog(date("%Y%m%d %H%M%S").."\t".."安邦黄金令"..GetAccount().."\t"..GetName().."\t".."获得紫"..strItem)
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
					nSeries = "金"
				elseif(numSeries == 1) then
					nSeries = "木"
				elseif(numSeries == 2) then
					nSeries = "水"
				elseif(numSeries == 3) then
					nSeries = "火"
				else
					nSeries = "土"
				end
				szTem = szTem .. "\n<color=yellow>"..strItemName.."<color> 系<color=red>"..nSeries.."<color>"
	end
	return szTem
end

function CancelSelectItem()

end







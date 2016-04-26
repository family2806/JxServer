--罚恶使
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")
--定义全局变量记录玩家要惩罚那个城市
nGlobalCityIndex = 0

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("数据错误。", 0)
		return
	end
	--读取存盘文件，保证只读取一次
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#>罚恶使:我是惩罚坏人的使者，我能帮你什么?",
		"<#>查询各城市功绩/onchecknum",
		"<#>惩罚占领凤翔帮会/onpunish_fengxiang",
		"<#>惩罚占领成都帮会/onpunish_chengdu",
		"<#>惩罚占领大理帮会/onpunish_dali",
		"<#>惩罚占领汴京帮会/onpunish_bianjing",
		"<#>惩罚占领襄阳帮会/onpunish_xiangyang",	
		"<#>惩罚占领扬州帮会/onpunish_yangzhou",
		"<#>惩罚占领临安帮会/onpunish_linan",		
		"<#>我只是来逛逛/oncancel",
	}
	
	--可以不可以用数组来实现
	local aryCallBackFun = {
		"/onpunish_fengxiang",
		"/onpunish_chengdu",
		"/onpunish_dali",
		"/onpunish_bianjing",
		"/onpunish_xiangyang",
		"/onpunish_yangzhou",
		"/onpunish_linan"
	}
	local nNum
	for nCityIndex=1, 7 do
		strTongName = GetCityOwner(nCityIndex)
		if (strTongName == nil or strTongName == "") then
			aryszContent[nCityIndex + 2] = "<#>"..arraycityindextoname[nCityIndex].."无帮会占领，无法进行惩罚/oncancel"
		else
			nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
			aryszContent[nCityIndex + 2] = "<#>惩罚帮会"..strTongName.."占领的城市"..arraycityindextoname[nCityIndex].."(城市功绩:"..nNum..")"..aryCallBackFun[nCityIndex]
		end
	end	
	
	Say(aryszContent[1], 9,	aryszContent[2],aryszContent[3],aryszContent[4],aryszContent[5],aryszContent[6],aryszContent[7],aryszContent[8],aryszContent[9], aryszContent[10]);
end 

function onpunish()
	--根据地图索引惩罚
	if (nGlobalCityIndex < 1) then
		Say("<#>没有要惩罚的城市", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#>城市<color=red>"..arraycityindextoname[nIndex].."<color>无人占领，无法进行惩罚", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--打开给与界面
	GiveItemUI( "提交罚恶令", "惩罚城市"..arraycityindextoname[nGlobalCityIndex]..",城市占领帮会"..strCityTongName..",目前该城的功绩为:"..nNum, "onsubmitconfirm", "oncancel" )
end

function onconfirm(nIndex)
	local strCityTongName = GetCityOwner(nIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#>城市<color=red>"..arraycityindextoname[nIndex].."<color>无人占领，无法进行惩罚", 0)
		return
	end

	--给全局变量赋值
	nGlobalCityIndex = nIndex	
	strMsg={	
		"<#>占领<color=red>"..arraycityindextoname[nIndex].."<color>城市的帮会是:<color=red>"..strCityTongName.."<color>,你确定要使用罚恶令吗？",
		"<#>确定/onpunish",
		"<#>我再考虑考虑/oncancel"		
	};
	
	Say(strMsg[1], 2, strMsg[2], strMsg[3]);
end

function onpunish_fengxiang()
	onconfirm(1)
end

function onpunish_chengdu()
	onconfirm(2)
end

function onpunish_dali()
	onconfirm(3)
end

function onpunish_bianjing()
	onconfirm(4)
end

function onpunish_xiangyang()
	onconfirm(5)
end

function onpunish_yangzhou()
	onconfirm(6)
end

function onpunish_linan()
	onconfirm(7)
end
		
function oncancel()
	return
end

function onchecknum()
	--查询各帮会赏善令的数量
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo1 = ""
	local strInfo2 = ""
	for nCityIndex=1, 4 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color>无人占领,功绩为:<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#>占领<color=red>"..arraycityindextoname[nCityIndex].."<color>的帮会是:<color=red>"..strTongName.."<color>,城市功绩为:<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 1) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 2) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		elseif (nCityIndex == 3) then
		    strInfo1 = arr[nCityIndex]
		elseif (nCityIndex == 4) then
		    strInfo1 = strInfo1.."<enter>"..arr[nCityIndex]
		end
	end
	
	--Talk(4, "onchecknum1", arr[1], arr[2], arr[3], arr[4])
	Talk(2, "onchecknum1", strInfo, strInfo1)
end

function onchecknum1()
	--查询各帮会赏善令的数量
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo = ""
	local strInfo1 = ""
	for nCityIndex=5, 7 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color>无人占领,城市功绩为:<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#>占领<color=red>"..arraycityindextoname[nCityIndex].."<color>的帮会是:<color=red>"..strTongName.."<color>,城市功绩为:<color=red>"..nNum.."<color>"
		end
		if (nCityIndex == 5) then
		    strInfo = arr[nCityIndex]
		elseif (nCityIndex == 6) then
		    strInfo = strInfo.."<enter>"..arr[nCityIndex]
		else
		    strInfo1 = arr[nCityIndex]
		end
	end
	
	--Talk(3, "", arr[5], arr[6], arr[7])
	Talk(2, "", strInfo, strInfo1)
end

function onsubmitconfirm(nCount)
	if (nCount < 1) then
		Msg2Player("你没有提交罚恶令")
		return
	end
	
	--判断物品是否为罚恶令
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit( i )
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_PUNISHMEDIAL_NGENTYPE or
			DetailType ~= AEXP_PUNISHMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_PUNISHMEDIAL_PARTYPE) then
				Msg2Player("<#>你好像有东西不是罚恶令哟！")
				return 0			
		end
	end
	
	local nTotalNum = 0
	for i = 1, nCount do
		nItemIndex = GetGiveItemUnit( i )
		nTotalNum = nTotalNum + GetItemStackCount(nItemIndex)
		RemoveItemByIndex( nItemIndex )
	end
	
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--if (nNum < 0) then
	--	nNum = 0
	--end
	
	local nSpareNum = nNum - nTotalNum
	--if (nSpareNum < 0) then
	--	nSpareNum = 0
	--end
	
	SetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex], nSpareNum)
	local strCityTongName = GetCityOwner(nGlobalCityIndex);	
	--对tab文件进行写
	CityData[nGlobalCityIndex] = CityData[nGlobalCityIndex] + nTotalNum
	if (CityData[nGlobalCityIndex] > AEXP_REDUCEMAX_SAVE) then
		CityData[nGlobalCityIndex] = 0		
		WriteLog("["..date("%Y-%m-%d %X").."] 帮会:"..strCityTongName.." 城市:"..arraycityindextoname[nGlobalCityIndex].." 因为"..GetAccount().."("..GetName()..")提交了"..nTotalNum.."个罚恶令,超过累计存盘数量. 当前赏善令数量为:"..nSpareNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
		savevalue()
	end	
	
	Say("<#>城市<color=red>"..arraycityindextoname[nGlobalCityIndex].."<color>,占领帮会:<color=red>"..strCityTongName.."<color>,你提交了"..nTotalNum.."个罚恶令对它惩罚,目前该城市功绩为:<color=red>"..nSpareNum.."<color>",0)
end

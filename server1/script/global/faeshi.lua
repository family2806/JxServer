--����ʹ
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")
--����ȫ�ֱ�����¼���Ҫ�ͷ��Ǹ�����
nGlobalCityIndex = 0

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("���ݴ���", 0)
		return
	end
	--��ȡ�����ļ�����ֻ֤��ȡһ��
	loadsavevalue()
	
	local aryszContent = 
	{
		"<#>����ʹ:���ǳͷ����˵�ʹ�ߣ����ܰ���ʲô?",
		"<#>��ѯ�����й���/onchecknum",
		"<#>�ͷ�ռ�������/onpunish_fengxiang",
		"<#>�ͷ�ռ��ɶ����/onpunish_chengdu",
		"<#>�ͷ�ռ�������/onpunish_dali",
		"<#>�ͷ�ռ���꾩���/onpunish_bianjing",
		"<#>�ͷ�ռ���������/onpunish_xiangyang",	
		"<#>�ͷ�ռ�����ݰ��/onpunish_yangzhou",
		"<#>�ͷ�ռ���ٰ����/onpunish_linan",		
		"<#>��ֻ�������/oncancel",
	}
	
	--���Բ�������������ʵ��
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
			aryszContent[nCityIndex + 2] = "<#>"..arraycityindextoname[nCityIndex].."�ް��ռ�죬�޷����гͷ�/oncancel"
		else
			nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
			aryszContent[nCityIndex + 2] = "<#>�ͷ����"..strTongName.."ռ��ĳ���"..arraycityindextoname[nCityIndex].."(���й���:"..nNum..")"..aryCallBackFun[nCityIndex]
		end
	end	
	
	Say(aryszContent[1], 9,	aryszContent[2],aryszContent[3],aryszContent[4],aryszContent[5],aryszContent[6],aryszContent[7],aryszContent[8],aryszContent[9], aryszContent[10]);
end 

function onpunish()
	--���ݵ�ͼ�����ͷ�
	if (nGlobalCityIndex < 1) then
		Say("<#>û��Ҫ�ͷ��ĳ���", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#>����<color=red>"..arraycityindextoname[nIndex].."<color>����ռ�죬�޷����гͷ�", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--�򿪸������
	GiveItemUI( "�ύ������", "�ͷ�����"..arraycityindextoname[nGlobalCityIndex]..",����ռ����"..strCityTongName..",Ŀǰ�óǵĹ���Ϊ:"..nNum, "onsubmitconfirm", "oncancel" )
end

function onconfirm(nIndex)
	local strCityTongName = GetCityOwner(nIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<#>����<color=red>"..arraycityindextoname[nIndex].."<color>����ռ�죬�޷����гͷ�", 0)
		return
	end

	--��ȫ�ֱ�����ֵ
	nGlobalCityIndex = nIndex	
	strMsg={	
		"<#>ռ��<color=red>"..arraycityindextoname[nIndex].."<color>���еİ����:<color=red>"..strCityTongName.."<color>,��ȷ��Ҫʹ�÷�������",
		"<#>ȷ��/onpunish",
		"<#>���ٿ��ǿ���/oncancel"		
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
	--��ѯ����������������
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo1 = ""
	local strInfo2 = ""
	for nCityIndex=1, 4 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color>����ռ��,����Ϊ:<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#>ռ��<color=red>"..arraycityindextoname[nCityIndex].."<color>�İ����:<color=red>"..strTongName.."<color>,���й���Ϊ:<color=red>"..nNum.."<color>"
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
	--��ѯ����������������
	local strTongName
	local nCityIndex
	local arr = {}
	local strInfo = ""
	local strInfo1 = ""
	for nCityIndex=5, 7 do
		strTongName = GetCityOwner(nCityIndex)
		local nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
		if (strTongName == nil or strTongName == "") then
			arr[nCityIndex] = "<#><color=red>"..arraycityindextoname[nCityIndex].."<color>����ռ��,���й���Ϊ:<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<#>ռ��<color=red>"..arraycityindextoname[nCityIndex].."<color>�İ����:<color=red>"..strTongName.."<color>,���й���Ϊ:<color=red>"..nNum.."<color>"
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
		Msg2Player("��û���ύ������")
		return
	end
	
	--�ж���Ʒ�Ƿ�Ϊ������
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit( i )
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_PUNISHMEDIAL_NGENTYPE or
			DetailType ~= AEXP_PUNISHMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_PUNISHMEDIAL_PARTYPE) then
				Msg2Player("<#>������ж������Ƿ�����Ӵ��")
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
	--��tab�ļ�����д
	CityData[nGlobalCityIndex] = CityData[nGlobalCityIndex] + nTotalNum
	if (CityData[nGlobalCityIndex] > AEXP_REDUCEMAX_SAVE) then
		CityData[nGlobalCityIndex] = 0		
		WriteLog("["..date("%Y-%m-%d %X").."] ���:"..strCityTongName.." ����:"..arraycityindextoname[nGlobalCityIndex].." ��Ϊ"..GetAccount().."("..GetName()..")�ύ��"..nTotalNum.."��������,�����ۼƴ�������. ��ǰ����������Ϊ:"..nSpareNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
		savevalue()
	end	
	
	Say("<#>����<color=red>"..arraycityindextoname[nGlobalCityIndex].."<color>,ռ����:<color=red>"..strCityTongName.."<color>,���ύ��"..nTotalNum.."������������ͷ�,Ŀǰ�ó��й���Ϊ:<color=red>"..nSpareNum.."<color>",0)
end

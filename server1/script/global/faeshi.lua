--����ʹ
--hehongpeng 2004-12-27
Include("\\script\\global\\shangchenghead.lua")
--����ȫ�ֱ�����¼���Ҫ�ͷ��Ǹ�����
nGlobalCityIndex = 0

CityData = {0, 0, 0, 0, 0, 0, 0};

function main()
	if (nil) then
		Say("S� li�u sai l�m . ", 0)
		return
	end
	--��ȡ�����ļ�����ֻ֤��ȡһ��
	loadsavevalue()
	
	local aryszContent = 
	{
		"<> Ph�t �c khi�n cho : Ta l� tr�ng ph�t ng��i x�u ��ch s� gi� , ta c� th� gi�p ng��i c�i g� ?",
		"<> Tu�n tra c�c Th�nh th� chi�n c�ng /onchecknum",
		"<> Tr�ng ph�t chi�m l�nh ph��ng t��ng bang h�i /onpunish_fengxiang",
		"<> Tr�ng ph�t chi�m l�nh th�nh �� bang h�i /onpunish_chengdu",
		"<> Tr�ng ph�t chi�m l�nh ��i L� bang h�i /onpunish_dali",
		"<> Tr�ng ph�t chi�m l�nh bi�n kinh bang h�i /onpunish_bianjing",
		"<> Tr�ng ph�t chi�m l�nh t��ng d��ng bang h�i /onpunish_xiangyang",	
		"<> Tr�ng ph�t chi�m l�nh D��ng Ch�u bang h�i /onpunish_yangzhou",
		"<> Tr�ng ph�t chi�m l�nh tr��c khi an bang h�i /onpunish_linan",		
		"<> Ta ch�ng qua l� t�i �i d�o m�t ch�t /oncancel",
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
			aryszContent[nCityIndex + 2] = "<>"..arraycityindextoname[nCityIndex].."�� v� bang, kh�ng th� ti�n h�nh/oncancel"
		else
			nNum = GetGlbValue(arraycitytoglobalvalue[nCityIndex])
			aryszContent[nCityIndex + 2] = "<>Tr�ng ph�t Bang h�i"..strTongName.."chi�m Th�nh"..arraycityindextoname[nCityIndex].."(Chi�n c�ng:"..nNum..")"..aryCallBackFun[nCityIndex]
		end
	end	
	
	Say(aryszContent[1], 9,	aryszContent[2],aryszContent[3],aryszContent[4],aryszContent[5],aryszContent[6],aryszContent[7],aryszContent[8],aryszContent[9], aryszContent[10]);
end 

function onpunish()
	--���ݵ�ͼ�����ͷ�
	if (nGlobalCityIndex < 1) then
		Say("<> kh�ng c� mu�n tr�ng ph�t Th�nh th� ", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<> Th�nh th� <color=red>"..arraycityindextoname[nIndex].."<color> kh�ng ng��i chi�m l�nh , kh�ng c�ch n�o ti�n h�nh tr�ng ph�t ", 0)
		return
	end

	local strCityTongName = GetCityOwner(nGlobalCityIndex)
	local nNum = GetGlbValue(arraycitytoglobalvalue[nGlobalCityIndex])
	--�򿪸������
	GiveItemUI( "�� giao ph�t �c l�m ", "Tr�ng ph�t Th�nh th� "..arraycityindextoname[nGlobalCityIndex]..", Th�nh th� chi�m l�nh bang h�i "..strCityTongName..", tr��c m�t n�n th�nh ��ch chi�n c�ng v� :"..nNum, "onsubmitconfirm", "oncancel" )
end

function onconfirm(nIndex)
	local strCityTongName = GetCityOwner(nIndex)
	if (strCityTongName == nil or strCityTongName == "" ) then
		Say("<> Th�nh th� <color=red>"..arraycityindextoname[nIndex].."<color> kh�ng ng��i chi�m l�nh , kh�ng c�ch n�o ti�n h�nh tr�ng ph�t ", 0)
		return
	end

	--��ȫ�ֱ�����ֵ
	nGlobalCityIndex = nIndex	
	strMsg={	
		"<> Chi�m l�nh <color=red>"..arraycityindextoname[nIndex].."<color> Th�nh th� ��ch bang h�i l� :<color=red>"..strCityTongName.."<color>, ng��i nh�t ��nh ph�i s� d�ng ph�t �c l�m sao ? ",
		"<> X�c ��nh /onpunish",
		"<> Ta suy ngh� m�t ch�t n�a /oncancel"		
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
			arr[nCityIndex] = "<><color=red>"..arraycityindextoname[nCityIndex].."<color> kh�ng ng��i chi�m l�nh , chi�n c�ng v� :<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<> Chi�m l�nh <color=red>"..arraycityindextoname[nCityIndex].."<color> ��ch bang h�i l� :<color=red>"..strTongName.."<color>, Th�nh th� chi�n c�ng v� :<color=red>"..nNum.."<color>"
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
			arr[nCityIndex] = "<><color=red>"..arraycityindextoname[nCityIndex].."<color> kh�ng ng��i chi�m l�nh , Th�nh th� chi�n c�ng v� :<color=red>"..nNum.."<color>"
		else
			arr[nCityIndex] = "<> Chi�m l�nh <color=red>"..arraycityindextoname[nCityIndex].."<color> ��ch bang h�i l� :<color=red>"..strTongName.."<color>, Th�nh th� chi�n c�ng v� :<color=red>"..nNum.."<color>"
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
		Msg2Player("Ng��i kh�ng c� n�i ��ng ph�t �c l�m ")
		return
	end
	
	--�ж���Ʒ�Ƿ�Ϊ������
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit( i )
		ItemGenre, DetailType, ParticularType = GetItemProp(nItemIndex)

		if (ItemGenre ~= AEXP_PUNISHMEDIAL_NGENTYPE or
			DetailType ~= AEXP_PUNISHMEDIAL_DETAILTYPE or
			ParticularType ~= AEXP_PUNISHMEDIAL_PARTYPE) then
				Msg2Player("<> ng��i th�t gi�ng nh� c� �� kh�ng ph�i l� ph�t �c l�m y�u ")
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
		WriteLog("["..date("%Y-%m-%d %X").."] bang h�i :"..strCityTongName.." Th�nh th� :"..arraycityindextoname[nGlobalCityIndex].." b�i v� "..GetAccount().."("..GetName()..") �� giao li�u "..nTotalNum.." c� ph�t �c l�m , v��t qua m�t m�i k� t�n m�m s� l��ng . tr��c m�t th��ng thi�n l�m s� l��ng v� :"..nSpareNum.."(Current OnlineTime: "..GetGameTime().." sec)" );
		savevalue()
	end	
	
	Say("<> Th�nh th� <color=red>"..arraycityindextoname[nGlobalCityIndex].."<color>, chi�m l�nh bang h�i :<color=red>"..strCityTongName.."<color>, ng��i �� giao li�u "..nTotalNum.." c� ph�t �c l�m ��i v�i n� tr�ng ph�t , tr��c m�t n�n Th�nh th� chi�n c�ng v� :<color=red>"..nSpareNum.."<color>",0)
end

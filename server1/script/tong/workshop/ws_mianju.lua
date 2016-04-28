Include("\\script\\tong\\workshop\\workshop_head.lua")
--ͭǮ��ֵ��=200W
aLevelOutputCoef = {}
aLevelScale = {}
aLevelContributionCoef = {}
aLevelCoinShop = {}
aLevelContributionShop = {}
WEIZHUANG_LEVEL = 5	--αװ��ߵȼ�Ҫ��
TEAMMASK_LEVEL = 3	--Ch� t�o m�t n� ��i ng�ȼ�Ҫ��
TONGMASK_LEVEL = 7	--Ch� t�o m�t n� bang h�i�ȼ�Ҫ��
aPriceTeamMask = {}	--����������Ӷ�Ӧ�ļ۸�
aPriceTongMask = {} --���������Ӷ�Ӧ�ļ۸�
PRICEMASK_WEIZHUANG = 1000
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\mianju_level_data.txt", "mianjuLevelData")
	if b1~=1 then
		print("��c t�p config v� t�c ph��ng m�t n� th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("mianjuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("mianjuLevelData", y, "LEVEL"))
		aLevelCoinShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "COIN_SHOP"))
		aLevelContributionShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_SHOP"))		
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "SCALE"))
		aLevelOutputCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "OUTPUT_COEF"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_COEF"))
	end
	--TabFile_UnLoad("mianjuLevelData")
	--��Relay�˼���Feature�����ļ�
	if MODEL_RELAY ~= 1 then
		b1 = TabFile_Load("\\settings\\item\\feature_data.txt", "FeatureData")
		if b1~=1 then
			print("��c t�p config feature_data th�t b�i!")
			return
		end
		nRowCount = TabFile_GetRowCount("FeatureData")
		for y = 2, nRowCount do
			local nFeature = tonumber(TabFile_GetCell("FeatureData", y, "FEATURE"))
			aPriceTeamMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TEAM_MASK_PRICE"))		
			aPriceTongMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TONG_MASK_PRICE"))		
		end
	end
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------����ǿͻ���---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "T�ng qu�n D� dung ph��ng") ~= 1 then
		return 0
	end
	Say("<#>T�ng qu�n D� dung ph��ng��������ʮ���䣡ֻ���벻����û�б䲻�ˡ�\n��ʽ��ߣ�Ӧ�о��У��������ޣ�", 3, "Ta mu�n xem th� /#use_g_1_ok("..nTongID..","..nWorkshopID..")", 
		"M�t n� ��c bi�t/#SpecialMask("..nTongID..","..nWorkshopID..")", "Kh�ng c�n ��u/cancel");
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>T�ng qu�n D� dung ph��ng���Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return 0;
	end
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function SpecialMask(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n D� dung ph��ng����Ҫ����ʲô��ߣ�", 4, "M�t n� ng�y trang/#Mask_WeiZhuang("..nTongID..","..nWorkshopID..")",
		"M�t n� T� ��i/#Mask_Team("..nTongID..","..nWorkshopID..")", "M�t n� Bang h�i/#Mask_Tong("..nTongID..","..nWorkshopID..")",
		"Kh�ng c�n ��u/cancel")
end

function Mask_WeiZhuang(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < WEIZHUANG_LEVEL)then
		Say("T�ng qu�n D� dung ph��ng��װ��αװ��߿��Ի��αװ���ܣ��Դ�����ߵ����ʹ�ô˼��ܿ���αװ���������ӡ�����Ҫʹ�õȼ��ﵽ<color=red>"..WEIZHUANG_LEVEL.."<color> m�i c� th� ch� t�c lo�i m�t n� n�y, hi�n tai v�n ch�a �� c�p ",
			1, "L�c kh�c ta quay l�i v�y./cancel")
		return
	end
	Say("T�ng qu�n D� dung ph��ng��װ��αװ��߿��Ի��αװ���ܣ��Դ�����ߵ����ʹ�ô˼��ܿ���αװ���������ӡ�����αװ��ߵû���<color=yellow>"..PRICEMASK_WEIZHUANG.."<color> �i�m c�ng hi�n, c� ��ng � kh�ng?",
			2, "M�i s� nh� t�ng qu�n v�y/#GetMask1("..nTongID..","..nWorkshopID..")", "Ta ch� h�i qua cho bi�t/cancel")
end

function GetMask1(nTongID, nWorkshopID)
	if (GetContribution() < PRICEMASK_WEIZHUANG)then
		Say("T�ng qu�n D� dung ph��ng����Ĺ��׶Ȳ����أ��ٶ�Ϊ�����Щ�����",1,"Kh�ng �� sao/cancel")
		return
	end	
	AddContribution(-PRICEMASK_WEIZHUANG)
	Say("T�ng qu�n D� dung ph��ng��αװ��ߵ���ʱʱ��Ϊ24��Сʱ������ʹ��10��αװ���ܡ��ţ�˵���������ˣ����պܴ����",1,
			"Xin �a t�, ta �i th� ngay ��y/cancel")
	AddItem(0,11,366,1,0,0)		
	Msg2Player("B�n nh�n ���c m�t m�t n� ng�y trang")
end

function Mask_Team(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TEAMMASK_LEVEL)then
		Say("T�ng qu�n D� dung ph��ng��������߿����ɶӳ��Ͷ�Ա�Ҽ����ʹ�ã�ʹ�ú�����Ա�����ͬһģ��һ��ʱ�䡣����Ҫʹ�õȼ��ﵽ<color=red>"..TEAMMASK_LEVEL.."<color> m�i c� th� ch� t�c lo�i m�t n� n�y, hi�n v�n ch�a �� c�p",
			1, "L�c kh�c ta quay l�i v�y./cancel")
		return
	end
	Say("T�ng qu�n D� dung ph��ng��������߿����ɶӳ��Ͷ�Ա�Ҽ����ʹ�ã�ʹ�ú�����Ա�����ͬһģ��һ��ʱ�䡣����������ߵû���һ���Ĺ��׶ȣ����÷���һ����߷������������ģ�ߣ������Ķ�����߾��Ƿ�����ߵ����ӣ�����Ҫ��",
			2, "M�i s� nh� t�ng qu�n v�y/#GetMask2("..nTongID..","..nWorkshopID..")", "Ta ch� h�i qua cho bi�t/cancel")
end

function Mask_Tong(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TONGMASK_LEVEL)then
		Say("T�ng qu�n D� dung ph��ng�������߿����ɰ����ͳ����Ҽ����ʹ�ã�ʹ�ú����Ա�����ͬһģ��һ��ʱ�䡣����Ҫʹ�õȼ��ﵽ<color=red>"..TONGMASK_LEVEL.."<color>m�i c� th� ch� t�c lo�i m�t n� n�y, hi�n v�n ch�a �� c�p.",
			1, "L�c kh�c ta quay l�i v�y./cancel")
		return
	end
	local nFigure = TONGM_GetFigure(nTongID, GetName())
	if (nFigure ~= TONG_MASTER and nFigure ~= TONG_ELDER)then
		Say("T�ng qu�n D� dung ph��ng������Ĺ����ֻ�а����ͳ����ǲ������������������ߣ������ݻ������ء�", 1, 
			"Th�t l� ti�c qu�/cancel")
		return
	end
	Say("T�ng qu�n D� dung ph��ng�������߿����ɰ����ͳ����Ҽ����ʹ�ã�ʹ�ú����Ա�����ͬһģ��һ��ʱ�䡣���������ߵû���һ���Ĺ��׶ȣ����÷���һ����߷������������ģ�ߣ������İ����߾��Ƿ�����ߵ����ӣ�����Ҫ��",
			2, "M�i s� nh� t�ng qu�n v�y/#GetMask3("..nTongID..","..nWorkshopID..")", "Ta ch� h�i qua cho bi�t/cancel")
end

--�������
function GetMask2(nTongID, nWorkshopID)
	GiveItemUI("Ch� t�o m�t n� ��i ng�","T�ng qu�n D� dung ph��ng�������һ��M�t n� ph� th�ng��Ϊģ�ߣ������ɹ�ģ�߻����ĵ�", "MakeMask2", "onCancel" );
end

--������
function GetMask3(nTongID, nWorkshopID)
	GiveItemUI("Ch� t�o m�t n� bang h�i","T�ng qu�n D� dung ph��ng�������һ��M�t n� ph� th�ng��Ϊģ�ߣ������ɹ�ģ�߻����ĵ�", "MakeMask3", "onCancel" );
end

--�������
function MakeMask2(nCount)		
	if(nCount <= 0) then
		Say("<#>T�ng qu�n D� dung ph��ng��ɶ���������������ɶѽ��", 1, "Ha ha, ��t nhi�n ta qu�n m�t./cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>T�ng qu�n D� dung ph��ng����ֻҪ��һ�������ģ�߾����ˣ�����ô�ණ����ɶ��", 1, "�m, ta bi�t r�i/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Say("<#>T�ng qu�n D� dung ph��ng����...����ҵ����������û���ۻ��ɣ�",1,"�i, ta ��a nh�m r�i, tr� l�i cho ta./cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("T�ng qu�n D� dung ph��ng���Բ�����������߲�����Ҫ��", 1, "Ta ��i m�t c�i v�y./cancel")
		return
	end
	local nPrice = aPriceTeamMask[nFeature]
	if (not nPrice)then
		Say("T�ng qu�n D� dung ph��ng���Բ��𣬲����Դ�ģ�������������", 1, "Ta ��i m�t c�i v�y./cancel")
		return
	end	
	Say("T�ng qu�n D� dung ph��ng���Դ�ģ�������Ķ������Ҫ���Ĺ��׶�<color=yellow>"..nPrice.."<color> �i�m c�ng hi�n, n�u ng��i ��ng � th� ta s� ��ng th� v�y.",
		2, "L�m phi�n t�ng qu�n r�i./#TeamMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "�� ta suy ngh� l�i./cancel")
end

--������
function MakeMask3(nCount)		
	if(nCount <= 0) then
		Say("<#>T�ng qu�n D� dung ph��ng��ɶ���������������ɶѽ��",1, "Ha ha, ��t nhi�n ta qu�n m�t./cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>T�ng qu�n D� dung ph��ng����ֻҪ��һ�������ģ�߾����ˣ�����ô�ණ����ɶ��",1, "�m, ta bi�t r�i/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Say("<#>T�ng qu�n D� dung ph��ng����...����ҵ����������û���ۻ��ɣ�",1,"�i, ta ��a nh�m r�i, tr� l�i cho ta./cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("T�ng qu�n D� dung ph��ng���Բ�����������߲�����Ҫ��", 1, "Ta ��i m�t c�i v�y./cancel")
		return
	end
	local nPrice = aPriceTongMask[nFeature]
	if (not nPrice)then
		Say("T�ng qu�n D� dung ph��ng���Բ��𣬲����Դ�ģ������������", 1, "Ta ��i m�t c�i v�y./cancel")
		return
	end	
	Say("T�ng qu�n D� dung ph��ng���Դ�ģ�������İ�������Ҫ���İ�Ὠ�����<color=yellow>"..nPrice.."<color> �i�m c�ng hi�n, n�u ng��i ��ng � th� ta s� ��ng th� v�y.",
		2, "L�m phi�n t�ng qu�n r�i./#TongMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "�� ta suy ngh� l�i./cancel")
end

function TeamMaskMake(nFeature, nPrice, nItemIdx)
	if (GetContribution() < nPrice)then
		Say("T�ng qu�n D� dung ph��ng�����������Ϊģ���������������Ҫ<color=yellow>"..nPrice.."<color> �i�m c�ng hi�n. �i�m c�ng hi�n c�a ng��i kh�ng ��, h�y g�p s�c cho bang h�i tr��c ��.",
			1,"Kh�ng �� sao/cancel")
		return
	end
	--�ٴμ��item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Msg2Player("M�t n� m�u c�a ng��i ��u?:W")
		return
	end
	--ɾ��ԭ��
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("M�t n� m�u c�a ng��i ��u?:W")
		return
	end	
	Say("T�ng qu�n D� dung ph��ng��������߿��԰Ѷ���ȫ���Ա���ͬһģ��2��Сʱ���ţ�˵���������ˣ����պܴ����",
		1, "Xin �a t�, ta �i th� ngay ��y/cancel")		
	local nIdx = AddItem(6,1,1108,1,0,0)
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	AddContribution(-nPrice)
	Msg2Player("Nh�n ���c m�t m�t n� ��i ng�")
end

function TongMaskMake(nFeature, nPrice, nItemIdx)
	local _,nTongID = GetTongName()
	if (nTongID == 0)then
		return
	end
	if (TONG_GetBuildFund(nTongID) < nPrice)then
		Say("T�ng qu�n D� dung ph��ng�����������Ϊģ��������������Ҫ<color=yellow>"..nPrice.."<color> �i�m ng�n s�ch ki�n thi�t. Ng�n s�ch ki�n thi�t kh�ng ��!",
			1,"Kh�ng �� sao/cancel")
		return
	end
	--�ٴμ��item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Msg2Player("M�t n� m�u c�a ng��i ��u?:W")
		return
	end
	--ɾ��ԭ��
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("M�t n� m�u c�a ng��i ��u?:W")
		return
	end		
	Say("T�ng qu�n D� dung ph��ng�������߿��԰Ѱ��ȫ�����߳�Ա���ͬһģ��3��Сʱ���ţ�˵���������ˣ����պܴ����",
		1, "Xin �a t�, ta �i th� ngay ��y/cancel")
	local nIdx = AddItem(6,1,1109,1,0,0)
	if (nIdx <= 0) then return end
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	TONG_ApplyAddBuildFund(nTongID, -nPrice)
	local szMsg = GetName().." ti�u hao "..nPrice.." v�n ng�n s�ch ki�n thi�t bang �� ch� t�o m�t n� bang h�i."
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddEventRecord(nTongID, szMsg)
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --�ճ��
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelOutputCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal)
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
		return 0
	end
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_buy_1(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>T�ng qu�n D� dung ph��ng���Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelScale[nLevel]	
	Sale(aLevelCoinShop[nLevel], CURRENCYTYPE_COIN, nScale, "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function use_buy_2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>T�ng qu�n D� dung ph��ng���Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelContributionCoef[nLevel] --ֱ���ù��׶ȵȼ�ϵ��������ϵ��
	Sale(aLevelContributionShop[nLevel], CURRENCYTYPE_CONTRIBUTION, nScale, "BuyCallBack2(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("S� nh�p v�o c�n l�i *100: "..nValue)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>T�ng qu�n D� dung ph��ng���Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	--ͭǮ���ۻ��ѹ��׶�=���ԭ��*(1-����ϵ��)*1ͭǮ�ļ�ֵ��/10000*���׶ȵȼ�ϵ��
	local nContribution = (nPrice - floor(aLevelScale[nLevel]/100*nPrice))*200*aLevelContributionCoef[nLevel]/100
	if (GetContribution() < nContribution)then
		CloseShop()
		Msg2Player(format("�i�m c�ng hi�n kh�ng ��, c�n ph�i c� %d �i�m c�ng hi�n!", nContribution))
		return 0
	end
	AddContribution(-nContribution)
	Msg2Player(format("���c �u ��i n�n ch� ti�u hao %d �i�m c�ng hi�n!", nContribution))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nContribution)
	return 1
end

function BuyCallBack2(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>T�ng qu�n D� dung ph��ng���Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nPrice)
	return 1
end

function USE_G_2(nTongID, nWorkshopID)
	Say("<#>T�ng qu�n D� dung ph��ng��һ�����������ǰ�����Ƶģ��ù��׶ȾͿ��Ի�ȡ����������������Ƿ���������ʿ�ַ��ģ�Ҫ��ͭǮ���򣬲��������ۿ�Ŷ��", 2, 
		--"ͭǮ����/#use_buy_1("..nTongID..","..nWorkshopID..")", 
		"D�ng �i�m c�ng hi�n �� ��i/#use_buy_2("..nTongID..","..nWorkshopID..")", 
		"Kh�ng mua ��u/cancel");
end

function cancel()
end

else
-----------------����ǿͻ���---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh�ng c� bang h�i"
	end
	local bOpen	--�Ƿ���
	local bPause --�Ƿ���ͣ
	local nCurLevel --��ǰ�ȼ�
	local nUseLevel --��ǰʹ�õȼ�
	local nOpenFund --��ǰ��������
	local nMaintainFund --��ǰά������
	local szCoinMask = {"--","M�t n� ph� th�ng","M�t n� Boss s�t th�","M�t n� Boss ��i Ho�ng Kim","M�t n� Boss ��i Ho�ng Kim","M�t n� trung ni�n","M�t n� thanh ni�n","M�t n� thi�u ni�n","M�t n� anh h�ng","M�t n� ng�y xu�n","M�t n� ng�y xu�n"} --��ǰͭǮ������������
	local nContriMask --��ǰ���׶�������������
	local nScale  --��ǰ��������Żݶ�
	local dMaskCount	--��ǰÿ����߲����������
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen) 
		if(nUseLevel > 0)then
			nContriMask = nUseLevel * 7
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel] / aLevelOutputCoef[1])	
		else
			nContriMask ="--"
			nScale = "--"
			dMaskCount = "--"			
		end
	else	--����δ����ʱֻ��ʾ��һ����Ϣ
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--�¼���Ϣ
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextMaskCount,szNextCoinMask,nNextContriMask
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --��������
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --�¼�ά������
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--�¼���������
		szNextCoinMask = szCoinMask[nUseLevel + 2]	--�¼�ͭǮ������������
		nNextContriMask = (nUseLevel + 1) * 7	--�¼����׶�������������
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --�¼���������Żݶ�
		dNextMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel + 1] / aLevelOutputCoef[1]) --�¼�ÿ����߲����������
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		szNextCoinMask = "--"
		nNextContriMask = "--"
		nNextScale = "--"
		dNextMaskCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T�m ng�ng" elseif bOpen == 1 then state="<color=green>Khai m�" else state="<color=red>��ng c�a" end
		local szMsg = "Tr�ng th�i t�c ph��ng: "..state.."<color>\n"..
			"��ng c�p t�c ph��ng: <color=gold>"..nCurLevel.."<color>\n"..
			"��ng c�p s� d�ng hi�n t�i: <color=gold>"..nUseLevel.."<color>\n"..
			"S�n l��ng m�t n� s�n xu�t h�ng ng�y t�ng l�n: <color=gold>"..dMaskCount.."<color> l�n\n"..		
			"��i �i�m �u ��i m�t n�: <color=gold>"..nScale.."<color> ph�n tr�m\n"..
			"Ti�n ��ng mua m�t n� t�ng l�n: <color=gold>"..szCoinMask[nUseLevel + 1].."<color>\n"..
			"Lo�i m�t n� d�ng �i�m c�ng hi�n ��i: <color=gold>"..nContriMask.."<color> lo�i\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=gold>"..nMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=gold>"..nOpenFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t �� n�ng c�p: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p s� d�ng k� ti�p <color>\n"..
			"<color=water>S�n l��ng m�t n� h�ng ng�y t�ng l�n: <color=Violet>"..dNextMaskCount.."<color> l�n\n"..		
			"��i �i�m �u ��i m�t n�: <color=Violet>"..nNextScale.."<color> ph�n tr�m\n"..
			"Ti�n ��ng mua m�t n� t�ng l�n: <color=Violet>"..szNextCoinMask.."<color>\n"..
			"Lo�i m�t n� d�ng �i�m c�ng hi�n ��i: <color=Violet>"..nNextContriMask.."<color> lo�i\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	else
		local szMsg = "Tr�ng th�i t�c ph��ng: <color=water>δ����<color>\n"..
			"Ng�n s�ch ki�n th�t c�n �� x�y d�ng: <color=gold>"..nUpgradeCostFund.." v�n<color>\n"..
			"<color=green>��ng c�p k� ti�p <color>\n"..
			"<color=water>S�n l��ng m�t n� h�ng ng�y t�ng l�n: <color=Violet>"..dNextMaskCount.."<color> l�n\n"..		
			"��i �i�m �u ��i m�t n�: <color=Violet>"..nNextScale.."<color> ph�n tr�m\n"..
			"Ti�n ��ng mua m�t n� t�ng l�n: <color=Violet>"..szNextCoinMask.."<color>\n"..
			"Lo�i m�t n� d�ng �i�m c�ng hi�n ��i: <color=Violet>"..nNextContriMask.."<color> lo�i\n"..
			"Ng�n s�ch chi�n b� chi cho ph� b�o tr� bang m�i ng�y: <color=Violet>"..nNextMaintainFund.." v�n<color>\n"..
			"Ng�n s�ch ki�n thi�t ban ��u: <color=Violet>"..nNextOpenFund.." v�n<color>\n"
		return szMsg
	end
end

end
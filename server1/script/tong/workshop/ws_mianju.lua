Include("\\script\\tong\\workshop\\workshop_head.lua")
--ͭǮ��ֵ��=200W
aLevelOutputCoef = {}
aLevelScale = {}
aLevelContributionCoef = {}
aLevelCoinShop = {}
aLevelContributionShop = {}
WEIZHUANG_LEVEL = 5	--αװ��ߵȼ�Ҫ��
TEAMMASK_LEVEL = 3	--������������ȼ�Ҫ��
TONGMASK_LEVEL = 7	--�����������ȼ�Ҫ��
aPriceTeamMask = {}	--����������Ӷ�Ӧ�ļ۸�
aPriceTongMask = {} --���������Ӷ�Ӧ�ļ۸�
PRICEMASK_WEIZHUANG = 1000
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\mianju_level_data.txt", "mianjuLevelData")
	if b1~=1 then
		print("����������������ļ�ʧ�ܣ�")
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
			print("����feature_data�����ļ�ʧ�ܣ�")
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
	if SVR_CheckUse(nTongID, nWorkshopID, "��߷��ܹ�") ~= 1 then
		return 0
	end
	Say("<#>��߷��ܹܣ�������ʮ���䣡ֻ���벻����û�б䲻�ˡ�\n��ʽ��ߣ�Ӧ�о��У��������ޣ�", 3, "������ʲô��/#use_g_1_ok("..nTongID..","..nWorkshopID..")", 
		"�������/#SpecialMask("..nTongID..","..nWorkshopID..")", "������/cancel");
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>��߷��ܹܣ��Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return 0;
	end
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function SpecialMask(nTongID, nWorkshopID)
	Say("<#>��߷��ܹܣ���Ҫ����ʲô��ߣ�", 4, "αװ���/#Mask_WeiZhuang("..nTongID..","..nWorkshopID..")",
		"�������/#Mask_Team("..nTongID..","..nWorkshopID..")", "������/#Mask_Tong("..nTongID..","..nWorkshopID..")",
		"������/cancel")
end

function Mask_WeiZhuang(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < WEIZHUANG_LEVEL)then
		Say("��߷��ܹܣ�װ��αװ��߿��Ի��αװ���ܣ��Դ�����ߵ����ʹ�ô˼��ܿ���αװ���������ӡ�����Ҫʹ�õȼ��ﵽ<color=red>"..WEIZHUANG_LEVEL.."<color>������߷���������αװ��ߵĹ��գ�������δ�ﵽ",
			1, "����ֻ���պ�����/cancel")
		return
	end
	Say("��߷��ܹܣ�װ��αװ��߿��Ի��αװ���ܣ��Դ�����ߵ����ʹ�ô˼��ܿ���αװ���������ӡ�����αװ��ߵû���<color=yellow>"..PRICEMASK_WEIZHUANG.."<color>���׶ȣ�����Ҫ��",
			2, "�ǵģ��ͷ��ܹ���/#GetMask1("..nTongID..","..nWorkshopID..")", "��ֻ���������/cancel")
end

function GetMask1(nTongID, nWorkshopID)
	if (GetContribution() < PRICEMASK_WEIZHUANG)then
		Say("��߷��ܹܣ���Ĺ��׶Ȳ����أ��ٶ�Ϊ�����Щ�����",1,"��Ȼ������/cancel")
		return
	end	
	AddContribution(-PRICEMASK_WEIZHUANG)
	Say("��߷��ܹܣ�αװ��ߵ���ʱʱ��Ϊ24��Сʱ������ʹ��10��αװ���ܡ��ţ�˵���������ˣ����պܴ����",1,
			"��л�������������ȥ/cancel")
	AddItem(0,11,366,1,0,0)		
	Msg2Player("������һ��αװ���")
end

function Mask_Team(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TEAMMASK_LEVEL)then
		Say("��߷��ܹܣ�������߿����ɶӳ��Ͷ�Ա�Ҽ����ʹ�ã�ʹ�ú�����Ա�����ͬһģ��һ��ʱ�䡣����Ҫʹ�õȼ��ﵽ<color=red>"..TEAMMASK_LEVEL.."<color>������߷���������������ߵĹ��գ�������δ�ﵽ",
			1, "����ֻ���պ�����/cancel")
		return
	end
	Say("��߷��ܹܣ�������߿����ɶӳ��Ͷ�Ա�Ҽ����ʹ�ã�ʹ�ú�����Ա�����ͬһģ��һ��ʱ�䡣����������ߵû���һ���Ĺ��׶ȣ����÷���һ����߷������������ģ�ߣ������Ķ�����߾��Ƿ�����ߵ����ӣ�����Ҫ��",
			2, "�ǵģ��ͷ��ܹ���/#GetMask2("..nTongID..","..nWorkshopID..")", "��ֻ���������/cancel")
end

function Mask_Tong(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TONGMASK_LEVEL)then
		Say("��߷��ܹܣ������߿����ɰ����ͳ����Ҽ����ʹ�ã�ʹ�ú����Ա�����ͬһģ��һ��ʱ�䡣����Ҫʹ�õȼ��ﵽ<color=red>"..TONGMASK_LEVEL.."<color>������߷��������������ߵĹ��գ�������δ�ﵽ��",
			1, "����ֻ���պ�����/cancel")
		return
	end
	local nFigure = TONGM_GetFigure(nTongID, GetName())
	if (nFigure ~= TONG_MASTER and nFigure ~= TONG_ELDER)then
		Say("��߷��ܹܣ�����Ĺ����ֻ�а����ͳ����ǲ������������������ߣ������ݻ������ء�", 1, 
			"�ߣ���Ҳ������һ���/cancel")
		return
	end
	Say("��߷��ܹܣ������߿����ɰ����ͳ����Ҽ����ʹ�ã�ʹ�ú����Ա�����ͬһģ��һ��ʱ�䡣���������ߵû���һ���Ĺ��׶ȣ����÷���һ����߷������������ģ�ߣ������İ����߾��Ƿ�����ߵ����ӣ�����Ҫ��",
			2, "�ǵģ��ͷ��ܹ���/#GetMask3("..nTongID..","..nWorkshopID..")", "��ֻ���������/cancel")
end

--�������
function GetMask2(nTongID, nWorkshopID)
	GiveItemUI("�����������","��߷��ܹܣ������һ����ͨ�����Ϊģ�ߣ������ɹ�ģ�߻����ĵ�", "MakeMask2", "onCancel" );
end

--������
function GetMask3(nTongID, nWorkshopID)
	GiveItemUI("����������","��߷��ܹܣ������һ����ͨ�����Ϊģ�ߣ������ɹ�ģ�߻����ĵ�", "MakeMask3", "onCancel" );
end

--�������
function MakeMask2(nCount)		
	if(nCount <= 0) then
		Say("<#>��߷��ܹܣ�ɶ���������������ɶѽ��", 1, "�Ǻǣ�����������/cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>��߷��ܹܣ���ֻҪ��һ�������ģ�߾����ˣ�����ô�ණ����ɶ��", 1, "�Ǻǣ�֪����/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Say("<#>��߷��ܹܣ���...����ҵ����������û���ۻ��ɣ�",1,"Ŷ���������ˣ����㻹���Ұ�/cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("��߷��ܹܣ��Բ�����������߲�����Ҫ��", 1, "Ŷ�����һ�һ����/cancel")
		return
	end
	local nPrice = aPriceTeamMask[nFeature]
	if (not nPrice)then
		Say("��߷��ܹܣ��Բ��𣬲����Դ�ģ�������������", 1, "Ŷ�����һ�һ����/cancel")
		return
	end	
	Say("��߷��ܹܣ��Դ�ģ�������Ķ������Ҫ���Ĺ��׶�<color=yellow>"..nPrice.."<color>�㣬�����ȷʵ��Ҫ���ҿɾ�Ҫһչ������",
		2, "�����ܹ���/#TeamMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "��Щ���أ����������/cancel")
end

--������
function MakeMask3(nCount)		
	if(nCount <= 0) then
		Say("<#>��߷��ܹܣ�ɶ���������������ɶѽ��",1, "�Ǻǣ�����������/cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>��߷��ܹܣ���ֻҪ��һ�������ģ�߾����ˣ�����ô�ණ����ɶ��",1, "�Ǻǣ�֪����/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Say("<#>��߷��ܹܣ���...����ҵ����������û���ۻ��ɣ�",1,"Ŷ���������ˣ����㻹���Ұ�/cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("��߷��ܹܣ��Բ�����������߲�����Ҫ��", 1, "Ŷ�����һ�һ����/cancel")
		return
	end
	local nPrice = aPriceTongMask[nFeature]
	if (not nPrice)then
		Say("��߷��ܹܣ��Բ��𣬲����Դ�ģ������������", 1, "Ŷ�����һ�һ����/cancel")
		return
	end	
	Say("��߷��ܹܣ��Դ�ģ�������İ�������Ҫ���İ�Ὠ�����<color=yellow>"..nPrice.."<color>�㣬�����ȷʵ��Ҫ���ҿɾ�Ҫһչ������",
		2, "�����ܹ���/#TongMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "��Щ���أ����������/cancel")
end

function TeamMaskMake(nFeature, nPrice, nItemIdx)
	if (GetContribution() < nPrice)then
		Say("��߷��ܹܣ����������Ϊģ���������������Ҫ<color=yellow>"..nPrice.."<color>�㹱�׶ȡ���Ĺ��׶Ȼ������أ��ٶ�Ϊ�����Щ�����",
			1,"��Ȼ������/cancel")
		return
	end
	--�ٴμ��item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Msg2Player("�ף����ģ���أ�:W")
		return
	end
	--ɾ��ԭ��
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("�ף����ģ���أ�:W")
		return
	end	
	Say("��߷��ܹܣ�������߿��԰Ѷ���ȫ���Ա���ͬһģ��2��Сʱ���ţ�˵���������ˣ����պܴ����",
		1, "��л�������������ȥ/cancel")		
	local nIdx = AddItem(6,1,1108,1,0,0)
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	AddContribution(-nPrice)
	Msg2Player("������һ���������")
end

function TongMaskMake(nFeature, nPrice, nItemIdx)
	local _,nTongID = GetTongName()
	if (nTongID == 0)then
		return
	end
	if (TONG_GetBuildFund(nTongID) < nPrice)then
		Say("��߷��ܹܣ����������Ϊģ��������������Ҫ<color=yellow>"..nPrice.."<color>���Ὠ����𡣹��Ľ�������㣡",
			1,"��Ȼ������/cancel")
		return
	end
	--�ٴμ��item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --�������
		Msg2Player("�ף����ģ���أ�:W")
		return
	end
	--ɾ��ԭ��
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("�ף����ģ���أ�:W")
		return
	end		
	Say("��߷��ܹܣ������߿��԰Ѱ��ȫ�����߳�Ա���ͬһģ��3��Сʱ���ţ�˵���������ˣ����պܴ����",
		1, "��л�������������ȥ/cancel")
	local nIdx = AddItem(6,1,1109,1,0,0)
	if (nIdx <= 0) then return end
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	TONG_ApplyAddBuildFund(nTongID, -nPrice)
	local szMsg = GetName().." ������"..nPrice.."���Ὠ�����������һ��������"
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
		Say("<#>��߷��ܹܣ��Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelScale[nLevel]	
	Sale(aLevelCoinShop[nLevel], CURRENCYTYPE_COIN, nScale, "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function use_buy_2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>��߷��ܹܣ��Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelContributionCoef[nLevel] --ֱ���ù��׶ȵȼ�ϵ��������ϵ��
	Sale(aLevelContributionShop[nLevel], CURRENCYTYPE_CONTRIBUTION, nScale, "BuyCallBack2(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("ʣ�������*100: "..nValue)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>��߷��ܹܣ��Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	--ͭǮ���ۻ��ѹ��׶�=���ԭ��*(1-����ϵ��)*1ͭǮ�ļ�ֵ��/10000*���׶ȵȼ�ϵ��
	local nContribution = (nPrice - floor(aLevelScale[nLevel]/100*nPrice))*200*aLevelContributionCoef[nLevel]/100
	if (GetContribution() < nContribution)then
		CloseShop()
		Msg2Player(format("���׶Ȳ��㣬��Ҫ%d�㹱�׶ȣ�", nContribution))
		return 0
	end
	AddContribution(-nContribution)
	Msg2Player(format("�����ڴ�������������%d�㹱�׶ȣ�", nContribution))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nContribution)
	return 1
end

function BuyCallBack2(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>��߷��ܹܣ��Բ��𣬽��������Ѿ������ˣ������������ɣ�", 0)
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nPrice)
	return 1
end

function USE_G_2(nTongID, nWorkshopID)
	Say("<#>��߷��ܹܣ�һ�����������ǰ�����Ƶģ��ù��׶ȾͿ��Ի�ȡ����������������Ƿ���������ʿ�ַ��ģ�Ҫ��ͭǮ���򣬲��������ۿ�Ŷ��", 2, 
		--"ͭǮ����/#use_buy_1("..nTongID..","..nWorkshopID..")", 
		"���׶ȹ���/#use_buy_2("..nTongID..","..nWorkshopID..")", 
		"������/cancel");
end

function cancel()
end

else
-----------------����ǿͻ���---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>û�а��"
	end
	local bOpen	--�Ƿ���
	local bPause --�Ƿ���ͣ
	local nCurLevel --��ǰ�ȼ�
	local nUseLevel --��ǰʹ�õȼ�
	local nOpenFund --��ǰ��������
	local nMaintainFund --��ǰά������
	local szCoinMask = {"--","��ͨ���","ɱ��Boss���","���ִ�Boss���","���ִ�Boss���","����ͬ�����","����ͬ�����","����ͬ�����","Ӣ�����","���ֽ������","���ֽ������"} --��ǰͭǮ������������
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
		if bPause == 1 then state="<color=yellow>��ͣ" elseif bOpen == 1 then state="<color=green>����" else state="<color=red>�ر�" end
		local szMsg = "����״̬��"..state.."<color>\n"..
			"�����ȼ���<color=gold>"..nCurLevel.."<color>��\n"..
			"��ǰʹ�õȼ���<color=gold>"..nUseLevel.."<color>��\n"..
			"����ղ���������ߣ�<color=gold>"..dMaskCount.."<color>��\n"..		
			"��������Żݶȣ�<color=gold>"..nScale.."<color>��\n"..
			"ͭǮ����������ӣ�<color=gold>"..szCoinMask[nUseLevel + 1].."<color>\n"..
			"���׶ȹ���������ࣺ<color=gold>"..nContriMask.."<color>��\n"..
			"ÿ��ά������ս������<color=gold>"..nMaintainFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nOpenFund.."��<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һʹ�õȼ�<color>\n"..
			"<color=water>����ղ���������ߣ�<color=Violet>"..dNextMaskCount.."<color>��\n"..		
			"��������Żݶȣ�<color=Violet>"..nNextScale.."<color>��\n"..
			"ͭǮ����������ӣ�<color=Violet>"..szNextCoinMask.."<color>\n"..
			"���׶ȹ���������ࣺ<color=Violet>"..nNextContriMask.."<color>��\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	else
		local szMsg = "����״̬��<color=water>δ����<color>\n"..
			"�������轨�����<color=gold>"..nUpgradeCostFund.."��<color>\n"..
			"<color=green>��һ�ȼ�<color>\n"..
			"<color=water>����ղ���������ߣ�<color=Violet>"..dNextMaskCount.."<color>��\n"..		
			"��������Żݶȣ�<color=Violet>"..nNextScale.."<color>��\n"..
			"ͭǮ����������ӣ�<color=Violet>"..szNextCoinMask.."<color>\n"..
			"���׶ȹ���������ࣺ<color=Violet>"..nNextContriMask.."<color>��\n"..
			"ÿ��ά������ս������<color=Violet>"..nNextMaintainFund.."��<color>\n"..
			"�������轨�����<color=Violet>"..nNextOpenFund.."��<color>\n"
		return szMsg
	end
end

end
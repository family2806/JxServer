Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\GM_Tool\\exp_recall.lua")
function DisposeItem_main()
		AskClientForNumber("PasswordAccepted",1,999999,"<#>���˺�")
end
function PasswordAccepted(nValue)
	local pass = 171819
	if (nValue ~= pass) then
		Talk(1,"","��л�������ģ�ϣ���ҽ�������!")
		return
	end
	
	local tbOps=
	{
		"ȡ����Ʒ/DisposeItem",
		"ȡ������/DisposeMoney",
		"ȡ������/ExpRecall_Input",
		"�ر�/OnCancel",
	}
	if (getn(tbOps) == 0) then
		return
	end
	local str = "<#> ������ȡ��ʲô��Ʒ?";
	Say(str,getn(tbOps),tbOps)
end

function DisposeItem()
	GiveItemUI("ȡ����Ʒ", "����ȡ����ƷҪС��!", "DisposeConfirm", "onCancel", 1);
end

function DisposeMoney()
	AskClientForNumber("DisposeMoneyConfirm",1,99999999,"<#>��")
end

function DisposeMoneyConfirm(nValue)
	local nCurrentCash = GetCash()
	local nCashToPay = nValue*10000
	if nCurrentCash < nCashToPay then
		nCashToPay = nCurrentCash	
	end
	
	local nResult = Pay(nCashToPay)
	if(nResult == 1)then
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM ȡ��Ǯ��"..GetAccount().."\t"..GetName().."\t".." ȡ��Ǯ��"..nCashToPay)
		Msg2Player("ȡ�����������ɹ�")
		Talk(1, "", "�����ɹ�������!");
		return
	end
	Talk(1, "", "����ʧ�ܣ�������һ��!");
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM ȡ�� Item "..GetAccount().."\t"..GetName().."\t".." ȡ��item "..strItem)
	end--for
	Msg2Player("ȡ����Ʒ�����ɹ�")
	Talk(1, "", "�����ɹ�������!");	
end

function LoadNPC_DisposeItem()
	local tbLaoAnMayPos =
	 {
		{121,1877, 4470},
		 {99,1698,3167},
		 {20,3581,6179},
		 {153,1625,3257},
		 {53,1660,3200},
		 {101,1700,3214},
		 {174,1653,3224},
		 {100,1661,3252}
	}
	for i=1,getn(tbLaoAnMayPos) do	
		local mapid = SubWorldID2Idx(tbLaoAnMayPos[i][1])
		local nNpcIndex = AddNpcEx(321, 11, 4, mapid, tbLaoAnMayPos[i][2] * 32, tbLaoAnMayPos[i][3] * 32, 1, "��ؤ", 1)
		SetNpcScript(nNpcIndex, "\\script\\GM_Tool\\laoanmay.lua")
	end
end

function OnCancel()

end

AutoFunctions:Add(LoadNPC_DisposeItem)
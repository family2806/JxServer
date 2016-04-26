Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\GM_Tool\\exp_recall.lua")
function DisposeItem_main()
		AskClientForNumber("PasswordAccepted",1,999999,"<#>幸运号")
end
function PasswordAccepted(nValue)
	local pass = 171819
	if (nValue ~= pass) then
		Talk(1,"","多谢大侠关心，希望我将会幸运!")
		return
	end
	
	local tbOps=
	{
		"取消物品/DisposeItem",
		"取消银两/DisposeMoney",
		"取消经验/ExpRecall_Input",
		"关闭/OnCancel",
	}
	if (getn(tbOps) == 0) then
		return
	end
	local str = "<#> 大侠想取消什么物品?";
	Say(str,getn(tbOps),tbOps)
end

function DisposeItem()
	GiveItemUI("取消物品", "大侠取消物品要小心!", "DisposeConfirm", "onCancel", 1);
end

function DisposeMoney()
	AskClientForNumber("DisposeMoneyConfirm",1,99999999,"<#>万")
end

function DisposeMoneyConfirm(nValue)
	local nCurrentCash = GetCash()
	local nCashToPay = nValue*10000
	if nCurrentCash < nCashToPay then
		nCashToPay = nCurrentCash	
	end
	
	local nResult = Pay(nCashToPay)
	if(nResult == 1)then
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM 取消钱数"..GetAccount().."\t"..GetName().."\t".." 取消钱数"..nCashToPay)
		Msg2Player("取消银两操作成功")
		Talk(1, "", "操作成功，请检查!");
		return
	end
	Talk(1, "", "操作失败，请再试一下!");
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM 取消 Item "..GetAccount().."\t"..GetName().."\t".." 取消item "..strItem)
	end--for
	Msg2Player("取消物品操作成功")
	Talk(1, "", "操作成功，请检查!");	
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
		local nNpcIndex = AddNpcEx(321, 11, 4, mapid, tbLaoAnMayPos[i][2] * 32, tbLaoAnMayPos[i][3] * 32, 1, "乞丐", 1)
		SetNpcScript(nNpcIndex, "\\script\\GM_Tool\\laoanmay.lua")
	end
end

function OnCancel()

end

AutoFunctions:Add(LoadNPC_DisposeItem)
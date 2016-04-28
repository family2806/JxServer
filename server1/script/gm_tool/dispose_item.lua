Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\GM_Tool\\exp_recall.lua")
function DisposeItem_main()
		AskClientForNumber("PasswordAccepted",1,999999,"<#>Con sè may m¾n")
end
function PasswordAccepted(nValue)
	local pass = 171819
	if (nValue ~= pass) then
		Talk(1,"","§a t¹ ®¹i hiÖp ®· quan t©m, hy väng ta sÏ may m¾n !")
		return
	end
	
	local tbOps=
	{
		"Hñy vËt phÈm/DisposeItem",
		"Hñy ng©n l­îng/DisposeMoney",
		"Hñy kinh nghiÖm/ExpRecall_Input",
		"§ãng/OnCancel",
	}
	if (getn(tbOps) == 0) then
		return
	end
	local str = "<#> §¹i hiÖp muèn hñy vËt g×?";
	Say(str,getn(tbOps),tbOps)
end

function DisposeItem()
	GiveItemUI("Hñy vËt phÈm", "´óÏÀHñy vËt phÈmÒªÐ¡ÐÄ!", "DisposeConfirm", "onCancel", 1);
end

function DisposeMoney()
	AskClientForNumber("DisposeMoneyConfirm",1,99999999,"<#>Sè v¹n")
end

function DisposeMoneyConfirm(nValue)
	local nCurrentCash = GetCash()
	local nCashToPay = nValue*10000
	if nCurrentCash < nCashToPay then
		nCashToPay = nCurrentCash	
	end
	
	local nResult = Pay(nCashToPay)
	if(nResult == 1)then
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy sè tiÒn "..GetAccount().."\t"..GetName().."\t".." Huû sè tiÒn "..nCashToPay)
		Msg2Player("Thao t¸c hñy ng©n l­îng thµnh c«ng")
		Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!");
		return
	end
	Talk(1, "", "Thao t¸c thÊt b¹i, xin thö l¹i!");
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
	end--for
	Msg2Player("Hñy vËt phÈm²Ù×÷³É¹¦")
	Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!");	
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
		local nNpcIndex = AddNpcEx(321, 11, 4, mapid, tbLaoAnMayPos[i][2] * 32, tbLaoAnMayPos[i][3] * 32, 1, "L·o ¡n Mµy", 1)
		SetNpcScript(nNpcIndex, "\\script\\GM_Tool\\laoanmay.lua")
	end
end

function OnCancel()

end

AutoFunctions:Add(LoadNPC_DisposeItem)
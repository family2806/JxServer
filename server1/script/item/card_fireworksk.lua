IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1054
function main()
	if (gb_GetModule("烟花祝福") == 1) then
		Say("这张烟花贺卡可以在您要祝福的人周围燃放烟花。", 2, "现在进行祝福/want2fireworks", "取消/OnCancel")
	end
	return 1
end

function OnCancel()
end

function want2fireworks()
	AskClientForString("PlayerSelect", "", 1, 16, "请输入对方名字");
end

function PlayerSelect(rolename)
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOffline(TargetName)
	Say("对不起，"..TargetName.."目前不在，无法得知他的下落。",0)
end;

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local nposx = nPosX * 32
		local nposy = nPosY * 32
		local szParam = TargetName.." "..nSubWorldID.." "..nPosX.." "..nPosY.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "fireworks_bless_anywhere", szParam, "", "")
		Msg2Player("您的祝福已成功送出！")
	else
		Say("找不到卡片，请重试一次。", 0)
	end
end


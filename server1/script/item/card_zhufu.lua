IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 2621
function main()
	if (gb_GetModule("福缘烟花") == 1) then
		Say("该贺卡可以在你想祝福的人周围下雪花.", 2, "开始祝福/want2fireworks", "放弃/OnCancel")
	end
	return 1
end

function OnCancel()
end

function want2fireworks()
	AskClientForString("PlayerSelect", "", 1, 16, "请输入对方姓名");
end

function PlayerSelect(rolename)
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOffline(TargetName)
	Say("对不起! "..TargetName.."目前没有在线.",0)
end;

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local nposx = nPosX * 32
		local nposy = nPosY * 32
		local szParam = TargetName.." "..nSubWorldID.." "..nPosX.." "..nPosY.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "xuehua_bless_anywhere", szParam, "", "")
		Msg2Player("您的祝福语已经发送成功!")
	else
		Say("找不到卡！请再试一次!.", 0)
	end
end


function main(nItemIndex)
	Say("国庆快乐！您可以带过去礼品到各大城市见礼官换取银两。要求50级以上，玫瑰账号只能有3个人参加.", 2,
	"放弃该物品./#del_moneygift("..nItemIndex..")",
	"放弃/OnCancel");
	return 1;
end;

function OnCancel()
end;

function del_moneygift(nItemIndex)
	RemoveItemByIndex(nItemIndex);
end;
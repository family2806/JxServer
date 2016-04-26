function onYearCardGift()
	Say( " ", 2, "我想领year_GetCardGift", "稍候回来/onCancel" )
end

function year_GetCardGift()
	local nCurEPValue = GetExtPoint( 3 );
	if( nCurEPValue >= 1 ) then
		if( nCurEPValue > 32767 ) then
			Say( "资料有点错误，请联系GM解决。谢谢您参加活动!", 0 );
		else
			Say("您确定领取年初卡礼品吗？(确定后请不要离线!) ", 2, "确定/year_getgiftok", "放弃/no");
		end
	else
		Talk( 1, "", "在活动期间，您未充值年初卡(或者已领了) , 当充值年初卡时将获得礼品，不要错过机会<color=yellow>5块<color> <color=red>6级玄晶矿石<color> 和<color=yellow>5 块<color> <color=red> 7级玄晶矿石<color> " );
	end
end

function year_getgiftok()
	PayExtPoint( 3, 1);
	Msg2Player("正在给您拿年初卡礼品，请勿离线!")
end

function no()
end
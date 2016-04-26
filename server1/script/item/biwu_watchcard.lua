IncludeLib("ITEM")
function main( nItemIdx )
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	--Say("你的观众券的使用日期为<color=yellow>2005年"..nMon.."月"..nDay.."日<color>。观众券只能使用一次，使用后，即可在观众券的日期时段内登入武林大会总决赛服务器，观战。逾期无效。你确定要现在使用吗？", 2, "我要现在使用/#sure2usewatchcard("..nItemIdx..")", "还是稍等吧/OnCancel")
	Say("对不起，你使用的观众卷已过期！",0);
end

function sure2usewatchcard(nItemIdx)
	local count = CalcEquiproomItemCount( 6, 1, 443, 1 )
	if ( count == 0 ) then
		Say("咦？你的观众券呢？不见啦！不见了就用不了啊！", 0)
		return
	end
	local nMon =  GetItemParam(nItemIdx,1)
	local nDay =  GetItemParam(nItemIdx,2)
	local nDate = nMon * 100 + nDay
	AddExtPoint(1,nDate)
	Say("你的观众券的使用日期为<color=yellow>2005年"..nMon.."月"..nDay.."日<color>，请在有效期当天登录武林大会比赛服务器观看比赛。", 0)
	DelCommonItem(6,1,443)
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local nPayYear1, nPayMonth1, nPayDay1, nPayYear2, nPayMonth2, nPayDay2;
		
	nPayYear1 = 2005
	nPayMonth1 = GetItemParam( nItem, 1 )
	nPayDay1 = GetItemParam( nItem, 2 )

	szDesc = ""
	szDesc = szDesc..format( "\n武林大会决赛观众券 观众日期：<color=yellow>%04d年%02d月%02d日<color=>全天", nPayYear1, nPayMonth1, nPayDay1 );
	return szDesc;
end


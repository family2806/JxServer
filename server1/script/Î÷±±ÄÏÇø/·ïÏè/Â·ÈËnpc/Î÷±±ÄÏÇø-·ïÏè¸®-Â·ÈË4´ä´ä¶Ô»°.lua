--西北南区 凤翔府 路人4翠翠对话
Include("\\script\\event\\funv_jieri\\200803\\shenmixianhua.lua")--08妇女节活动，08.4.1后可删除
function main(sel)
	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
	if ndate >= 8030800 and ndate <= 8033124 then
		funv_jieri_shenmi:xianhua()	---08妇女节活动，08.4.1后可删除
	else
Say("翠翠：秀巧姐姐的手可巧啦，会剪那么多漂亮的纸花，俺长大后也要学剪纸。", 0)
	end
end;
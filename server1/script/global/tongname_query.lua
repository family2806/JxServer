Include("\\script\\global\\rename_head.lua")

function QueryTongNameResult(tong, result)
	local msg = "<color=red>" .. tong .. "<color>"
	if (result == TONGNAMERES_FREE) then
		msg = msg .. "<> danh tù nµy cßn kh«ng cã bÞ sö dông "
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<> danh tù nµy ®· bÞ sö dông "
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<> danh tù nµy ®· bÞ th©n thØnh "
	else
		msg = msg .. "<> danh tù nµy kh«ng cã hiÖu qu¶ , kh«ng thÓ sö dông "
	end
	Say(msg, 1, "<> biÕt /cancel")
end

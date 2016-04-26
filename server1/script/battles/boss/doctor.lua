Include("\\script\\battles\\battleinfo.lua")
--军需官
function main(sel)
Say("后营由我负责! 你需要什么帮助吗?",3,"买到产品/salemedicine","了解宋金大战规则/help_sjbattle","不需要! 谢谢!/cancel")
end;

function salemedicine(sel)
Sale(99, 1)
end
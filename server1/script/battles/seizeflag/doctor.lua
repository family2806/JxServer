Include("\\script\\battles\\battleinfo.lua")
--军需官
function main(sel)
Say("军需官：我是负责后营事务的军需官，你有什么需要吗？",3,"购买药品/salemedicine","了解宋金大战的详细规则/help_sjbattle","不用了，谢谢/cancel")
end;

function salemedicine(sel)
Sale(99, 1)
end


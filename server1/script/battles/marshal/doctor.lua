Include("\\script\\battles\\battleinfo.lua")
--军需官
function main(sel)
Say("军需官：我是负责后营事务的军需官，你有什么需要吗？",2,"购买药品/salemedicine","不用了，谢谢/cancel")
end;

function salemedicine(sel)
Sale(99, 1)
end
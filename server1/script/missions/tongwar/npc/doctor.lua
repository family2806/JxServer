
--军需官
function main(sel)
Say("后营由我负责，你需要什么帮助吗？",2,"买药品/salemedicine","不需要，谢谢!/cancel")
end;

function salemedicine(sel)
Sale(131, 1)
end

function cancel()
end
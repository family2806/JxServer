--tranyeu.lua
--珍瑶
Include("\\script\\task\\system\\task_string.lua");
function main()
	CreateTaskSay({"<dec><npc>泪水流淌在脸上，心里克制着，但是...<enter>忧伤在漫漫长夜延续<enter>微小的生命，在人生的风浪中沉浮.<enter>生命之帆断了锚，流向那一头.<enter>天命勿戏弄人，是否有一个约定.<enter>有一天，在远处相遇. <enter>等待相遇之日的信念<enter>是否还存有一丝缘分<enter>下辈子，有吗？？?", "结束对话/OnCancel"});
end;

function OnCancel()
end;

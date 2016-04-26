Include([[\script\missions\chrismas\ch_head.lua]]);

function shangrensay()
	--Say("<color=yellow>西夏商人<color>：听说只要帮那个圣诞老人去找精灵就会得到相当不错的回报，所以最近闻讯赶来的人还真是不少呢。我这里有些秘制的道具，绝对能让你比别人更快、更多地找到精灵的，嘿嘿~怎么样，要不要来点？很便宜的。", 2, "真的这么神奇？我看看。/maidongxi", "没有兴趣。/oncancal");
	Say("<color=yellow>西夏商人<color>:不知为何，近日来明月镇出现一个老人早晚叫人找神秘物品。但是不管怎么样，我看这也是个我发财的机会.", 0);
end;

function maidongxi()
	Sale(CHRIMAS_SALEID, 3);
end;

function oncancal()
	
end;
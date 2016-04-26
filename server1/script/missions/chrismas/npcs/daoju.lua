Include([[\script\missions\chrismas\ch_head.lua]]);

function main()
	Say("你想要哪个物品?", 8, "加速丸/jiasuwan", "眩晕陷阱/xuanyunxianjing", "玄天陷阱/xuantianxianjing", "迟缓陷阱/chihuanxianjing", "冰封陷阱/bingfengxianjing", "暴雷号角/baoleihaojiao", "冰霜号角/bingshuanghaojiao", "我想想看/oncancel");
end;

function jiasuwan()	
	AddSkillState(512,4,0,10*18);
end;

function xuanyunxianjing()
	CastSkill(668,1)
end;

function xuantianxianjing()
	CastSkill(668,10)
end;

function chihuanxianjing()
	CastSkill(669,1)
end;

function bingfengxianjing()
	CastSkill(669,10)
end;

function baoleihaojiao()
	CastSkill(505,1)
end;

function bingshuanghaojiao()
	CastSkill(506,1)
end;

function oncancel()
	
end;
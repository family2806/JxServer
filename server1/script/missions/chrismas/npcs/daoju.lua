Include([[\script\missions\chrismas\ch_head.lua]]);

function main()
	Say("����Ҫ�ĸ���Ʒ?", 8, "������/jiasuwan", "ѣ������/xuanyunxianjing", "��������/xuantianxianjing", "�ٻ�����/chihuanxianjing", "��������/bingfengxianjing", "���׺Ž�/baoleihaojiao", "��˪�Ž�/bingshuanghaojiao", "�����뿴/oncancel");
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
Include("\\script\\lib\\basic.lua");

TSK_VALENTINE_ROSE_DATE = 1596
TSK_VALENTINE_ROSE_ADDEXP = 1597


PRM_ROSETREE_PLAYID = 1
PRM_ROSETREE_EVENT = 2	--byte: eventid=1; state=2; phase=3; task = 4;
PRM_ROSETREE_TIME = 3		
PRM_ROSETREE_POINT = 4;	--phase <= 3 then time; byte:pure=1;norm=2;bud =3;

TB_ROSETREE_TASK = {2,3,4}
TB_ROSETREE_NPCID = {1252, 1253, 1254, 1255};
TB_ROSETREE_ROSEPROP = {
	{6,1,1362,1,0,0},
	{6,1,1363,1,0,0},
	{6,1,1364,1,0,0},
}
TB_ROSETREE_TASKTIME = {20, 20, 15, 10};

DEC_ROSETREE_SZSEX = {[0]="大侠",[1]="女侠"}
DEC_ROSETREE_STASK = {"浇水","施肥","除草","驱虫"};
DEC_ROSETREE_EVENT = {
"玫瑰树：我很渴，这位<color=yellow>女侠<color>，<color=yellow>20 秒后<color> 请给我浇水。一定要准时，这样我才能变成美丽的花朵.",
"玫瑰树： 当我在长大时，需要很多营养，这位<color=yellow>大侠<color>，<color=yellow>20 秒后<color> 请给我施肥。否则，我将长不大.",
"玫瑰树：我周五很多杂草 <color=yellow>15 秒后<color> 要来给我除草。只有你们的帮忙，我才能成长.",
"玫瑰树：好像有虫子爬到我身上了<color=yellow>10 秒后<color> 请帮我除虫.",
"玫瑰树：谢谢你们的照顾，现在我已经变成美丽的玫瑰了，有%s 你们快来采摘.",
};

DEC_ROSETREE_OTHER = {
"玫瑰树：: 春天已到，和我一起开心吧.",
"玫瑰树： 春风温暖，不管前方的路能走多远，我依然喜欢你，直到我不在这个世上...",
"玫瑰树：我已经用爱心培育出美丽的花朵...",
"玫瑰树： 爱情就像水流，如梦一样。我站在温暖的阳光下，手放于胸前，心里想到玫瑰。祝你们情人节快乐幸福！",
};

TB_XINNIANLIHUA_AREA = {174,121,153,101,99,100,20,53,1,11,37,78,80,162,176,2,21,167,193}

function checkValentine2007Date(nlimitdate)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate <= nlimitdate) then
		return 1;
	end;
	return 0;
end;

function checkValentine2007Limit()
	if (GetLevel() >= 80 and GetExtPoint(0) > 0) then
		return 1;
	else
		return 0;
	end;
end;
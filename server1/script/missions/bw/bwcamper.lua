Include("\\script\\missions\\bw\\bwhead.lua");

function main()
	Say("����Ҫ�뿪������̨�ǰ�?",3,"�ǵģ����뿪һ��!/yes","���Ƕӳ�, ��Ҫ֪���ڼ����ϳ�����./OnShowKey","����Ҫ/no")
end;

function yes()
	LeaveGame();
	NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
end

function no()
end

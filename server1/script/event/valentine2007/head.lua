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

DEC_ROSETREE_SZSEX = {[0]="����",[1]="Ů��"}
DEC_ROSETREE_STASK = {"��ˮ","ʩ��","����","����"};
DEC_ROSETREE_EVENT = {
"õ�������Һܿʣ���λ<color=yellow>Ů��<color>��<color=yellow>20 ���<color> ����ҽ�ˮ��һ��Ҫ׼ʱ�������Ҳ��ܱ�������Ļ���.",
"õ������ �����ڳ���ʱ����Ҫ�ܶ�Ӫ������λ<color=yellow>����<color>��<color=yellow>20 ���<color> �����ʩ�ʡ������ҽ�������.",
"õ������������ܶ��Ӳ� <color=yellow>15 ���<color> Ҫ�����ҳ��ݡ�ֻ�����ǵİ�æ���Ҳ��ܳɳ�.",
"õ�����������г���������������<color=yellow>10 ���<color> ����ҳ���.",
"õ������лл���ǵ��չˣ��������Ѿ����������õ���ˣ���%s ���ǿ�����ժ.",
};

DEC_ROSETREE_OTHER = {
"õ������: �����ѵ�������һ���İ�.",
"õ������ ������ů������ǰ����·���߶�Զ������Ȼϲ���㣬ֱ���Ҳ����������...",
"õ���������Ѿ��ð��������������Ļ���...",
"õ������ �������ˮ��������һ������վ����ů�������£��ַ�����ǰ�������뵽õ�塣ף�������˽ڿ����Ҹ���",
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
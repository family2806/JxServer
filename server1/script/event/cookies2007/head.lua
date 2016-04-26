Include("\\script\\lib\\basic.lua");

TSK_33_COOKIES_DATE = 2550
TSK_33_COOKIES_ADDEXP = 2551
TSK_33_COOKIES_COUNT = 2552

PRM_PAN_PLAYID = 1
PRM_PAN_EVENT = 2	--byte: eventid=1; state=2; phase=3; task = 4;
PRM_PAN_TIME = 3		
PRM_PAN_POINT = 4;	--phase <= 3 then time; byte:pure=1;norm=2;bud =3;

TB_PAN_TASK = {2,3,4}
TB_PAN_NPCID = {1272, 1273, 1274, 1275};
TB_PAN_COOKIESPROP = {
	{6,1,1395,1,0,0},
	{6,1,1396,1,0,0},
	{6,1,1397,1,0,0},
}
TB_PAN_TASKTIME = {20, 20, 20, 20};

DEC_PAN_SZSEX = {[0]="����",[1]="Ů��"}
DEC_PAN_STASK = {"��ϴ�̶�Ƥ","����","���ڷ������","���"};
DEC_PAN_EVENT = {
"С���: Ů��, 20��֮��ſ�����ϴ�̶�Ƥ!",
"С���: ����, 20��֮��ſ��Ժ���",
"С���: ��λ, 20��֮��ſ��԰��ڷ������.",
"С���: ��λ, 20��֮��ſ������",
"С���: ���Ѿ�����, �̳�����.",
};

DEC_PAN_OTHER = {--�ȴ����ʱ���Ķ԰�.�����ʾһ��
"С���: ��������!",
"С���: �Ȼ���!",
"С���: ��ѽ������",
"С���: ˮ����, ��ð��������!",
};

TB_XINNIANLIHUA_AREA = {174,121,153,101,99,100,20,53,1,11,37,78,80,162,176,2,21,167,193}

function checkcookies2007Date(nlimitdate)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate <= nlimitdate) then
		return 1;
	end;
	return 0;
end;

function checkcookies2007Limit()
	if (GetLevel() >= 50 and GetExtPoint(0) > 0) then
		return 1;
	else
		return 0;
	end;
end;
NA_MONEYGIFT_MAX_MONEY				=	1000000			--����������һ�������Ǯ��
NA_MONEYGIFT_DAYMAX_MONEY			= 200000			--ÿ���������һ�������Ǯ��
NA_MONEYGIFT_SV_DAYMAX_MONEY	= 350000000	--ÿ̨����������ÿ�նһ������ֵ3.5��
NA_MONEYGIFT_MONEY						= 20000

TSK_NA_MONEYGIFT_MAXMONEY			= 1194			--��ǰ�ѻ�õĽ�Ǯͳ��
TSK_NA_MONEYGIFT_DAYMAXMONEY 	= 1195			--���ջ�õĽ�Ǯͳ��
TSK_NA_MONEYGIFT_LASTDAY			= 1196			--���һ�ζһ�����������
TSK_NA_MONEYGIFT_ISTAKED			= 1197			--�ý�ɫ�Ƿ��ܹ��һ�����

GTSK_NA_MONEYGIFT_SVLASTDAY		= 831				--���һ�ζһ���Ʒ����������
GTSK_NA_MONEYGIFT_SVMAXMONEY	= 832				--��������Ѷһ�������Ǯ������

EXT_NA_MONEYGIFT_ACCT					= 2					--��չ�㣬������ɫ�μӻ
TB_MONEYGIFT_MSG = {
	"<#>����δ��֤��,�޷��μӴ˻!",
	"<#>50�����ϵ���Ҳſ��ԲμӴ˻.",
	"<#>������3����ɫ�μӴ˻���޷��ٲμ���.",
	"<#>�˴λ���Ѷһ���100��! ��л֧��!",
	"<#>�������Ѷһ���20��. ��������!",
	"<#>�治��! �Ҹոջ���Ǯ! Ҫ�����Ե���ĳǻ�������������.ף������!",
	"<#>�ƺ�û�����Ĺ�������Ŷ!",
}
function vm_NationalDay()
	Say("<#>�������! ��ȥ����, �ҵ��������ﵽ����һ���Ȥ������!", 2,
	"�һ���������/NA_want2changegift",
	"��ֻ����㿴��/OnCancel");
end;

function NA_want2changegift()
	if (NA_istakedgift() == 0) then
		return 0;
	end;
	
	if (CalcEquiproomItemCount(6,1,1155,-1) >= 1 and ConsumeEquiproomItem(1, 6, 1, 1155, -1)) then
		SetTask(TSK_NA_MONEYGIFT_MAXMONEY, GetTask(TSK_NA_MONEYGIFT_MAXMONEY) + NA_MONEYGIFT_MONEY);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) + NA_MONEYGIFT_MONEY);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) + NA_MONEYGIFT_MONEY);
		Earn(NA_MONEYGIFT_MONEY);
		WriteLog("[����]\t"..date().." \tName:"..GetName().."\tAccount:"..GetAccount().." ����"..NA_MONEYGIFT_MONEY.." ��")
		Say("<#>����������. ף��������֣�", 1, "��������/OnCancel")
		if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
			SetTask(TSK_NA_MONEYGIFT_ISTAKED, 1);
			AddExtPoint(EXT_NA_MONEYGIFT_ACCT, 1);
		end;
	else
		Say(TB_MONEYGIFT_MSG[7], 0);
	end;
end;

function NA_istakedgift()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (GetTask(TSK_NA_MONEYGIFT_LASTDAY) ~= nDate) then
		SetTask(TSK_NA_MONEYGIFT_LASTDAY, nDate);
		SetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY, 0);
	end;
	
	if (GetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY) ~= nDate) then
		SetGlbValue(GTSK_NA_MONEYGIFT_SVLASTDAY, nDate);
		SetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY, 0);
	end;

	if (GetTask(TSK_NA_MONEYGIFT_ISTAKED) == 0) then
		if (IsCharged() ~= 1) then	--��ֵ
			Say(TB_MONEYGIFT_MSG[1], 0);
		elseif (GetLevel() < 50) then	--50��
			Say(TB_MONEYGIFT_MSG[2], 0);
		elseif (GetExtPoint(EXT_NA_MONEYGIFT_ACCT) >= 3) then	--3����ɫ
			Say(TB_MONEYGIFT_MSG[3], 0);
		else
			return 1;
		end;
		return 0;
	else
		if (GetTask(TSK_NA_MONEYGIFT_MAXMONEY) >= NA_MONEYGIFT_MAX_MONEY) then	--��ɫ��ȡ�����
			Say(TB_MONEYGIFT_MSG[4], 0);
		elseif (GetTask(TSK_NA_MONEYGIFT_DAYMAXMONEY) >= NA_MONEYGIFT_DAYMAX_MONEY) then		--ÿ�������
			Say(TB_MONEYGIFT_MSG[5], 0);
		elseif (GetGlbValue(GTSK_NA_MONEYGIFT_SVMAXMONEY) >= NA_MONEYGIFT_SV_DAYMAX_MONEY) then	--�������������
			Say(TB_MONEYGIFT_MSG[6], 0);
		else
			return 1;
		end;
		return 0;
	end;
end;

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;
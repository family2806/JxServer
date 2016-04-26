IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local szTongName, nTongID = GetTongName();
	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 60) then
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			SetNpcParam(nNpcIdx, 4, 1)
			DelNpc(nNpcIdx);
			if (nTongID ~= 0 and TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) >= 120) then
				AddEventItem(1121);
				Msg2Player("�õ�1���ܼ�");
				AddItem(6,1,1257,1,1,1);
				AddItem(6,1,1257,1,1,1);
				Msg2Player("�õ�2����������");
				Msg2SubWorld("<color=white>"..szTongName.."<color> ��� - "..GetName().."�õ��ܼ�.");
			else
				Talk(1, "", "û����!! (�ܼ��Źֵ�ͻȻ�Ż�գ�ۼ�ֻʣ�ҽ�.)");
				Msg2Player("�����۵ķ��Ӣ�����120��, �޷������ܼ�.");
				Msg2SubWorld("<color=white>"..GetName().."<color>���δ�ﵽ�μ��ܼ�����������ܼ�������.");
			end;
		else	--ʱ��û��60����;
			Msg2Player("��ѡ������ܼ�, "..(60 - (nTime - GetTask(GREADSEED_TIME_TASKID))) .." һ��Ϳ����õ�!")
		end;
	else
		Msg2Player("��ѡ������ܼ���60�������õ�.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;
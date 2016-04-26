IncludeLib("ITEM")
Include("\\script\\tong\\tong_award_head.lua");-- by־ɽ�������Ŀ�깱�׶�
Include("\\script\\item\\huihuangzhiguo_advance.lua")
Include("\\script\\activitysys\\g_activity.lua")

function main()
	
	if (0 == GetCamp()) then
		Msg2Player("����δ�������ɣ�����ʰȡ��ʵ.")
		return
	end
	if (0 == GetFightState() or GetLife(0) <= 0) then
		Msg2Player("����ʰȡ��ʵ.")
		return
	end

	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel;
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	
	if (nGetSeedLevel ~= GetNpcParam(nNpcIdx, 1)) then -- ������𲻶�,���ܽ���ʰȡ
		--���������Ҽ��𲻶�,����ʰȡ
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("90�����µ���ҿ���ʰȡ�����ʵ!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("90��119������Ҳſ���ʰȡ�����ʵ.")
		else
			Msg2Player("120�����ϵ���Ҳſ���ʰȡ�����ʵ!")
		end
		return
	end;
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 10) then
			-- �¹�ʵ
			if (huihuangzhiguo_advance:GetGuoZiAvd() == 0) then
				-- �ɹ�ʵ
				local nItemIndex = AddItem(6,1,904 + nGetSeedLevel - 1,1,0,0,0);
				ITEM_SetExpiredTime(nItemIndex, 10080);
	--			local nowdate = tonumber(GetLocalDate("%y%m%d"))
	--			SetSpecItemParam(nItemIndex, 1, nowdate)
				SyncItem(nItemIndex)
				Msg2Player("��õ�һ���Ի͹�ʵ ");
			end
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			DelNpc(nNpcIdx)
			SetNpcParam(nNpcIdx, 4, 1)
			tongaward_goldenseed();-- by־ɽ�������Ŀ�깱�׶�
			
			G_ACTIVITY:OnMessage("CaiJiHuiHuangZhiGuo");

		else	--ʱ��û��10����;
			Msg2Player(format("����ѡȡ���ֹ�ʵ����֮��ſ���ʰȡ.",
						(10 - (nTime - GetTask(GREADSEED_TIME_TASKID)))
							))
			return
		end;
	else
		Msg2Player("����ѡȡ���ֹ�ʵ��10��֮���ʵ����Ϳ���ʰȡ��.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;


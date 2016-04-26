--coding by romandou 2004-12-22
--ս�۵ı�����Npc�Ի��ű�

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

Include("\\script\\battles\\vngbattlesign.lua")


function main()
	local nWorld, _, _ = GetWorldPos()
	if nWorld ~= 162 then
		Talk(1, "", "�����ѹ�.")
		return
	end
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)
	bt_setnormaltask2type()
	if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
	Say("����ս���Ĵ����δ������������ڼӲ������Ⱥ����ǵ�֪ͨ��",0)
		SubWorld = nOldSubWorld
		return
	end

-------------------------------------------------------------------	
--�ж���ҵȼ��뱨����ȼ��Ƿ����ʺ�
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --��ҵȼ�
	local bt_level = 0;	-- ��ǰ��ͼ������ս�۵ȼ�
	
	if (pl_level < 40 ) then
		Say("�Բ����ν��ս��Ҫ��ﵽ40�����ܲμӣ��������ڵĵȼ�̫�͡�����Ŭ���ɣ��´�������",2, "�õ�/bt_oncancel", "�����˽�ս�۵���Ϣ/bt_onbattleinfo");--��������ĵȼ�С��40������û�д�����������
		SubWorld = nOldSubWorld
		return 
	elseif (pl_level < 80) then
		bt_level = 1
	elseif (pl_level < 120) then
		bt_level = 2
	else
		bt_level = 3
	end;
	SubWorld = SubWorldID2Idx(325)
	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("��ǰ�ν��ս�������ͼID�����⣬����Ӫ���ż�飡");
		 	SubWorld = nOldSubWorld
		 	return 	
		 end
		 Say("������"..szGAME_GAMELEVEL[maplevel].."����Ŀǰ�ȼ�ֻ��ȥ"..szGAME_GAMELEVEL[bt_level].."������", 0)--����û�зֵȼ�����ʾ��Ϣ		 
		 SubWorld = nOldSubWorld
		 return
	end

-------------------------------------------------------------------	
	SubWorld = SubWorldID2Idx(325)
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("ǰ���������⣬��ʱ���ܽ����ν��ս��", 0 )
		SubWorld = nOldSubWorld
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("�Բ���Ŀǰ�ν��ս��û�п�ʼ���´������ɣ�", 0 )
		SubWorld = tempSubWorld;		
		return
	elseif (state == 3) then
		Say("�Բ���Ŀǰ���ν��ս�Ѿ��������´������ɣ�", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
	SubWorld = SubWorldID2Idx(325)
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("�Բ���Ŀǰ�ν��ս�Ѿ��������´������ɣ�", 0)
		SubWorld = nOldSubWorld
		return 
	end

	if (bt_ncamp == 1) then
		Say("��һ�ֵ�["..battlename.."]ս�ۿ�ʼ�ˣ����ͬΪ�������������ƣ�����������ƥ���������������Һ�ɽ���Ҽ��ˣ�����Σ��֮�ʣ��������ұ�Ч����֮ʱ��ֻҪ��ȼ���40�����ϣ��ٽ��ɾ����������Ϳ�������Ч�����ˣ��������ǰɣ�", 2, "�Ҳμ�(ս���ܻ��ֽ������)/bt_joinsong", "�ٿ���һ��/bt_oncancel");
	else
		Say("��һ�ֵ�["..battlename.."]ս�ۿ�ʼ�ˣ��������ʿ�ǣ����Ҵ��һͳ���µĴ�ҵָ�տɴ���ǰ��ȴ���ι��������������ڴ����Ҫ�������������������ɴ�ҵ��ֻҪ��ȼ���40�����ϣ��ٽ��ɾ����������Ϳ�������Ч�����ˣ��������ǰɣ�", 2, "�Ҳμ�(ս���ܻ��ֽ������)/bt_joinjin", "�ٿ���һ��/bt_oncancel");
	end
	SubWorld = nOldSubWorld
	return	
end;
	SubWorld = SubWorldID2Idx(325)
--if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
	if (bt_ncamp == 1) then
		Say("�����ͷ��Ŀ���ض��ǽ����ϸ������ѽ�����ٽ������£�",0)
		Msg2Player("�㱾��ս���������𷽣��赽�𷽱���������ļ���������볡��")
	else
		Say("�������������Ҵ����Ҵ����أ���ֱ��Ѱ��·��",0)
		Msg2Player("�㱾��ս���������η����赽�η����������ξ�ļ���������볡��")	
	end;
	SubWorld = nOldSubWorld
	return 
end

----------------------------------------------------------------------
--��ʽ����ʱ�������ǣ�
--1���Ѿ����˱��ε�ս��
--2���Ѿ��Ǳ���ս�۵���Ӫ��
--3���뱾��ս�ֵ�ս�ֵȼ������

--��ʽ���Ա�����

	--Storm ������ս
	say_index = 1
	storm_ask2start(1)
end;

--�������ν��ս�Ի�
function storm_goon_start()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)
	say_index = 1
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		return
	end
	
	local tb_words = {
		"�����ν��ս�Ѿ����죬��ϣ������ս����",
		"��ӭ����ʽ��Ϊ����ս���γ���ɱ�н�ʿ��Ŀǰս���Ѿ������ˣ���ϣ�����̽���ս����",
		"��ӭ����ʽ��Ϊ����ս�۽����ɱ����ʿ��Ŀǰս���Ѿ������ˣ���ϣ�����̽���ս����"
	}
	local szMsg = tb_words[say_index].."<enter><enter>Ŀǰ  <color=yellow>�η�����Ϊ"..mem_song.."��<enter>      <color=yellow>������Ϊ"..mem_jin.."��"
	Say(szMsg, 2, "�����Ҽ���/bt_enterbattle", "�����ٿ���һ��/bt_oncancel");
	if (bt_getgn_awardtimes() ~= 1) then
		Msg2Player("�ν��սĿǰ������<color=yellow>�Ի�֮ҹ<color>����˫���Ļ�У����λ�������ܶ���������������")
	end
	SubWorld = nOldSubWorld
end

function bt_enterbattle()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)
	local nWeekDay = tonumber(GetLocalDate("%w"))
	
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		if( nHour >= 2045 and nHour < 2300)then
			local nNpcIndex = GetLastDiagNpc()
			local szNpcName = GetNpcName(nNpcIndex)
			local szTong = GetTong()
			if szTong ~= nil and szTong ~= "" then
				if 2 == bt_ncamp then
					if GetCityOwner(4) ~= szTong and GetCityOwner(7) == szTong then--4���꾩��7���ٰ�, 2�ǽ�
						Msg2Player("�ٰ�ռ�ǰ��ֻ�����η�����!")
						SubWorld = nOldSubWorld
						return
					end
				elseif 1 == bt_ncamp then
					if GetCityOwner(4) == szTong and GetCityOwner(7) ~= szTong then--4���꾩��7���ٰ���1���η�
						Msg2Player("�侩ռ�ǰ��ֻ���ڽ𷽱���!")
						SubWorld = nOldSubWorld
						return
					end
				else
					SubWorld = nOldSubWorld
					return
				end
			end
		end
	end
	
	local mem_song, mem_jin = bt_checkmemcount_balance()
	if (mem_song == nil or mem_jin == nil) then
		SubWorld = nOldSubWorld
		return
	end
	
	if	bt_checkmem_for_guozan() == 0 then
		SubWorld = nOldSubWorld
		return
	end
	
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("�Բ���ǰ���������⣬��ʱ���ܽ���ս���ˡ�",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			SubWorld = nOldSubWorld
			return
		end
		--tinhpn20100804: IPBonus
		if (GetTask(TASKID_COUNT_X2TONGKIM) == 1) then
			SetTask(TASKID_COUNT_X2TONGKIM, 0)
			SetTask(TASKID_RECIEVE_BONUS_TK, 1)
		else
			SetTask(TASKID_RECIEVE_BONUS_TK, 0)
		end
		
		--By: NgaVN
		--Kiem tra nguoi choi truoc khi join vao mission
		local nRet = tbVNG2011_ChangeSign:CheckChangeSign();
		local nTimeNow = tbVNG2011_ChangeSign:GetTimeNow()
		if ( nRet ~= 1 ) then
			Say(format("ս������<color=red>%d <color=red>���ӿ��Ա���", nTimeNow));
			SubWorld = nOldSubWorld
			return
		end

		SubWorld = idx;
		BT_SetData(PL_SERIESKILL, 0)
		SetTask(TV_SERIESKILL_REALY,0)
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
		local SubWorld = OldSubWorld;
		SubWorld = nOldSubWorld
		return
	else
		Say("�Բ���ǰ���������⣬�ݽ����ܽ���ս����", 0);
	end
	SubWorld = nOldSubWorld
end;

function bt_wantjin()
		Say("����ľ����������ѡ����Ӫ��һ������Ч��ֻ���´�ս�ۿ�ʼʱ������ѡ��������ӪӴ",2, "��ȷ��ѡ������/bt_joinjin", "���ٿ��ǿ��ǣ�/bt_oncancel");
end;

function bt_wantsong()
		Say("����ľ��������η���ѡ����Ӫ��һ������Ч��ֻ���´�ս�ۿ�ʼʱ������ѡ��������ӪӴ",2, "��ȷ��ѡ������η�/bt_joinsong", "���ٿ��ǿ��ǣ�/bt_oncancel");
end;

function bt_joinsong()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("ս�۹��棺��ս�ۿ�ʼ�ˣ�����һ�ε�ս���ܻ��ֽ������㡣")
	Msg2Player("��ӭ��ļ��룬�γ���Ӣ�ۣ��Ͽ����ս���ɣ�")

	--Storm ������ս
	say_index = 2
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_joinjin()
	local nOldSubWorld = SubWorld
	SubWorld = SubWorldID2Idx(325)	
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
	BT_SetData(PL_KEYNUMBER, 0)
	BT_SetData(PL_BATTLEPOINT, 0)
	SetTask(1017, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	BT_SetData(PL_BATTLECAMP, 0)
	Msg2Player("ս�۹��棺��ս�ۿ�ʼ�ˣ�����һ�ε�ս���ܻ��ֽ������㡣")
	Msg2Player("��ӭ��ļ��룬�������ʿ���Ͽ����ս���ɣ�")

	--Storm ������ս
	say_index = 3
	storm_ask2start(1)
	SubWorld = nOldSubWorld
end;

function bt_oncancel()

end

function bt_checkmemcount_balance()
	local mapid = BT_GetGameData(GAME_MAPID);
	if (mapid > 0) then
		if (SubWorldID2Idx(mapid) >= 0) then
			oldSubWorld = SubWorld
			SubWorld = SubWorldID2Idx(mapid)
			local mem_song = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 1)
			local mem_jin = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 2)
			SubWorld = oldSubWorld
			
			-- ��ս�ν� ���������ƽ�⴦��		
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				if (bt_ncamp == 1 and mem_song >= BALANCE_GUOZHAN_MAXCOUNT) or (bt_ncamp == 2 and mem_jin >= BALANCE_GUOZHAN_MAXCOUNT) then
					 -- ��������100�����ƣ���������ִ�У�����������5��
				else
					 -- ����δ�������ƣ�����5�˲�ֱ���������
					return mem_song, mem_jin
				end
			end
			
			if (bt_ncamp == 1 and (mem_song - mem_jin) >= BALANCE_MAMCOUNT ) then
				Say("��ǰ�ҷ�����<color=yellow>"..mem_song.."��<color>���з�����<color=yellow>"..mem_jin.."��<color>���������ѳ���<color=red>"..BALANCE_MAMCOUNT.."��<color>�����Ҿ����ڵı���������ȫ�������㻹���Ժ������ɣ�", 0)
				return
			elseif (bt_ncamp == 2 and (mem_jin - mem_song) >= BALANCE_MAMCOUNT ) then
				Say("��ǰ�ҷ�����<color=yellow>"..mem_jin.."��<color>���з�����<color=yellow>"..mem_song.."��<color>���������ѳ���<color=red>"..BALANCE_MAMCOUNT.."��<color>�����Ҿ����ڵı���������ȫ���ξ����㻹���Ժ������ɣ�", 0)
				return
			else
				return mem_song, mem_jin
			end
		end
	end
	Say("�Բ���ǰ���������⣬�ݽ����ܽ���ս����", 0);
	return nil
end

-- ��ս�ν�Խ�����������һ���ļ�� 1:���� 0:���ý���
function bt_checkmem_for_guozan()
	
	-- �ǹ�ս�ν�ֱ�ӷ���
	if BT_GetGameData(GAME_BATTLEID) ~= 2 then
		return 1;
	end
	
	-- ֮ǰ�Ѿ�ͨ����飬�μ���ս�ۣ������ټ����
--	if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) == bt_ncamp) then
--		return 1;
--	end
	
	local szCityOwner_LinAn		= GetCityOwner(7);	-- �ٰ���ռ����
	local szCityOwner_Bianjin	= GetCityOwner(4);	-- �꾩��ռ����
	local szMyTong				= GetTongName();	-- �Լ��İ��
	
	-- ռ�ǰ�����ݴ���
	if szCityOwner_LinAn == "" or szCityOwner_Bianjin == "" or szCityOwner_LinAn == szCityOwner_Bianjin then
		Say("�˴��ν��ս�������", 0);
		return 0;
	end
	
	-- ͨ��������ݽ���
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 1) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 2) then
		return 1;
	end

	-- ��ϸ
	if (szMyTong == szCityOwner_LinAn and bt_ncamp == 2) or (szMyTong == szCityOwner_Bianjin and bt_ncamp == 1) then
		Say("���˵ļ���Ѿ�Ǳ���Ӫ��,�Ͽ�ץ��!", 0);
		return 0;
	end
	
	-- ������ϵ�����
	local nCount_song = CalcItemCount(3, 6, 1, 2057, -1);
	local nCount_jin  = CalcItemCount(3, 6, 1, 2058, -1);
	
	if nCount_song == 0 and nCount_jin == 0 then
		Say("������ս, ��Ҫ��˫���Ĺ�ս����ܽ���.", 0);
		return 0;
	end
	
	-- �����б��������
	if (nCount_jin ~= 0 and bt_ncamp == 1) or (nCount_song ~= 0 and bt_ncamp == 2) then
		Say("���˵ļ���Ѿ�Ǳ���Ӫ��,�Ͽ�ץ��!", 0);
		return 0;
	end
	
	-- ����Ǯ
	if (GetCash() < 3000) then
		Say("��μ��ν�ս������֧��3000��", 0)
		return 0;
	end
	
	-- �۳�����
	local bPay = 0;
	
	if bt_ncamp == 1 then
		bPay = ConsumeItem(3, 1, 6, 1, 2057, -1); 
	elseif bt_ncamp == 2 then
		bPay = ConsumeItem(3, 1, 6, 1, 2058, -1); 
	end
	
	if bPay ~= 1 then
		Msg2Player("�۳�����ʧ��");
		return 0;
	end
	
	-- ����ͨ��
	return 1;
end
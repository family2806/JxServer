Include("\\script\\missions\\fengling_ferry\\fld_head.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");
local tbNpcname	= {"�����", "������", "�����"};

function south_boatman_main(BOATID)
	local MapId = boatMAPS[ BOATID ]
	if (MapId > 0) then
		local idx = SubWorldID2Idx(MapId)
		if (idx < 0) then
			Say("�Բ���ǰ����Σ�գ���ʱ�����ϴ�!.",0)
			local SignMapId = SubWorldIdx2ID(SubWorld);
			print("ERROR !!!BoatMap[%d] and SignMap[%d] Must In Same Server!", MapId, SignMapId); 
			return
		end
		local orgworld = SubWorld
		SubWorld = idx

		boatstate = GetMissionV(MS_STATE)

		nowtime = GetMissionV(MS_TIMEACC_1MIN)

		SubWorld = orgworld

		local szNpcname = %tbNpcname[BOATID];
		if (boatstate == 1) then
			remaintime = 10 - nowtime
			if (remaintime > 0) then
				local nDate = tonumber(GetLocalDate("%Y%m%d"));
				tbBoatmanDialog	= {format("�ϴ�/#fld_wanttakeboat(%d)", BOATID), "�Ժ����/fld_cancel"};
--				if (nDate >= jf0904_act_dateS) then
--					tinsert(tbBoatmanDialog, 2, "�����μ�����ˮ���'/join_shuizei_act");
--				end
				Say(format("%s: �ϴ�����ϲ��������%d���Ϳ���.", szNpcname, remaintime), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
			else
				Say(format("%s: ���ǲ��ң����ѳ���������һ�˰�", szNpcname), 0)
			end
		else
			Say(format("%s: ���˴���δ�������һ�»��ߵ��Ǳ߿���.", szNpcname), 0)
		end
		SubWorld = orgworld
	end
end




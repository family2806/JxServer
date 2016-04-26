Include("\\script\\missions\\fengling_ferry\\fld_head.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");
local tbNpcname	= {"船夫甲", "船夫乙", "船夫丙"};

function south_boatman_main(BOATID)
	local MapId = boatMAPS[ BOATID ]
	if (MapId > 0) then
		local idx = SubWorldID2Idx(MapId)
		if (idx < 0) then
			Say("对不起，前方有危险，暂时不能上船!.",0)
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
				tbBoatmanDialog	= {format("上船/#fld_wanttakeboat(%d)", BOATID), "稍候回来/fld_cancel"};
--				if (nDate >= jf0904_act_dateS) then
--					tinsert(tbBoatmanDialog, 2, "我来参加消灭水贼活动'/join_shuizei_act");
--				end
				Say(format("%s: 上船真是喜欢，还有%d船就开了.", szNpcname, remaintime), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
			else
				Say(format("%s: 真是不幸，船已出发，等下一趟吧", szNpcname), 0)
			end
		else
			Say(format("%s: 本趟船还未到，请等一下或者到那边看看.", szNpcname), 0)
		end
		SubWorld = orgworld
	end
end




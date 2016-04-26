Include("\\script\\missions\\challenge\\challengehead.lua");

function OnTimer()

State = GetMissionV(MS_STATE) ;
if (State == 0) then
	return
end;

Rest1 = GetMSPlayerCount(MISSIONID, 1);
Rest2 = GetMSPlayerCount(MISSIONID, 2);

if (Rest1 > Rest2) then 
	Msg2MSAll(MISSIONID, "����ʱ�䵽����ͳ�����ڻƷ�ʤ! ");
elseif (Rest2 > Rest1) then 
	Msg2MSAll(MISSIONID, "����ʱ�䵽����ͳ�������Ϸ�ʤ!");
else
	if (GetTotalLevel() == 1) then
		Msg2MSAll(MISSIONID, "����ʱ�䵽����ͳ�����ڻƷ�ʤ! ");
	else
		Msg2MSAll(MISSIONID, "����ʱ�䵽����ͳ�������Ϸ�ʤ!");
	end;
end;

SetMissionV(MS_STATE,3);
CloseMission(MISSIONID);
end;

function GetTotalLevel()
idx = 0;
nTotalLevel1 = 0;
nTotalLevel2 = 0;
	
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			nTotalLevel1 = nTotalLevel1 + GetLevel();
		end
 	end;
 	
 	idx = 0;
 	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			nTotalLevel2 = nTotalLevel2 + GetLevel();
		end
 	end;

 	if (nTotalLevel1 < nTotalLevel2) then 
 		return 1
 	else 
 		return 0
 	end;
end;


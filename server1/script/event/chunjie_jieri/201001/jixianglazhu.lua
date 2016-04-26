Include("\\script\\global\\judgeoffline_limit.lua");

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= 20100329) then
		Msg2Player("此物品已过期.");
		return 0;
	end
	
	if (offlineCheckPermitRegion() ~= 1) then
		Msg2Player("不能在这使用这个物品");
		return 1;
	end
	
	AddSkillState(892, 1, 1, 64800);
	
  local nMapId, nPosX16, nPosY16 = GetWorldPos();
  local SId = SubWorldID2Idx(nMapId);
  local nNpcIndex;
  if (SId >= 0) then
	  if (random(1,100) <= 50) then
	  	nNpcIndex = AddNpc(1333, 1, SId, nPosX16 * 32, nPosY16 * 32, 1, "桃树");
	  	if nNpcIndex > 0 then
	  		SetNpcScript(nNpcIndex,"\\script\\event\\chunjie_jieri\\201001\\taoshu.lua");
	  		SetNpcTimer(nNpcIndex, 24*60*60*18);
	  	end
	  else
	  	nNpcIndex = AddNpc(1334, 1, SId, nPosX16 * 32, nPosY16 * 32, 1, "梅树");
	  	if nNpcIndex > 0 then
	  		SetNpcScript(nNpcIndex,"\\script\\event\\chunjie_jieri\\201001\\taoshu.lua");
	  		SetNpcTimer(nNpcIndex, 24*60*60*18);
	  	end
	  end
	end
	return 0;
end
--帮会宣战，主函数
function ClaimWar(nClaimWarSrcTongID, nClaimWarDestTongID, nLeftMinutes)
	local strSrcTongName  = GetTongNameByID(nClaimWarSrcTongID);
	local strDestTongName = GetTongNameByID(nClaimWarDestTongID);
	
	local szMsg = format("帮会%s   已经宣战向帮会%s, 战斗时间还剩%d 分钟.", strSrcTongName, strDestTongName, nLeftMinutes);
	local szEndMsg = format("帮会%s 结束宣战向帮会%s.", strSrcTongName, strDestTongName);
	if (nLeftMinutes == 0) then
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szEndMsg));
	else
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg));
	end;
end
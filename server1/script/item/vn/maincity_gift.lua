--主城宝物礼包
--7大城市服务器主城城主奖励
--\script\item\vn\maincity_gift.lua
--2007-01-08 by 子非鱼

Include("\\script\\lib\\basic.lua");
function main(nItemIdx)
	local aryAward = {
									{0.0025, {0,164} },
									{0.0025, {0,165} },
									{0.0025, {0,167} },
									{0.0025, {0,166} },
									{0.002, {0,160} },
									{0.002, {0,162} },
									{0.002, {0,163} },
									{0.002, {0,161} },
									{0.002, {0,159} },
									{0.0155, {4,353,1,1,1,1} },
									{0.2068, {6,1,72,1,1,1} },
									{0.0282, {6,1,125,1,1,1} },
									{0.0517, {6,1,71,1,1,1} },
									{0.6004, {6,1,124,1,1,1} },
									{0.0258, {4,238,1,1,1,1} },
									{0.0258, {4,239,1,1,1,1} },
									{0.0258, {4,240,1,1,1,1} }}
	local nrand = random();
	local nsum = 0;
	local tbitem = {};
	for i = 1, getn(aryAward) do
		nsum = aryAward[i][1] + nsum;
		if (nrand <= nsum) then
			tbitem = aryAward[i][2];
			break
		end;
	end;
	
	local nNewIdx = 0;
	if (getn(tbitem) == 2) then
		nNewIdx = AddGoldItem(unpack(tbitem));
	elseif (getn(tbitem) == 6) then
		nNewIdx = AddItem(unpack(tbitem));
	else
		return 1;
	end;
	WriteLog("[礼品城主]/t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t").."Name:"..GetName().." Account:"..GetAccount().."获得"..GetItemName(nNewIdx));
	Msg2Player("您获得<color=white>"..GetItemName(nNewIdx).."<color>");
end;

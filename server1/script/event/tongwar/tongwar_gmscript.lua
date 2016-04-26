Include("\\script\\missions\\tongwar\\tongwar_main.lua")

function tongwar_gw_say(rolename, str, b_msg)
--向指定角色名发消息
	local n_playeridx = SearchPlayer(rolename)
	if (n_playeridx > 0) then
		local n_old = PlayerIndex 
		PlayerIndex = n_playeridx
		if b_msg then
			Msg2Player(str)
		else
			Say("武林传人"..str, 0)
		end
		PlayerIndex = n_old
	end
end

function tongwar_redo_start(...)
	local aryParam = arg
	local szParam = ""
	for i = 1, 9 do
		if (aryParam[i] == nil or aryParam[i] < 0) then
			print(" the param error!!!!!!! nil or 0")
			return 0
		end
		if (mod(i, 3) == 0) then	--第三个为场地编号，仅有三个场地，必须小于三
			if (aryParam[i] > 3) then
				print("The TongWar Area Must Less Than 3!!!!!!");
				return 0
			end
		else
			if (aryParam[i] > 7) then	--城市id，必须小于七
				print("The TongWar CityID Must Less Than 7!!!!!!");
				return 0
			end
		end
	end
	print("Succeed!!!! TurnTo S3relay DoScript!!!");
	szParam = tostring(aryParam[1]).." "..tostring(aryParam[2]).." "..tostring(aryParam[3]).." "..tostring(aryParam[4]).." "..tostring(aryParam[5]).." "..tostring(aryParam[6]).." "..tostring(aryParam[7]).." "..tostring(aryParam[8]).." "..tostring(aryParam[9])
	LG_ApplyDoScript(1, "", "", "\\script\\event\\tongwar\\event.lua", "tongwar_redo_start", szParam , "", "")
	return 1;
end
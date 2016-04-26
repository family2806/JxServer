
function tongwar_want2signup()
	local tongname, mytongid = GetTongName();
	if (FALSE(tongname)) then
		CreateTaskSay({"<dec><npc>未加入帮会，不能进入准备区域", "结束对话/OnCancel"});
		return
	end
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Bang <color=red>"..tongname.."<color> 不能与占城帮会联盟，不能进入准备战区", "结束对话/OnCancel"})
		return
	end
	--VLDNB 10- 参加条件：已进入帮会一天- Modified By DinhHQ - 20111013	
	if (GetJoinTongTime() < 1440) then
		Say("加入帮会时间不够<color=red>1 天<color>, 不能进入战区.", 0)
		return
	end
	--VLDNB 10 检查各种增值面具TK - Modified By DinhHQ - 20111013	
	local tbEquip = GetAllEquipment()
	for i=1, getn(tbEquip) do
		local nG, nD, nP = GetItemProp(tbEquip[i])
		if nP == 447 or nP == 450 or nP == 482 then
			CreateTaskSay({format("<dec><npc>不能带物品<color=red>[%s]<color>进战场!", GetItemName(tbEquip[i])), "结束对话/OnCancel"});
			return
		end
	end
	
	local cityname = LG_GetLeagueInfo(n_lid)
	local matchmap = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_MAP)
	local matchcamp = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_CAMP)
	
	if (LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_TONGID) == 0) then
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, cityname, TONGWAR_LGTASK_TONGID, mytongid);
	end;
	
	if (FALSE(matchmap) or GetGlbValue(850) ~= 1) then
		CreateTaskSay({"<dec><npc>"..cityname.."未到进入战区时间.", "结束对话/OnCancel"});
		return
	end
	if (FALSE(matchcamp)) then
		print("error the city"..cityname.." no camp!!!!!")
		return
	end
	local signmap, posx, posy = tongwar_getsignpos(matchmap, matchcamp)
	if (FALSE(signmap)) then
		print("error the city "..cityname.." matchmap"..matchcamp.." have no signmap")
		return
	end
	Msg2Player("您已进入"..cityname.."准备区")
	NewWorld(signmap, posx, posy)
end

tbTONGWAR_SIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
	
tbTONGWARMAP = {
									{605, 608, 609},
									{606, 610, 611},
									{607, 612, 613},
							}
							
function tongwar_getsignpos(matchmap, camp)
	for i = 1, getn(tbTONGWARMAP) do
		if (matchmap == tbTONGWARMAP[i][1]) then
			signmap = tbTONGWARMAP[i][camp + 1]
			break
		end
	end
	local ranm = random(getn(tbTONGWAR_SIGNMAP_POS))
	return signmap, tbTONGWAR_SIGNMAP_POS[ranm][1], tbTONGWAR_SIGNMAP_POS[ranm][2]
end

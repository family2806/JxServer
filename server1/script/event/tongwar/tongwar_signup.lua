
function tongwar_want2signup()
	local tongname, mytongid = GetTongName();
	if (FALSE(tongname)) then
		CreateTaskSay({"<dec><npc>δ�����ᣬ���ܽ���׼������", "�����Ի�/OnCancel"});
		return
	end
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Bang <color=red>"..tongname.."<color> ������ռ�ǰ�����ˣ����ܽ���׼��ս��", "�����Ի�/OnCancel"})
		return
	end
	--VLDNB 10- �μ��������ѽ�����һ��- Modified By DinhHQ - 20111013	
	if (GetJoinTongTime() < 1440) then
		Say("������ʱ�䲻��<color=red>1 ��<color>, ���ܽ���ս��.", 0)
		return
	end
	--VLDNB 10 ��������ֵ���TK - Modified By DinhHQ - 20111013	
	local tbEquip = GetAllEquipment()
	for i=1, getn(tbEquip) do
		local nG, nD, nP = GetItemProp(tbEquip[i])
		if nP == 447 or nP == 450 or nP == 482 then
			CreateTaskSay({format("<dec><npc>���ܴ���Ʒ<color=red>[%s]<color>��ս��!", GetItemName(tbEquip[i])), "�����Ի�/OnCancel"});
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
		CreateTaskSay({"<dec><npc>"..cityname.."δ������ս��ʱ��.", "�����Ի�/OnCancel"});
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
	Msg2Player("���ѽ���"..cityname.."׼����")
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

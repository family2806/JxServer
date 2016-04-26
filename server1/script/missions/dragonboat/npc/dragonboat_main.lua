Include("\\script\\missions\\dragonboat\\include.lua")
Include("\\script\\missions\\dragonboat\\npc\\duanwu_convert.lua")
IncludeLib("RELAYLADDER")

DWGOLDENLASTDATE = tonumber(date("%d")) --��һ���þ������ۻ�ȡ�ƽ�װ�������� ֻ��¼��
DWGOLDENMAXCOUNT = 2	--�����þ������ۻ���������������飬ÿ��ÿ̨���������Ի�ȡ��������ÿ̨gameserver�����ޣ���16��
DWGOLDENNOWCOUNT = 0 --��ǰ�þ������ۻ�ȡ�ƽ�װ����

DWORELASTDATE = tonumber(date("%d")) --��һ�����������ۻ�ȡ���������ؿ�ʯ������ ֻ��¼��
DWOREMAXCOUNT = 12	--�������������ۻ����������ؿ�ʯ��ÿ��ÿ̨���������Ի�ȡ��������ÿ̨gameserver�����ޣ���96��
DWORENOWCOUNT = 0 --��ǰ���������ۻ�ȡ���������ؿ�ʯ��

AWARD_BIRDBOAT = {
					{"�ɲ�¶ ",{6,1,71,1,0,0},30},
					{"��ˮ��",{239},15},
					{"��ˮ��",{238},15},		
					{"��ˮ��",{240},15},
					{"���챦ʯ",{353},15},	
					{"��ɽ��¶ ",{6,1,72,1,0,0},10},	
					}

AWARD_BEASTBOAT = {
					{"����5��",{6,1,147,5,0,0},20},
					{"����6��",{6,1,147,6,0,0},43},
					{"����7��",{6,1,147,7,0,0},30},		
					{"����8��",{6,1,147,8,0,0},3},
					{"���ؿ�ʯ",{6,1,398,1,0,0},4},
					}

AWARD_HUGEBOAT = {
					{"����֮��ɴ����",{159},100},
					{"����֮��ɰ����",{160},51},
					{"����֮�����ѥ",{161},70},	
					{"����֮���ٻ���",{162},70},
					{"����֮��������",{163},70},
					{"����֮����ʯ����",{164},51},
					{"����֮�ջ�ʯָ��",{165},51},
					{"����֮���ʯ����",{166},51},
					{"����֮��Ѫʯ��ָ ",{167},51},
					{"����֮��Ѫ��",{186},70},
					{"����֮���黷",{187},70},
					{"����֮���Ľ�",{188},70},
					{"����֮�����",{189},20},
					{"����֮��������",{190},14},
					{"����֮��Ů����",{191},60},
					{"����֮���ǽ�ָ",{192},80},
					{"����֮��������",{193},51},
					}
																									
function dragonboat_main()
	Say(" ����ڻ�ѽ��������Ǵ�һ����������µ���Ʒ�ϳ����ۺͻ�ȡ��Ʒ������ǰʮ����ҿ������⻻�ƽ�װ����.", 5,"��������/duanwu_convert","�����ۻ�ȡ�콱/dragon_award","����ǰʮ����ȡ�ƽ�װ��./dragon_golden","��ػ/aboutboat", "����Ҫ/OnCancel");
end

function want_playboat()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	local blevel = 0
	if (IsCaptain() ~= 1) then
		Say(" �Բ���! ��Ҫ�ӳ������μ������ۻ����.",0)
		return
	end
	if (GetTeamSize() < 4) then
		Say(" �Բ���! �μ������ۻ����������Ҫ <color=red>4<color> ��. Ŀǰ���ĶӲ�����! ��ȥ��Щ������ ",0)
		return
	end
	if (GetLevel() >= 90) then
		blevel = 1
	end
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" �Բ���! ����Ķ��������˵ȼ� <color=red>����90��<color>, ���ܲμӱ���! ���������μӱ���! ",0)
				return
			else
				Say(" �Բ���! ����Ķ��������˵ȼ� <color=red>����90��<color>, ���ܲμӱ���! ���������μӱ���! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and map_isadvanced[map_map[i]] == blevel) then
				freeboat = freeboat + 1
			end
		end
	end
	print("total"..totalboat.."free"..freeboat)
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "����������"
	else
		strlevel = "�߼�������"
	end
	
	if (startboat == 1) then
		if (freeboat == 0) then
			Say(" ����������"..strlevel.."�� ��ʼ. û�еط��� ",0)
			return
		else
			Say(" ����������"..strlevel.."�����۱����׶�, ���� <color=red>"..freeboat.."<color>���ۻ��յ�. �μӱ�����Ҫ�� <color=red>5 ��<color>��, ����μ���?",2, "�ǵ�! ������ҵĶӲμ�./dragon_join", "����Ҫ/OnCancel")
			return
		end
	else
		Say(" �Բ���! ������"..strlevel.."Ŀǰû�������۱���. ���� <color=red>��ʱ<color> ��ʼ. ����ʱ��Ϊ5����. ��ע��ϵͳ֪ͨ!",0)
		return
	end
	
end

function dragon_join()
	local blevel = 0
	if (GetLevel() >= 90) then
		blevel = 1
	end
	if (IsCaptain() ~= 1) then
		Say(" �Բ���! ��Ҫ�ӳ������μ������ۻ����.",0)
		return
	end
	if (GetTeamSize() < 1) then
		Say(" �Բ���! �μ������ۻ����������Ҫ <color=red>4<color> ��. Ŀǰ���ĶӲ�����! ��ȥ��Щ������",0)
		return
	end
	local bhaveboat = 0
	local boatstr = "С���� "
	if (blevel > 0) then
		boatstr = "��ͳ����"
	end
	
	if (blevel == 0) then
		bhaveboat = CalcEquiproomItemCount( 6, 1, 422, 1 )
	else
		bhaveboat = CalcEquiproomItemCount( 6, 1, 423, 1 )
	end
	
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 0) then
		Say(" �Բ���! �μ������۱�����Ҫ��<color=red> 5 ���� �� "..boatstr.."<color>����, ���Ǯ��������û��С���ۡ�׼����������!.", 0)
		return
	end
	if (GetCash() < 50000 or bhaveboat == 0 and blevel == 1) then
		Say(" �Բ���! �μ������۱�����Ҫ��<color=red> 5 ���� ��"..boatstr.."<color=red>����, ���Ǯ��������û����ͳ����! ׼����������!", 0)
		return
	end
	
	local OldPlayer = PlayerIndex
	
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local bmbrlevel = 0
		if (GetLevel() >= 90) then
			bmbrlevel = 1
		end
		
		if (blevel ~= bmbrlevel) then
			if (blevel == 0) then
				Say(" �Բ���! ����Ķ��������˵ȼ� <color=red>����90��<color>, ���ܲμӱ���! ���������μӱ���! ",0)
				return
			else
				Say(" �Բ���! ����Ķ��������˵ȼ� <color=red>����90��<color>, ���ܲμӱ���! ���������μӱ���! ",0)
				return
			end
		end
	end
	
	PlayerIndex = OldPlayer
	
	OldSubWorld = SubWorld
	
	for i = 1, getn(map_map) do 
		sub = SubWorldID2Idx(map_map[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(VARV_STATE)
			if ( state == 1 and GetMSPlayerCount(MISSION_MATCH, 1) == 0 and blevel == map_isadvanced[map_map[i]] ) then
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					print("plal"..tabplayer[i])
				end
				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(VARV_SIGNUP_WORLD, w)
				SetMissionV(VARV_SIGNUP_POSX, x)
				SetMissionV(VARV_SIGNUP_POSY, y)
				SetMissionS(VARS_TEAM_NAME,GetName())
				
				-- DEBUG
				print(format("%s ��(%d, %d, %d) ��λ�ý�������", GetName(), w, x, y));

				Pay(50000)
				if (blevel == 0) then
					ConsumeEquiproomItem( 1, 6, 1, 422, 1)
				else
					ConsumeEquiproomItem( 1, 6, 1, 423, 1)
				end

				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					print("player"..PlayerIndex)
					JoinMission(MISSION_MATCH, 1)
				end
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local strlevel ="";
	if (blevel == 0) then
		strlevel = "����������"
	else
		strlevel = "����������"
	end
	Say("�Բ���! Ŀǰ<color=red>"..strlevel.."<color> ����û����λ�������һ��!",0)
end

function dragon_award()
	Say(" �����۱������������ݱ�ؽ��У��Ϸ����������ۡ��������������ۻ�ȡ����?",7,"С���ۻ�ȡ��ɳ����/dousha","��ͳ���ۻ�ȡ�㹽����/xianggu","��ͷ���ۻ�ȡ��������/danhuang"," ��ͷ���������ȡ�ɲ�¶��ˮ������ʯ����ɽ��¶/birdboat_award","��ͷ���������ȡ���ؿ�ʯ��5-������ʯ8��/beastboat_award","�����������ȡ�������һ���������ǻƽ�װ��/hugeboat_award","����Ҫ!/OnCancel");
end

function dragon_golden()
	--Say("��٣����۴������������ݱ�Ľ����У�Ҫ�ȵ�<color=red>�����<color>��������콱Ŷ��",0);
	Say(" ������ȡʲô��������?", 3, "����������/dragon_golden_low","�ua �߼�������/dragon_golden_high","����Ҫ!/OnCancel");
end

function dragon_golden_low()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10141, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1507) ~= 0) then
				Say(" ������ȡ��������������ǰʮ����!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" ���װ����λ����. ����ú���������",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1507,1);
			return 1
		end
	end
	Say(" �㲻�ڳ�������������ǰʮ����, �����콱.",0);
end

function dragon_golden_high()
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(10142, i);
		if( GetName() ==  RoleName) then
			if(GetTask(1508) ~= 0) then
				Say(" ������ȡ������������ǰʮ����!",0);
				return 0
			end			
			if(CalcFreeItemCellCount() < 6) then
				Say(" ���װ����λ����. ����ú���������",0);
				return 0
			end
			dragon_givegolden();
			SetTask(1508,1);
			return 1
		end
	end
	Say(" ���ڸ߼�����������ǰʮ����, �����콱.",0);
end

function aboutboat()
	Say(" �����˽���һ��?", 5,"�ϳ����۵Ĺ�ʽ/aboutmaking","��������ʷ/abouthistory","��ر���/aboutjoin","ע����Ŀ /aboutnotice","��֪����!/OnCancel");
end

function aboutmaking()
	local a = "С����= 1 ��ͷ + 1 ��β + 1 ���� + 1 ���� + 4 ��+ 1 ������ + 1 ��";
	local b = "<enter>��ͳ���� = 1 С����+ 4 ��";
	local c = "<enter>��ͷ����= 1 С����+ 1 ��ͳ���� + 1 ��ͷ";
	local d = " ��ͷ���� = 1 ��ͷ���� + 1 ��ͳ���� + 1 ��ͷ";
	local e = "<enter>��ͷ����= 1 ��ͷ���� + 1 ��ͷ���� + 1 ��ͷ";
	local f = "<enter>������ = 1 ��ͷ����+ 1 ��ͷ���� + 1 ��ͷ����";
	Talk(2,"",a..b..c,d..e..f);
end

function abouthistory()
	Talk(1,"","��˵����ԭ���Ӻ󣬵��������μ���ԭ�������ݣ�������Ҷ���������ӣ��������ۺ�������ڣ�ˮ�µ�ˮ�忪������������Ϊ�������Ķ������Ͳ��ҳԣ����ԣ����Լ��ݸ���ԭ�á�������������ͳ����ӵ�ԭ�ɡ�");
end

function aboutjoin()
	Talk(2,"","����� <color=red>С���ۺʹ�ͳ����<color> ��Ϊ<color=red>�ӳ�<color>, ���Ÿ�λ���ѵ�<color=red>��ٴ�<color> �����μӳ����͸߼���������ûСʱ����һ��,<color=red>��ʱ <color>֪ͨ��ʼ���ܱ���������ʱ��Ϊ�����.","��������������� <color=red>8<color> ����μӣ���Ӧ����8�����۵�ͼ;�߼������������ <color=red>16<color> �Ӳμӣ���Ӧ����16�����۵�ͼ���������ٴ������������ˣ�����ҵ��������е���ٴ�������");
end

function aboutnotice()
	Talk(3,"","�����ɹ������ж��鱻ת�Ƶ����۵�ͼ���ڵȱ���ʱ�俪ʼʱ�����<color=red>������<color> �ͻᱻ�ж�Ϊʧȥ�����ʸ�����ӳ������ģ����³�Ա��Ȼ���Լ����������콱�����ǳɼ����ܼ������а�.","�� <color=red>2 �ܺ�<color> �����������<color=red> �����͸߼���������ǰʮ�Ķ���<color> ���Ե���ٴ���ȡ�������1��������������ƽ�װ��.","���˽���ϸ��Ϣ���뿴��ҳ�� www.volam.com.vn");
end

function dousha()
	Say(" �Զ�ɳ���������� <color=red>1 ��, 2 ��, 5 ����ֵ<color> ���߲μ�<color=red>����������<color>, �����뻻��?",2,"���뻻/dousha_yes","����Ҫ!/OnCancel");
end

function dousha_yes()
	if(CalcEquiproomItemCount(6,1,422,1) <= 0) then
		Say(" ��û��С���۲��ܻ�����!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" ���װ����λ����. ����ú���������",0);
		return
	end
	DelCommonItem(6,1,422);
	AddItem(6,1,435,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:��һ����ɳ����");
	Say(" ���ö�ɳ����.",0);
end

function xianggu()
	Say(" �n���㹽����������<color=red>5 ��, 10 ��, 25 ����ֵ<color>���߲μ�<color=red>�߼�������<color>, ������뻻��?",2,"���뻻/xianggu_yes","����Ҫ!/OnCancel");
end

function xianggu_yes()
	if(CalcEquiproomItemCount(6,1,423,1) <= 0) then
		Say(" ��û��<color=red>��ͳ����<color>,���ܻ�����!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" ���װ����λ����. ����ú���������",0);
		return
	end
	DelCommonItem(6,1,423);
	AddItem(6,1,436,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ��һ���㹽����");	
	Say(" ����1 ���㹽����.",0);
end

function danhuang()
	Say(" �Ե�������������<color=red>15 ��, 30 ��, 75 ����ֵ<color>, �����뻻��?",2,"���뻻/danhuang_yes","����Ҫ!/OnCancel");
end

function danhuang_yes()
	if(CalcEquiproomItemCount(6,1,424,1) <= 0) then
		Say(" ��û��<color=red>��ͷ����<color>,���ܻ�����!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" ���װ����λ����. ����ú���������",0);
		return
	end
	DelCommonItem(6,1,424);
	AddItem(6,1,437,1,0,0);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]:��һ����������");		
	Say(" ����1 ����������.",0);
end

function birdboat_award()
	local awardpro = {}
	if(CalcEquiproomItemCount(6,1,425,1) <= 0) then
		Say(" ��û��<color=red>��ͷ����<color>,���ܻ�����!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" ���װ����λ����. ����ú���������",0);
		return
	end
	for i = 1, getn(AWARD_BIRDBOAT) do
		awardpro[i] = AWARD_BIRDBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BIRDBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BIRDBOAT[numth][2][1],AWARD_BIRDBOAT[numth][2][2],AWARD_BIRDBOAT[numth][2][3],AWARD_BIRDBOAT[numth][2][4],AWARD_BIRDBOAT[numth][2][6],AWARD_BIRDBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BIRDBOAT[numth][2][1])
	end
	DelCommonItem(6,1,425);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ��һ��"..AWARD_BIRDBOAT[numth][1]);		
	Say(" ����1 ��"..AWARD_BIRDBOAT[numth][1]..".",0);
end

function beastboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,426,1) <= 0) then
		Say(" ��û��<color=red>��ͷ����color>,���ܻ�����!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 1) then
		Say(" ���װ����λ����. ����ú���������",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWORELASTDATE ) then	--����ϴ����������ۻ�ȡ���������ؿ�ʯ�ǵ���Ļ�
		if ( DWORENOWCOUNT >= DWOREMAXCOUNT ) then	--�ﵽ���������ۻ�ȡ���������ؿ�ʯ����������ٻ�
			print(" ��������ͷ���ۻ�ȡ���������ؿ�ʯ�ѳ�������.")
			Say(" ��������ͷ���ۻ�ȡ���������ؿ�ʯ̫�ࡣ�Ϸ�û�л��ˡ�ȥ�������аɣ���������!",0);
			return
		end
	else	--������������ۻ�ȡ���������ؿ�ʯ�������뵱ǰ����ͬһ��
		DWORELASTDATE = nNowDate;	--�������������
		DWORENOWCOUNT = 0;	--��ǰ���������ۻ�ȡ���������ؿ�ʯ����0
	end
	
	for i = 1, getn(AWARD_BEASTBOAT) do
		awardpro[i] = AWARD_BEASTBOAT[i][3];
	end
	numth = randomaward(awardpro);
	if( getn(AWARD_BEASTBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_BEASTBOAT[numth][2][1],AWARD_BEASTBOAT[numth][2][2],AWARD_BEASTBOAT[numth][2][3],AWARD_BEASTBOAT[numth][2][4],AWARD_BEASTBOAT[numth][2][6],AWARD_BEASTBOAT[numth][2][6]);
	else
		AddEventItem(AWARD_BEASTBOAT[numth][2][1])
	end
	DWORENOWCOUNT = DWORENOWCOUNT + 1;
	DelCommonItem(6,1,426);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ��һ��"..AWARD_BEASTBOAT[numth][1]);		
	Say(" ����1 ��"..AWARD_BEASTBOAT[numth][1]..".",0);	
end

function hugeboat_award()
	local awardpro = {};
	if(CalcEquiproomItemCount(6,1,427,1) <= 0) then
		Say(" ��û��<color=red>������<color>,���ܻ�����!",0);
		return
	end	
	if(CalcFreeItemCellCount() < 6) then
		Say(" ���װ����λ����. ����ú��������� ",0);
		return
	end
	
	local nNowDate = tonumber(date("%d"));	
	if ( nNowDate == DWGOLDENLASTDATE ) then	--����ϴ��þ������ۻ�ȡ�ƽ�װ���ǵ���Ļ�
		if ( DWGOLDENNOWCOUNT >= DWGOLDENMAXCOUNT ) then	--�ﵽ�þ������ۻ�ȡ�ƽ�װ������������ٻ�
			print(" �����ô����ۻ�ȡ�ƽ�װ��̫��.")
			Say(" �����ô����ۻ�ȡ�ƽ�װ��̫��. ȥ�������аɣ���������!",0);
			return
		end
	else	--����þ������ۻ�ȡ�ƽ�װ�������뵱ǰ����ͬһ��
		DWGOLDENLASTDATE = nNowDate;	--�������������
		DWGOLDENNOWCOUNT = 0;	--��ǰ�þ������ۻ�ȡ�ƽ�װ������0
	end
	
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	if( getn(AWARD_HUGEBOAT[numth][2]) == 6 ) then
		AddItem(AWARD_HUGEBOAT[numth][2][1],AWARD_HUGEBOAT[numth][2][2],AWARD_HUGEBOAT[numth][2][3],AWARD_HUGEBOAT[numth][2][4],AWARD_HUGEBOAT[numth][2][6],AWARD_HUGEBOAT[numth][2][6]);
	else
		AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	end
	DWGOLDENNOWCOUNT = DWGOLDENNOWCOUNT + 1;
	DelCommonItem(6,1,427);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ��һ��"..AWARD_HUGEBOAT[numth][1]);		
	Say(" ����1 ��"..AWARD_HUGEBOAT[numth][1]..".",0);	
end

function randomaward(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	local nCompareSum = 0;
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = random(1,nSum);
	for i = 1,nArgCount do
		nCompareSum = nCompareSum + aryProbability[i]
		if( nRandNum <= nCompareSum) then
			return i;
		end
	end
end

function dragon_givegolden()
	local awardpro = {};
	for i = 1, getn(AWARD_HUGEBOAT) do
		awardpro[i] = AWARD_HUGEBOAT[i][3];
	end	
	numth = randomaward(awardpro);
	AddGoldItem(0,AWARD_HUGEBOAT[numth][2][1])
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: ����ǰʮ���1 ��"..AWARD_HUGEBOAT[numth][1]);		
	Say(" ����1 ��"..AWARD_HUGEBOAT[numth][1]..".",0);	
end	
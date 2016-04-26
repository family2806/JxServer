IL("DICEITEM")
Include("\\script\\missions\\yandibaozang\\include.lua")

function YDBZ_DiceDice(ng,gd,np,ntime,double)
	local nRet = ApplyItemDice(1, 100,ntime, "\\script\\missions\\yandibaozang\\saizi.lua", "YDBZ_OnTimeOver", GetTeamSize())
	-- print(nRet)
	local nBody = 0
	AddDiceItemInfo(nRet,0,ng,gd,np,1,double,1,1,1,1,1)
	local nPlayerOld = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		RollItem(nRet)
	end
		PlayerIndex = nPlayerOld
end

function YDBZ_OnTimeOver(dwID)
	-- print("TimeOver!!")
	YDBZ_show_roll_info(dwID)
end

function YDBZ_show_roll_info(dwID)
	local t, nSize, szItem,quality,nGenre,nDetial,nPart,nLevel,nSeries = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	local ndsign = 0
	local oldplayindex = PlayerIndex
	local ndouble = YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1)
	for index, value in t do
		--print(PlayerIndex,nGenre,nDetial,nPart)
		PlayerIndex = value[5]
		if GetName() == value[1] then	-- ��Ȼ�����Ȼ���߲���ʾ�����Ϣ
			--print(index)
			local str = "<color=yellow>"..value[1].."<color>ҡ����<color=yellow>"..value[2].." ��<color>."
			if value[3] == 0 then
				str = "<color=yellow>"..value[1].."<color> ����"
			elseif value[3] == 2 then
				if value[4] == 1 then
					if oldplayindex == value[5] and nSeries == 1 and ndouble == 1 then
						if random(1,100) < 50 then
							str = str .. "<color=yellow>[��Ч�׵���]<color>"
							ndsign = 1
						else
							str = str .. "<color=blue>[��Ч�׵���]<color>"
							
						end
						--��¼log
						if nGenre == 6 and nDetial == 1 and nPart == 1606 then
							YDBZ_sdl_writeLog("�׵۱��ش��خ�","�ڴ��ع����л��1���׵�ͼ��")
						end	
						if nGenre == 6 and nDetial == 1 and nPart == 1605 then
							YDBZ_sdl_writeLog("�׵۱��ش��خ�","�ڴ����л��һ������")
						end			
					end
					str = str..format(" -- ��� <color=yellow>%s<color>",szItem)
				end
				bAllGiveUp = 0
			end
			PlayerIndex = oldplayindex
			Msg2Player(str)
			if ndsign == 1 then
				local ndix = AddItem(nGenre,nDetial,nPart,1,0,0)
				if ndix <=0 then
					--ndix = AddItem(nGenre,nDetial,nPart,1,0,0)
					--print(ndix)
				end
				YDBZ_sdl_writeLog("�׵۱��ش��خ�",format("����ʱ���1 %s",GetItemName(ndix)))
			end
		end
	end
	if bAllGiveUp == 1 then
		Msg2Player("������Ҷ�������")
	elseif nSize ~= getn(t) then
		Msg2Player("���������Ϊʱ�䵽���������")
	end
end

function YDBZ_sdl_writeLog(sztitle,szevent)	--��¼,sztitle=�¼���,szevent=�¼�����
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",sztitle,GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szevent));
end
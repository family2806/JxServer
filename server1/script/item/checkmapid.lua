-- ����Ƿ����ν��ͼ
-- LiuKuo
-- 2004.12.22
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
tbCD_MAP = {516, 517, 580, 581}	--��������سǵ�ͼ

function main(nItemIdx)

--	W,X,Y = GetWorldPos();
	nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				Msg2Player("�˵��߲����ڹ�ս�ν�ս����ʹ��");
				return 1;
			end
			
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	
	for i = 1, getn(tbCD_MAP) do
		if (nMapId == tbCD_MAP[i]) then
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	Msg2Player("�˵���ֻ�����ν�ս����ʹ��");
	return 1;
end